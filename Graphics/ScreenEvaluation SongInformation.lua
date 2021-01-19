return Def.ActorFrame {
 	Def.BitmapText{
		Font= "Common Normal",
		Name="TextTitle",
		InitCommand=function(self) self:y(-16.5):zoom(0.875):maxwidth(256/0.875) end,
		OnCommand=function(self) self:shadowlength(1) end,
-- 		TickCommand=cmd(finishtweening():diffusealpha(0):addx(-10):zoomx(1.25):zoomy(0):decelerate(0.25):diffusealpha(1):addx(10):zoom(1):sleep(0):glow(Color("White")):decelerate(0.275):glow(Color("Invisible")) end,
	},
 	Def.BitmapText{
		Font= "Common Normal",
		Name="TextSubtitle",
		InitCommand=function(self) self:zoom(0.5):maxwidth(256/0.5) end,
		OnCommand=function(self) self:shadowlength(1) end,
-- 		TickCommand=cmd(finishtweening():diffusealpha(0):addy(-10):addx(10):decelerate(0.25):diffusealpha(1):addy(10):addx(-10) end,
	},
	Def.BitmapText{
		Font= "Common Normal",
		Name="TextArtist",
		InitCommand=function(self) self:y(18):zoom(0.75):maxwidth(256/0.75) end,
		OnCommand=function(self) self:shadowlength(1):skewx(-0.2) end,
-- 		TickCommand=cmd(finishtweening():diffusealpha(0):addy(10):addx(10):decelerate(0.25):diffusealpha(1):addy(-10):addx(-10) end,
	}
}