return LoadActor("bg.png") ..{
	InitCommand=function(self)
		self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT)
	end,
	OnCommand=function(self)
		self:texcoordvelocity(0,-1):customtexturerect(0,0,SCREEN_WIDTH/self:GetWidth(),SCREEN_HEIGHT/self:GetHeight()):diffuse(color("0.9,0.9,0.9,1"))
	end
}