return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self) self:zoomto(THEME:GetMetric(Var "LoadingScreen","ChatInputBoxWidth"),THEME:GetMetric(Var "LoadingScreen","ChatInputBoxHeight")):diffuse(color("0,0,0,0.25")) end,
	}
}