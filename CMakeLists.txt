cmake_minimum_required( VERSION 3.1 )

project( INSERT_PROJECT_NAME_HERE )

set( CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake )

# C++11
set( CMAKE_CXX_STANDARD 11 )
set( CMAKE_CXX_STANDARD_REQUIRED ON )

# Dependencies
find_package( GLFW COMPONENTS glfw )
if( NOT GLFW_FOUND )
    include( BuildGLFW )
    BuildGLFW()
endif()

find_package( OpenGL COMPONENTS GL REQUIRED )
find_package( Threads REQUIRED )

# Project-wide includes
include_directories( include )

# Project-wide dependencies
link_libraries( ${CMAKE_THREAD_LIBS_INIT} )

# build the project
add_subdirectory( src )
