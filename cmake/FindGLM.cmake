# Try to find GLM

# do the actual searching
find_path( GLM_INCLUDE_DIR glm/glm.hpp
           PATH_SUFFIXES glm
           HINTS "C:/Program Files/GLFW/include" "/usr/local/lib" )

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args( GLM DEFAULT_MSG GLM_INCLUDE_DIR )
mark_as_advanced( GLM_INCLUDE_DIR )
