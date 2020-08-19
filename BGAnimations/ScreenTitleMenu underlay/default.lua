return Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self) self:align(0,0):y(SCREEN_TOP+8) end,
		OnCommand=function(self) self:diffuse(Color.Black):diffusealpha(0.5):zoomto(256,84):faderight(1) end
	},
	Def.Quad {
		InitCommand=function(self) self:align(1,0):xy(SCREEN_RIGHT,SCREEN_TOP+8) end,
		OnCommand=function(self) self:diffuse(Color.Black):diffusealpha(0.5):zoomto(256,46):fadeleft(1) end
	}
}