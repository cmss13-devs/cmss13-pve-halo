#define LIFEBOAT_BUMBLEBEE_WEST "bumblebee_west"

/obj/docking_port/mobile/crashable/escape_shuttle/bumblebee_west
	id = LIFEBOAT_BUMBLEBEE_WEST
	width = 6
	height = 3
	preferred_direction = WEST
	port_direction = WEST

/datum/map_template/shuttle/bumblebee_west
	name = "bumblebee"
	shuttle_id = LIFEBOAT_BUMBLEBEE_WEST

/obj/docking_port/stationary/escape_pod/bumblebee
	id = LIFEBOAT_BUMBLEBEE_WEST
	roundstart_template = /datum/map_template/shuttle/bumblebee_west
	width = 6
	height = 3
