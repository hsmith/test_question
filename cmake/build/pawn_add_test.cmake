#
# LetsMakeGames 2023
# http://www.letsmake.games/
#

function(pawn_add_test NAME)
    if(ENABLE_TESTING)
        set(opts)
        set(args)
        set(margs
            SOURCES INCLUDES LIBRARIES
	    )

        cmake_parse_arguments(ARGS "${opts}" "${args}" "${margs}" "${ARGN}")

        add_executable(${NAME} ${ARGS_SOURCES})
        target_link_libraries(
            ${NAME}
            PUBLIC ${ARGS_LIBRARIES} Catch2WithMain
	    )
        add_test(NAME ${NAME} COMMAND ${NAME})

	    target_include_directories(${NAME} PUBLIC ${ARGS_INCLUDES} ${PAWN_REPO_ROOT})

        # place tests in a directory structure that shadows the source tree
        # so we can run them based on directory
        file(RELATIVE_PATH REL_PATH ${PAWN_REPO_ROOT} ${CMAKE_CURRENT_LIST_DIR})
	    set_target_properties(${NAME}
	    	PROPERTIES
	    		RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/tests/${REL_PATH}
	    )

    endif()
endfunction()
