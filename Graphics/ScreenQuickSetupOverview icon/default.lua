local gc = Var "GameCommand"
local c = {}
	c.X = THEME:GetMetric( Var "LoadingScreen", "Icon" .. gc:GetName() .. "X")
	c.Y = THEME:GetMetric( Var "LoadingScreen", "Icon" .. gc:GetName() .. "Y")
return Def.ActorFrame {
	Def.ActorFrame {
		Condition=( gc:GetName() ~= "Back" ),
		InitCommand=function(self) self:x(c.X):y(c.Y) end,
		GainFocusCommand=function(self) self:finishtweening():zoom(1.125):bounceend(0.125):zoom(1) end,
		LoseFocusCommand=function(self) self:stoptweening():linear(0.125):zoom(0.875) end,
		Def.Sprite{
			Texture= THEME:GetPathG("ScreenQuickSetupOverview", "icon/_base"),
			GainFocusCommand=function(self)
				self:stoptweening():linear(0.125):diffuse(Color("Orange")):diffusetopedge(Color("Yellow")) end,
			LoseFocusCommand=function(self) self:stoptweening():linear(0.125):diffuse(Color("White")) end,
		},
		Def.BitmapText{
			Font= "Common Normal",
			Text=gc:GetName(),
			InitCommand=function(self) self:strokecolor(Color("White")) end,
			OnCommand=function(self) self:diffuse(Color("Black")) end,
		}
	},
	Def.ActorFrame {
		Condition=( gc:GetName() == "Back" ),
		InitCommand=function(self) self:x(c.X):y(c.Y) end,
		GainFocusCommand=function(self) self:finishtweening():zoom(1.125):bounceend(0.125):zoom(1) end,
		LoseFocusCommand=function(self) self:stoptweening():linear(0.125):zoom(0.875) end,
		Def.Sprite{
			Texture= THEME:GetPathG("ScreenQuickSetupOverview", "icon/_base"),
			GainFocusCommand=function(self) self:stoptweening():linear(0.125):diffuse(Color("Red")) end,
			LoseFocusCommand=function(self) self:stoptweening():linear(0.125):diffuse(Color("White")) end,
		},
		Def.BitmapText{
			Font= "Common Normal",
			Text=gc:GetName(),
			InitCommand=function(self) self:strokecolor(Color("White")) end,
			OnCommand=function(self) self:diffuse(Color("Black")) end,
		}
	}

}