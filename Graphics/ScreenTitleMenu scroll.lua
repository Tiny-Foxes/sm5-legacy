local gc = Var("GameCommand")

return Def.ActorFrame {
	Def.Quad{
		InitCommand=function(self) self:zoomto(256,26):fadeleft(0.45):faderight(0.45) end,
		OnCommand=function(self)
			self:diffuseshift():effectcolor1(color("0,0,0,0.5")):effectcolor2(color("0,0,0,0.5")) end,
		GainFocusCommand=function(self) self:stoptweening():decelerate(0.1):zoomto(256,26):diffusealpha(1) end,
		LoseFocusCommand=function(self) self:stoptweening():accelerate(0.1):zoomto(SCREEN_WIDTH,0):diffusealpha(0) end,
	},
	Def.BitmapText{
		Font= "Common Normal",
		Text=THEME:GetString("ScreenTitleMenu",gc:GetText()),
		OnCommand=function(self) self:shadowlength(1) end,
		GainFocusCommand=function(self) self:stoptweening():linear(0.1):zoom(1):diffuse(color("1,1,1,1")) end,
		LoseFocusCommand=function(self) self:stoptweening():linear(0.1):zoom(0.75):diffuse(color("0.5,0.5,0.5,1")) end,
	}
}