local t = Def.ActorFrame {}

local x = Def.ActorFrame{
	FOV = 90,
	InitCommand=function(self) self:Center() end,
	UpdateParticleShowMessageCommand=function(self) self:hide_if( hideFancyElements ) end,
	Def.Quad {
		InitCommand=function(self) self:scaletoclipped(SCREEN_WIDTH,SCREEN_HEIGHT) end,
		OnCommand=function(self) self:diffuse(color("#FFCB05")):diffusebottomedge(color("#F0BA00")) end
	},
}

x[#x+1] = Def.ActorFrame {
	LoadActor("_checkerboard") .. {
		InitCommand=function(self)
			self:rotationx(-90/4*3.5):zoomto(SCREEN_WIDTH*2,SCREEN_HEIGHT*2):customtexturerect(0,0,SCREEN_WIDTH*4/256,SCREEN_HEIGHT*4/256)
		end,
		OnCommand=cmd(texcoordvelocity,0,0.25;diffuse,color("#ffd400");fadetop,1);
	}
}

x[#x+1] = LoadActor("_particleLoader") .. {
	InitCommand=function(self)
		self:xy(-SCREEN_CENTER_X,-SCREEN_CENTER_Y)
	end
}
-- if not hideFancyElements then
-- end

t[#t+1] = x

return t;
