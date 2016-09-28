# CMake script to download, unpack and add to the calling project GLM 0.9.8.1

file( DOWNLOAD https://github.com/g-truc/glm/releases/download/0.9.8.1/glm-0.9.8.1.zip ${CMAKE_CURRENT_SOURCE_DIR}/deps/glm-0.9.8.1.zip
      SHOW_PROGRESS
      EXPECTED_MD5 2f6c98eda1bf0747af2272271ca114a8
      )
execute_process( COMMAND ${CMAKE_COMMAND} -E tar xfz glm-0.9.8.1.zip
                 WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/deps
                 RESULT_VARIABLE rv )
if( NOT rv EQUAL 0 )
    message( FATAL_ERROR "Could not find or fetch a copy of GLM." )
else()
    message( STATUS "Setting up internal GLM dir." )

    # set include var
    set( GLM_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/deps/glm )
    # hide var
    mark_as_advanced( GLM_INCLUDE_DIR )
endif()
