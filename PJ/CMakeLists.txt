cmake_minimum_required(VERSION 3.0.0)
project(compilerPJ)

if(CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
    message(STATUS "optional:-std=c++11")   
endif(CMAKE_COMPILER_IS_GNUCXX)

include_directories(lexical_analysis/include)

find_package(FLEX REQUIRED)

add_subdirectory(lexical_analysis)
add_subdirectory(syntax_analysis)

add_executable(lexAnalyzer
    ${CMAKE_SOURCE_DIR}/lexical_analysis/main.cpp
)

target_link_libraries(lexAnalyzer
    lexAnalyzerLib
)