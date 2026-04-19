/obj/structure/platform/pelican
	name = "tandem seat steps"
	icon = 'icons/halo/obj/structures/pelican_structures.dmi'
	icon_state = "platform"
	dir = WEST
	plane = FLOOR_PLANE

/obj/structure/prop/pelican_holotank
	name = "pelican holotank"
	desc = "A small holotank capable of projecting a hologram, and rarely the avatar of an AI."
	icon = 'icons/halo/obj/structures/pelican_structures.dmi'
	icon_state = "holotank"

/obj/structure/roof/pelican_roof
	icon = 'icons/halo/obj/structures/pelican.dmi'
	icon_state = "pelican"
	indestructible = TRUE
	unslashable = TRUE
	unacidable = TRUE
	lazy_nodes = FALSE
	mouse_opacity = FALSE
	plane = 900
	alpha = 255
	pixel_y = -413
	pixel_x = -320

/obj/structure/roof/pelican_roof/ex_act(severity, direction)
	return

/obj/structure/roof/pelican_roof/Initialize()
	. = ..()
	normal_image = image(icon, src, "cutout-alt2", layer = layer)
	under_image = image(icon, src, "cutout", layer = layer)
	under_image.plane = 900
	normal_image.plane = 900
	under_image.alpha = 75


/obj/effect/roof_node/pelican
	icon = 'icons/halo/landmarks.dmi'
	icon_state = "roof"
