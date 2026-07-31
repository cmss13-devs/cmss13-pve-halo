/obj/item/clothing/head/helmet/unsc
	name = "\improper CH252 helmet"
	desc = "The standard issue ballistic helmet in use by the UNSC's Army and Marine Corps. Latest technologies rate this helmet very strong against most conventional human weaponry, while still providing a comfortable platform for a trooper's communications and HUD/Smartlink systems."
	icon = 'icons/halo/obj/items/clothing/hats/hats_by_faction/hat_unsc.dmi'
	icon_state = "helmet_2"
	item_state = "helmet_2"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	health = 5
	force = 15
	throwforce = 15
	attack_verb = list("whacked", "hit", "smacked", "beaten", "battered")
	var/obj/structure/machinery/camera/camera
	var/helmet_overlays[]
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = NONE
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	var/flags_marine_helmet = HELMET_GARB_OVERLAY|HELMET_DAMAGE_OVERLAY
	var/helmet_bash_cooldown = 0

	valid_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	restricted_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	item_icons = list(
		WEAR_HEAD = 'icons/halo/mob/humans/onmob/clothing/hats/hats_by_faction/hat_unsc.dmi'
	)

	var/obj/item/storage/internal/headgear/pockets
	var/storage_slots = 2
	var/storage_slots_reserved_for_garb = 2
	var/storage_max_w_class = SIZE_TINY
	var/storage_max_storage_space = 4

	var/helmet_overlay_icon = 'icons/halo/mob/humans/onmob/helmet_garb.dmi'

	var/list/built_in_visors = null

	var/list/inserted_visors = list()

	var/max_inserted_visors = 1

	var/obj/item/device/helmet_visor/active_visor = null

	var/start_down_visor_type = null

	var/motion_tracker = FALSE

/obj/item/clothing/head/helmet/unsc/Initialize(mapload, list/new_protection)
	. = ..()

	if(!(flags_atom & NO_SNOW_TYPE))
		select_gamemode_skin(type, null, new_protection)

	helmet_overlays = list() //To make things simple.

	pockets = new(src)
	pockets.storage_slots = HAS_FLAG(flags_marine_helmet, HELMET_GARB_OVERLAY) ? storage_slots + storage_slots_reserved_for_garb : storage_slots
	pockets.slots_reserved_for_garb = HAS_FLAG(flags_marine_helmet, HELMET_GARB_OVERLAY) ? storage_slots_reserved_for_garb : 0
	pockets.max_w_class = storage_max_w_class
	pockets.bypass_w_limit = GLOB.allowed_helmet_items
	pockets.max_storage_space = storage_max_storage_space

	camera = new /obj/structure/machinery/camera/overwatch(src)

	for(var/obj/visor as anything in built_in_visors)
		visor.forceMove(src)

	if(length(inserted_visors) || length(built_in_visors))
		var/datum/action/item_action/cycle_helmet_huds/new_action = new(src)
		if(ishuman(loc))
			var/mob/living/carbon/human/holding_human = loc
			if(holding_human.head == src)
				new_action.give_to(holding_human)

	if(start_down_visor_type)
		for(var/obj/item/device/helmet_visor/cycled_visor in (built_in_visors + inserted_visors))
			if(cycled_visor.type == start_down_visor_type)
				active_visor = cycled_visor
				break

		if(active_visor)
			var/datum/action/item_action/cycle_helmet_huds/cycle_action = locate() in actions
			if(cycle_action)
				cycle_action.set_action_overlay(active_visor)

	if(motion_tracker)
		AddComponent(/datum/component/motion_tracker_manager)

/obj/item/clothing/head/helmet/unsc/Destroy(force)
	helmet_overlays = null
	QDEL_NULL(camera)
	QDEL_NULL(pockets)
	if(active_visor && istype(loc, /mob/living/carbon/human))
		var/mob/living/carbon/human/potential_user = loc
		if(potential_user.head == src)
			var/obj/item/device/helmet_visor/temp_visor_holder = active_visor
			active_visor = null
			toggle_visor(potential_user, temp_visor_holder, TRUE)
	return ..()

