/obj/item/clothing/suit/marine/shielded
	/// Whether a shield is broken. Used for keeping track of it in the code.
	var/shield_broken = FALSE
	/// The "health" of the shield
	var/shield_strength
	/// The maximum "health" of the shield
	var/max_shield_strength
	/// The value of shield regeneration
	var/shield_regen_rate
	/// Shield datum
	var/datum/halo_shield/shield = TESTER_SHIELD
	/// Whether or not any of the shield features are enabled
	var/shield_enabled = TRUE
	/// Time in seconds until the shield begins to regenerate after taking damage
	COOLDOWN_DECLARE(time_to_regen)
	/// Time that it takes for the shield to reach full strength
	var/recovery_time
	/// Shield crackle cooldown?
	COOLDOWN_DECLARE(shield_sparks)

	// sounds
	COOLDOWN_DECLARE(shield_noise_cd)

	actions_types = list(/datum/action/item_action/toggle_shield)

	var/mob/living/carbon/human/user

// ------------------ PROCS ------------------

/obj/item/clothing/suit/marine/shielded/Initialize()
	. = ..()
	start_process()
	shield_strength = shield.max_shield_strength
	max_shield_strength = shield.max_shield_strength
	recovery_time = shield.recovery_time
	shield_regen_rate = ((max_shield_strength / recovery_time) * 0.5) * 10

/obj/item/clothing/suit/marine/shielded/proc/toggle_shield()
	user = src.loc
	if(ishuman(user))
		if(shield_enabled)
			shield_enabled = FALSE
			shield_strength = 0
			playsound(src, 'sound/effects/shields/shield_manual_down.ogg')
			end_process()
			to_chat(user, SPAN_NOTICE("You hear a low hum and a hiss as your shield powers off."))
			return
		if(!shield_enabled)
			shield_enabled = TRUE
			playsound(src, 'sound/effects/shields/shield_manual_up.ogg')
			COOLDOWN_START(src, time_to_regen, shield.time_to_regen)
			start_process()
			to_chat(user, SPAN_NOTICE("You hear a low hum as your shield powers on."))
			return

/obj/item/clothing/suit/marine/shielded/proc/disable_shield()
	user = src.loc
	if(ishuman(user))
		shield_enabled = FALSE
		shield_strength = 0
		playsound(src, 'sound/effects/shields/shield_manual_down.ogg')
		to_chat(user, SPAN_NOTICE("You hear a low hum and a hiss as your shield powers off."))
		end_process()
		return

/obj/item/clothing/suit/marine/shielded/proc/take_damage(damage_taken, mob/living/carbon/human/user)
	user = src.loc
	if(ishuman(user))
		if(damage_taken)
			playsound(src, "shield_hit")
			flick_overlay(user, image('icons/halo/mob/humans/onmob/clothing/sangheili/armor.dmi', null, "+flicker"), 4)
			shield_strength = max(shield_strength - damage_taken, 0)
			COOLDOWN_START(src, time_to_regen, shield.time_to_regen)
			if(shield_strength <= 0 && !shield_broken)
				shield_pop(user)
				shield_broken = TRUE


/obj/item/clothing/suit/marine/shielded/proc/shield_pop(mob/living/carbon/human/user)
	user = src.loc
	if(ishuman(user))
		playsound(src, "shield_pop", falloff = 5)
		flick_overlay(user, image('icons/halo/mob/humans/onmob/clothing/sangheili/armor.dmi', null, "+pop"), 2 SECONDS)
		user.visible_message(SPAN_NOTICE("[user]s energy shield shimmers and pops, overloading!"), SPAN_DANGER("Your energy shield shimmers and pops, overloading!"))

// ------------------ PROCESS PROCS ------------------

/obj/item/clothing/suit/marine/shielded/proc/start_process()
	START_PROCESSING(SSfastobj, src)

/obj/item/clothing/suit/marine/shielded/proc/end_process()
	STOP_PROCESSING(SSfastobj, src)
	COOLDOWN_RESET(src, time_to_regen)

/obj/item/clothing/suit/marine/shielded/process(delta_time)
	user = src.loc
	if(ishuman(user))
		if(!shield_enabled)
			return
		if(shield_broken || user.stat == DEAD)
			if(COOLDOWN_FINISHED(src, shield_sparks))
				flick_overlay(user, image('icons/halo/mob/humans/onmob/clothing/sangheili/armor.dmi', null, "+flicker"), 4)
				COOLDOWN_START(src, shield_sparks, rand(1, 4) SECONDS)
		if(user.stat == DEAD)
			disable_shield()
		if(COOLDOWN_FINISHED(src, time_to_regen))
			if(shield_strength < max_shield_strength)
				shield_strength = min(shield_strength + shield_regen_rate, max_shield_strength)
				shield_broken = FALSE
				if(COOLDOWN_FINISHED(src, shield_noise_cd))
					playsound(src, "shield_charge", vary = TRUE)
					user.visible_message(SPAN_NOTICE("[user]s energy shield emitters hum, regenerating the shield around them!"), SPAN_DANGER("Your energy shields hum and begin to regenerate."))
					COOLDOWN_START(src, shield_noise_cd, shield.time_to_regen)

// ------------------ ARMOR ------------------

/obj/item/clothing/suit/marine/shielded/sangheili
	name = "YOU SHOULDN'T SEE THIS"
	desc = "The central piece to a set of advanced combat armor manufactured by the Covenant. Made with nanolaminate and equipped with shielding, the armor is much more durable than any other species' equipment."
	icon = 'icons/halo/obj/items/clothing/covenant/armor.dmi'
	icon_state = "sang_minor"
	item_state = "sang_minor"

	item_icons = list(
		WEAR_JACKET = 'icons/halo/mob/humans/onmob/clothing/sangheili/armor.dmi'
	)

	allowed_species_list = list(SPECIES_SANGHEILI)
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	slowdown = SLOWDOWN_ARMOR_LIGHT

	valid_accessory_slots = list(ACCESSORY_SLOT_SANG_SHOULDER, ACCESSORY_SLOT_SANG_WEBBING)

// Minor

/obj/item/clothing/suit/marine/shielded/sangheili/minor
	name = "Sangheili Minor combat harness"
	desc = "A blue coloured harness worn by 'Minors', the lowest rank of Sangheili warrior. Worn over a 'tech-suit' the armour consists of a thoracic-cage over the torso, with pauldrons, vambraces, cuisses, and greaves attached, providing a high level of protection, though the most important defensive feature of the harness is its energy-shielding."
	desc_lore = "Though Minor is the lowest rank a Sangheili can hold, this blue marks them out as still superior to any lesser-caste species. A fact that some abuse."

	shield = SANG_SHIELD_MINOR
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
