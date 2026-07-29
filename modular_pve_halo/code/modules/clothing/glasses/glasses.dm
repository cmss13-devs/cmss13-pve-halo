//bimex tempfiller
/obj/item/clothing/glasses/sunglasses/big
	name = "tactical shades"
	desc = "Combat graded ballistic sunglasses with polarized lenses. Protects eyes from laser flash and splinters. Often avaliable at surplus stores or the PX."
	clothing_traits = null

/obj/item/clothing/glasses/sunglasses/big/orange
	name = "orange tactical shades"
	desc = "Combat graded ballistic sunglasses with polarized anti-glare lenses. Protects eyes from laser flash and splinters. Marginally more expensive."

/obj/item/clothing/glasses/sunglasses/big/classic
	name = "ballistic aviator shades"
	desc = "Combat graded large lens sunglasses with laser eye protection and ballistic defense. Enhanced grip nosebridge prevents them from falling off."

/obj/item/clothing/glasses/sunglasses/sechud
	desc = "Tied into local security systems, this set of sunglasses also can display personal information of suspects at a glance."

/obj/item/clothing/glasses/sunglasses/sechud/prescription
	desc = "Tied into local security systems, this set of prescription sunglasses also can display personal information of suspects at a glance."

/obj/item/clothing/glasses/sunglasses/big/unsc
	name = "\improper orange UNSC shooting shades"
	desc = "A pair of standard-issue shades. Some models come with an in-built HUD system, this one evidently does not."
	icon = 'icons/halo/obj/items/clothing/glasses/glasses.dmi'
	icon_state = "hudglasses"
	item_state = "hudglasses"
	item_icons = list(
		WEAR_EYES = 'icons/halo/mob/humans/onmob/clothing/eyes.dmi',
		WEAR_FACE = 'icons/halo/mob/humans/onmob/clothing/eyes.dmi'
		)

/obj/item/clothing/glasses/sunglasses/big/unsc/silver
	name = "\improper silver UNSC shooting shades"
	icon_state = "hudglasses_silver"
	item_state = "hudglasses_silver"

/obj/item/clothing/glasses/sunglasses/big/unsc/black
	name = "\improper black UNSC shooting shades"
	icon_state = "hudglasses_black"
	item_state = "hudglasses_black"

// scouter

/obj/item/clothing/glasses/scouter
	name = "UNSC scouter"
	desc = "A green holographic UNSC HUD display."
	icon = 'icons/halo/obj/items/clothing/glasses/glasses.dmi'
	icon_state = "scouter"
	item_state = "scouter"
	actions_types = list(/datum/action/item_action/toggle)
	toggleable = TRUE
	deactive_state = "scouter_0"
	var/base_icon_state = "scouter"
	flags_equip_slot = SLOT_EYES|SLOT_FACE
	flags_obj = OBJ_NO_HELMET_BAND|OBJ_IS_HELMET_GARB
	eye_protection = EYE_PROTECTION_FLAVOR
	var/flipped = FALSE
	garbage = FALSE
	w_class = SIZE_TINY

	item_icons = list(
		WEAR_EYES = 'icons/halo/mob/humans/onmob/clothing/eyes.dmi',
		WEAR_FACE = 'icons/halo/mob/humans/onmob/clothing/eyes.dmi'
	)

/obj/item/clothing/glasses/scouter/get_examine_text(mob/user)
	. = ..()
	. += SPAN_INFO("Alt-clicking it in your hand will flip it.")

/obj/item/clothing/glasses/scouter/clicked(mob/user, list/mods)
	if(mods[ALT_CLICK])
		if(!CAN_PICKUP(user, src))
			return ..()
		if(!flipped)
			deactive_state = "[base_icon_state]_f_0"
			if(active)
				icon_state = "[base_icon_state]_f"
				item_state = "[base_icon_state]_f"
			if(!active)
				icon_state = "[base_icon_state]_f_0"
				item_state = "[base_icon_state]_f_0"
			to_chat(user, SPAN_NOTICE("You flip the [src] around."))
		else
			deactive_state = "[base_icon_state]_0"
			if(active)
				icon_state = "[base_icon_state]"
				item_state = "[base_icon_state]"
			if(!active)
				icon_state = "[base_icon_state]_0"
				item_state = "[base_icon_state]_0"
			to_chat(user, SPAN_NOTICE("You flip the [src] back."))
		if(ismob(src.loc))
			var/mob/M = src.loc
			M.update_inv_glasses()
			M.update_inv_wear_mask()
	return ..()

// scouter, med

/obj/item/clothing/glasses/hud/health/unsc
	name = "UNSC health scouter"
	desc = "A blue holographic display providing readouts of health conditions at a glance."
	icon = 'icons/halo/obj/items/clothing/glasses/glasses.dmi'
	icon_state = "scouter_med"
	deactive_state = "scouter_med_0"
	item_icons = list(
		WEAR_EYES = 'icons/halo/mob/humans/onmob/clothing/eyes.dmi',
		WEAR_FACE = 'icons/halo/mob/humans/onmob/clothing/eyes.dmi'
	)
	var/flipped = FALSE

/obj/item/clothing/glasses/hud/health/unsc/get_examine_text(mob/user)
	. = ..()
	. += SPAN_INFO("Alt-clicking it in your hand will flip it.")

/obj/item/clothing/glasses/hud/health/unsc/clicked(mob/user, list/mods)
	if(mods[ALT_CLICK])
		if(flipped)
			deactive_state = "scouter_med_f_0"
			if(active)
				icon_state = "scouter_med_f"
			else
				icon_state = "scouter_med_f_0"
		else
			deactive_state = "scouter_med_0"
			if(active)
				icon_state = "scouter_med"
			else
				icon_state = "scouter_med_0"

		if(ismob(src.loc))
			var/mob/M = src.loc
			M.update_inv_glasses()
			M.update_inv_wear_mask()
	return ..()
