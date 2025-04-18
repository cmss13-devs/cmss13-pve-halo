//PARENT AREAS

/area/skyhammer
	icon = 'icons/turf/areas.dmi'
	powernet_name = "ground"
	temperature = ICE_COLONY_TEMPERATURE
	minimap_color = MINIMAP_AREA_COLONY
	requires_power = 0 //Location powered by thermal energy via volcano, no power needed

/area/skyhammer
	icon = 'icons/turf/area_shiva.dmi'
	name = "Sky Hammer - Terrain"
	ceiling = CEILING_MAX

/area/skyhammer/interior
	ceiling = CEILING_METAL
	sound_environment = SOUND_ENVIRONMENT_ROOM
	temperature = T20C

/area/skyhammer/exterior
	soundscape_playlist = SCAPE_PL_WIND
	sound_environment = SOUND_ENVIRONMENT_MOUNTAINS
	ceiling = CEILING_NONE
	icon = 'icons/turf/areas.dmi'

//SECONDARIES

/area/skyhammer/interior/gatehouse
	icon = 'icons/turf/area_shiva.dmi'
	icon_state = "hangars0"
	ceiling = CEILING_UNDERGROUND_ALLOW_CAS

/area/skyhammer/interior/gatehouse/a
	name = "Sky Hammer - Primary Checkpoint"

/area/skyhammer/interior/gatehouse/b
	name = "Sky Hammer - Secondary Checkpoint"

/area/skyhammer/interior/scout_posts
	name = "Sky Hammer - Scout Posts"
	icon_state = "blue"
	ceiling = CEILING_UNDERGROUND_ALLOW_CAS

/area/skyhammer/interior/bunker
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/skyhammer/interior/bunker/entrance
	name = "Sky Hammer - Bunker entrance"
	icon = 'icons/turf/area_shiva.dmi'
	icon_state = "caves3"

/area/skyhammer/interior/bunker/hallway
	name = "Sky Hammer - Main Hallway"
	sound_environment = SOUND_ENVIRONMENT_HALLWAY
	icon_state = "hallC1"

/area/skyhammer/interior/bunker/ammo_loader
	name = "Sky Hammer - Ammunition Loader"
	icon_state = "ass_line"

/area/skyhammer/interior/bunker/storage
	name = "Sky Hammer - Storage Closet"
	icon_state = "storage"

/area/skyhammer/interior/bunker/medbay
	name = "Sky Hammer - Medical Bay"
	icon_state = "medbay"

/area/skyhammer/interior/bunker/bathroom
	name = "Sky Hammer - Bathroom"
	icon_state = "toilet"

/area/skyhammer/interior/bunker/armory
	name = "Sky Hammer - Armory"
	icon_state = "armory"

/area/skyhammer/interior/bunker/bunks
	name = "Sky Hammer - Bunks"
	icon_state = "Sleep"

/area/skyhammer/interior/bunker/mac_controls
	name = "Sky Hammer - MACs Control Room"
	icon_state = "captain"
