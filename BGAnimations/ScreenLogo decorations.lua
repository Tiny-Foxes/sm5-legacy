return LoadFallbackB() .. {
	StandardDecorationFromFileOptional("Logo","Logo"),
	loadfile( THEME:GetPathB("_Arcade","decorations") )()
}