set( BUILT_LIBRARY_NAME "INSERT_LIBRARY_NAME_HERE" )

include_directories( include )

# Kitware recommends against using file glob to create source file lists
# I, clearly, disagree. Run CMake before each build.
file( GLOB SOURCES "*.cpp" "*.c" "*.cxx" )
# Including headers in the project for IDE users.
file( GLOB HEADERS "*.hpp" "*.h" "*.hxx" "include/*.hpp" "include/*.h" "include/*.hxx" )

if ( GLOB_SOURCES OR GLOB_HEADERS )
    add_library( ${BUILT_LIBRARY_NAME} ${SOURCES} ${HEADERS} )
    target_link_libraries( ${BUILT_LIBRARY_NAME} ${GLFW_LIBRARIES} )
endif()

# each cpp file placed in the bin subdirectory is compiled as an independent executable
file( GLOB BIN_SOURCES "bin/*.cpp" )
foreach( BIN_SOURCE ${BIN_SOURCES} )
    get_filename_component( BIN_NAME ${BIN_SOURCE} NAME_WE )
    add_executable( ${BIN_NAME} ${BIN_SOURCE} )
    target_link_libraries( ${BIN_NAME} ${GLFW_LIBRARIES} )
    if ( GLOB_SOURCES OR GLOB_HEADERS )
        target_link_libraries( ${BIN_NAME} ${BUILT_LIBRARY_NAME} )
    endif()
endforeach()

# each cpp file placed in the test subdirectory is compiled as an independent executable.
# if there is a file with the same basename with '_command' appended ( ex: test_foo.cpp
# becomes test_foo_command ) the contents of that file are expected to contain the
# command line invocation of the associated test, otherwise the test executable is
# assumed to require no arguments
file( GLOB TEST_SOURCES "test/*.cpp" )
foreach( TEST_SOURCE ${TEST_SOURCES} )
    get_filename_component( TEST_NAME ${TEST_SOURCE} NAME_WE )
    add_executable( ${TEST_NAME} ${TEST_SOURCE} )
    target_link_libraries( ${TEST_NAME} ${GLFW_LIBRARIES} )
    if ( GLOB_SOURCES OR GLOB_HEADERS )
        target_link_libraries( ${TEST_NAME} ${BUILT_LIBRARY_NAME} )
    endif()

    if ( EXISTS ${TEST_NAME}_command )
        file( READ ${TEST_NAME}_command TEST_CMD )
        add_test( NAME ${TEST_NAME} COMMAND ${TEST_CMD} )
    else()
        add_test( NAME ${TEST_NAME} COMMAND ${TEST_NAME} )
    endif()
endforeach()

