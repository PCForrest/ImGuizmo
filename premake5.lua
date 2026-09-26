local project_name = "ImGuizmo"

project (project_name)
	kind "StaticLib"
	language "C++"

	targetdir (bin_dir .. "/Libs/Vendor/%{prj.name}")
	objdir (int_dir .. "/Libs/Vendor/%{prj.name}")

   -- Not using precompiled headers

	files {
		"premake5.lua",
		"cpp.hint",
		"local.hint",
		".editorconfig",
      "*.h",
      "*.cpp",
	}

	removefiles	{
		"premake5.lua",
		"cpp.hint",
		"local.hint",
		".editorconfig",
	}

	includedirs {
		"%{IncludeDir.ImGuizmo}",
		"%{IncludeDir.imgui}",
	}

	dependson {
		"imgui",
	}

	links {
		"imgui",
	}

	defines {
		"_LIB",
	}

	filter "system:windows"
		systemversion "latest"
 	   cppdialect "C++17"
	   staticruntime "Off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "off"

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Profile"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"

	filter {}
