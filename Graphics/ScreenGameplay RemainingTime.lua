local PlayerNumber = ...
assert( PlayerNumber )

return Def.BitmapText{
	Font= THEME:GetPathF("ScreenGameplay","RemainingTime"),
	Name="SurvivalTime",
	Text="",
}