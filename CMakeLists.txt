cmake_minimum_required(VERSION 2.8)

project(experiment)

add_executable(sample main.c)
target_link_libraries(sample multiplyNumbers)

add_library(multiplyNumbers STATIC multiplyNumbers.c)

# ⊨ cmake -DCMAKE_INSTALL_PREFIX=(realpath ./) ..
install(TARGETS sample DESTINATION bin)
install(TARGETS multiplyNumbers DESTINATION lib)
install(FILES multiplyNumbers.h DESTINATION include)