/obj/item/clothing/head/helmet/unsc/attack_hand(mob/user)
	if(loc != user)
		..(user) // If it's in a satchel or something don't open the pockets
		return

	if(pockets.handle_attack_hand(user))
		..(user)


/obj/item/clothing/head/helmet/unsc/MouseDrop(over_object, src_location, over_location)
	SEND_SIGNAL(usr, COMSIG_ITEM_DROPPED, usr)
	if(pockets.handle_mousedrop(usr, over_object))
		..()

/obj/item/clothing/head/helmet/unsc/attackby(obj/item/attacking_item, mob/user)
	if(istype(attacking_item, /obj/item/ammo_magazine) && world.time > helmet_bash_cooldown && user)
		var/obj/item/ammo_magazine/M = attacking_item
		var/ammo_level = "more than half full."
		playsound(user, 'sound/items/trayhit1.ogg', 15, FALSE)
		if(M.current_rounds == (M.max_rounds/2))
			ammo_level = "half full."
		if(M.current_rounds < (M.max_rounds/2))
			ammo_level = "less than half full."
		if(M.current_rounds < (M.max_rounds/6))
			ammo_level = "almost empty."
		if(M.current_rounds == 0)
			ammo_level = "empty. Uh oh."
		user.visible_message("[user] bashes [M] against their helmet", "You bash [M] against your helmet. It is [ammo_level]")
		helmet_bash_cooldown = world.time + 20 SECONDS
		return

	if(istype(attacking_item, /obj/item/device/helmet_visor))
		if(length(inserted_visors) >= max_inserted_visors)
			to_chat(user, SPAN_NOTICE("[src] has used all of its visor attachment sockets."))
			return

		var/obj/item/device/helmet_visor/new_visor = attacking_item
		for(var/obj/item/device/helmet_visor/cycled_visor as anything in (built_in_visors + inserted_visors))
			if(cycled_visor.type == new_visor.type)
				to_chat(user, SPAN_NOTICE("[src] already has this type of HUD connected."))
				return
		if(!user.drop_held_item())
			return

		inserted_visors += new_visor
		to_chat(user, SPAN_NOTICE("You connect [new_visor] to [src]."))
		new_visor.forceMove(src)
		if(!(locate(/datum/action/item_action/cycle_helmet_huds) in actions))
			var/datum/action/item_action/cycle_helmet_huds/new_action = new(src)
			new_action.give_to(user)
		return

	if(HAS_TRAIT(attacking_item, TRAIT_TOOL_SCREWDRIVER))
		// If there isn't anything to remove, return.
		if(!length(inserted_visors))
			// If the user is trying to remove a built-in visor, give them a more helpful failure message.
			switch(length(built_in_visors))
				if(1) // Messy plural handling
					to_chat(user, SPAN_WARNING("The visor on [src] is built-in!"))
				if(2 to INFINITY)
					to_chat(user, SPAN_WARNING("The visors on [src] are built-in!"))
			return

		if(active_visor)
			var/obj/item/device/helmet_visor/temp_visor_holder = active_visor
			active_visor = null
			toggle_visor(user, temp_visor_holder, TRUE)

		for(var/obj/item/device/helmet_visor/visor as anything in inserted_visors)
			visor.forceMove(get_turf(src))

		inserted_visors = list()
		to_chat(user, SPAN_NOTICE("You remove the inserted visors."))

		var/datum/action/item_action/cycle_helmet_huds/cycle_action = locate() in actions
		cycle_action.set_default_overlay()
		if(!length(built_in_visors))
			cycle_action.remove_from(user)

		return

	..()
	return pockets.attackby(attacking_item, user)

/obj/item/clothing/head/helmet/unsc/on_pocket_insertion()
	update_icon()

/obj/item/clothing/head/helmet/unsc/on_pocket_removal()
	update_icon()

