local PlayerNumber = ...
assert( PlayerNumber )

local bpm_text_zoom = 0.875

local song_bpms= {}
local bpm_text= "??? - ???"
local function format_bpm(bpm)
	return ("%.0f"):format(bpm)
end

-- Courses don't have GetDisplayBpms.
if GAMESTATE:GetCurrentSong() then
	song_bpms= GAMESTATE:GetCurrentSong():GetDisplayBpms()
	song_bpms[1]= math.round(song_bpms[1])
	song_bpms[2]= math.round(song_bpms[2])
	if song_bpms[1] == song_bpms[2] then
		bpm_text= format_bpm(song_bpms[1])
	else
		bpm_text= format_bpm(song_bpms[1]) .. " - " .. format_bpm(song_bpms[2])
	end
end

return Def.ActorFrame {
	loadfile(THEME:GetPathB("_frame","3x1"))("rounded fill", 192-8) .. {
		OnCommand=function(self) self:diffuse(color("#333333")):diffusealpha(0.875) end,
	},
	loadfile(THEME:GetPathB("_frame","3x1"))("rounded gloss", 192-8) .. {
		OnCommand=function(self) self:diffusealpha(0.125) end,
	},
	Def.BitmapText{
		Font="Common Normal",
		Text=ToEnumShortString(PlayerNumber),
		Name="PlayerShortName",
		InitCommand=function(self) self:x(-104):maxwidth(32) end,
		OnCommand=function(self) self:diffuse(PlayerColor(PlayerNumber)):shadowlength(1) end
	},
	Def.BitmapText{
		Font="Common Normal",
		Text=bpm_text,
		Name="BPMRangeOld",
		InitCommand=function(self) self:x(-40):maxwidth(88/bpm_text_zoom) end,
		OnCommand=function(self) self:shadowlength(1):zoom(bpm_text_zoom) end
	},
	Def.Sprite{
		Texture=THEME:GetPathG("_StepsDisplayListRow","arrow"),
		Name="Seperator",
		InitCommand=function(self) self:x(14) end
	},
	Def.BitmapText{
		Font="Common Normal",
		Text="100 - 200000",
		Name="BPMRangeNew",
		InitCommand= function(self)
			self:x(68):maxwidth(88/bpm_text_zoom):shadowlength(1):zoom(bpm_text_zoom)
			local speed, mode= GetSpeedModeAndValueFromPoptions(PlayerNumber)
			self:playcommand("SpeedChoiceChanged", {pn= PlayerNumber, mode= mode, speed= speed})
		end,
		BPMWillNotChangeCommand=function(self) self:stopeffect() end,
		BPMWillChangeCommand=function(self) self:diffuseshift():effectcolor1(Color.White):effectcolor2(Color.Orange) end,
		SpeedChoiceChangedMessageCommand= function(self, param)
			if param.pn ~= PlayerNumber then return end
			local text= ""
			local no_change= true
			if param.mode == "x" then
				if not song_bpms[1] then
					text= "??? - ???"
				elseif song_bpms[1] == song_bpms[2] then
					text= format_bpm(song_bpms[1] * param.speed*.01)
				else
					text= format_bpm(song_bpms[1] * param.speed*.01) .. " - " ..
						format_bpm(song_bpms[2] * param.speed*.01)
				end
				no_change= param.speed == 100
			elseif param.mode == "C" then
				text= param.mode .. param.speed
				no_change= param.speed == song_bpms[2] and song_bpms[1] == song_bpms[2]
			else
				no_change= param.speed == song_bpms[2]
				if song_bpms[1] == song_bpms[2] then
					text= param.mode .. param.speed
				else
					local factor= song_bpms[1] / song_bpms[2]
					text= param.mode .. format_bpm(param.speed * factor) .. " - "
						.. param.mode .. param.speed
				end
			end
			self:settext(text)
			if no_change then
				self:queuecommand("BPMWillNotChange")
			else
				self:queuecommand("BPMWillChange")
			end
		end
	}
}