# suggest running with 
#   gcc 4.6 : -DCMAKE_CXX_FLAGS="-std=c++0x"
#   gcc 4.8 : -DCMAKE_CXX_FLAGS="-std=c++11"

cmake_minimum_required(VERSION 2.8)

project (cpp_nix)
set( ${CMAKE_PROJECT_NAME}_VERSION_MAJOR 0 )
set( ${CMAKE_PROJECT_NAME}_VERSION_MINOR 1 )
set( ${CMAKE_PROJECT_NAME}_VERSION_BUGFIX 0 )

set(VERSION_STRING "${${CMAKE_PROJECT_NAME}_VERSION_MAJOR}")
set(VERSION_STRING "${VERSION_STRING}.${${CMAKE_PROJECT_NAME}_VERSION_MINOR}")
set(VERSION_STRING "${VERSION_STRING}.${${CMAKE_PROJECT_NAME}_VERSION_BUGFIX}")

# adds the project-specific cmake module directory cmake/Modules to the cmake
# search path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

enable_testing()

add_subdirectory(include)
include_directories(include BEFORE SYSTEM)
add_subdirectory(src)

add_subdirectory(gtest)
include_directories(BEFORE SYSTEM gtest)
add_subdirectory(test)

# configure the doxygen configuration
configure_file( 
    "${PROJECT_SOURCE_DIR}/doxy.config.in"
    "${PROJECT_BINARY_DIR}/doxy.config" 
    )

include("TargetDoc" OPTIONAL)

install(EXPORT CPP_NIX_TARGETS
  DESTINATION share/cmake/
  FILE cpp_nix_targets.cmake )

configure_file(
  cpp_nix-config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/cpp_nix-config.cmake 
  @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/cpp_nix-config.cmake
  DESTINATION share/cmake/)
    
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/cpp_nix-version.cmake 
  VERSION ${VERSION_STRING} 
  COMPATIBILITY SameMajorVersion)
  
configure_file(
  cpp_nix.pc.in
  ${CMAKE_CURRENT_BINARY_DIR}/cpp_nix.pc 
  @ONLY)
  
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/cpp_nix.pc
  DESTINATION lib/pkg-config/)