set(LIBS
  cpp_nix_shared 
  gtest
  gtest_main
  pthread)

macro(cc_test TEST_NAME)
  add_executable(${TEST_NAME} ${ARGN})
  target_link_libraries(${TEST_NAME} ${LIBS} )
  add_test(${TEST_NAME} ${TEST_NAME})
endmacro()

cc_test(clock_test clock_test.cc)
cc_test(epoll_test epoll_test.cc)
cc_test(notify_pipe_test notify_pipe_test.cc)
cc_test(timespec_test timespec_test.cc)
cc_test(timeval_test timeval_test.cc)
