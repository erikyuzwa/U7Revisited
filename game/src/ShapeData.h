///////////////////////////////////////////////////////////////////////////
//
// Name:     SHAPEDATA.H
// Author:   Anthony Salter
// Date:     3/2/2024
// Purpose:  Defines the drawing data for each shape and can be modified
//				 and serialized/deserialized.
///////////////////////////////////////////////////////////////////////////

#ifndef _SHAPEDATA_H_
#define _SHAPEDATA_H_

#include <vector>

class Texture;

struct coords;

enum class CuboidTexture
{
	CUBOID_DONT_DRAW = 0,
	CUBOID_DRAW_TOP,
	CUBOID_DRAW_FRONT,
	CUBOID_DRAW_RIGHT,
	CUBOID_DRAW_TOP_INVERTED,
	CUBOID_DRAW_FRONT_INVERTED,
	CUBOID_DRAW_RIGHT_INVERTED,
	CUBOID_DRAW_LAST,
	CUBOID_INVALID,
};

enum class ShapeDrawType
{
	OBJECT_DRAW_BILLBOARD = 0,
	OBJECT_DRAW_CUBOID,
	OBJECT_DRAW_FLAT,
	OBJECT_DRAW_CUSTOM_MESH,
	OBJECT_DRAW_LAST
};

enum class CuboidSides
{
	CUBOID_BOTTOM = 0,
	CUBOID_FRONT,
	CUBOID_BACK,
	CUBOID_RIGHT,
	CUBOID_LEFT,
	CUBOID_TOP,
	CUBOID_LAST
};

class ShapeData
{
public:
	ShapeData();
	~ShapeData() {};

	void Init(int shape, int frame, bool shouldreset = true);

	void SetupDrawTypes();
	void FixupTextures();

	void Serialize(std::ofstream& outputStream );
	void Deserialize(std::ifstream& inputStream);

	void Draw(const Vector3& pos, float angle, Color color = Color{255, 255, 255, 255});

	void DrawSide(CuboidSides side, Vector3 thisPos, Color color, Vector3 scaling);

	bool IsValid() { return m_isValid; }

	void CreateDefaultTexture();

	void SetDefaultTexture(Image image);

	Texture* GetTexture() { return &m_defaultTexture->m_Texture; }
	Texture* GetTopTexture() { return &m_topTexture->m_Texture; }
	Texture* GetFrontTexture() { return &m_frontTexture->m_Texture; }
	Texture* GetRightTexture() { return &m_rightTexture->m_Texture; }

	void SetDrawType(ShapeDrawType drawType) { m_drawType = drawType; }
	ShapeDrawType GetDrawType() { return m_drawType; }

	void SafeAndSane();
	void ResetTopTexture();
	void ResetFrontTexture();
	void ResetRightTexture();

	int GetShape() { return m_shape; }
	int GetFrame() { return m_frame; }

	CuboidTexture GetTextureForSide(CuboidSides side) { return m_sideTexture[static_cast<int>(side)]; }
	void SetTextureForSide(CuboidSides side, CuboidTexture texture) { m_sideTexture[static_cast<int>(side)] = texture; }

	bool Pick(Vector3 thisPos, float angle);

	// In original pixels
	int m_topTextureOffsetX;
	int m_topTextureOffsetY;
	int m_topTextureWidth;
	int m_topTextureHeight;

	int m_frontTextureOffsetX;
	int m_frontTextureOffsetY;
	int m_frontTextureWidth;
	int m_frontTextureHeight;

	int m_rightTextureOffsetX;
	int m_rightTextureOffsetY;
	int m_rightTextureWidth;
	int m_rightTextureHeight;

private:

	bool m_isValid;

	int m_shape;
	int m_frame;

	ShapeDrawType m_drawType;

	//  The custom shape data will also contain a list of custom modifications to the shape.

	std::vector<coords> m_topFaceMods;
	std::vector<coords> m_frontFaceMods;
	std::vector<coords> m_rightFaceMods;

	//  The custom shape data will also contain a list of which sides of the cuboid to draw and which to not draw,
	//  and which of the three faces to apply to those cuboid sides.
	CuboidTexture m_sideTexture[static_cast<int>(CuboidSides::CUBOID_LAST)];

	std::unique_ptr<ModTexture> m_defaultTexture;
	std::unique_ptr<ModTexture> m_topTexture;
	std::unique_ptr<ModTexture> m_frontTexture;
	std::unique_ptr<ModTexture> m_rightTexture;

	Vector3 m_Scaling;

	std::array<Mesh*, static_cast<int>(CuboidSides::CUBOID_LAST)> m_meshes;

};

#endif