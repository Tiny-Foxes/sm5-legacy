InitUserPrefs()

return Def.ActorFrame {
	StandardDecorationFromFileOptional("Footer","Footer"),
	StandardDecorationFromFileOptional("Logo","Logo"),
	StandardDecorationFromFileOptional("VersionInfo","VersionInfo"),
	StandardDecorationFromFileOptional("CurrentGametype","CurrentGametype"),
	StandardDecorationFromFileOptional("LifeDifficulty","LifeDifficulty"),
	StandardDecorationFromFileOptional("TimingDifficulty","TimingDifficulty"),
	StandardDecorationFromFileOptional("NetworkStatus","NetworkStatus"),
	StandardDecorationFromFileOptional("SystemDirection","SystemDirection"),

	StandardDecorationFromFileOptional("NumSongs","NumSongs") .. {
		SetCommand=function(self)
			local InstalledSongs, AdditionalSongs, InstalledCourses, AdditionalCourses, Groups, Unlocked = 0
			if SONGMAN:GetRandomSong() then
				InstalledSongs, AdditionalSongs, InstalledCourses, AdditionalCourses, Groups, Unlocked =
					SONGMAN:GetNumSongs(),
					SONGMAN:GetNumAdditionalSongs(),
					SONGMAN:GetNumCourses(),
					SONGMAN:GetNumAdditionalCourses(),
					SONGMAN:GetNumSongGroups(),
					SONGMAN:GetNumUnlockedSongs()
			else
				return
			end

			self:settextf(THEME:GetString("ScreenTitleMenu","%i Songs (%i Groups), %i Courses"), InstalledSongs, Groups, InstalledCourses)
		end
	}

}
