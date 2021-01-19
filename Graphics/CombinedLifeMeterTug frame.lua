return Def.Sprite{
	Texture= THEME:GetPathG("_combined","life frame"),
	InitCommand=function(self) self:diffuse(PlayerColor(PLAYER_1)):diffuserightedge(PlayerColor(PLAYER_2)) end,
}