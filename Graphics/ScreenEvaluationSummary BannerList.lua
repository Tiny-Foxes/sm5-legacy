local function GetList()
	local l = {}
	for i=1,7 do
		local stats
		stats = STATSMAN:GetPlayedStageStats(i)

		if not stats then
			break
		end

		l[#l+1] = stats
	end
	return l
end

local statList = GetList()

local as = Def.ActorScroller {
	SecondsPerItem = 1,
	NumItemsToDraw = 10,
	TransformFunction = function( self, offset, itemIndex, numItems)
		self:diffusealpha(1-offset)
	end,
	OnCommand=function(self)
		self:SetLoop(true)
		self:SetSecondsPauseBetweenItems(2)
		self:ScrollThroughAllItems()
	end
}

for i=1,#statList do
	local j = #statList - (i-1)
	as[#as+1] = Def.ActorFrame {
		Def.Sprite {
			InitCommand=function(self) self:scaletoclipped(256,80) end,
			OnCommand=function(self)
				local path = statList[j]:GetPlayedSongs()[1]:GetBannerPath() or THEME:GetPathG("Common","fallback banner")
				self:LoadBanner(path)
			end
		},
		Def.Quad {
			InitCommand=function(self) self:x(128):y(40):horizalign(right):vertalign(bottom) end,
			OnCommand=function(self) self:zoomto(80,18):diffuse(Color.Black):diffusealpha(0.5):fadeleft(0.5) end
		},
		Def.BitmapText{
			Font= "Common Normal",
			Text=FormatNumberAndSuffix(statList[j]:GetStageIndex()+1),
			InitCommand=function(self) self:x(128-4):y(40-4):horizalign(right):vertalign(bottom) end,
			OnCommand=function(self) self:diffuse(StageToColor(statList[j]:GetStage())):zoom(0.675):shadowlength(1) end
		}
	}
end

return Def.ActorFrame {
	as,
	Def.Sprite{ Texture= THEME:GetPathG("ScreenSelectMusic","BannerFrame") }
}
