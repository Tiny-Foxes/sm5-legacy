return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self) self:FullScreen():diffuse(color("0,0,0,0")) end,
		OnCommand=function(self) self:accelerate(0.5):diffusealpha(1) end,
	}
}
