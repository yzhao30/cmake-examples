cmake_minimum_required(VERSION 2.8)

project(experiment)

add_subdirectory(libmultiplyNumbers)

include_directories(libmultiplyNumbers .)

add_executable(sample main.c)
target_link_libraries(sample multiplyNumbers)

# ⊨ cmake -DCMAKE_INSTALL_PREFIX=(realpath ./) ..
install(TARGETS sample DESTINATION bin)