/obj/item/clothing/head/helmet/unsc/update_icon()
	.=..()
	helmet_overlays = list() // Rebuild our list every time
	if(pockets && length(pockets.contents) && (flags_marine_helmet & HELMET_GARB_OVERLAY))
		var/list/above_band_layer = list()
		var/list/below_band_layer = list()
		var/has_helmet_band = FALSE
		for(var/obj/O in pockets.contents)
			if(GLOB.allowed_helmet_items[O.type])
				var/has_band = !HAS_FLAG(O.flags_obj, OBJ_NO_HELMET_BAND)
				if(has_band)
					has_helmet_band = TRUE
				if(GLOB.allowed_helmet_items[O.type] == HELMET_GARB_RELAY_ICON_STATE)
					if(has_band)
						above_band_layer += "helmet_[O.icon_state]"
					else
						below_band_layer += "helmet_[O.icon_state]"
				else
					if(has_band)
						above_band_layer += GLOB.allowed_helmet_items[O.type]
					else
						below_band_layer += GLOB.allowed_helmet_items[O.type]
		if(has_helmet_band)
			helmet_overlays = above_band_layer + list("helmet_band") + below_band_layer
		else
			helmet_overlays = above_band_layer + below_band_layer

	if(active_visor)
		helmet_overlays += active_visor.helmet_overlay

	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_head()

/obj/item/clothing/head/helmet/unsc/equipped(mob/living/carbon/human/mob, slot)
	if(camera)
		camera.c_tag = mob.name
	if(active_visor)
		recalculate_visors(mob)
	..()

/obj/item/clothing/head/helmet/unsc/unequipped(mob/user, slot)
	. = ..()
	if(pockets)
		for(var/obj/item/attachable/flashlight/F in pockets)
			if(F.light_on)
				F.activate_attachment(src, user, TRUE)
	if(active_visor)
		recalculate_visors(user)

/obj/item/clothing/head/helmet/unsc/dropped(mob/living/carbon/human/mob)
	if(camera)
		camera.c_tag = "Unknown"
	if(pockets)
		for(var/obj/item/attachable/flashlight/F in pockets)
			if(F.light_on)
				F.activate_attachment(src, mob, TRUE)
	if(active_visor)
		recalculate_visors(mob)
	..()

/obj/item/clothing/head/helmet/unsc/has_garb_overlay()
	return flags_marine_helmet & HELMET_GARB_OVERLAY

/obj/item/clothing/head/helmet/unsc/get_examine_text(mob/user)
	. = ..()
	if(active_visor)
		. += active_visor.get_helmet_examine_text()

/obj/item/clothing/head/helmet/unsc/proc/add_hugger_damage() //This is called in XenoFacehuggers.dm to first add the overlay and set the var.
	if(flags_marine_helmet & HELMET_DAMAGE_OVERLAY && !(flags_marine_helmet & HELMET_IS_DAMAGED))
		helmet_overlays["damage"] = image('icons/obj/items/clothing/cm_hats.dmi',icon_state = "hugger_damage")
		flags_marine_helmet |= HELMET_IS_DAMAGED
		update_icon()
		desc += "\n<b>This helmet seems to be scratched up and damaged, particularly around the face area...</b>"

/obj/item/clothing/head/helmet/unsc/get_pockets()
	if(pockets)
		return pockets
	return ..()

/// Recalculates and sets the proper visor effects
/obj/item/clothing/head/helmet/unsc/proc/recalculate_visors(mob/user)
	turn_off_visors(user)

	if(!active_visor)
		return

	if(user != loc)
		return

	var/mob/living/carbon/human/human_user = user
	if(!human_user || human_user.head != src)
		return

	toggle_visor(user, silent = TRUE)

/// Toggles the specified visor, if nothing specified then the active visor, if the visor is the active visor and the helmet is on the user's head it will turn on, if it is not the active visor it will turn off
/obj/item/clothing/head/helmet/unsc/proc/toggle_visor(mob/user, obj/item/device/helmet_visor/current_visor, silent = FALSE)
	current_visor = current_visor || active_visor

	if(!current_visor)
		return

	current_visor.toggle_visor(src, user, silent)

	update_icon()

