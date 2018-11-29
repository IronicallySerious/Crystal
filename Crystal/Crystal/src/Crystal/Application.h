#pragma once

#include "Core.h"

namespace Crystal
{
	class CRYSTAL_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// TO BE DEFINED IN CLIENT
	Application * CreateApplication();
}
