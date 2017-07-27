# app 1
add_executable(hello main.c)

# app 2
add_executable(hello_u main_uselib.c)

include_directories(${PROJECT_SOURCE_DIR}/lib)

add_dependencies(hello_u hello_static)
target_link_libraries(hello_u ${PROJECT_BINARY_DIR}/lib/libhello.a)
# is the same as
# target_link_libraries(hello_u hello_static)

# app 2, but use custom module
find_package(HELLO)
if(HELLO_FOUND)
  add_executable(hello_module main_uselib.c)
  install(TARGETS hello_module RUNTIME DESTINATION bin)
  include_directories(${HELLO_INCLUDE_DIR})
  target_link_libraries(hello_module ${HELLO_LIBRARY})
endif(HELLO_FOUND)


# app 3
add_executable(curltest main_curl.c)

## method 1
# include_directories(/usr/include)
# target_link_libraries(curltest curl)

## method 2: use FindCURL module
find_package(CURL)
if(CURL_FOUND)
  include_directories(${CURL_INCLUDE_DIR})
  target_link_libraries(curltest ${CURL_LIBRARY})
else(CURL_FOUND)
  message(FATAL_ERROR "CURL library not found")
endif(CURL_FOUND)

# common
install(TARGETS hello hello_u RUNTIME DESTINATION bin)
