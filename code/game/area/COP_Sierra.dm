//Area for COP Sierra

/area/cop_sierra
	name = "COP Sierra"
	icon = 'icons/turf/areas.dmi'
	ambience_exterior = AMBIENCE_TRIJENT
	icon_state = "cliff_blocked"
	can_build_special = TRUE //T-Comms structure
	powernet_name = "ground"
	temperature = 308.7 //kelvin, 35c, 95f
	minimap_color = MINIMAP_AREA_ENGI

/area/cop_sierra/exterior
	ambience_exterior = AMBIENCE_BIGRED
	soundscape_playlist = SCAPE_PL_THUNDER
	ceiling = CEILING_NONE
	icon = 'icons/turf/areas.dmi'

/area/shuttle/drop1/cop_sierra
	name = "COP Sierra - Primary Landing Zone"
	icon_state = "shuttle"

//INTERIOR

/area/cop_sierra/interior
	ceiling = CEILING_METAL

/area/cop_sierra/interior/bunker
	name = "Bunker"
	icon_state = "construction2"

/area/cop_sierra/interior/engi
	name = "Engineering/Servers"
	icon_state = "construction2"

/area/cop_sierra/interior/cic
	name = "Engineering/Servers"
	icon_state = "syndie-ship"

/area/cop_sierra/interior/quarters
	icon_state = "hallC2"

/area/cop_sierra/interior/quarters/alpha
	name = "Alpha Platoon Quarters"

/area/cop_sierra/interior/quarters/bravo
	name = "Bravo Platoon Quarters"

/area/cop_sierra/interior/bathroom
	name = "Bathroom"
	icon_state = "medical"

/area/cop_sierra/interior/showers
	name = "Showers"
	icon_state = "medical"

/area/cop_sierra/interior/messhall
	name = "Mess hall"
	icon_state = "food"

/area/cop_sierra/interior/medical
	name = "Medical"
	icon_state = "medical"

/area/cop_sierra/motor_pool
	name = "Motor Pool"
	icon_state = "workshop"

/area/cop_sierra/storage
	name = "Requestitions"
	icon_state = "req"
