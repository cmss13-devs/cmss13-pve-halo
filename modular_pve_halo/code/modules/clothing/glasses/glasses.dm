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
	var/base_icon_state = "scouter"
	flags_equip_slot = SLOT_EYES|SLOT_FACE
	flags_obj = OBJ_NO_HELMET_BAND|OBJ_IS_HELMET_GARB
	eye_protection = EYE_PROTECTION_FLAVOR
	var/activated = TRUE
	var/datum/action/item_action/activation
	var/obj/item/attached_item
	garbage = FALSE

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
		if(activated)
			icon_state = "[base_icon_state]_f"
			item_state = "[base_icon_state]_f"
			base_icon_state = "[base_icon_state]_f"
		if(!activated)
			icon_state = "[base_icon_state]_f_0"
			item_state = "[base_icon_state]_f_0"
			base_icon_state = "[base_icon_state]_f"
		if(ismob(src.loc))
			var/mob/M = src.loc
			M.update_inv_glasses()
			M.update_inv_wear_mask()
	return ..()

/obj/item/clothing/glasses/scouter/on_enter_storage(obj/item/storage/internal/S)
	..()

	if(!istype(S))
		return

	remove_attached_item()

	attached_item = S.master_object
	RegisterSignal(attached_item, COMSIG_PARENT_QDELETING, PROC_REF(remove_attached_item))
	activation = new /datum/action/item_action/toggle(src, S.master_object)

	if(ismob(S.master_object.loc))
		activation.give_to(S.master_object.loc)

/obj/item/clothing/glasses/scouter/on_exit_storage(obj/item/storage/S)
	remove_attached_item()
	return ..()

/obj/item/clothing/glasses/scouter/proc/remove_attached_item()
	SIGNAL_HANDLER
	if(!attached_item)
		return

	UnregisterSignal(attached_item, COMSIG_PARENT_QDELETING)
	UnregisterSignal(attached_item, COMSIG_ITEM_EQUIPPED)
	qdel(activation)
	attached_item = null

/obj/item/clothing/glasses/scouter/ui_action_click(mob/owner, obj/item/holder)
	toggle_goggles(owner)
	activation.update_button_icon()

/obj/item/clothing/glasses/scouter/proc/toggle_goggles(mob/living/carbon/human/user)
	if(user.is_mob_incapacitated())
		return

	if(!attached_item)
		return

	activated = !activated
	if(activated)
		to_chat(user, SPAN_NOTICE("You activate the HUD."))
		icon_state = "[base_icon_state]"
		playsound(user, 'sound/handling/hud_on.ogg', 25, 1)
	else
		to_chat(user, SPAN_NOTICE("You de-activate the HUD."))
		playsound(user, 'sound/handling/hud_off.ogg', 25, 1)
		icon_state = "[base_icon_state]_0"

	attached_item.update_icon()

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

/obj/item/clothing/glasses/hud/health/unsc/get_examine_text(mob/user)
	. = ..()
	. += SPAN_INFO("Alt-clicking it in your hand will flip it.")

/obj/item/clothing/glasses/hud/health/unsc/clicked(mob/user, list/mods)
	if(mods[ALT_CLICK])
		icon_state = "scouter_med_f"
		deactive_state = "scouter_med_f_0"
		if(ismob(src.loc))
			var/mob/M = src.loc
			M.update_inv_glasses()
			M.update_inv_wear_mask()
