/obj/structure/machinery/light/covenant/invisible // this is not invulnerable because we want it to be destroyed in explosions and such
	name = "covenant ceiling light"
	desc = "Yeah, you're not supposed to see this."
	invisibility = INVISIBILITY_OBSERVER
	fitting = null
	icon = 'icons/halo/obj/items/lighting.dmi'
	icon_state = "cov_invis1"
	base_state = "cov_invis"
	use_power = USE_POWER_NONE
	needs_power = FALSE
	on =  TRUE
	light_range = 3
	light_power = 0.25
	light_color = LIGHT_COLOR_PINK

/obj/structure/machinery/light/covenant/invisible/small
	light_range = 2

/obj/structure/machinery/light/covenant/invisible/brighter
	light_range = 4

/obj/structure/machinery/light/covenant/invisible/brightest
	light_range = 5

/obj/structure/machinery/light/covenant/invisible/hangar
	light_range = 6
