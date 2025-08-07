project "Box2D"
    kind "StaticLib"
    language "C"
    staticruntime "off"
    
    -- Enable multi-core compilation
    flags { "MultiProcessorCompile" }
    
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
    
    -- Platform-specific settings
    filter "system:windows"
        systemversion "latest"
        
        defines
        {
            "_CRT_SECURE_NO_WARNINGS"
        }
        
        buildoptions 
        { 
            "/std:c11", 
            "/experimental:c11atomics" 
        }
        
    filter "system:linux"
        pic "On"
        systemversion "latest"
        
        buildoptions 
        { 
            "-std=c11" 
        }
        
        -- Linux math library linking
        links
        {
            "m"  -- Math library for C math functions
        }
        
    filter "system:macosx"
        systemversion "latest"
        
        buildoptions 
        { 
            "-std=c11" 
        }
    
    -- Configuration-specific settings
    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
        defines { "DEBUG" }
        
    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        defines { "NDEBUG" }
        
    filter "configurations:Dist"
        runtime "Release"
        optimize "On"
        symbols "Off"
        defines { "NDEBUG", "DIST_BUILD" }
        
    -- Clear filters
    filter {}