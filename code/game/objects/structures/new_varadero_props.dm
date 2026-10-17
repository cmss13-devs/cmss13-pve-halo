// ========================================== Prop stuff for new varadero
/obj/structure/prop/new_varadero_props
	icon = 'icons/obj/structures/props/landing_signs.dmi'
	icon_state = "new_varadero"

//---------------------Concrete Seaweed
/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall
	name = "concrete wall"
	desc = "A concrete wall that has been berrated by the sea."
	icon = 'icons/obj/structures/props/seaweed_covered.dmi'
	icon_state = "seaweed"
	density = TRUE
	anchored = TRUE
	layer = WALL_LAYER

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/clean
	icon_state = "seaweed_clean"
	density = FALSE

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/pattern_1
	icon_state = "seaweed0"

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/pattern_2
	icon_state = "seaweed1"

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/edge
	icon_state = "seaweed_east"
	density = FALSE

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/edge/west
	icon_state = "seaweed_west"

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/edge/north
	icon_state = "seaweed1_north"

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/half
	icon_state = "seaweed1_south"
	density = FALSE

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/half/pattern_1
	icon_state = "seaweed1_south_0"

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/half/pattern_2
	icon_state = "seaweed1_south_1"

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/half/edge
	icon_state = "seaweed1_east"

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/half/edge/west
	icon_state = "seaweed1_west"

/obj/structure/prop/new_varadero_props/Seaweed_Covered_Wall/half/edge/north
	icon_state = "seaweed1_north"

//---------------------SUPPORT BEAM
/obj/structure/prop/new_varadero_props/support_beam
	name = "\improper support strut"
	icon = 'icons/turf/support_beams.dmi'
	icon_state = "support_beam"
	anchored = TRUE
	unslashable = TRUE
	unacidable = TRUE
	density = FALSE
	opacity = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/new_varadero_props/support_beam/green
	icon_state = "support_beam_green"


/obj/structure/prop/new_varadero_props/support_beam/aqua
	icon_state = "support_beam_aqua"


/obj/structure/prop/new_varadero_props/support_beam/blue
	icon_state = "support_beam_blue"


/obj/structure/prop/new_varadero_props/support_beam/red
	icon_state = "support_beam_red"


/obj/structure/prop/new_varadero_props/support_beam/brown
	icon_state = "support_beam_brown"

/obj/structure/prop/new_varadero_props/support_beam/half
	icon_state = "support_beam_half"
