/area/slade_point
	icon = 'icons/turf/area_almayer.dmi'
	icon_state = "almayer"
	ceiling = CEILING_PROTECTION_TIER_2
	ceiling_muffle = FALSE

/area/slade_point/city
	minimap_color = MINIMAP_AREA_COLONY
	ambience_exterior = AMBIENCE_CAVE
	sound_environment = SOUND_ENVIRONMENT_CITY
	powernet_name = "City"

/area/slade_point/city/power
	name = "\improper Generator Zone"
	icon_state = "alpha"

/area/slade_point/city/structures
	name = "\improper City Buildings"
	icon_state = "alpha"

/area/slade_point/city/streets
	name = "\improper City Streets"
	icon_state = "alpha"
	ceiling = CEILING_NO_PROTECTION

/area/slade_point/city/water
	name = "\improper Ocean"
	icon_state = "alpha"
	ceiling = CEILING_NO_PROTECTION

/area/slade_point/city/waterfront_highway
	name = "\improper Waterfront Highway"
	icon_state = "alpha"

/area/slade_point/alpha_site
	minimap_color = MINIMAP_AREA_COLONY
	ambience_exterior = AMBIENCE_CAVE
	sound_environment = SOUND_ENVIRONMENT_CITY
	powernet_name = "Alpha Site"

/area/slade_point/alpha_site/interior
	name = "\improper Alpha Site Interior"
	icon_state = "alpha"
	ceiling_muffle = TRUE

/area/slade_point/alpha_site/exterior
	name = "\improper Alpha Site Exterior"
	icon_state = "alpha"
	ceiling = CEILING_NO_PROTECTION

/area/slade_point/uplift_reserve
	minimap_color = MINIMAP_AREA_COLONY
	ambience_exterior = AMBIENCE_CAVE
	sound_environment = SOUND_ENVIRONMENT_CITY
	powernet_name = "Uplift Reserve"

/area/slade_point/uplift_reserve/interior
	name = "\improper Uplift Reserve Interior"
	icon_state = "alpha"
	ceiling_muffle = TRUE

/area/slade_point/uplift_reserve/exterior
	name = "\improper Uplift Reserve Exterior"
	icon_state = "alpha"
	ceiling = CEILING_NO_PROTECTION

/area/slade_point/tayari_plaza
	minimap_color = MINIMAP_AREA_COLONY
	ambience_exterior = AMBIENCE_CAVE
	sound_environment = SOUND_ENVIRONMENT_CITY
	powernet_name = "Tayari Plaza"

/area/slade_point/tayari_plaza/interior
	name = "\improper Tayari Plaza Interior"
	icon_state = "alpha"
	ceiling_muffle = TRUE

/area/slade_point/tayari_plaza/exterior
	name = "\improper Tayari Plaza Exterior"
	icon_state = "alpha"
	ceiling = CEILING_NO_PROTECTION

/area/slade_point/tayari_plaza/spdp
	name = "\improper Slade Point Police Department"
	minimap_color = MINIMAP_AREA_SEC
	icon_state = "alpha"

/area/slade_point/kizingo_boulevard
	minimap_color = MINIMAP_AREA_COLONY
	ambience_exterior = AMBIENCE_CAVE
	sound_environment = SOUND_ENVIRONMENT_CITY
	powernet_name = "Kizingo Boulevard"

/area/slade_point/kizingo_boulevard/interior
	name = "\improper Kizingo Boulevard Interior"
	icon_state = "alpha"
	ceiling_muffle = TRUE

/area/slade_point/kizingo_boulevard/exterior
	name = "\improper Kizingo Boulevard Exterior"
	icon_state = "alpha"
	ceiling = CEILING_NO_PROTECTION

/area/slade_point/kizingo_boulevard/vyrant_telecom
	name = "\improper Vyrant Telecom HQ"
	icon_state = "alpha"
	ceiling_muffle = TRUE

/area/slade_point/kikowani_station
	minimap_color = MINIMAP_AREA_COLONY
	ambience_exterior = AMBIENCE_CAVE
	sound_environment = SOUND_ENVIRONMENT_CITY
	powernet_name = "Kikowani Station"

/area/slade_point/kikowani_station/interior
	name = "\improper Kikowani Station Interior"
	icon_state = "alpha"
	ceiling_muffle = TRUE

/area/slade_point/kikowani_station/exterior
	name = "\improper Kikowani Station Exterior"
	icon_state = "alpha"
	ceiling = CEILING_NO_PROTECTION

/area/slade_point/kikowani_station/sp_hospital
	name = "\improper Slade Point Medical Center"
	minimap_color = MINIMAP_AREA_MEDBAY
	icon_state = "alpha"
	ceiling_muffle = TRUE

/area/slade_point/data_center
	minimap_color = MINIMAP_AREA_COLONY
	ambience_exterior = AMBIENCE_CAVE
	sound_environment = SOUND_ENVIRONMENT_HALLWAY
	powernet_name = "Data Center"
	ceiling = CEILING_PROTECTION_TIER_4
	ceiling_muffle = TRUE

/area/slade_point/data_center/sublevel_7
	name = "\improper Sublevel 7"
	icon_state = "alpha"

/area/slade_point/data_center/sublevel_8
	name = "\improper Sublevel 8"
	icon_state = "alpha"

/area/slade_point/data_center/sublevel_9
	name = "\improper Sublevel 9"
	icon_state = "alpha"

/area/slade_point/data_center/ai_core
	name = "\improper AI Core"
	icon_state = "alpha"
	sound_environment = SOUND_ENVIRONMENT_AUDITORIUM


//Elevators

/area/slade_point/elevator
	name = "\improper Elevator shuttle"
	icon_state = "red"
	unlimited_power = TRUE
	requires_power = FALSE

/area/slade_point/elevator/oni_elevator
	name = "\improper ONI Elevator"
	base_lighting_alpha = 255

/area/slade_point/elevator/oni_elevator/entry
	name = "\improper ONI Elevator Entry"

/area/slade_point/elevator/oni_elevator/exit
	name = "\improper ONI Elevator Exit"
