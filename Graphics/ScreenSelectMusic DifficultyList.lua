return Def.ActorFrame {
	CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
-- 			self:setaux(0)
			self:finishtweening()
			self:playcommand("TweenOn")
		elseif not song and self:GetZoomX() == 1 then
-- 			self:setaux(1)
			self:finishtweening()
			self:playcommand("TweenOff")
		end
	end,
	Def.Quad {
		InitCommand=function(self) self:y(-14):zoomto(164,2):fadeleft(8/164):faderight(8/164) end,
		OnCommand=function(self) self:diffuse(Color("Black")):diffusealpha(0):linear(0.35):diffusealpha(0.5) end,
	},
	Def.Quad {
		InitCommand=function(self) self:y(24*(5)-10):zoomto(164,2):fadeleft(8/164):faderight(8/164) end,
		OnCommand=function(self) self:diffuse(Color("Black")):diffusealpha(0):linear(0.35):diffusealpha(0.5) end,
	},
	Def.StepsDisplayList {
		Name="StepsDisplayListRow",

		CursorP1 = Def.ActorFrame {
			InitCommand=function(self) self:x(-128+16):player(PLAYER_1) end,
			PlayerJoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_1 then
					self:visible(true)
					self:zoom(0):bounceend(1):zoom(1)
				end
			end,
			PlayerUnjoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_1 then
					self:visible(true)
					self:bouncebegin(1):zoom(0)
				end
			end,
			Def.Sprite{
				Texture= THEME:GetPathG("_StepsDisplayListRow","Cursor"),
				InitCommand=function(self) self:diffuse(PlayerColor(PLAYER_1)):x(8):zoom(0.75) end,
			},
			Def.Sprite{
				Texture= THEME:GetPathG("_StepsDisplayListRow","arrow"),
				InitCommand=function(self) self:x(20):diffuse(PlayerColor(PLAYER_1)) end,
				OnCommand=function(self) self:thump(1):effectmagnitude(1,1.25,1):effectclock('beat') end,
			},
			Def.BitmapText{
				Font= "Common Normal",
				Text="P1",
				InitCommand=function(self) self:x(2):diffuse(PlayerColor(PLAYER_1)):shadowlength(1) end,
				OnCommand=function(self) self:zoom(0.75) end,
			}
		},
		CursorP2 = Def.ActorFrame {
			InitCommand=function(self) self:x(128-16):player(PLAYER_2) end,
			PlayerJoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_2 then
					self:visible(true)
					self:zoom(0):bounceend(1):zoom(1)
				end
			end,
			PlayerUnjoinedMessageCommand=function(self, params)
				if params.Player == PLAYER_2 then
					self:visible(true)
					self:bouncebegin(1):zoom(0)
				end
			end,
			Def.Sprite{ Texture= THEME:GetPathG("_StepsDisplayListRow","Cursor"),
				InitCommand=function(self) self:diffuse(PlayerColor(PLAYER_2)):x(-8):zoom(0.75):zoomx(-0.75) end,
			},
			Def.Sprite{ Texture= THEME:GetPathG("_StepsDisplayListRow","arrow"),
				InitCommand=function(self) self:x(-20):diffuse(PlayerColor(PLAYER_2)):zoomx(-1) end,
				OnCommand=function(self) self:thump(1):effectmagnitude(1,1.25,1):effectclock('beat') end,
			},
			Def.BitmapText{
				Font= "Common Normal",
				Text="P2",
				InitCommand=function(self) self:x(-2):diffuse(PlayerColor(PLAYER_2)):shadowlength(1) end,
				OnCommand=function(self) self:zoom(0.75) end,
			}
		},
		CursorP1Frame = Def.Actor{
			ChangeCommand=function(self) self:stoptweening():decelerate(0.05) end,
		},
		CursorP2Frame = Def.Actor{
			ChangeCommand=function(self) self:stoptweening():decelerate(0.05) end,
		}
	}
}