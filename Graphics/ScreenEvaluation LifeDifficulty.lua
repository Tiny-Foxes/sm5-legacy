return Def.BitmapText{
	Font= "Common Normal",
	Text=GetLifeDifficulty(),
	AltText="",
	BeginCommand=function(self)
		self:settextf( Screen.String("LifeDifficulty"), GetLifeDifficulty() )
	end
}