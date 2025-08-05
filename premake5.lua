project "Box2D"
	kind "StaticLib"
	language "C"
	staticruntime "off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"src/**.h",
		"src/**.c",
		"include/**.h"
	}
	
	includedirs
	{
		"include",
		"src"
	}
	
	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}
	
	filter "system:windows"
		systemversion "latest"
		buildoptions { "/std:c11", "/experimental:c11atomics" }
		
	filter "system:linux"
		pic "On"
		systemversion "latest"
		buildoptions { "-std=c11" }
		
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		
	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		
	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
		symbols "off"