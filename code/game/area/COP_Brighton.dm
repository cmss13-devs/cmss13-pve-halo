/area/cop_brighton
	icon = 'icons/turf/area_almayer.dmi'
	icon_state = "almayer"
	ceiling = CEILING_UNDERGROUND_METAL_BLOCK_CAS
	ceiling_muffle = FALSE

/area/cop_brighton/inside
	minimap_color = MINIMAP_AREA_SEC
	ambience_exterior = AMBIENCE_ALMAYER
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/cop_brighton/inside/barracks
	name = "\improper COP Barracks"
	icon_state = "hangar"

/area/cop_brighton/inside/motor_pool
	name = "\improper COP Motor Pool"
	icon_state = "hangar"

/area/cop_brighton/inside/engineering
	name = "\improper COP Engineering"
	icon_state = "hangar"
	minimap_color = MINIMAP_AREA_ENGI

/area/cop_brighton/inside/operations
	name = "\improper COP Operations"
	icon_state = "hangar"
	minimap_color = MINIMAP_AREA_COMMAND

/area/cop_brighton/outside
	name = "\improper COP Terrain"
	icon_state = "green"
	soundscape_playlist = SCAPE_PL_WIND
	sound_environment = SOUND_ENVIRONMENT_MOUNTAINS
	minimap_color = MINIMAP_AREA_COLONY
	ceiling = CEILING_NO_PROTECTION

/area/cop_brighton/outside/landing_zone
	name = "\improper COP Landing Pad"
	icon_state = "hangar"
	minimap_color = MINIMAP_AREA_LZ
