/obj/structure/shuttle/part/bumblebee
	name = "beeeeeeeeee"
	icon = 'icons/halo/obj/structures/bumblebee_parts.dmi'
	icon_state = "0,1"
	layer = WALL_LAYER

/obj/structure/shuttle/part/bumblebee/ex_act(severity, direction)
	return FALSE

/obj/structure/shuttle/part/bumblebee/no_dense
	density = FALSE

/obj/structure/shuttle/part/bumblebee/no_dense/opacity_false
	opacity = FALSE

/obj/structure/shuttle/part/bumblebee/opacity_false
	opacity = FALSE

/obj/structure/bed/chair/vehicle/bumblebee

/obj/structure/bed/chair/vehicle/bumblebee/handle_rotation()
	if(dir == NORTH)
		layer = 4.09 // above mob layer below above_mob layer
	else
		layer = BELOW_MOB_LAYER
	if(buckled_mob)
		buckled_mob.setDir(dir)

/obj/structure/machinery/door/airlock/evacuation/bumblebee
	name = "\improper Evacuation Airlock"
	icon = 'icons/halo/obj/structures/doors/bumblebee_door.dmi'
	unslashable = TRUE
	unacidable = TRUE

/obj/structure/machinery/computer/shuttle/escape_pod_panel/bumblebee
	icon = 'icons/halo/obj/structures/machinery/bumblebee_computer.dmi'
	icon_state = "console_on"
