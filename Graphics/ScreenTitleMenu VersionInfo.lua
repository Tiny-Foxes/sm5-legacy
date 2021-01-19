return Def.ActorFrame {
	Def.BitmapText{
		Font= "Common Normal",
		Text=string.format("%s %s", ProductFamily(), ProductVersion()),
		AltText="StepMania",
		InitCommand=function(self) self:zoom(0.675) end,
		OnCommand=function(self) self:horizalign(right):shadowlength(1) end,
	},
	Def.BitmapText{
		Font= "Common Normal",
		Text=string.format("%s", VersionDate()),
		AltText="Unknown Version",
		InitCommand=function(self) self:y(16):zoom(0.5) end,
		OnCommand=function(self) self:horizalign(right):shadowlength(1) end,
	}
}