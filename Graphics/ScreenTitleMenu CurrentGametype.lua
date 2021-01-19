local curGameName = GAMESTATE:GetCurrentGame():GetName()

return Def.BitmapText{
	Font= "Common Normal",
	BeginCommand=function(self)
		self:settextf( Screen.String("CurrentGametype"), curGameName )
	end
}