/// Attempts to turn off all visors
/obj/item/clothing/head/helmet/unsc/proc/turn_off_visors(mob/user)
	var/list/total_visors = built_in_visors + inserted_visors

	for(var/obj/item/device/helmet_visor/cycled_helmet_visor in total_visors)
		cycled_helmet_visor.deactivate_visor(src, user)

	update_icon()

///Cycles the active HUD to the next between built_in_visors and inserted_visors, nullifies if at end and removes all HUDs
/obj/item/clothing/head/helmet/unsc/proc/cycle_huds(mob/user)
	var/list/total_visors = built_in_visors + inserted_visors

	if(!length(total_visors))
		to_chat(user, SPAN_WARNING("There are no visors to swap to."))
		return FALSE

	if(active_visor)
		var/visor_to_deactivate = active_visor
		var/skipped_hud = FALSE
		var/iterator = 1
		for(var/obj/item/device/helmet_visor/current_visor as anything in total_visors)
			if(current_visor == active_visor || skipped_hud)
				if(length(total_visors) > iterator)
					var/obj/item/device/helmet_visor/next_visor = total_visors[iterator + 1]

					if(!isnull(GLOB.huds[next_visor.hud_type]?.hudusers[user]))
						iterator++
						skipped_hud = TRUE
						continue

					if(!next_visor.can_toggle(user))
						iterator++
						skipped_hud = TRUE
						continue

					active_visor = next_visor
					toggle_visor(user, visor_to_deactivate, silent = TRUE) // disables the old visor
					toggle_visor(user)
					return active_visor
				else
					active_visor = null
					toggle_visor(user, visor_to_deactivate, FALSE)
					return FALSE
			iterator++

	for(var/obj/item/device/helmet_visor/new_visor in total_visors)
		if(!isnull(GLOB.huds[new_visor.hud_type]?.hudusers[user]))
			continue

		if(!new_visor.can_toggle(user))
			continue

		active_visor = new_visor
		toggle_visor(user)
		return active_visor

	to_chat(user, SPAN_WARNING("There are no visors to swap to currently."))
	return FALSE

/obj/item/clothing/head/helmet/unsc/motion
	name = "\improper CH252-M helmet"
	desc = "The standard issue ballistic helmet in use by the UNSC's Army and Marine Corps. Latest technologies rate this helmet very strong against most conventional human weaponry, while still providing a comfortable platform for a trooper's communications and HUD/Smartlink systems. This one comes with a motion tracker."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/unsc/variant_2
	name = "\improper CH252/UA helmet"
	desc = "Reinforced variant of the standard CH252 ballistic helmet given to Army and Marine Corps troops. Features an up-armoured module, providing greater protection along the forward arc of the helmet. Thanks to material enhancements it is only moderately heavier than the standard. The helmet retains the same communication and HUD/Smartlink equipment as the CH252."
	icon_state = "helmet"
	item_state = "helmet"

/obj/item/clothing/head/helmet/unsc/variant_2/motion
	name = "\improper CH252/UA-M helmet"
	desc = "Reinforced variant of the standard CH252 ballistic helmet given to Army and Marine Corps troops. Features an up-armoured module, providing greater protection along the forward arc of the helmet. Thanks to material enhancements it is only moderately heavier than the standard. The helmet retains the same communication and HUD/Smartlink equipment as the CH252."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/unsc/enclosed
	name = "\improper CH299 helmet"
	desc = "An enclosed helmet modeled after the CH252. Although it greatly resembles ODST helmets, it lacks many of their advanced capabilities and is instead primarily used in lightly hazardous environments or extreme weather conditions."
	icon_state = "enclosed"
	item_state = "enclosed"
	flags_atom = ALLOWINTERNALS|NO_SNOW_TYPE|NO_NAME_OVERRIDE|BLOCKGASEFFECT|ALLOWREBREATH|ALLOWCPR
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR

