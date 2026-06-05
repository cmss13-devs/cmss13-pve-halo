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

/obj/item/attachable/scope/variable_zoom/covenant
	name = "\improper carbine scope"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"

/obj/item/attachable/scope/variable_zoom/covenant/activate_attachment(obj/item/weapon/gun/gun, mob/living/carbon/user, turn_off)
	if(turn_off || gun.zoom)
		if(gun.zoom)
			gun.zoom(user, zoom_offset, zoom_viewsize, allows_movement)
		return TRUE

	if(!gun.zoom)
		if(!(gun.flags_item & WIELDED))
			if(user)
				to_chat(user, SPAN_WARNING("You must hold [gun] with two hands to use [src]."))
			return FALSE
		if(!iscovenant(user))
			if(user)
				to_chat(user, SPAN_DANGER("There's no visible optic feed or compatible smart-link connection, how the hell do you expect to use this?!"))
			return FALSE
		else
			gun.zoom(user, zoom_offset, zoom_viewsize, allows_movement)
			apply_scoped_buff(gun,user)
	return TRUE
