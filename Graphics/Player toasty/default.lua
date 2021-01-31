local Player = ...
assert(Player)
local HasToasty = false
local fWidth = ( GAMESTATE:GetCurrentStyle():GetStyleType() == 'StyleType_OnePlayerTwoSides' ) and 600 or 256+16
return Def.ActorFrame {
	ToastyAchievedMessageCommand=function(self,params)
		if params.PlayerNumber == Player then
			self:thump(1):effectclock('beat'):effectmagnitude(1,1,1)
			:effectcolor1(color("1,1.125,1,1")):effectcolor2(color("1,1,1,1"))
		end
	end,
	Def.Quad {
		InitCommand=function(self) self:zoomto(fWidth,SCREEN_HEIGHT):diffuse(PlayerColor(Player)):diffusealpha(0)
		:fadeleft(32/(256+16)):faderight(32/(256+16)) end,
		ToastyAchievedMessageCommand=function(self,params)
			if params.PlayerNumber == Player then
				self:stoptweening():linear(2.125):diffuse(Color.Alpha( PlayerColor(Player), 0.345 ))
				:glow(color("1,1,1,0.5")):decelerate(3)
				:glow(Color.Alpha( ColorDarkTone( PlayerColor(Player) ), 0 )):diffuseramp()
				:effectcolor1(ColorLightTone( PlayerColor(Player) ))
				:effectcolor2(PlayerColor(Player)):effectclock('beat'):effectperiod(2)
				HasToasty = true
			end
		end,
		ToastyDroppedMessageCommand=function(self,params)
			if params.PlayerNumber == Player then
				if HasToasty then
					self:finishtweening():stopeffect():glow(color("1,1,1,0.5")):decelerate(0.35)
					:diffuse(Color.Alpha( Color("Black"), 0.25 ))
					:glow(color("1,1,1,0")):linear(0.35*0.25):diffusealpha(0)
					HasToasty = false
				else
					return
				end
			end
		end
	}
}