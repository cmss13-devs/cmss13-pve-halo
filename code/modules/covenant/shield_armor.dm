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
	var/datum/looping_sound/shield_down/soundloop

// ------------------ PROCS ------------------

/obj/item/clothing/suit/marine/shielded/Initialize()
	. = ..()
	start_process()
	var/user = src.loc
	soundloop = new(user)
	shield_strength = shield.max_shield_strength
	max_shield_strength = shield.max_shield_strength
	recovery_time = shield.recovery_time
	shield_regen_rate = ((max_shield_strength / recovery_time) * 0.5) * 10
	to_chat(world, SPAN_BOLD("Shield initialized!"))

/obj/item/clothing/suit/marine/shielded/Destroy()
	QDEL_NULL(soundloop)
	return ..()

/obj/item/clothing/suit/marine/shielded/proc/toggle_shield()
	if(shield_enabled)
		shield_enabled = FALSE
		shield_strength = 0
		to_chat(world, SPAN_BOLD("Shield toggled off!"))
		end_process()
	if(!shield_enabled)
		shield_enabled = TRUE
		to_chat(world, SPAN_BOLD("Shield toggled on!"))
		COOLDOWN_START(src, time_to_regen, shield.time_to_regen)
		start_process()


/obj/item/clothing/suit/marine/shielded/proc/take_damage(damage_taken, mob/living/carbon/human/user)
	if(damage_taken)
		user = src.loc
		to_chat(world, SPAN_BOLD("Shield damaged for [damage_taken] in shield_armor.dm"))
		playsound(src, "shield_hit")
		flick_overlay(user, image('icons/halo/mob/humans/onmob/sangheili/armor.dmi', null, "+flicker"), 4)
		shield_strength = max(shield_strength - damage_taken, 0)
		COOLDOWN_START(src, time_to_regen, shield.time_to_regen)
		if(shield_strength <= 0 && !shield_broken)
			shield_pop(user)
			shield_broken = TRUE


/obj/item/clothing/suit/marine/shielded/proc/shield_pop(mob/living/carbon/human/user)
	user = src.loc
	to_chat(world, SPAN_BOLD("Shield popped!"))
	playsound(src, "shield_pop", falloff = 5)
	flick_overlay(user, image('icons/halo/mob/humans/onmob/sangheili/armor.dmi', null, "+pop"), 2 SECONDS)
	soundloop.start()

// ------------------ PROCESS PROCS ------------------

/obj/item/clothing/suit/marine/shielded/proc/start_process()
	START_PROCESSING(SSfastobj, src)

/obj/item/clothing/suit/marine/shielded/proc/end_process()
	STOP_PROCESSING(SSfastobj, src)
	COOLDOWN_RESET(src, time_to_regen)

/obj/item/clothing/suit/marine/shielded/process(delta_time)
	var/user = src.loc
	if(!shield_enabled)
		to_chat(world, SPAN_BOLD("Shield processed, but the shield is disabled, so it has not regenerated!"))
		return
	if(shield_broken)
		if(COOLDOWN_FINISHED(src, shield_sparks))
			flick_overlay(user, image('icons/halo/mob/humans/onmob/sangheili/armor.dmi', null, "+flicker"), 4)
			COOLDOWN_START(src, shield_sparks, rand(1, 4) SECONDS)
	if(COOLDOWN_FINISHED(src, time_to_regen))
		if(shield_strength < max_shield_strength)
			shield_strength = min(shield_strength + shield_regen_rate, max_shield_strength)
			shield_broken = FALSE
			to_chat(world, SPAN_BOLD("Shield processed, regenerated shielding for [shield_regen_rate] health."))
			soundloop.stop()
			if(COOLDOWN_FINISHED(src, shield_noise_cd))
				playsound(src, "shield_charge", vary = TRUE)
				COOLDOWN_START(src, shield_noise_cd, shield.time_to_regen)

// ------------------ ARMOR ------------------

/obj/item/clothing/suit/marine/shielded/sangheili
	name = "YOU SHOULDN'T SEE THIS"
	desc = "The central piece to a set of advanced combat armor manufactured by the Covenant. Made with nanolaminate and equipped with shielding, the armor is much more durable than any other species' equipment."
	icon = 'icons/halo/obj/items/clothing/covenant/armor.dmi'
	icon_state = "chestpiece"
	item_state = "chestpiece"

	item_icons = list(
		WEAR_JACKET = 'icons/halo/mob/humans/onmob/sangheili/armor.dmi'
	)
	allowed_species_list = list(SPECIES_SANGHEILI)

	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/suit/marine/shielded/sangheili/minor
	name = "Sangheili Minor combat harness"

	shield = SANG_SHIELD_MINOR
