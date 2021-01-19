return Def.ActorFrame {

	Def.Quad {
		InitCommand=function(self) self:vertalign(bottom):zoomto(SCREEN_WIDTH,34):diffuse(color("#161616")) end,
	},

	Def.Sprite{
		Texture= THEME:GetPathG("ScreenWithMenuElements","header/Header"),
		InitCommand=function(self) self:y(-48):vertalign(bottom):zoomtowidth(SCREEN_WIDTH) end,
		OnCommand=function(self) self:zoomy(-1):diffuse(color("#ffd400")) end,
	}
}
