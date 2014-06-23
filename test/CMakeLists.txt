include_directories(BEFORE SYSTEM ${GTEST_INCLUDE_DIR})

set(LIBS
  cpp_nix_shared 
  gtest
  gtest_main
  pthread)

add_executable( notify_pipe_test notify_pipe_test.cc )
target_link_libraries( notify_pipe_test ${LIBS} )
add_test( notify_pipe_test notify_pipe_test )

add_executable( timespec_test timespec_test.cc )
target_link_libraries( timespec_test ${LIBS})
add_test( timespec_test timespec_test )

add_executable( timeval_test timeval_test.cc )
target_link_libraries( timeval_test ${LIBS} )
add_test( timeval_test timeval_test )