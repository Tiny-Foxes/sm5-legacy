return Def.ActorFrame {
	InitCommand=function(self) self:Center() end,
	Def.Quad {
		InitCommand=function(self) self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT) end,
		OnCommand=function(self) self:diffuse(Color.Black):diffusealpha(0) end,
		StartSelectingStepsMessageCommand=function(self) self:stoptweening():linear(0.2):diffusealpha(0.75) end,
		SongUnchosenMessageCommand=function(self) self:stoptweening():linear(0.2):diffusealpha(0) end
	}
}