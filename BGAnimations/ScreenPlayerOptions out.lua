if PREFSMAN:GetPreference( "ShowSongOptions" ) ~= "Maybe_Ask" then
	return loadfile( THEME:GetPathB("Screen", "out") )()
end

return Def.ActorFrame {
	loadfile( THEME:GetPathB("Screen", "out") )(),

	Def.BitmapText{
		Font= "common normal",
		InitCommand=function(self)
			self:settext("Press &START; for more options"):x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+100):visible(false) end,
		AskForGoToOptionsCommand=function(self)
			self:visible(true)
			:diffusealpha(0)
			:linear(0.15)
			:zoomy(1)
			:diffusealpha(1)
			:sleep(1)
			:linear(0.15)
			:diffusealpha(0)
			:zoomy(0)
		 end,
		GoToOptionsCommand=function(self) self:visible(false) end,
	},
	Def.BitmapText{
		Font= "common normal",
		InitCommand=function(self)
			self:settext("entering options..."):x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+100):visible(false) end,
		AskForGoToOptionsCommand=function(self)
			self:visible(false)
			:linear(0.15)
			:zoomy(1)
			:diffusealpha(1)
			:sleep(1)
			:linear(0.15)
			:diffusealpha(0)
			:zoomy(0)
		 end,
		GoToOptionsCommand=function(self) self:visible(true) end,
	}
}