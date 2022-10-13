cmake_minimum_required(VERSION 3.10)
project(test_project)

# Set build type
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)

add_executable(main main.cpp)
