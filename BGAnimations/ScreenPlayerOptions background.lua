return Def.ActorFrame {
	Def.ActorFrame {
		Def.Sprite {
			Condition=not GAMESTATE:IsCourseMode(),
			InitCommand=function(self) self:Center() end,
			OnCommand=function(self)
				if GAMESTATE:GetCurrentSong() then
					local song = GAMESTATE:GetCurrentSong()
					if song:HasBackground() then
						self:LoadBackground(song:GetBackgroundPath())
					end
					self:scale_or_crop_background()
					self:fadebottom(0.25):fadetop(0.25):croptop(48/480):cropbottom(48/480)
				else
					self:visible(false)
				end
			end
		},
		Def.Quad {
			InitCommand=function(self) self:Center():scaletoclipped(SCREEN_WIDTH+1,SCREEN_HEIGHT) end,
			OnCommand=function(self) self:diffuse(color("#FFCB05")):diffusebottomedge(color("#F0BA00")):diffusealpha(0.45) end,
		},
		Def.Sprite{
			Texture= THEME:GetPathB("ScreenWithMenuElements","background/_bg top"),
			InitCommand=function(self) self:Center():scaletoclipped(SCREEN_WIDTH+1,SCREEN_HEIGHT) end,
			OnCommand=function(self) self:diffusealpha(0.5) end,
		}
	}
}
