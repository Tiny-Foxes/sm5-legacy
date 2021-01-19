local gc = Var "GameCommand"
local Name = gc:GetName()
local Index = gc:GetIndex()

local previewWidth = SCREEN_CENTER_X*0.825
local previewHeight = SCREEN_CENTER_Y

local function TitleMenuItem(text,focused)
	if focused == nil then focused = false end
	local textColor = focused and color("#FFFFFF") or color("#888888")
	return Def.BitmapText{
		Font= "Common Normal",
		Text=text,
		InitCommand=function(self) self:zoom(0.45):strokecolor(Color("Outline")):diffuse(textColor) end,
		GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
		LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
	}
end

local previews = {
	WhereToFind = Def.ActorFrame{
		Def.Sprite{
			Texture= THEME:GetPathG("_howto","find"),
			InitCommand=function(self) self:zoomto(previewWidth,previewHeight) end,
			GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
			LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
		}
	},
	HowToInstall = Def.ActorFrame{
		Def.Sprite{
			Texture= THEME:GetPathG("_howto","install"),
			InitCommand=function(self) self:zoomto(previewWidth,previewHeight) end,
			GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
			LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
		}
	},
	AdditionalFolders = Def.ActorFrame{
		Def.Quad{
			InitCommand=function(self) self:zoomto(previewWidth,previewHeight) end,
			GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
			LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
		},
		Def.Quad{
			InitCommand=function(self) self:y(-previewHeight*0.45):diffuse(color("#E0F0F0")):zoomto(previewWidth,previewHeight*0.1) end,
			GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
			LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
		},
		Def.BitmapText{
			Font= "Common normal",
			InitCommand=function(self) self:x(-(SCREEN_CENTER_X*0.4)):y(-(SCREEN_CENTER_Y*0.475)):zoom(0.625):halign(0):valign(0):diffuse(color("#000000")) end,
			BeginCommand=function(self)
				local text = "Preferences.ini"
				self:settext(text)
			end,
			GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
			LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
		},
		Def.BitmapText{
			Font= "Common normal",
			Text="[Options]\nAdditionalCourseFolders=\nAdditionalFolders=\nAdditionalSongFolders=",
			InitCommand=function(self) self:x(-(SCREEN_CENTER_X*0.4)):y(-(SCREEN_CENTER_Y*0.35)):zoom(0.75):halign(0):valign(0):diffuse(color("#000000")) end,
			GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
			LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
		}
	},
	ReloadSongs = Def.ActorFrame{
		Def.Sprite{
			Texture = THEME:GetPathB("ScreenTitleMenu","background/_bg"),
			InitCommand=function(self) self:zoomto(previewWidth,previewHeight):halign(0.5):valign(0.5) end,
			GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
			LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
		},
		Def.BitmapText{
			Font= "Common normal",
			InitCommand=function(self) self:zoom(0.4):maxwidth((previewWidth*1.6)-8) end,
			BeginCommand=function(self)
				local song = SONGMAN:GetRandomSong()
				self:settext("Loading songs...\n"..song:GetGroupName().."\n"..song:GetDisplayFullTitle())
			end,
			GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
			LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
		}
	},
	Exit = Def.ActorFrame{
		Def.Sprite{
			Texture = THEME:GetPathB("ScreenTitleMenu","background/_bg"),
			InitCommand=function(self) self:zoomto(previewWidth,previewHeight):halign(0.5):valign(0.5) end,
			GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
			LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
		},
		loadfile(THEME:GetPathG("ScreenTitleMenu","logo"))()..{
			InitCommand=function(self) self:y(-28):zoom(0.35):propagate(true) end,
			GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
			LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
		},
		TitleMenuItem("Game Start",true)..{
			InitCommand=function(self) self:y(20) end,
		},
		TitleMenuItem("Options")..{
			InitCommand=function(self) self:y(32) end,
		},
		TitleMenuItem("Edit/Share")..{
			InitCommand=function(self) self:y(44) end,
		},
		TitleMenuItem("Exit")..{
			InitCommand=function(self) self:y(56) end,
		}
	}
}

return Def.ActorFrame{
	Name="PreviewFrame",
	InitCommand=function(self) self:x(SCREEN_CENTER_X*1.5):y(SCREEN_CENTER_Y*0.85) end,
	OffCommand=function(self) self:bouncebegin(0.25):addx(SCREEN_CENTER_X) end,
	previews[Name],
	Def.BitmapText{
		Font="Common normal",
		Name="Explanation",
		--Text="The quick brown fox jumps over the lazy dog ".. Index .." times.",
		Text=Screen.String("Explanation-"..Name),
		-- was x(-(SCREEN_CENTER_X*0.4)):y(SCREEN_CENTER_Y*0.525)
		InitCommand=function(self) self:x(-(SCREEN_CENTER_X*0.8)):y(SCREEN_CENTER_Y*0.8):halign(0):valign(0):zoom(0.65):wrapwidthpixels((SCREEN_WIDTH*0.55)*1.75):NoStroke():shadowlength(1) end,
		GainFocusCommand=function(self) self:stoptweening():decelerate(0.5):diffusealpha(1) end,
		LoseFocusCommand=function(self) self:stoptweening():accelerate(0.5):diffusealpha(0) end,
	}
}