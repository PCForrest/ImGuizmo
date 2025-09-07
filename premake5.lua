project "ImGuizmo"
	kind "StaticLib"

	language "C++"
	cppdialect "C++17"
	staticruntime "Off"

	targetdir (bin_dir .. "/Libs/Vendor/%{prj.name}")
	objdir (int_dir .. "/Libs/Vendor/%{prj.name}")

	pchheader "%{prj.name}/_framework/pch.hpp"
	pchsource "src/%{prj.name}/_framework/pch.cpp"

	files
	{
		"premake5.lua",
		".editorconfig",
		"src/%{prj.name}/_framework/pch.hpp",
		"src/%{prj.name}/_framework/pch.cpp",
		"src/%{prj.name}/GraphEditor.cpp",
		"src/%{prj.name}/GraphEditor.h",
		"src/%{prj.name}/Images",
		"src/%{prj.name}/ImCurveEdit.cpp",
		"src/%{prj.name}/ImCurveEdit.h",
		"src/%{prj.name}/ImGradient.cpp",
		"src/%{prj.name}/ImGradient.h",
		"src/%{prj.name}/ImGuizmo.cpp",
		"src/%{prj.name}/ImGuizmo.h",
		"src/%{prj.name}/ImSequencer.cpp",
		"src/%{prj.name}/ImSequencer.h",
		"src/%{prj.name}/ImZoomSlider.h",
	}

	removefiles
	{
		"premake5.lua",
		".editorconfig",
	}

	includedirs
	{
		"src",
		"%{IncludeDir.imgui}",
	}

	dependson
	{
		"imgui",
	}

	links
	{
		"imgui",
	}

	defines
	{
		"_LIB"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines { "_DEBUG", "PCFF_DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines { "NDEBUG", "PCFF_RELEASE" }
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines { "NDEBUG", "PCFF_DIST" }
		runtime "Release"
		optimize "on"

	filter {}