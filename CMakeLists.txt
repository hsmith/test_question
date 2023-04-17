#
# __PROGEN_copmany__ 2023
# http://www.ganeshfanclub.com
#

cmake_minimum_required(VERSION 3.20)

project(
    test_question 
    LANGUAGES C CXX 
    VERSION 0.1.0
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)


#
# #############################################################################
#

set(REPO_ROOT ${CMAKE_CURRENT_LIST_DIR})

#
# #############################################################################
#

include(cmake/build.cmake)
include(cmake/platform.cmake)

set(PAWN_DEBUG TRUE)
if(${CMAKE_BUILD_TYPE} STREQUAL "MinSizeRel")
    set(PAWN_DEBUG FALSE)
endif()

#
# #############################################################################
#

include_directories(${REPO_ROOT} ${CMAKE_CURRENT_BINARY_DIR})

add_subdirectory(deps)

set(PAWN_TESTING FALSE)
if(ENABLE_TESTING)
    enable_testing()
    set(PAWN_TESTING TRUE)
endif()
add_subdirectory(pawn)
