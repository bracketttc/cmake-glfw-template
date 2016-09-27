# CMake script to download, unpack and add to the calling project GLFW 3.2

file( DOWNLOAD https://github.com/glfw/glfw/releases/download/3.2/glfw-3.2.zip ${CMAKE_CURRENT_SOURCE_DIR}/deps/glfw-3.2.zip
      SHOW_PROGRESS
      EXPECTED_MD5 d51fa09602abce26a65096ce97b4831c )
execute_process( COMMAND ${CMAKE_COMMAND} -E tar xfz glfw-3.2.zip
                 WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/deps
                 RESULT_VARIABLE rv )
if( NOT rv EQUAL 0 )
    message( FATAL_ERROR "Could not find or fetch a copy of GLFW." )
else()
    message( STATUS "Setting up internal GLFW build." )

    # disable unnecessary build targets
    set( GLFW_BUILD_DOCS     OFF CACHE BOOL "" FORCE )
    set( GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE )
    set( GLFW_BUILD_TESTS    OFF CACHE BOOL "" FORCE )
    set( GLFW_INSTALL        OFF CACHE BOOL "" )
    # hide options
    mark_as_advanced( BUILD_SHARED_LIBS GLFW_BUILD_DOCS GLFW_BUILD_EXAMPLES GLFW_BUILD_TESTS GLFW_DOCUMENT_INTERNALS GLFW_INSTALL )

    add_subdirectory( ${CMAKE_CURRENT_SOURCE_DIR}/deps/glfw-3.2 )

    # set library and include vars
    set( GLFW_LIBRARY glfw )
    set( GLFW_LIBRARIES ${GLFW_LIBRARY} )
    set( GLFW_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/deps/glfw-3.2/include )
    set( GLFW_INCLUDE_DIRS ${GLFW_INCLUDE_DIR} )
    # hide vars
    mark_as_advanced( GLFW_LIBRARY GLFW_LIBRARIES GLFW_INCLUDE_DIR GLFW_INCLUDE_DIRS )
endif()
