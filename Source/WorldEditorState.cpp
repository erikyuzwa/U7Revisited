#include "Geist/Globals.h"
#include "Geist/Engine.h"
#include "U7Globals.h"
#include "WorldEditorState.h"

#include <list>
#include <string>
#include <sstream>
#include <iomanip>
#include <math.h>
#include <fstream>
#include <algorithm>
#include <unordered_map>

using namespace std;

////////////////////////////////////////////////////////////////////////////////
//  WorldEditorState
////////////////////////////////////////////////////////////////////////////////

WorldEditorState::~WorldEditorState()
{
	Shutdown();
}

void WorldEditorState::Init(const string& configfile)
{


}

void WorldEditorState::OnEnter()
{

}

void WorldEditorState::OnExit()
{

}

void WorldEditorState::Shutdown()
{

}

void WorldEditorState::Update()
{
	if (IsKeyPressed(KEY_ESCAPE))
	{
		g_Engine->m_Done = true;
	}
}


void WorldEditorState::Draw()
{
	BeginDrawing();

	ClearBackground(Color {0, 0, 0, 255});

	DrawTextEx(*g_Font, "Welcome to the World Editor!  It doesn't work yet. Sorry.", Vector2{ 0, 0 }, g_Font->baseSize, 0, WHITE);
	DrawTextEx(*g_Font, "Press ESC to exit.", Vector2{ 0, g_fontSize }, g_Font->baseSize, 0, WHITE);

	DrawTexture(*g_Cursor, GetMouseX(), GetMouseY(), WHITE);

	EndDrawing();
}