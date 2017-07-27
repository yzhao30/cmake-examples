cmake_minimum_required(VERSION 2.6)
project(hello)

add_subdirectory(src bin)
add_subdirectory(lib)

# install
install(PROGRAMS runhello.sh DESTINATION bin)
install(FILES COPYRIGHT README DESTINATION share/doc/cmake/practice)
install(DIRECTORY doc/ DESTINATION share/doc/cmake/practice)

add_test(mytest ${PROJECT_BINARY_DIR}/bin/hello)
enable_testing()
