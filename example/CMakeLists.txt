cmake_minimum_required(VERSION 2.8)

project(experiment)

# ---------------------------
add_subdirectory(libmultiplyNumbers)

include_directories(libmultiplyNumbers .)

add_executable(sample main.c)

# ---------------------------
# https://cmake.org/cmake/help/v2.8.8/cmake.html#module%3aExternalProject
include(ExternalProject)

# NOTE: some of the arguments can not be set concurrently!
# If you don't specify commands like BUILD_COMMAND or INSTALL_COMMAND,
# CMake will look for a CMakeLists.txt in the external project and execute it.
ExternalProject_Add(project_checkNumber
# PREFIX ${CMAKE_CURRENT_SOURCE_DIR}/third-party/checkNumber
SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third-party/checkNumber
CONFIGURE_COMMAND "" # ${CMAKE_CURRENT_SOURCE_DIR}/third-party/configure --prefix=<INSTALL_DIR>
# BINARY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third-party/checkNumber
BUILD_COMMAND make
BUILD_IN_SOURCE 1
INSTALL_COMMAND "" # make install
# INSTALL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third-party/checkNumber
)

# retrieves external project target properties:
# ExternalProject_Get_Property(<name> [prop1 [prop2 [...]]])
# It stores property values in variables of the same name.
# Property names correspond to the keyword argument names of 'ExternalProject_Add'.
# ExternalProject_Get_Property(project_checkNumber INSTALL_DIR)

# ---------------------------
# Calling ExternalProject_Add only specifies the external project as a target
# but does not automatically build it. It will only be built if we add a dependency to it. 
add_library(checkNumber STATIC IMPORTED)
# set_property(TARGET checkNumber PROPERTY IMPORTED_LOCATION ${INSTALL_DIR}/lib/libcheckan.a)
set_property(TARGET checkNumber PROPERTY IMPORTED_LOCATION
${CMAKE_CURRENT_SOURCE_DIR}/third-party/checkNumber/libcheckan.a)

add_dependencies(checkNumber project_checkNumber)

# ---------------------------
target_link_libraries(sample multiplyNumbers checkNumber)
# ⊨ cmake -DCMAKE_INSTALL_PREFIX=(realpath ./) ..
install(TARGETS sample DESTINATION bin)
