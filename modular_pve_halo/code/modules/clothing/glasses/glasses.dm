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
	flags_equip_slot = SLOT_EYES|SLOT_FACE
	flags_obj = OBJ_NO_HELMET_BAND|OBJ_IS_HELMET_GARB
	eye_protection = EYE_PROTECTION_FLAVOR
	garbage = FALSE
	w_class = SIZE_TINY

	item_icons = list(
		WEAR_EYES = 'icons/halo/mob/humans/onmob/clothing/eyes.dmi',
		WEAR_FACE = 'icons/halo/mob/humans/onmob/clothing/eyes.dmi'
	)



/obj/item/clothing/glasses/scouter/clicked(mob/user, list/mods)
	if(mods[ALT_CLICK])
		if(!CAN_PICKUP(user, src))
			return ..()
		if(istypestrict(src, /obj/item/clothing/glasses/scouter))
			qdel(src)
			var/obj/item/clothing/glasses/scouter/flipped/new_scouter = new(user.loc)
			if(!active)
				new_scouter.toggle_glasses_effect()
			user.put_in_active_hand(new_scouter)
		else if(istypestrict(src, /obj/item/clothing/glasses/scouter/flipped))
			qdel(src)
			var/obj/item/clothing/glasses/scouter/new_scouter = new(user.loc)
			if(!active)
				new_scouter.toggle_glasses_effect()
			user.put_in_active_hand(new_scouter)
	return ..()

/obj/item/clothing/glasses/scouter/toggle_glasses_effect()
	active = !active
	clothing_traits_active = !clothing_traits_active
	update_icon()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(H.glasses == src  || H.wear_mask == src)
			if(has_tint)
				H.update_tint()
			H.update_sight()
			H.update_glass_vision(src)
			update_clothing_icon()

			if(hud_type)
				for(var/type in hud_type)
					var/datum/mob_hud/MH = GLOB.huds[type]
					if(active)
						MH.add_hud_to(H, src)
						playsound(H, 'sound/handling/hud_on.ogg', 25, 1)
					else
						MH.remove_hud_from(H, src)
						playsound(H, 'sound/handling/hud_off.ogg', 25, 1)
			if(active) //turning it on? then add the traits
				for(var/trait in clothing_traits)
					ADD_TRAIT(H, trait, TRAIT_SOURCE_EQUIPMENT(flags_equip_slot))
			else //turning it off - take away its traits
				for(var/trait in clothing_traits)
					REMOVE_TRAIT(H, trait, TRAIT_SOURCE_EQUIPMENT(flags_equip_slot))

	for(var/X in actions)
		var/datum/action/A = X
		if(istype(A, /datum/action/item_action/toggle))
			A.update_button_icon()

/obj/item/clothing/glasses/scouter/flipped // i dont wanna fuck with all the code

	icon_state = "scouter_f"
	item_state = "scouter_f"
	deactive_state = "scouter_f_0"

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
