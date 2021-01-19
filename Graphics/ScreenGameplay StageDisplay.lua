local curScreen = Var "LoadingScreen"
local curStageIndex = GAMESTATE:GetCurrentStageIndex() + 1
local playMode = GAMESTATE:GetPlayMode()

return Def.ActorFrame {
	loadfile(THEME:GetPathB("_frame","3x3"))("rounded black",64,16),
	Def.BitmapText{
		Font= "Common Normal",
		InitCommand=function(self) self:y(-1):shadowlength(1):playcommand("Set") end,
		CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end,
		CurrentCourseChangedMessageCommand=function(self) self:playcommand("Set") end,
		CurrentStepsP1ChangedMessageCommand=function(self) self:playcommand("Set") end,
		CurrentStepsP2ChangedMessageCommand=function(self) self:playcommand("Set") end,
		CurrentTraiP1ChangedMessageCommand=function(self) self:playcommand("Set") end,
		CurrentTraiP2ChangedMessageCommand=function(self) self:playcommand("Set") end,
		SetCommand=function(self)
			local curStage = GAMESTATE:GetCurrentStage()
			if GAMESTATE:IsCourseMode() then
				local stats = STATSMAN:GetCurStageStats()
				if not stats then
					return
				end
				local mpStats = stats:GetPlayerStageStats( GAMESTATE:GetMasterPlayerNumber() )
				local songsPlayed = mpStats:GetSongsPassed() + 1
				self:settextf("%i / %i", songsPlayed, GAMESTATE:GetCurrentCourse():GetEstimatedNumStages())
			else
				if GAMESTATE:IsEventMode() then
					self:settextf("Stage %s", curStageIndex)
				else
					local thed_stage= thified_curstage_index(false)
					if THEME:GetMetric(curScreen,"StageDisplayUseShortString") then
						self:settextf(thed_stage)
					else
						self:settextf("%s Stage", thed_stage)
					end
				end
			end
			self:zoom(0.675)
			self:diffuse(StageToColor(curStage))
			self:diffusetopedge(ColorLightTone(StageToColor(curStage)))
		end
	}
}

