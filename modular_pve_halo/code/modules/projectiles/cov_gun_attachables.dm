/obj/item/attachable/carbine_muzzle
	name = "\improper carbine muzzle"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/covenant/covenant_attachments.dmi'
	icon_state = "carbine_muzzle"
	attach_icon = "carbine_muzzle"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = -7

/obj/item/attachable/scope/mini/covenant
	name = "\improper carbine scope"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"

/obj/item/attachable/scope/mini/covenant/activate_attachment(obj/item/weapon/gun/gun, mob/living/carbon/user, turn_off)
	if(!iscovenant(user))
		to_chat(user, SPAN_DANGER("There's no visible optic feed or compatible smart-link connection, how the hell do you expect to use [src]?!"))
		return FALSE
	..()

/obj/item/attachable/scope/variable_zoom/covenant
	name = "\improper needle rifle scope"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"


/obj/item/attachable/scope/variable_zoom/covenant/activate_attachment(obj/item/weapon/gun/gun, mob/living/carbon/user, turn_off)
	if(!iscovenant(user))
		to_chat(user, SPAN_DANGER("There's no visible optic feed or compatible smart-link connection, how the hell do you expect to use [src]?!"))
		return FALSE
	..()

/obj/item/attachable/repeater_stock
	name = "\improper repeater stock"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/covenant/covenant_attachments.dmi'
	icon_state = "plasma_repeater_stock"
	attach_icon = "plasma_repeater_stock"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = 7

/obj/item/attachable/repeater_stock/heavy
	icon_state = "heavy_repeater_stock"
	attach_icon = "heavy_repeater_stock"

/obj/item/attachable/needle_rifle_stock
	name = "\improper needle rifle stock"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/covenant/covenant_attachments.dmi'
	icon_state = "needle_rifle_stock"
	attach_icon = "needle_rifle_stock"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = 0

/obj/item/attachable/needle_rifle_muzzle
	name = "\improper needle rifle muzzle"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/covenant/covenant_attachments.dmi'
	icon_state = "needle_rifle_muzzle"
	attach_icon = "needle_rifle_muzzle"
	slot = "muzzle"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = 0
