workspace "Crystal"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Crystal"
    location "Crystal"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/vendor/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "CR_PLATFORM_WINDOWS",
            "CR_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:debug"
        defines "CR_DEBUG"
        symbols "On"

    filter "configurations:release"
        defines "CR_RELEASE"
        optimize "On"

    filter "configurations:dist"
        defines "CR_DIST"
        optimize "On"

    filter { "system:windows", "configurations:release" }
        buildoptions "/MT"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Crystal/vendor/spdlog/include",
        "Crystal/src"
    }

    links
    {
        "Crystal"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "CR_PLATFORM_WINDOWS"
        }

    filter "configurations:debug"
        defines "CR_DEBUG"
        symbols "On"

    filter "configurations:release"
        defines "CR_RELEASE"
        optimize "On"

    filter "configurations:dist"
        defines "CR_DIST"
        optimize "On"

    filter { "system:windows", "configurations:release" }
        buildoptions "/MT"
