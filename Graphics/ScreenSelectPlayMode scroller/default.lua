local gc = Var "GameCommand"
local colors = {
	Easy		= color("#00ff00"),
	Normal		= color("#feee00"),
	Hard		= color("#feee00"),
	Rave		= color("#db93ff"),
	Nonstop		= color("#00ffff"),
	Oni			= color("#d70b8c"),
	Endless		= color("#b4c3d2"),
}

local icon_color = ModeIconColors[gc:GetName()]

local string_name = gc:GetText()
local string_expl = THEME:GetString(Var "LoadingScreen", gc:GetName() .. "Explanation")
return Def.ActorFrame {
	GainFocusCommand=function(self) self:finishtweening():visible(true):zoom(1.1):decelerate(0.25):zoom(1) end,
	LoseFocusCommand=function(self) self:finishtweening():visible(false):zoom(1) end,

	-- Background!
	Def.ActorFrame {
		Def.Sprite{
			Texture= THEME:GetPathG("ScreenSelectPlayMode","BackgroundFrame"),
			InitCommand=function(self) self:diffuse(Color("Black")):diffusealpha(0.45) end,
			GainFocusCommand=function(self) self:visible(true) end,
			LoseFocusCommand=function(self) self:visible(false) end,
		},
		Def.Sprite{
			Texture= THEME:GetPathG("ScreenSelectPlayMode","scroller/_HighlightFrame"),
			InitCommand=function(self) self:diffuse(icon_color):diffusealpha(0) end,
			GainFocusCommand=function(self)
				self:finishtweening():diffuse(ColorLightTone(icon_color)):linear(1):diffuse(icon_color) end,
			LoseFocusCommand=function(self) self:finishtweening():diffusealpha(0) end,
			OffFocusedCommand=function(self)
				self:finishtweening():glow(Color("White")):decelerate(1):glow(Color("Invisible")) end,
		}
	},

	-- Emblem Frame
	Def.ActorFrame {
		FOV=90,
		InitCommand=function(self) self:x(-192):zoom(0.9) end,
		-- Main Emblem
		Def.Sprite{
			Texture= THEME:GetPathG("ScreenSelectPlayMode","scroller/"..gc:GetName()),
			InitCommand=function(self) self:diffusealpha(0):zoom(0.75) end,
			GainFocusCommand=function(self)
				self:finishtweening():stopeffect():diffusealpha(1):zoom(1):glow(Color("White"))
				:decelerate(0.5):glow(Color("Invisible")):pulse():effecttiming(0.75,0.125,0.125,0.75)
				:effectmagnitude(0.95,1,1) end,
			LoseFocusCommand=function(self)
				self:finishtweening():stopeffect():smooth(0.4)
				:diffusealpha(0):zoom(0.75):glow(Color("Invisible")) end,
			OffFocusedCommand=function(self)
				self:finishtweening():stopeffect():glow(icon_color):decelerate(0.5)
				:rotationy(360):glow(Color("Invisible")) end,
		}
	},

	-- Text Frame
	Def.ActorFrame {
		InitCommand=function(self) self:x(-192/2):y(-10) end,
		Def.BitmapText{
			Font= "Common Large",
			Text=string_name,
			InitCommand=function(self)
				self:y(-2):horizalign(left):diffuse(icon_color):strokecolor(ColorDarkTone(icon_color))
				:shadowlength(2):diffusealpha(0):skewx(-0.125) end,
			OnCommand=function(self)
				self:glowshift():textglowmode('TextGlowMode_Inner')
				:effectcolor1(color("1,1,1,0.5")):effectcolor2(color("1,1,1,0"))
			end,
			GainFocusCommand=function(self)
				self:finishtweening():x(-16):diffuse(ColorLightTone(icon_color))
				:decelerate(0.45):diffusealpha(1):x(0):diffuse(icon_color) end,
			LoseFocusCommand=function(self) self:finishtweening():x(0):accelerate(0.4):diffusealpha(0):x(32):diffusealpha(0) end,
		},
		Def.BitmapText{
			Font= "Common Normal",
			Text=string_expl,
			InitCommand=function(self)
				self:horizalign(right):x(320):y(30):shadowlength(1)
				:diffusealpha(0):skewx(-0.125):zoom(0.75) end,
			GainFocusCommand=function(self)
				self:finishtweening():x(320+16):decelerate(0.45):diffusealpha(1):x(320) end,
			LoseFocusCommand=function(self)
				self:finishtweening():x(320):accelerate(0.4):diffusealpha(0):x(320-32):diffusealpha(0) end,
		},
		Def.Quad {
			InitCommand=function(self)
				self:horizalign(left):y(20):zoomto(320,2):diffuse(icon_color)
				:diffusealpha(0):fadeleft(0.35):faderight(0.35) end,
			GainFocusCommand=function(self) self:stoptweening():linear(0.5):diffusealpha(1) end,
			LoseFocusCommand=function(self) self:stoptweening():linear(0.1):diffusealpha(0) end,
		}
	}

}