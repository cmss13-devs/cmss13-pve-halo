/obj/effect/landmark/halo_human_ai_spawner
	name = "Unknown"
	icon_state = "x3"
	var/equip_path = null
	invisibility_value = INVISIBILITY_OBSERVER

/obj/effect/landmark/halo_human_ai_spawner/Initialize(mapload, ...)
	. = ..()
	GLOB.halo_human_ai_spawns += src

/obj/effect/landmark/halo_human_ai_spawner/Destroy()
	GLOB.halo_human_ai_spawns -= src
	return ..()
