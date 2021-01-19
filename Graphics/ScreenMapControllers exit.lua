return Def.BitmapText{
	Font= "Common Normal",
	Text=ScreenString("Exit"),
	InitCommand=function(self) self:x(SCREEN_CENTER_X):zoom(0.75):shadowlength(0):diffuse(color("#880000")):NoStroke() end,
	OnCommand=function(self) self:diffusealpha(0):decelerate(0.5):diffusealpha(1) end,
	OffCommand=function(self) self:stoptweening():accelerate(0.3):diffusealpha(0):queuecommand("Hide") end,
	HideCommand=function(self) self:visible(false) end,

	GainFocusCommand=function(self) self:diffuseshift():effectcolor1(color("#FF2222")):effectcolor2(color("#880000")) end,
	LoseFocusCommand=function(self) self:stopeffect() end,
}
