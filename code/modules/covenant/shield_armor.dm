/obj/item/clothing/suit/marine/shielded
	/// The "health" of the shield
	var/shield_strength
	/// The maximum "health" of the shield
	var/max_shield_strength
	/// The value of shield regeneration
	var/shield_regen_rate
	/// Maximum attainable value of shield regeneration
	var/max_shield_regen_rate
	/// Shield datum
	var/datum/halo_shield/shield = TESTER_SHIELD
	/// Whether or not any of the shield features are enabled
	var/shield_enabled
	/// Time until regeneration begins after taking damage
	COOLDOWN_DECLARE(time_to_recovery)

// ------------------ PROCS ------------------

/obj/item/clothing/suit/marine/shielded/Initialize()
	. = ..()
	start_process()

/obj/item/clothing/suit/marine/shielded/proc/toggle_shield()
	if(shield_enabled)
		shield_enabled = FALSE
		shield_strength = 0
		shield_regen_rate = 0
		end_process()
	if(!shield_enabled)
		shield_enabled = TRUE
		COOLDOWN_START(src, time_to_recovery, shield.time_to_recovery)
		start_process()

// ------------------ PROCESS PROCS ------------------

/obj/item/clothing/suit/marine/shielded/proc/start_process()
	START_PROCESSING(SSfastobj, src)

/obj/item/clothing/suit/marine/shielded/proc/end_process()
	STOP_PROCESSING(SSfastobj, src)

/obj/item/clothing/suit/marine/shielded/process(delta_time)
	if(COOLDOWN_FINISHED(src, time_to_recovery))
		shield_strength = min(shield_strength + shield_regen_rate, max_shield_strength)
		shield_regen_rate = min(shield_regen_rate + shield.shield_regen_recovery, max_shield_regen_rate)

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

	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/suit/marine/shielded/sangheili/minor
	name = "Sangheili Minor combat harness"

	shield = SANG_SHIELD_MINOR
