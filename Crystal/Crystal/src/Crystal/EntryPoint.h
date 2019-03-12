#pragma once

#ifdef CR_PLATFORM_WINDOWS

extern Crystal::Application * Crystal::CreateApplication();

int main(int argc, char ** argv)
{
	Crystal::Log::Init();
	CR_CORE_WARN("Initialised Log");
	int a = 5;
	CR_CORE_INFO("Hello Var={0}", a);

	auto * app = Crystal::CreateApplication();
	app->Run();
	delete app;
}

#endif
