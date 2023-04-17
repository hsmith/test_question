//
// GaneshFanClub 2023
// http://www.ganeshfanclub.com
//

#pragma once

#include <stdexcept>

#define PAWN_VERSION_MAJOR @PROJECT_VERSION_MAJOR@
#define PAWN_VERSION_MINOR @PROJECT_VERSION_MINOR@
#define PAWN_VERSION_PATCH @PROJECT_VERSION_PATCH@
#define PAWN_VERSION "@PROJECT_VERSION@"

#cmakedefine PAWN_DEBUG TRUE
#cmakedefine PAWN_TESTING TRUE

#cmakedefine PAWN_PLATFORM "@PAWN_PLATFORM@"
#cmakedefine PAWN_PLATFORM_WASM
#cmakedefine PAWN_EMSCRIPTEN
#cmakedefine PAWN_PLATFORM_UNIX
#cmakedefine PAWN_PLATFORM_POSIX
#cmakedefine PAWN_PLATFORM_WINDOWS
#cmakedefine PAWN_PLATFORM_APPLE
#cmakedefine PAWN_PLATFORM_MINGW
#cmakedefine PAWN_PLATFORM_OTHER

#define PAWN_ABORT(MSG_) \
    std::cerr << MSG_ << std::endl; \
    throw std::runtime_error(MSG_);

#define PAWN_ABORT_IF(CONDITION_, MSG_) \
    if(!(CONDITION_)) { \
        PAWN_ABORT(MSG_); \
    }

#ifdef PAWN_DEBUG
#   define PAWN_DABORT(MSG_) PAWN_ABORT(MSG_)
#   define PAWN_ASSERT(CONDITION_, MSG_) PAWN_ABORT_IF(CONDITION_, MSG_)
#else
#  define PAWN_DABORT(MSG_)
#  define PAWN_ASSERT(CONDITION_, MSG_)
#endif

