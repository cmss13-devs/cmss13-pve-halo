
//------------- UNSC CRATES -------------

/obj/structure/closet/crate/unsc
	name = "UNSC supply crate"
	desc = "Standard issue supply crate for UNSC forces capable of storing a variety of objects."
	icon = 'icons/halo/obj/structures/crates.dmi'
	icon_state = "closed_unsc"
	icon_opened = "open_unsc"
	icon_closed = "closed_unsc"

//------------- ORDNANCE CANISTER -------------

/obj/structure/closet/ordnance_canister
	name = "Type-A Resupply Canister"
	desc = "Used to quickly drop supplies, often ferried by UNSC pelicans into hot combat zones."
	icon = 'icons/halo/obj/structures/crates_32x48.dmi'
	icon_state = "closed_pod"
	icon_opened = "opened_pod"
	icon_closed = "closed_pod"
	layer = ABOVE_MOB_LAYER
	anchored = TRUE
	var/drop_on_spawn // dont use this with open on spawn
	var/open_on_spawn // dont use this with drop on spawn
	var/contents_path
	var/contents_number

/obj/item/prop/ordnance_canister_door
	w_class = SIZE_HUGE
	icon = 'icons/halo/obj/structures/crates_32x48.dmi'
	icon_state = "cover_off"

/obj/structure/closet/ordnance_canister/open()
	if(opened)
		return 0
	if(!can_open())
		return 0

	for(var/obj/contents in src)
		contents.forceMove(get_step(src, SOUTH))
	opened = 1
	update_icon()
	if(climbable)
		structure_shaken()
		climbable = 0 //Open crate is not a surface that works when climbing around
	return 1

/obj/structure/closet/ordnance_canister/can_close()
	return FALSE

/obj/structure/closet/ordnance_canister/dropping/Initialize()
	. = ..()
	if(contents_path && contents_number)
		for(var/amount = 1 to contents_number)
			new contents_path(src)
	if(drop_on_spawn)
		drop_down()
		return
	if(open_on_spawn)
		pop_open()
		return

/obj/structure/closet/ordnance_canister/proc/pop_open()
	icon_state = "closed_landed_pod"
	icon_opened = "opened_landed_pod"
	icon_closed = "closed_landed_pod"
	playsound(src, 'sound/effects/odst_pod/door_clang_1.ogg')
	addtimer(CALLBACK(src, PROC_REF(finish_open)), 2)

/obj/structure/closet/ordnance_canister/proc/finish_open()
	open()
	var/obj/item/prop/ordnance_canister_door/door
	door = new /obj/item/prop/ordnance_canister_door(get_turf(src))
	var/rand_x = rand(-1, 1)
	var/turf/target = get_offset_target_turf(loc, rand_x, -2)
	var/target_turf = get_turf(target)
	door.throw_atom(target_turf, 16, SPEED_FAST, loc, FALSE)
	create_pod_light()
	playsound(door, 'sound/effects/odst_pod/door_clang_1.ogg')

/obj/structure/closet/ordnance_canister/proc/drop_down()
	pixel_y = 400
	animate(src, pixel_y = 0, time = 1.5 SECONDS, easing = LINEAR_EASING)
	addtimer(CALLBACK(src, PROC_REF(pop_open)), 1.45 SECONDS)

/obj/structure/closet/ordnance_canister/proc/create_pod_light()
	light_pixel_y = 20
	light_system = HYBRID_LIGHT
	set_light(3, 3, "#972121", /atom/movable/lighting_mask/slow_blinking)

// =================
// Supply presets
// =================

// Weapons, in case marines lose them and need a resupply. Also it's a halo reference so we need it of course.

/obj/structure/closet/ordnance_canister/dropping/weapon/ma5c
	name = parent_type::name + " (MA5C Rifles)"
	contents_path = /obj/item/weapon/gun/rifle/halo/ma5c
	contents_number = 2
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/weapon/ma5b
	name = parent_type::name + " (MA5B Rifles)"
	contents_path = /obj/item/weapon/gun/rifle/halo/ma5b
	contents_number = 2
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/weapon/br55
	name = parent_type::name + " (BR55 Rifles)"
	contents_path = /obj/item/weapon/gun/rifle/halo/br55
	contents_number = 2
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/weapon/m7
	name = parent_type::name + " (M7 SMG)"
	contents_path = /obj/item/weapon/gun/smg/halo/m7
	contents_number = 3
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/weapon/m7_socom
	name = parent_type::name + " (M7/S SMG)"
	contents_path = /obj/item/weapon/gun/smg/halo/m7/socom
	contents_number = 3
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/weapon/m90_shotgun
	name = parent_type::name + " (M90 CAWS)"
	contents_path = /obj/item/weapon/gun/shotgun/pump/halo/m90
	contents_number = 1
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/weapon/srs99_sniper
	name = parent_type::name + " (SRRS99-AM)"
	contents_path = /obj/item/weapon/gun/rifle/sniper/halo/unloaded
	contents_number = 1
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/weapon/m41_spnkr
	name = parent_type::name + " (M41 SPNKr)"
	contents_path = /obj/item/weapon/gun/halo_launcher/spnkr/unloaded
	contents_number = 1
	drop_on_spawn = TRUE



