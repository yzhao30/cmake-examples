cmake_minimum_required(VERSION 2.6)
project(hello)

# find the custom module FindHELLO.cmake
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

add_subdirectory(lib)
add_subdirectory(src bin)

# install
install(PROGRAMS runhello.sh DESTINATION bin)
install(FILES COPYRIGHT README DESTINATION share/doc)
install(DIRECTORY doc/ DESTINATION share/doc)

add_test(mytest ${PROJECT_BINARY_DIR}/bin/hello)
enable_testing()

# check some variable
message(STATUS "PROJECT_SOURCE_DIR: " ${PROJECT_SOURCE_DIR})
message(STATUS "PROJECT_BINARY_DIR: " ${PROJECT_BINARY_DIR})
message(STATUS "CMAKE_INSTALL_PREFIX: " ${CMAKE_INSTALL_PREFIX})
message(STATUS "CMAKE_MODULE_PATH: " ${CMAKE_MODULE_PATH})
