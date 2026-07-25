/obj/structure/shuttle/part/bumblebee
	name = "SKT-9 \"Bumblebee\" Lifeboat"
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

// Change from parent: does not make the chair dense when multiple on one tile are occupied.
/obj/structure/bed/chair/vehicle/bumblebee/afterbuckle(mob/buckled)
	if(buckled_mob)
		if(buckled_mob != buckled)
			return
		icon_state = initial(icon_state) + "_buckled"
		overlays += chairbar

		if(buckle_offset_x != 0)
			mob_old_x = buckled.pixel_x
			buckled.pixel_x = buckle_offset_x
		if(buckle_offset_y != 0)
			mob_old_y = buckled.pixel_y
			buckled.pixel_y = buckle_offset_y
	else
		icon_state = initial(icon_state)
		overlays -= chairbar

		if(buckle_offset_x != 0)
			buckled.pixel_x = mob_old_x
			mob_old_x = 0
		if(buckle_offset_y != 0)
			buckled.pixel_y = mob_old_y
			mob_old_y = 0

	if(buckled_mob)
		ADD_TRAIT(buckled_mob, TRAIT_UNDENSE, DOUBLE_SEATS_TRAIT)
	else
		REMOVE_TRAIT(buckled, TRAIT_UNDENSE, DOUBLE_SEATS_TRAIT)

	handle_rotation()


/obj/structure/machinery/door/airlock/evacuation/bumblebee
	name = "\improper Bumblebee Evacuation Airlock"
	icon = 'icons/halo/obj/structures/doors/bumblebee_door.dmi'
	unslashable = TRUE
	unacidable = TRUE
	opacity = FALSE
	glass = TRUE

/obj/structure/machinery/computer/shuttle/escape_pod_panel/bumblebee
	icon = 'icons/halo/obj/structures/machinery/bumblebee_computer.dmi'
	icon_state = "console_on"

/obj/structure/roof/bumblebee_roof
	icon = 'icons/halo/obj/structures/bumblebee.dmi'
	icon_state = "bumblebee"
	indestructible = TRUE
	unslashable = TRUE
	unacidable = TRUE
	lazy_nodes = FALSE
	mouse_opacity = FALSE
	plane = 900
	alpha = 255
	pixel_y = -32
	pixel_x = -32

/obj/structure/roof/bumblebee_roof/ex_act(severity, direction)
	return

/obj/structure/roof/bumblebee_roof/Initialize()
	. = ..()
	normal_image = image(icon, src, "bumblebee", layer = layer)
	under_image = image(icon, src, "blank", layer = layer)
	under_image.plane = 900
	normal_image.plane = 900
	under_image.alpha = 75


/obj/effect/roof_node/bumblebee
	icon = 'icons/halo/landmarks.dmi'
	icon_state = "roof"
