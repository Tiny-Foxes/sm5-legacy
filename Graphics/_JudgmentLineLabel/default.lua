local jl = Var "JudgmentLine"

return Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self) self:horizalign(right):zoomto(256,18) end,
		OnCommand=function(self) self:diffuse(Color("Black")):fadeleft(1) end,
	},
	Def.Quad {
		InitCommand=function(self) self:horizalign(left):zoomto(256,18) end,
		OnCommand=function(self) self:diffuse(Color("Black")):faderight(1) end,
	},

	Def.Sprite{
		Texture= THEME:GetPathG("","_JudgmentLineLabel/_frame"),
		InitCommand=function(self) self:diffuse(JudgmentLineToColor(jl)) end,
	},
	Def.BitmapText{
		Font= "Common Normal",
		InitCommand=function(self)
			self:zoom(0.675):settext(string.upper(JudgmentLineToLocalizedString(jl)))
			:diffuse(JudgmentLineToColor(jl)):shadowlength(1):maxwidth(180) end,
	}
}