/obj/item/clothing/head/helmet/unsc/forecon
	name = "\improper CH288 Helmet"
	desc = "Reinforced combat helmet built from the ground up as part of the expensive M65 program. This helmet has been given superior armour composition and more significant hardening of precision electronics against conventional and electronic damage. Fits snugly, if a little heavy."
	desc_lore = "The CH288 is similar to its older CH252 sibling in form and function, but features many stark differences in internal construction and materials. While considered heavier than the standard helmet, enough for troops to consistently complain, it remains popular with those that can get their hands on it thanks to its greater deal of protection, and its plusher fit."
	icon_state = "forecon"
	item_state = "forecon"
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_HIGH

/obj/item/clothing/head/helmet/unsc/forecon/motion
	name = "\improper CH288-M Helmet"
	desc = "Reinforced combat helmet built from the ground up as part of the expensive M65 program. This helmet has been given superior armour composition and more significant hardening of precision electronics against conventional and electronic damage. Fits snugly, if a little heavy. This one has a motion tracker."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/unsc/forecon/enclosed
	name = "\improper ECH288 Helmet"
	desc = "The ECH288 is similar in all ways to the common CH288 helmet, save for its inclusion of an enclosed face covering visor, providing superior all around protection. The ECH288 also includes air filtration and a 15 minute emergency oxygen supply."
	desc_lore = "The ECH288 has seen adoption by UNSC Marine VBSS teams and even some ODST units which have yet to be equipped with their newer generation equipment, some still preferring the mythic reputation of the 'cruder' armour systems."
	icon_state = "forecon_enclosed"
	item_state = "forecon_enclosed"
	flags_atom = ALLOWINTERNALS|NO_SNOW_TYPE|NO_NAME_OVERRIDE|BLOCKGASEFFECT|ALLOWREBREATH|ALLOWCPR
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR

/obj/item/clothing/head/helmet/unsc/forecon/enclosed/motion
	name = "\improper ECH288-M Helmet"
	desc = "The ECH288 is similar in all ways to the common CH288 helmet, save for its inclusion of an enclosed face covering visor, providing superior all around protection. The ECH288 also includes air filtration and a 15 minute emergency oxygen supply. This one has a motion tracker."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/unsc/pilot
	name = "\improper FH400 Pilot Helmet"
	desc = "Standard issue flight helmet for UNSC dropship pilots, uses a conventional HUD visor which automatically interfaces with whatever vehicle it finds itself in. The classic FH400 pilot helmet has remained largely unchanged in over a hundred years, outside of regular hardware and software updates, which is a testament to its enduring legacy."
	icon_state = "pilot_3"
	item_state = "pilot_3"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/unsc/pilot/weapons_operator
	name = "\improper FH400/WS Pilot Helmet"
	desc = "A standard flight helmet in use with the UNSC Marines, modified with an alternate WS (Weapon-Systems) module. The WS module allows for seamless integration with the aircraft's weaponry, defensive systems and sensors, while allowing the WSO to isolate themselves from unnecessary visual clutter."
	desc_lore = "While nominally seen in use by marine weapon system officers, the advanced interface systems and clear imaging provided by the blockier HUD unit has seen it also assigned to UNSC escape craft, which may require extreme maneuvers by their pilots. For the same reason it has also become unofficially popular with some regular pilots as well."
	icon_state = "pilot_2"
	item_state = "pilot_2"

