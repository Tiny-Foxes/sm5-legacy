return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self) self:FullScreen():diffuse(color("0,0,0,1")):cropbottom(1):fadebottom(1) end,
		OnCommand=function(self) self:decelerate(0.5):cropbottom(0):fadebottom(0) end,
	}
}
