#pragma once

#ifdef CR_PLATFORM_WINDOWS
#ifdef CR_BUILD_DLL
#define CRYSTAL_API __declspec(dllexport)
#else
#define CRYSTAL_API __declspec(dllimport)
#endif // CR_BUILD_DLL
#else
#error Crystal only supports Windows.
#endif // CR_PLATFORM_WINDOWS
