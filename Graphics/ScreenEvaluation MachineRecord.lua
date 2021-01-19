local Player = ...
assert(Player,"MachineRecord needs Player")
local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player)
local record = stats:GetMachineHighScoreIndex()
local hasMachineRecord = record ~= -1

return Def.BitmapText{
	Font= "Common normal",
	InitCommand=function(self) self:zoom(0.55):shadowlength(1):NoStroke():glowshift():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,0.25")) end,
	BeginCommand=function(self)
		self:visible(hasMachineRecord)
		local text = string.format(THEME:GetString("ScreenEvaluation", "MachineRecord"), record+1)
		self:settext(text)
	end
}