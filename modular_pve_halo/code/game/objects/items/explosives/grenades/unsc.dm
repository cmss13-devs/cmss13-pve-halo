
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
