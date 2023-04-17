#
# LetsMakeGames 2023
# http://www.letsmake.games/
#

function(pawn_add_executable NAME)
    set(opts)
    set(args)
    set(margs
        SOURCES INCLUDES LIBRARIES MESSAGES
    )

    cmake_parse_arguments(ARGS "${opts}" "${args}" "${margs}" "${ARGN}")

    add_executable(
        ${NAME}
        ${ARGS_SOURCES}
	)

	set(INCLUDES ${ARGS_INCLUDES} ${PAWN_REPO_ROOT} ${CMAKE_CURRENT_BINARY_DIR})

    target_link_libraries(${NAME} ${ARGS_LIBRARIES})

	target_include_directories(${NAME} PUBLIC ${INCLUDES})

    set_target_properties(
        ${NAME}
        PROPERTIES
            RUNTIME_OUTPUT_DIRECTORY "${PAWN_REPO_ROOT}/bin/${CMAKE_BUILD_TYPE}/"
    )

endfunction()