/obj/item/clothing/head/helmet/unsc/pilot/navy
	name = "\improper FH640 Pilot Helmet"
	desc = "The UNSC Navy's primary flight helmet assigned to nearly all combat pilots. Features top of the line hardware and software including proprietary VISR versions and 45 minutes of emergency rebreathing capability, alongside general comfort considerations like active-cooling. Cozy."
	desc_lore = "Developed in response to mounting demands by Navy combat pilots during the height of the Insurrection for a new helmet that was both advanced enough to keep up with the realities of pitched small craft combat and able to protect its wearer more readily in the event of a worse case scenario. Thanks to its success in both categories it has also become one of the most commonly stolen items when considering cross-branch theft."
	icon_state = "pilot"
	item_state = "pilot"
	flags_atom = ALLOWINTERNALS|NO_SNOW_TYPE|NO_NAME_OVERRIDE|BLOCKGASEFFECT|ALLOWREBREATH|ALLOWCPR
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR

/obj/item/clothing/head/helmet/unsc/police
	name = "\improper police CH252/UA helmet"
	desc = "Standard-issue helmet to the UNSC Marine Corps, this one given to the local police and security forces across the colonies for riot suppression during the days of the insurrection."
	icon_state = "police"
	item_state = "police"

/obj/item/clothing/head/helmet/unsc/insurrection
	icon_state = "insurgent_2"
	item_state = "insurgent_2"

/obj/item/clothing/head/helmet/unsc/insurrection/variant_2
	name = "\improper CH252/UA helmet"
	desc = "Reinforced variant of the standard CH252 ballistic helmet given to Army and Marine Corps troops. Features an up-armoured module, providing greater protection along the forward arc of the helmet. Thanks to material enhancements it is only moderately heavier than the standard. The helmet retains the same communication and HUD/Smartlink equipment as the CH252."
	icon_state = "insurgent"
	item_state = "insurgent"


/obj/item/clothing/head/helmet/unsc/oni
	name = "\improper ONI CH252 helmet"
	desc = "Standard-issue helmet to the UNSC Marine Corps. Various attachment points on the helmet allow for various equipment to be fitted to the helmet. This particular variant is used by ONI Security Forces, featuring a distinct black colour scheme."
	icon_state = "oni"
	item_state = "oni"

/obj/item/clothing/head/helmet/unsc/oni/motion
	name = "\improper ONI CH252-M helmet"
	desc = "An upgraded helmet of the UNSC Marine Corps, with a motion tracker. Various attachment points on the helmet allow for various equipment to be fitted to the helmet. This particular variant is used by ONI Security Forces, featuring a distinct black colour scheme."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/unsc/odst
	name = "\improper CH381 ODST helmet"
	desc = "An iconic helmet, designed for use by Orbital-Drop-Shock-Troopers of the UNSC's Marine Corps' Special Forces. An advanced piece of equipment featuring various benefits: a polarizing visor, VISR optical software, reinforced COM unit, fully sealed environment, and a nice black finish. Commonly defaced with crude graffiti by bored helljumpers."
	icon_state = "odst"
	item_state = "odst"

	flags_atom = ALLOWINTERNALS|NO_SNOW_TYPE|NO_NAME_OVERRIDE|BLOCKGASEFFECT|ALLOWREBREATH|ALLOWCPR
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_HIGH

/obj/item/clothing/head/helmet/unsc/odst/motion
	name = "\improper CH381-M ODST helmet"
	desc = "An iconic helmet, designed for use by Orbital-Drop-Shock-Troopers of the UNSC's Marine Corps' Special Forces. An advanced piece of equipment featuring various benefits: a polarizing visor, VISR optical software, reinforced COM unit, fully sealed environment, a motion tracker, and a nice black finish. Commonly defaced with crude graffiti by bored helljumpers."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/unsc/odst/oni
	name = "\improper CH299/S helmet"
	desc = "A heavily modified variant of a standard helmet, developed for use by UEG strategic security personnel and the Office of Naval Intelligence. Modifications are primarily focused on a fully enclosed design with polarizing visor and an overall reinforced frame. Secondary modifications include advanced encryption/comms gear and proprietary VISR versions."
	motion_tracker = TRUE

/obj/item/clothing/head/uppcap/ushanka
	name = "\improper ushanka"
	desc = "An old-style cold weather hat favored by those hailing from old Russia, Eastern Europe, or colonies founded by settlers from there."
