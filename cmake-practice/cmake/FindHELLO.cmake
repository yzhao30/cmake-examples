# the header and library must exist in the following directory
# e.g., if cmake -DCMAKE_INSTALL_PREFIX=./usr ..

set(TMP "/Users/yzhao30/Downloads/cmake-examples/cmake-practice/build/usr")
find_path(HELLO_INCLUDE_DIR hello.h /usr/include/hello /usr/local/include/hello ${TMP}/include/hello)
find_library(HELLO_LIBRARY NAMES libhello.a PATH /usr/lib /usr/local/lib ${TMP}/lib)
# NOTE: if use `NAMES hello`, it may find the dynamic library

if(HELLO_INCLUDE_DIR AND HELLO_LIBRARY)
  set(HELLO_FOUND TRUE)
endif(HELLO_INCLUDE_DIR AND HELLO_LIBRARY)
if(HELLO_FOUND)
  if(NOT HELLO_FOUND_QUIETLY)
    message(STATUS "Found Hello: ${HELLO_LIBRARY}")
  endif(NOT HELLO_FOUND_QUIETLY)
else(HELLO_FOUND)
  if(HELLO_FOUND_REQUIRED)
    message(FATAL_ERROR "Cound not find hello library")
  endif(HELLO_FOUND_REQUIRED)
endif(HELLO_FOUND)
