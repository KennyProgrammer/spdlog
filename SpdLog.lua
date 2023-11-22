--
-- Premake5 file for build SpdLog project.
-- Copyright (c) 2019-2023 by Danil (Kenny) Dukhovenko, All rights reserved.
--

-- SpdLog C++ Project
project "ImGuizmo"
	kind          "StaticLib"
	language      "C++"
	cppdialect    "C++17"
	staticruntime "On"
	targetdir     ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/lib")
	objdir        ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/obj")

	files {
		"include/**.h",
        "src/**.cpp"
	}
	
	includedirs {
		"include"
	}

    defines {
        "SPDLOG_COMPILED_LIB"
    }

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"