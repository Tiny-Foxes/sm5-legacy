return Def.ActorFrame {
	FOV=90,
--[[ 	Def.Sprite{
		Texture= THEME:GetPathF("Combo","1000milestone/shot"),
		InitCommand=function(self) self:diffusealpha(0):zoom(2):blend('BlendMode_Add') end,
		MilestoneCommand=function(self) self:diffusealpha(0.75):rotationz(0):accelerate(2.5):diffusealpha(0):rotationz(360):zoom(2.5) end,
	}, --]]
--[[ 	Def.Sprite{
		Texture= THEME:GetPathF("Combo","1000milestone/shot"),
		InitCommand=function(self) self:diffusealpha(0):zoom(2):zoomx(-2):blend('BlendMode_Add') end,
		MilestoneCommand=function(self) self:diffusealpha(0.75):rotationz(-360):x(0):linear(2.5):diffusealpha(0):rotationz(0):zoom(2.5) end,
	}, --]]
	loadfile(THEME:GetPathG("Combo","100Milestone"))()
}
