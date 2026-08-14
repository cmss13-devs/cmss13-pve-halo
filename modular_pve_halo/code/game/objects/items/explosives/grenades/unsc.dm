
// Grenades

/obj/item/explosive/grenade/high_explosive/m15/unsc
	name = "M9 fragmentation grenade"
	desc = "A high explosive fragmentation grenade utilized by the UNSC."
	desc_lore = "Rumors spread about how every new posting someone gets, the design of the M9 fragmentation grenade looks different from the last ones they held."
	icon = 'icons/halo/obj/items/weapons/grenades.dmi'
	icon_state = "m9"
	item_state = "m9"
	falloff_mode = EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL_HALF

/obj/item/explosive/grenade/high_explosive/m15/unsc/launchable
	name = "40mm explosive grenade"
	desc = "A 40mm explosive grenade. It's unable to be primed by hand and must be loaded into the bottom of a rifle's grenade launcher."
	icon = 'icons/halo/obj/items/weapons/grenades.dmi'
	icon_state = "he_40mm"
	item_state = "he_40mm"
	caliber = "40mm"
	explosion_power = 80
	explosion_falloff = 40
	shrapnel_count = 0
	hand_throwable = FALSE
	has_arm_sound = FALSE
	dangerous = FALSE
	dual_purpose = TRUE
	underslug_launchable = TRUE

/obj/item/explosive/grenade/smokebomb/unsc
	name = "\improper M45 smoke grenade"
	desc = "A canister-type grenade typically used for signalling or concealment purposes."
	icon = 'icons/halo/obj/items/weapons/grenades.dmi'
	icon_state = "smonk"
	item_state = "smonk"
	det_time = 30
	throw_speed = SPEED_FAST
	caliber = "non-standard"
	underslug_launchable = FALSE
	dual_purpose = FALSE
	throw_range = 6
	arm_sound = 'sound/weapons/pinpull.ogg'
	spent_case = /obj/item/trash/grenade/unsc_smoke

/obj/item/explosive/grenade/high_explosive/pmc/unsc
	name = "\improper M47 blast grenade"
	desc = "A powerful high-explosive grenade designed to be used from defensive positions."
	icon = 'icons/halo/obj/items/weapons/grenades.dmi'
	icon_state = "defensive_grenade"
	item_state = "defensive_grenade"
	explosion_power = 90
	explosion_falloff = 8
	falloff_mode = EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL

/obj/item/explosive/grenade/incendiary/unsc
	name = "\improper TH-61 thermite grenade"
	desc = "An explosive-incendiary grenade designed primarily for anti-materiel purposes, but is just as effective against organic matter too."
	icon = 'icons/halo/obj/items/weapons/grenades.dmi'
	icon_state = "thermite_grenade"
	item_state = "thermite_grenade"
	caliber = "non-standard"
	underslug_launchable = FALSE
	dual_purpose = FALSE
	arm_sound = 'sound/weapons/pinpull.ogg'
	flame_level = 20
	burn_level = 60
	flameshape = FLAMESHAPE_STAR
	radius = 1
	fire_type = FIRE_VARIANT_DEFAULT

/obj/item/explosive/grenade/incendiary/unsc/prime(mob/living/user)
	set waitfor = 0
	INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(flame_radius), cause_data, radius, get_turf(src), flame_level, burn_level, flameshape, null, fire_type)
	playsound(src.loc, 'sound/weapons/halo/gun_firebomb.ogg', 35, 1, 4)
	qdel(src)