// Ammo

/obj/structure/closet/ordnance_canister/dropping/ammo/ma5c
	name = parent_type::name + " (MA5C Ammo)"
	contents_path = /obj/item/ammo_box/magazine/unsc/ma5c
	contents_number = 2
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/ma5c_shredder
	name = parent_type::name + " (MA5C Ammo - Shredder)"
	contents_path = /obj/item/ammo_box/magazine/unsc/ma5c/shredder
	contents_number = 2
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/ma5b
	name = parent_type::name + " (MA5B Ammo)"
	contents_path = /obj/item/ammo_box/magazine/unsc/ma5b
	contents_number = 2
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/ma5b_shredder
	name = parent_type::name + " (MA5B Ammo - Shredder)"
	contents_path = /obj/item/ammo_box/magazine/unsc/ma5b/shredder
	contents_number = 2
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/br55
	name = parent_type::name + " (BR55 Ammo)"
	contents_path = /obj/item/ammo_box/magazine/unsc/br55
	contents_number = 2
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/br55_extended
	name = parent_type::name + " (BR55 Ammo - Shredder)"
	contents_path = /obj/item/ammo_box/magazine/unsc/br55/extended
	contents_number = 2
	drop_on_spawn = TRUE


/obj/structure/closet/ordnance_canister/dropping/ammo/m7
	name = parent_type::name + " (M7 Ammo)"
	contents_path = /obj/item/ammo_box/magazine/misc/unsc/m7_ammo
	contents_number = 3
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/m6c
	name = parent_type::name + " (M6C Ammo)"
	contents_path = /obj/item/ammo_box/magazine/unsc/small/m6c
	contents_number = 3
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/m6c
	name = parent_type::name + " (M6C Ammo - SOCOM)"
	contents_path = /obj/item/ammo_box/magazine/unsc/small/m6c/socom
	contents_number = 3
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/m6g
	name = parent_type::name + " (M6G Ammo)"
	contents_path = /obj/item/ammo_box/magazine/unsc/small/m6g
	contents_number = 3
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/m6d
	name = parent_type::name + " (M6D Ammo)"
	contents_path = /obj/item/ammo_box/magazine/unsc/small/m6d
	contents_number = 3
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/shotgun
	name = parent_type::name + " (Buckshot Ammo)"
	contents_path = /obj/item/ammo_magazine/shotgun/buckshot/unsc
	contents_number = 3
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/spnkr
	name = parent_type::name + " (M41 SPNKr Ammo)"
	contents_path = /obj/item/ammo_magazine/spnkr
	contents_number = 2
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/ammo/sniper
	name = parent_type::name + " (SRS99-AM Ammo)"
	contents_path = /obj/item/ammo_magazine/rifle/halo/sniper
	contents_number = 4
	drop_on_spawn = TRUE

// Misc. Supplies

/obj/structure/closet/ordnance_canister/dropping/misc/m9_grenades
	name = parent_type::name + " (M9 Grenades)"
	contents_path = /obj/item/ammo_box/magazine/misc/unsc/grenade
	contents_number = 2
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/misc/launchable_grenades
	name = parent_type::name + " (40mm Grenades)"
	contents_path = /obj/item/ammo_box/magazine/misc/unsc/grenade/launchable
	contents_number = 3
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/misc/medical_resupply
	name = parent_type::name + " (Medical Supplies)"
	drop_on_spawn = TRUE

/obj/structure/closet/ordnance_canister/dropping/misc/medical_resupply/Initialize() // We need multiple paths and the system doesn't support that and I'm too lazy to make it do that for one thing.
	. = ..()
	new /obj/item/ammo_box/magazine/misc/unsc/medical_packets(src)
	new /obj/item/storage/firstaid/unsc/corpsman(src)
	new /obj/item/storage/firstaid/unsc/corpsman(src)
	new /obj/item/storage/firstaid/unsc/corpsman(src)
	new /obj/item/storage/firstaid/unsc/corpsman(src)
