/obj/item/device/radio/headset/almayer/marine/solardevils/unsc
	name = "UNSC headset"
	desc = "A special headset used by the United Nations Space Command for all branches of the military."
	frequency = CRYO_FREQ
	has_hud = TRUE
	hud_type = list(MOB_HUD_FACTION_UNSC)
	inbuilt_tracking_options = list(
		"Platoon Commander" = TRACKER_PLTCO,
		"Squad Leader" = TRACKER_SL,
		"Fireteam Leader" = TRACKER_FTL,
		"Landing Zone" = TRACKER_LZ
	)

/obj/item/device/radio/headset/almayer/marine/solardevils/unsc/equipped(mob/living/carbon/human/user, slot)
	. = ..()

	if((user == user.assigned_squad?.fireteam_leaders["SQ1"] || user == user.assigned_squad?.fireteam_leaders["SQ2"]) && ("Squad Leader" in tracking_options))
		locate_setting = tracking_options["Squad Leader"]
		return

	if(((user in user.assigned_squad?.fireteams["SQ1"]) || (user in user.assigned_squad?.fireteams["SQ2"])) && ("Fireteam Leader" in tracking_options))
		locate_setting = tracking_options["Fireteam Leader"]
		return

/obj/item/device/radio/headset/almayer/marine/solardevils/unsc/rockhoppers
	frequency = UNSC_FREQ

/obj/item/device/radio/headset/almayer/marine/solardevils/unsc/rockhoppers/squadlead
	initial_keys = list(/obj/item/device/encryptionkey/squadlead)

/obj/item/device/radio/headset/almayer/marine/solardevils/unsc/ferrymen
	frequency = ODST_FREQ

/obj/item/device/radio/headset/almayer/marine/solardevils/unsc/ferrymen/squadlead
	initial_keys = list(/obj/item/device/encryptionkey/squadlead)

/obj/item/device/radio/headset/distress/oni
	name = "ONI security headset"
	desc = "A headset utilized by ONI security forces."
	frequency = ONI_FREQ
	initial_keys = list(/obj/item/device/encryptionkey/oni)
