add_executable(hello main.c)

add_executable(hello_u main_uselib.c)

install(TARGETS hello hello_u RUNTIME DESTINATION bin)

include_directories(${PROJECT_SOURCE_DIR}/lib)

add_dependencies(hello_u hello_static)

target_link_libraries(hello_u ${PROJECT_BINARY_DIR}/lib/libhello.a)
# is the same as
# target_link_libraries(hello_u hello_static)
