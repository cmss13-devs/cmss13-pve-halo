

/obj/item/attachable/ma5c_shroud
	name = "\improper MA5C shroud"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_attachments.dmi'
	icon_state = "ma5c_shroud"
	attach_icon = "ma5c_shroud"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = -7

/obj/item/attachable/attached_gun/grenade/ma5c
	name = "\improper M301C 40mm grenade launcher"
	desc = "A 40mm underslung grenade launcher. The C variant of the M301 is purpose built for the MA5C ICWS to serve as a grip for the weapon much like the standard-issue flashlight of the MA5C."
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_attachments.dmi'
	icon_state = "ma5c_gl"
	attach_icon = "ma5c_gl_a"
	current_rounds = 0
	max_rounds = 1
	max_range = 10
	attachment_firing_delay = 5

/obj/item/attachable/flashlight/ma5c
	name = "\improper M2C integrated flashlight"
	desc = "The M2C integrated flashlight, standard-issue to any MA5C assault rifle and essential to handling it."
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_attachments.dmi'
	icon_state = "ma5c_flashlight"
	attach_icon = "ma5c_flashlight_a"
	original_state = "ma5c_flashlight"
	original_attach = "ma5c_flashlight_a"
	slot = "under"

/obj/item/attachable/ma5c_barrel
	name = "\improper MA5C barrel"
	desc = "The barrel to an MA5C ICWS assault rifle. Better not leave without it."
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_attachments.dmi'
	icon_state = "ma5c_barrel"
	attach_icon = "ma5c_barrel"
	slot = "muzzle"
	size_mod = 0
