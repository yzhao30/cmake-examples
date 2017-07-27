set(hello_src hello.c)

add_library(hello_dy SHARED ${hello_src})
set_target_properties(hello_dy PROPERTIES OUTPUT_NAME "hello")

# target name can not be reused
add_library(hello_static STATIC ${hello_src})
# we want to use the same output name
set_target_properties(hello_static PROPERTIES OUTPUT_NAME "hello")

set_target_properties(hello_dy PROPERTIES VERSION 1.2 SOVERSION 1)

install(TARGETS hello_dy hello_static
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
)

install(FILES hello.h DESTINATION include/hello)
