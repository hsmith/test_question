#
# GaneshFanClub 2022
# http://www.ganeshfanclub.com
#

# platform --------------------------------------------------------------------
if(EMSCRIPTEN)
    set(PAWN_PLATFORM "wasm")
    set(PAWN_PLATFORM_WASM TRUE)
    set(PAWN_EMSCRIPTEN TRUE)
elseif(UNIX)
    set(PAWN_PLATFORM "unix")
    set(PAWN_PLATFORM_UNIX TRUE)
	set(PAWN_PLATFORM_POSIX TRUE)
elseif(WIN32)
    set(PAWN_PLATFORM "windows")
    set(PAWN_PLATFORM_WINDOWS TRUE)
elseif(APPLE)
    set(PAWN_PLATFORM "apple")
    set(PAWN_PLATFORM_APPLE TRUE)
	set(PAWN_PLATFORM_POSIX TRUE)
elseif(MINGW)
    set(PAWN_PLATFORM "mingw")
    set(PAWN_PLATFORM_MINGW TRUE)
	set(PAWN_PLATFORM_POSIX TRUE)
else()
    set(PAWN_PLATFORM "other")
    set(PAWN_PLATFORM_OTHER TRUE)
endif()

