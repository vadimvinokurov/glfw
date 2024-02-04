project "GLFW"
	kind "StaticLib"
	language "C"
	staticruntime "on"
	warnings "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	defines 
	{ 
		"_CRT_SECURE_NO_WARNINGS"
	}

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",

		"src/null_init.c",
		"src/null_joystick.c",
		"src/null_monitor.c",
		"src/null_window.c",

		"src/platform.c",
		"src/vulkan.c",
		"src/window.c",
	}

	filter "system:windows"
		systemversion "latest"

		files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_module.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}

		defines 
		{ 
			"_GLFW_WIN32"
		}

	filter "configurations:Debug"
		defines "VE_DEBUG"
		runtime "Debug"
		optimize "Off"
		symbols "On"
		
	filter "configurations:Release"
		defines "VE_RELEASE"
		runtime "Release"
		optimize "Speed"
		symbols "Off"
		
	filter "configurations:Profile"
		defines "VE_PROFILE"
		runtime "Release"
		optimize "Speed"
		symbols "Off"
	
	filter "configurations:Retail"
		defines "VE_RETAIL"
		runtime "Release"
		optimize "Speed"
		symbols "Off"
