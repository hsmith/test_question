#
# LetsMakeGames 2023
# http://www.letsmake.games/
#

function(pawn_add_library NAME)
    set(opts INTERFACE)
    set(args
        ALIAS)
    set(margs
        SOURCES INCLUDES LIBRARIES MESSAGES
    )

    cmake_parse_arguments(ARGS "${opts}" "${args}" "${margs}" "${ARGN}")

    if(ARGS_INTERFACE)
        add_library(${NAME} INTERFACE)
    else()
        add_library(${NAME} ${ARGS_SOURCES})
    endif()

    if(NOT ${ARGS_ALIAS} STREQUAL "")
        add_library(${ARGS_ALIAS} ALIAS ${NAME})
    endif()

    set(INCLUDES ${ARGS_INCLUDES} ${PAWN_REPO_ROOT} ${CMAKE_CURRENT_BINARY_DIR})
    
    if(ARGS_INTERFACE)
        target_link_libraries(${NAME} INTERFACE ${ARGS_LIBRARIES})
        target_include_directories(${NAME} INTERFACE ${INCLUDES})
    else()
        target_link_libraries(${NAME} PUBLIC ${ARGS_LIBRARIES})
        target_include_directories(${NAME} PUBLIC ${INCLUDES})
    endif()

endfunction()
