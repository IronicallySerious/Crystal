#include <Crystal.h>

class SandBox : public Crystal::Application
{
public:
	SandBox()
	{
	}

	~SandBox()
	{
	}
};

Crystal::Application * Crystal::CreateApplication()
{
	return new SandBox();
}