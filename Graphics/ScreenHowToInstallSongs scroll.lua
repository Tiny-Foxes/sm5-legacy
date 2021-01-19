local gc = Var("GameCommand")
local squareSize = 8 -- was 18

return Def.ActorFrame {
	Def.Quad{
		InitCommand=function(self) self:x(-12):zoom(squareSize):rotationz(45):diffuse(color("#222222")) end,
		GainFocusCommand=function(self) self:stoptweening():accelerate(0.25):zoom(squareSize):rotationz(45) end,
		LoseFocusCommand=function(self) self:stoptweening():decelerate(0.25):zoom(0):rotationz(360+45) end,
	},
	Def.BitmapText{
		Font= "Common Normal",
		Text=gc:GetText(),
		InitCommand=function(self) self:halign(0):zoom(0.625) end,
		GainFocusCommand=function(self) self:stoptweening():decelerate(0.25):diffuse(color("1,1,1,1")) end,
		LoseFocusCommand=function(self) self:stoptweening():accelerate(0.25):diffuse(color("0.5,0.5,0.5,1")) end,
	}
}