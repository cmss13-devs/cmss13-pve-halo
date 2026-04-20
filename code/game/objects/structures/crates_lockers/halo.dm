
//------------- UNSC CRATES -------------

/obj/structure/closet/crate/unsc
	name = "UNSC supply crate"
	desc = "Standard issue supply crate for UNSC forces capable of storing a variety of objects."
	icon = 'icons/halo/obj/structures/crates.dmi'
	icon_state = "closed_unsc"
	icon_opened = "open_unsc"
	icon_closed = "closed_unsc"

//------------- ORDNANCE CANISTER -------------

/obj/structure/closet/crate/unsc/ordnance_canister
	name = "Type-A Resupply Canister"
	desc = "Used to quickly drop supplies, often ferried by UNSC pelicans into hot combat zones."
	icon = 'icons/halo/obj/structures/crates_32x48.dmi'
	icon_state = "closed_pod"
	icon_opened = "opened_pod"
	icon_closed = "closed_pod"

/obj/item/prop/ordnance_canister_door
	w_class = SIZE_HUGE
	icon = 'icons/halo/obj/structures/crates_32x48.dmi'
	icon_state = "cover_off"

/obj/structure/closet/crate/unsc/ordnance_canister/open()
	if(opened)
		return 0
	if(!can_open())
		return 0

	playsound(src.loc, 'sound/machines/click.ogg', 15, 1)
	for(var/obj/contents in src)
		contents.forceMove(get_turf(src))
	opened = 1
	update_icon()
	if(climbable)
		structure_shaken()
		climbable = 0 //Open crate is not a surface that works when climbing around
	return 1

/obj/structure/closet/crate/unsc/ordnance_canister/can_close()
	return FALSE

/obj/structure/closet/crate/unsc/ordnance_canister/proc/pop_open()
	icon_state = "closed_landed_pod"
	icon_opened = "opened_landed_pod"
	icon_closed = "closed_landed_pod"
	addtimer(CALLBACK(src, PROC_REF(finish_open)), 2)

/obj/structure/closet/crate/unsc/ordnance_canister/proc/finish_open()
	open()
	var/obj/item/prop/ordnance_canister_door/door
	door = new /obj/item/prop/ordnance_canister_door(get_turf(src))
	var/rand_x = rand(-1, 1)
	var/turf/target = get_offset_target_turf(loc, rand_x, -2)
	var/target_turf = get_turf(target)
	door.throw_atom(target_turf, 16, SPEED_FAST, loc, FALSE)
	create_pod_light()
	playsound(door, 'sound/effects/odst_pod/door_clang_1.ogg')

/obj/structure/closet/crate/unsc/ordnance_canister/proc/drop_down()
	pixel_z = 400
	animate(src, pixel_z = 0, time = 2 SECONDS, easing = LINEAR_EASING)
	addtimer(CALLBACK(src, PROC_REF(pop_open)), 2 SECONDS)

/obj/structure/closet/crate/unsc/ordnance_canister/proc/create_pod_light()
	light_system = HYBRID_LIGHT
	light_mask_type = /atom/movable/lighting_mask/slow_blinking
	light_pixel_y = 20
	light_range = 3
	light_power =3
	light_color = "#972121"
	set_light_on(TRUE)

/obj/structure/closet/crate/unsc/ordnance_canister/dropping/Initialize()
	. = ..()
	drop_down()

/obj/structure/closet/crate/unsc/ordnance_canister/dropped/Initialize()
	. = ..()
	pop_open()
