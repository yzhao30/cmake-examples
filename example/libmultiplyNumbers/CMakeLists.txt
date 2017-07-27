cmake_minimum_required(VERSION 2.8)

project(libmultiplyNumbers)

add_library(multiplyNumbers STATIC multiplyNumbers.c)

install(TARGETS multiplyNumbers DESTINATION lib)
install(FILES multiplyNumbers.h DESTINATION include)
