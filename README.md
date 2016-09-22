# CMake GLFW project template

This is the skeleton for a CMake-based project depending on GLFW. It is intended to provide a very simple set up to getting a project off the starting platform and require only a minimum of CMake knowledge.

It is also a "bad" CMake project. I use file globbing to create file lists for all of my build targets for ease of use. KitWare recommends against doing this because CMake will not automatically detect when new files are added. The correct solution is to hand-list your sources at each level. The "bad" solution is to run CMake prior to every build. I advocate the "bad" route.
