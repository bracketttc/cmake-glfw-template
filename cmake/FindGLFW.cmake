# Try to find GLFW

# do the actual searching
find_path( GLFW_INCLUDE_DIR GLFW/glfw3.h
           PATH_SUFFIXES GLFW
           HINTS "C:/Program Files/GLFW/include" "/usr/local/lib" )

find_library( GLFW_LIBRARY NAMES glfw
              HINTS "C:/Program Files/GLFW/lib" )
if( NOT GLFW_LIBRARY )
    find_library( GLFW_LIBRARY NAMES glfw3
	              HINTS "C:/Program Files/GLFW/lib" "/usr/local/lib" )
endif( NOT GLFW_LIBRARY )

# duplicate results into plural form ( compatibility )
set( GLFW_LIBRARIES ${GLFW_LIBRARY} )
set( GLFW_INCLUDE_DIRS ${GLFW_INCLUDE_DIRS} )

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args( GLFW DEFAULT_MSG GLFW_LIBRARY GLFW_INCLUDE_DIR )
mark_as_advanced( GLFW_INCLUDE_DIR GLFW_LIBRARY )
