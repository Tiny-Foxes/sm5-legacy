-- how does installed song??? let's find out

return Def.ActorFrame{
	Def.BitmapText{
		Font= "Common Normal",
		Name="Header",
		InitCommand=function(self) self:x(SCREEN_LEFT+24):y(SCREEN_TOP+24):halign(0):diffuse(color("#CCCCCC")):settext(Screen.String("BodyHeader")):shadowlength(1):shadowcolor(HSV(40,0,0.6)):diffusetopedge(color("#FFFFFF")) end,
		OnCommand=function(self) self:queuecommand("Anim") end,
		AnimCommand=function(self)
			self:cropright(1):faderight(1):addx(96):decelerate(1):addx(-96):skewx(-0.1):cropright(0):faderight(0) end,
	}
	-- todo: add explantion paragraph here (above the scroller)
}