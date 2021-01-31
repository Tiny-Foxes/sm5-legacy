local gc = Var("GameCommand")

local string_name = gc:GetText()
local string_expl = THEME:GetString(Var "LoadingScreen", gc:GetName().."Explanation")
local icon_color = ModeIconColors[gc:GetName()]

return Def.ActorFrame {
	Def.ActorFrame {
		GainFocusCommand=function(self) self:stoptweening():bob():effectmagnitude(0,6,0):decelerate(0.05):zoom(1) end,
		LoseFocusCommand=function(self) self:stoptweening():stopeffect():decelerate(0.1):zoom(0.6) end,

		Def.Sprite{
			Texture= THEME:GetPathG("ScreenSelectPlayMode", "Icon/_background base"),
			InitCommand=function(self) self:diffuse(icon_color) end,
		},
		Def.Sprite{
			Texture= THEME:GetPathG("ScreenSelectPlayMode", "Icon/_background effect"),
		},
		Def.Sprite{
			Texture= THEME:GetPathG("ScreenSelectPlayMode", "Icon/_gloss"),
		},
		Def.Sprite{
			Texture= THEME:GetPathG("ScreenSelectPlayMode", "Icon/_stroke"),
		},
		Def.Sprite{
			Texture= THEME:GetPathG("ScreenSelectPlayMode", "Icon/_cutout"),
		},

		-- todo: generate a better font for these.
		Def.BitmapText{
			Font= "Common Large",
			Text=string.upper(string_name),
			InitCommand=function(self) self:y(-12):maxwidth(232) end,
			OnCommand=function(self)
				self:diffuse(Color.Black):shadowlength(1):shadowcolor(color("#ffffff77")):skewx(-0.125) end,
		},
		Def.BitmapText{
			Font= "Common Normal",
			Text=string.upper(string_expl),
			InitCommand=function(self) self:y(27.5):maxwidth(232) end,
		},
		Def.Sprite{
			Texture= THEME:GetPathG("ScreenSelectPlayMode", "Icon/_background base"),
			DisabledCommand=function(self) self:diffuse(color("0,0,0,0.5")) end,
			EnabledCommand=function(self) self:diffuse(color("1,1,1,0")) end,
		}
	}
}