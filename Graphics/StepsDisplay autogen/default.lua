return Def.ActorFrame{
	Def.Sprite{
		Texture= THEME:GetPathG("StepsDisplay", "autogen/_badge"),
		InitCommand=function(self)
			self:shadowlength(1):diffuse(Color.Green):pulse():effectmagnitude(0.875,1,1):effecttiming(0,0,1,0)
			:effectclock('beatnooffset'):effectperiod(2) end,
	},
	Def.Quad {
		InitCommand=function(self)
			self:zoomto(40,20):diffuse(Color.Black):diffusealpha(0.5):fadeleft(0.25):faderight(0.25) end,
	},
	Def.BitmapText {
		Font="Common Normal",
		Text="AG",
		InitCommand=function(self) self:shadowlength(1):zoom(0.875) end,
	}
}