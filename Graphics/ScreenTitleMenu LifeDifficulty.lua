local label_text= false

return Def.ActorFrame {
	Def.BitmapText{
		Font= "Common Normal",
		Text=GetLifeDifficulty(),
		AltText="",
		InitCommand=function(self) self:horizalign(left):zoom(0.675) end,
		OnCommand= function(self)
			label_text= self
			self:shadowlength(1):settextf(Screen.String("LifeDifficulty"), "")
		end,
	},
	Def.BitmapText{
		Font= "Common Normal",
		Text=GetLifeDifficulty(),
		AltText="",
		InitCommand=function(self) self:zoom(0.675):halign(0) end,
		OnCommand= function(self)
			self:shadowlength(1):skewx(-0.125):x(label_text:GetZoomedWidth()+8)
		end,
	}
}
