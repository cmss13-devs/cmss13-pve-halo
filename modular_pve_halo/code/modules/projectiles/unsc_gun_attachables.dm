

/obj/item/attachable/ma5c_muzzle
	name = "\improper MA5C shroud"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma5c_muzzle"
	attach_icon = "ma5c_muzzle"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = -3

/obj/item/attachable/attached_gun/grenade/ma5
	name = "\improper M301 40mm grenade launcher"
	desc = "A 40mm underslung grenade launcher. Replaces the standard-issue flashlight of the MA5 series of rifles. Fits both the MA5C and the MA5B."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma5c_gl"
	attach_icon = "ma5c_gl"
	current_rounds = 0
	max_rounds = 1
	max_range = 10
	attachment_firing_delay = 5
	layer_addition = 0.1
	caliber = "40mm"

/obj/item/attachable/attached_gun/grenade/ma5/update_icon()
	. = ..()
	var/base_icon_state
	if(istype(loc, /obj/item/weapon/gun/rifle/halo/ma5b))
		base_icon_state = "ma5b_gl"
	if(istype(loc, /obj/item/weapon/gun/rifle/halo/ma5c))
		base_icon_state = "ma5c_gl"
	attach_icon = base_icon_state
	icon_state = base_icon_state
	if(breech_open)
		attach_icon += "-open"
		icon_state += "-open"
	if(istype(loc, /obj/item/weapon/gun))
		var/obj/item/weapon/gun/gun = loc
		gun.update_attachable(slot)

/obj/item/attachable/attached_gun/grenade/ma5/Attach(obj/item/weapon/gun/subject)
	if(istype(subject, /obj/item/weapon/gun/rifle/halo/ma5b))
		attach_icon = "ma5b_gl"
		..()
	if(istype(subject, /obj/item/weapon/gun/rifle/halo/ma5c))
		attach_icon = "ma5c_gl"
		..()
	else return

/obj/item/attachable/ma3a_shroud
	name = "\improper MA3A shroud"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma3a_shroud"
	attach_icon = "ma3a_shroud"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = -3

/obj/item/attachable/vk78_front
	name = "\improper VK78 fore"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "vk78_front"
	attach_icon = "vk78_front"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0
	size_mod = 0
	hud_offset_mod = -3

/obj/item/attachable/vk78_front/New()
	..()
	recoil_mod = -RECOIL_AMOUNT_TIER_2

/obj/item/attachable/br55_muzzle
	name = "\improper BR55 muzzle"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "br55_muzzle"
	attach_icon = "br55_muzzle"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = -7

/obj/item/attachable/ma5b_muzzle
	name = "\improper MA5B muzzle"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma5b_muzzle"
	attach_icon = "ma5b_muzzle"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = -7

/obj/item/attachable/m90_muzzle
	name = "\improper M90 CAWS muzzle"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "m90_muzzle"
	attach_icon = "m90_muzzle"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = -7

/obj/item/attachable/dmr_front
	name = "\improper M392 DMR fore"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "dmr_front"
	attach_icon = "dmr_front"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0
	size_mod = 0
	hud_offset_mod = -3

/obj/item/attachable/flashlight/ma5
	name = "\improper MA5 integrated flashlight"
	desc = "The MA5 integrated flashlight, standard-issue to any MA5 series assault rifle."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma5_flashlight"
	attach_icon = "ma5_flashlight"
	original_state = "ma5_flashlight"
	original_attach = "ma5_flashlight"
	slot = "under"

/obj/item/attachable/flashlight/ma5/ma3a
	name = "\improper MA3A integrated flashlight"
	desc = "An underbarrel grip for the MA3A, integrated as a flashlight."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma3a_flashlight"
	attach_icon = "ma3a_flashlight"
	original_state = "ma3a_flashlight"
	original_attach = "ma3a_flashlight"
	slot = "under"

/obj/item/attachable/flashlight/ma5/ma3a/New()
	..()
	recoil_mod = -RECOIL_AMOUNT_TIER_4

/obj/item/attachable/flashlight/m90
	name = "\improper M90 integrated flashlight"
	desc = "The M90 integrated flashlight, standard-issue to any M90 series shotgun and built into the pump. You shouldn't see this, actually."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "m90_flashlight"
	attach_icon = "m90_flashlight_a"
	original_state = "m90_flashlight"
	original_attach = "m90_flashlight_a"
	slot = "under"

/obj/item/attachable/flashlight/m90/police
	icon_state = "m90_police_flashlight"
	attach_icon = "m90_police_flashlight_a"
	original_state = "m90_police_flashlight"
	original_attach = "m90_police_flashlight_a"

/obj/item/attachable/vk78_barrel
	name = "\improper VK78 barrel"
	desc = "The barrel to an VK78 Commando rifle. Better not leave without it."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "vk78_barrel"
	attach_icon = "vk78_barrel"
	slot = "muzzle"
	size_mod = 0

/obj/item/attachable/vk78_barrel/New()
	..()
	scatter_mod = -SCATTER_AMOUNT_TIER_2
	burst_scatter_mod = -SCATTER_AMOUNT_TIER_3

/obj/item/attachable/ma3a_barrel
	name = "\improper MA3A barrel"
	desc = "The barrel to an MA3A ICWS assault rifle. Better not leave without it."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma3a_barrel"
	attach_icon = "ma3a_barrel"
	slot = "muzzle"
	size_mod = 0

/obj/item/attachable/br55_barrel
	name = "\improper BR55 barrel"
	desc = "The barrel to an BR55 battle rifle. Better not leave without it."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "br55_barrel"
	attach_icon = "br55_barrel"
	slot = "muzzle"
	size_mod = 0

/obj/item/attachable/br55_barrel/New()
	..()
	scatter_mod = -9
	burst_scatter_mod = -SCATTER_AMOUNT_TIER_3

/obj/item/attachable/dmr_barrel
	name = "\improper M392 DMR barrel"
	desc = "The barrel to an M392 DMR. Better not leave without it."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "dmr_barrel"
	attach_icon = "dmr_barrel"
	slot = "muzzle"
	size_mod = 0

/obj/item/attachable/dmr_barrel/New()
	..()
	scatter_mod = -SCATTER_AMOUNT_TIER_2
	burst_scatter_mod = -SCATTER_AMOUNT_TIER_3

/obj/item/attachable/scope/spnkr
	name = "\improper spnkr scope"
	desc = "This shouldn't be able to come off the spnkr..."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "spnkr_scope"
	attach_icon = null
	size_mod = 0
	hidden = TRUE

/obj/item/attachable/scope/mini/br55
	name = "\improper A2 scope"
	desc = "A telescopic sight with 2x zoom capability. While typically reliable, it often needs adjustment and fine tuning to maintain perfect accuracy."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "br55_scope"
	attach_icon = "br55_scope"
	size_mod = 0

/obj/item/attachable/scope/mini/vk78
	name = "\improper VK78 scope"
	desc = "An old telescopic sight, often paired with the VK78 Commando."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "vk78_scope"
	attach_icon = "vk78_scope"
	size_mod = 0

/obj/item/attachable/scope/mini/dmr
	name = "\improper M392 DMR scope"
	desc = "A x3 DMR scope commonly equipped upon the M392 DMR. Rather reliable by most accounts."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "dmr_scope"
	attach_icon = "dmr_scope"
	size_mod = 0

/obj/item/attachable/scope/mini/ma3a
	name = "\improper MA3A scope"
	desc = "An MA3A scope, unintregrated but often attached due to the accuracy increase."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma3a_scope"
	attach_icon = "ma3a_scope"
	size_mod = 0

/obj/item/attachable/scope/mini/ma3a/New()
	..()
	scatter_mod = -SCATTER_AMOUNT_TIER_3
	burst_scatter_mod = -SCATTER_AMOUNT_TIER_3
	accuracy_mod = -HIT_ACCURACY_MULT_TIER_4

/obj/item/attachable/srs_barrel
	name = "\improper SRS99-AM sniper rifle barrel"
	desc = "The detachable barrel of an SRS99-AM sniper rifle featuring a large muzzle brake at the end. Essential to the operation of the rifle. It's detachable nature allows it to be swapped out with other barrels featuring alternative integrated attachments. "
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "srs_barrel"
	attach_icon = "srs_barrel"
	slot = "muzzle"
	size_mod = 0
	flags_attach_features = NO_FLAGS

/obj/item/attachable/srs_barrel/New()
	..()
	scatter_mod = SCATTER_AMOUNT_NONE
	recoil_mod = RECOIL_OFF

/obj/item/attachable/srs_barrel/suppressed
	name = "\improper SRS99-AM suppressed sniper rifle barrel"
	desc = "The detachable barrel of an SRS99-AM sniper rifle featuring an integrated flash hider/sound suppressor kit. Essential to the operation of the rifle. It's detachable nature allows it to be swapped out with other barrels featuring alternative integrated attachments. "
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "srs_barrel_suppressed"
	attach_icon = "srs_barrel_suppressed"

/obj/item/attachable/scope/variable_zoom/oracle
	name = "\improper N-Variant oracle scope"
	desc= "One of the most common sniper optic systems utilized by the UNSC. Able to switch between different zoom modes. Some models even provide night vision optics."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "oracle_scope"
	attach_icon = "oracle_scope"
	slot = "rail"
	var/scatter_scoped_buff = 0

/obj/item/attachable/scope/variable_zoom/oracle/New()
	..()
	scatter_scoped_buff = SCATTER_AMOUNT_TIER_1

/obj/item/attachable/scope/variable_zoom/oracle/handle_attachment_recalc(obj/item/weapon/gun/source)
	. = ..()
	if(using_scope)
		source.scatter -= scatter_scoped_buff

/obj/item/attachable/scope/variable_zoom/oracle/apply_scoped_buff(obj/item/weapon/gun/G, mob/living/carbon/user)
	. = ..()
	if(G.zoom)
		G.scatter -= scatter_scoped_buff

/obj/item/attachable/scope/variable_zoom/oracle/remove_scoped_buff(mob/living/carbon/user, obj/item/weapon/gun/G)
	. = ..()
	G.scatter += scatter_scoped_buff

/obj/item/attachable/scope/variable_zoom/oracle/night_vision
	name = "\improper Oracle-N/2 \"VERGIL\""
	desc= "A newer model of the standard issue Oracle-N variant scope found in universal use with UNSC sniper rifles. The VERGIL employs numerous upgrades; including VISR derived software improvements and a new hardware package via an enhanced sensor suite. Both of these upgrades allowing for enhanced night fighting capability and improved thermal-optic quality."
	var/lighting_alpha = 140

/obj/item/attachable/scope/variable_zoom/oracle/night_vision/apply_scoped_buff(obj/item/weapon/gun/G, mob/living/carbon/user)
	. = ..()
	if(G.zoom)
		RegisterSignal(user, COMSIG_HUMAN_POST_UPDATE_SIGHT, PROC_REF(on_update_sight))

		user.add_client_color_matrix("nvg_visor", 90, color_matrix_multiply(color_matrix_saturation(0.02), color_matrix_from_string("#c4dbdf")))
		user.update_sight()
		START_PROCESSING(SSobj, src)
		RegisterSignal(user, COMSIG_MOB_CHANGE_VIEW)

/obj/item/attachable/scope/variable_zoom/oracle/night_vision/remove_scoped_buff(mob/living/carbon/user, obj/item/weapon/gun/G)
	. = ..()
	user.remove_client_color_matrix("nvg_visor", 0.5 SECONDS)

	UnregisterSignal(user, COMSIG_HUMAN_POST_UPDATE_SIGHT)
	UnregisterSignal(user, COMSIG_MOB_CHANGE_VIEW)

	user.update_sight()
	STOP_PROCESSING(SSobj, src)

/obj/item/attachable/scope/variable_zoom/oracle/night_vision/proc/on_update_sight(mob/living/carbon/user)
	SIGNAL_HANDLER

	if(lighting_alpha < 255)
		user.see_in_dark = 12
	user.lighting_alpha = lighting_alpha
	user.sync_lighting_plane_alpha()

/obj/item/attachable/scope/variable_zoom/m6d
	name = "\improper KFA-2/D Model II smart-linked scope"
	desc = "A smart-linked scope designed to attach to the M6D magnum. The Model II is much more precise and allows the scope to switch between 2x and 4x modes. Links with UNSC optics to provide the HUD a reticle and ammunition counter."
	slot = "rail"

/obj/item/attachable/srs_assembly
	name = "\improper SRS99-AM assembly"
	desc = "That's not supposed to come off. You should probably report it to your supervisor..."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "srs_assembly"
	attach_icon = "srs_assembly"
	slot = "special"
	flags_attach_features = NO_FLAGS

/obj/item/attachable/bipod/srs_bipod
	name = "\improper SRS99-AM bipod"
	desc = "A detachable bipod system belonging to the SRS99-AM sniper rifle. Why you would detach it from such an unwieldy rifle is a mystery."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "srs_bipod"
	attach_icon = "srs_bipod"
	flags_attach_features = NO_FLAGS

/obj/item/attachable/bipod/srs_bipod/New()
	..()

	wield_delay_mod = WIELD_DELAY_FAST
	accuracy_mod = -HIT_ACCURACY_MULT_TIER_5
	scatter_mod = SCATTER_AMOUNT_NONE
	recoil_mod = RECOIL_OFF

/obj/item/attachable/bipod/srs_bipod/undeploy_bipod(obj/item/weapon/gun/gun, mob/user)
	REMOVE_TRAIT(gun, TRAIT_GUN_BIPODDED, "attached_bipod")
	bipod_deployed = FALSE
	accuracy_mod = -HIT_ACCURACY_MULT_TIER_5
	scatter_mod = SCATTER_AMOUNT_NONE
	recoil_mod = RECOIL_OFF
	burst_scatter_mod = 0
	//if we are no longer on full auto, don't bother switching back to the old firemode
	if(full_auto_switch && gun.gun_firemode == GUN_FIREMODE_AUTOMATIC && gun.gun_firemode != old_firemode)
		gun.do_toggle_firemode(user, null, old_firemode)
	if(istype(gun, /obj/item/weapon/gun/rifle/sniper/halo || /obj/item/weapon/gun/rifle/sniper/halo/stealth))
		delay_mod = FIRE_DELAY_TIER_13

	gun.recalculate_attachment_bonuses()
	gun.stop_fire()
	SEND_SIGNAL(user, COMSIG_MOB_UNDEPLOYED_BIPOD)
	UnregisterSignal(user, COMSIG_MOB_MOVE_OR_LOOK)

	if(gun.flags_gun_features & GUN_SUPPORT_PLATFORM)
		gun.remove_firemode(GUN_FIREMODE_AUTOMATIC)

	if(heavy_bipod)
		user.anchored = FALSE

	if(!QDELETED(gun))
		playsound(user,'sound/items/m56dauto_rotate.ogg', 55, 1)
		update_icon()

/obj/item/attachable/bipod/srs_bipod/activate_attachment(obj/item/weapon/gun/gun, mob/living/user, turn_off)
	if(turn_off)
		if(bipod_deployed)
			undeploy_bipod(gun, user)
	else
		var/obj/support = check_bipod_support(gun, user)
		if(!support&&!bipod_deployed)
			to_chat(user, SPAN_NOTICE("You start deploying [src] on the ground."))
			if(!do_after(user, 15, INTERRUPT_ALL, BUSY_ICON_HOSTILE, gun, INTERRUPT_DIFF_LOC))
				return FALSE

		bipod_deployed = !bipod_deployed
		if(user)
			if(bipod_deployed)
				ADD_TRAIT(gun, TRAIT_GUN_BIPODDED, "attached_bipod")
				to_chat(user, SPAN_NOTICE("You deploy [src] [support ? "on [support]" : "on the ground"]."))
				SEND_SIGNAL(user, COMSIG_MOB_DEPLOYED_BIPOD)
				playsound(user,'sound/items/m56dauto_rotate.ogg', 55, 1)
				accuracy_mod = HIT_ACCURACY_MULT_TIER_5
				recoil_mod = -RECOIL_AMOUNT_TIER_1
				scatter_mod = -SCATTER_AMOUNT_NONE
				burst_scatter_mod = -SCATTER_AMOUNT_TIER_8
				if(istype(gun, /obj/item/weapon/gun/rifle/sniper/halo || /obj/item/weapon/gun/rifle/sniper/halo/stealth))
					delay_mod = -FIRE_DELAY_TIER_6
				else if(istype(gun,/obj/item/weapon/gun/rifle/lmg))
					delay_mod = 0
					fa_scatter_peak_mod = FULL_AUTO_SCATTER_PEAK_TIER_3
				gun.recalculate_attachment_bonuses()
				gun.stop_fire()

				initial_mob_dir = user.dir
				RegisterSignal(user, COMSIG_MOB_MOVE_OR_LOOK, PROC_REF(handle_mob_move_or_look))

				if(gun.flags_gun_features & GUN_SUPPORT_PLATFORM)
					gun.add_firemode(GUN_FIREMODE_AUTOMATIC)

				if(heavy_bipod)
					user.anchored = TRUE

				old_firemode = gun.gun_firemode
				if(full_auto_switch && gun.gun_firemode != GUN_FIREMODE_AUTOMATIC)
					gun.do_toggle_firemode(user, null, GUN_FIREMODE_AUTOMATIC)

			else
				to_chat(user, SPAN_NOTICE("You retract [src]."))
				undeploy_bipod(gun, user)

	update_icon()

	return 1

/obj/item/attachable/scope/mini/smartscope
	name = "\improper KFA-2 x2 smart-linked scope"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = null
	slot = "rail"
	zoom_offset = 3

/obj/item/attachable/scope/mini/smartscope/m6g
	name = "\improper KFA-2/G smart-linked scope"
	desc = "A smart-linked scope designed to attach to the M6G magnum, allowing for advanced magnification and linking with UNSC optics to provide the HUD a reticle and ammunition counter."
	icon_state = "m6c_smartscope_obj"
	attach_icon = "m6g_smartscope"

/obj/item/attachable/scope/mini/smartscope/m6c
	name = "\improper KFA-2/C smart-linked scope"
	desc = "A smart-linked scope designed to attach to the M6C magnum, allowing for advanced magnification and linking with UNSC optics to provide the HUD a reticle and ammunition counter."
	icon_state = "m6c_smartscope_obj"
	attach_icon = "m6c_smartscope"

/obj/item/attachable/flashlight/m6
	name = "\improper M6 flashlight"
	desc = "The M6 Flashlight. Not much can be said about it, it turns on and off."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "flashlight"
	attach_icon = "m6g_light"
	original_state = "flashlight"
	original_attach = "m6g_light"
	slot = "under"

/obj/item/attachable/flashlight/m6/Attach(obj/item/weapon/gun/subject)
	if(istype(subject, /obj/item/weapon/gun/pistol/halo/m6g))
		attach_icon = "m6g_light"
		original_attach = "m6g_light"
		..()
	if(istype(subject, /obj/item/weapon/gun/pistol/halo/m6c))
		attach_icon = "m6c_light"
		original_attach = "m6c_light"
		..()
	if(istype(subject, /obj/item/weapon/gun/pistol/halo/m6d))
		attach_icon = "m6d_light"
		original_attach = "m6d_light"
		..()
	else return

/obj/item/attachable/flashlight/m6c_socom
	name = "\improper M6C/SOCOM flashlight/laser-sight"
	desc = "Standard to all M6C/SOCOM models, it is both a combination of the flashlight and laser-sight. Only able to be attached to the M6C/SOCOM series of pistols, due to its modified attachment points."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "socom_under"
	attach_icon = "socom_under"
	original_state = "socom_under"
	original_attach = "socom_under"
	slot = "under"

/obj/item/attachable/flashlight/m6c_socom/New()
	..()
	accuracy_mod = HIT_ACCURACY_MULT_TIER_1
	movement_onehanded_acc_penalty_mod = -MOVEMENT_ACCURACY_PENALTY_MULT_TIER_5
	scatter_mod = -SCATTER_AMOUNT_TIER_10
	scatter_unwielded_mod = -SCATTER_AMOUNT_TIER_9
	accuracy_unwielded_mod = HIT_ACCURACY_MULT_TIER_1

/obj/item/attachable/suppressor/m6c_socom
	name = "\improper M6C/SOCOM suppressor"
	desc = "An attachable suppressor, only able to be attached to the M6C/SOCOM series of pistols, due to its modified attachment points."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "socom_barrel"
	attach_icon = "socom_barrel"
	hud_offset_mod = -3
	new_fire_sound = "gun_socom"

/obj/item/attachable/suppressor/m6c_socom/New()
	return

/obj/item/attachable/suppressor/m7
	name = "\improper M7/SOCOM suppressor"
	desc = "An attachable suppressor for the M7/SOCOM upgrade package."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "m7_suppressor"
	attach_icon = "m7_suppressor"
	hud_offset_mod = -3
	new_fire_sound = "gun_socom_smg"

/obj/item/attachable/suppressor/m7/New()
	return

/obj/item/attachable/reddot/m7
	name = "\improper M7/SOCOM red-dot sight"
	desc = "A red-dot sight for the M7/SOCOM upgrade package."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "m7_red_dot"
	attach_icon = "m7_red_dot"

/obj/item/attachable/flashlight/m7
	name = "\improper M7 flashlight"
	desc = "A side-mounted flashlight to attach to the M7 SMG."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "m7_flashlight"
	attach_icon = "m7_flashlight"
	original_state = "m7_flashlight"
	original_attach = "m7_flashlight"
	slot = "special"
	layer_addition = 0.1

/obj/item/attachable/stock/m7
	name = "M7 SMG collapsable stock"
	desc = "A collapsable stock for the M7 SMG. Extending it makes it more difficult to fire with one and unable to fit into belts, but improves the accuracy and scatter of the weapon."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "m7_stock"
	attach_icon = "m7_stock"
	w_class = SIZE_TINY
	flags_attach_features = ATTACH_ACTIVATION
	collapsible = TRUE
	stock_activated = FALSE
	collapse_delay  = 0.5 SECONDS
	attachment_action_type = /datum/action/item_action/toggle
	slot = "stock"

/obj/item/attachable/stock/m7/New()
	..()

	accuracy_mod = 0
	scatter_mod = 0
	movement_onehanded_acc_penalty_mod = 0
	accuracy_unwielded_mod = 0
	scatter_unwielded_mod = 0
	wield_delay_mod = 0
	recoil_unwielded_mod = 0
	size_mod = 2

/obj/item/attachable/stock/m7/apply_on_weapon(obj/item/weapon/gun/gun)
	if(stock_activated)
		//folded up
		accuracy_mod = HIT_ACCURACY_MULT_TIER_2
		scatter_mod = -SCATTER_AMOUNT_TIER_9
		movement_onehanded_acc_penalty_mod = -MOVEMENT_ACCURACY_PENALTY_MULT_TIER_5
		accuracy_unwielded_mod = -HIT_ACCURACY_MULT_TIER_4
		scatter_unwielded_mod = SCATTER_AMOUNT_TIER_6
		recoil_unwielded_mod = RECOIL_AMOUNT_TIER_5
		icon_state = "m7_stock-on"
		attach_icon = "m7_stock-on"
		size_mod = 2
		wield_delay_mod = WIELD_DELAY_VERY_FAST

	else
		accuracy_mod = 0
		recoil_mod = 0
		scatter_mod = 0
		movement_onehanded_acc_penalty_mod = 0
		accuracy_unwielded_mod = 0
		scatter_unwielded_mod = 0
		icon_state = "m7_stock"
		attach_icon = "m7_stock"
		size_mod = 0
		wield_delay_mod = WIELD_DELAY_NONE //stock is folded so no wield delay
		recoil_unwielded_mod = 0

	gun.recalculate_attachment_bonuses()
	gun.update_overlays(src, "stock")

/obj/item/attachable/stock/m7/grip
	name = "M7 SMG folding grip"
	desc = "A folding grip that comes standard with the M7 SMG. Folding it up makes it more portable and quicker to wield but as a downside becomes slightly less accurate and has worse scatter."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "m7_grip"
	attach_icon = "m7_grip-on"
	flags_attach_features = ATTACH_ACTIVATION
	collapsible = TRUE
	stock_activated = FALSE
	collapse_delay  = 0.5 SECONDS
	attachment_action_type = /datum/action/item_action/toggle
	slot = "under"

/obj/item/attachable/stock/m7/grip/New()
	..()

	accuracy_mod = 0
	scatter_mod = 0
	movement_onehanded_acc_penalty_mod = 0
	accuracy_unwielded_mod = 0
	scatter_unwielded_mod = 0
	wield_delay_mod = 0
	recoil_unwielded_mod = 0
	size_mod = 0
	icon_state = "m7_grip-on"
	attach_icon = "m7_grip-on"

/obj/item/attachable/stock/m7/grip/apply_on_weapon(obj/item/weapon/gun/gun)
	if(stock_activated)
		//folded down
		accuracy_mod = HIT_ACCURACY_MULT_TIER_2
		scatter_mod = -SCATTER_AMOUNT_TIER_9
		movement_onehanded_acc_penalty_mod = -MOVEMENT_ACCURACY_PENALTY_MULT_TIER_5
		accuracy_unwielded_mod = -HIT_ACCURACY_MULT_TIER_3
		scatter_unwielded_mod = SCATTER_AMOUNT_TIER_7
		recoil_unwielded_mod = -RECOIL_AMOUNT_TIER_5
		icon_state = "m7_grip"
		attach_icon = "m7_grip"
		wield_delay_mod = WIELD_DELAY_NONE
		size_mod = 1

	else
		accuracy_mod = 0
		recoil_mod = 0
		scatter_mod = 0
		movement_onehanded_acc_penalty_mod = 0
		accuracy_unwielded_mod = 0
		scatter_unwielded_mod = 0
		icon_state = "m7_grip-on"
		attach_icon = "m7_grip-on"
		wield_delay_mod = 0 //stock is folded up so no wield delay
		recoil_unwielded_mod = 0
		size_mod = 0

	gun.recalculate_attachment_bonuses()
	gun.update_overlays(src, "under")

/obj/item/attachable/stock/m7/grip/folded_down
	stock_activated = TRUE
	attach_icon = "m7_grip"

/obj/item/attachable/stock/m7/grip/folded_down/New()
	..()

	accuracy_mod = HIT_ACCURACY_MULT_TIER_2
	scatter_mod = -SCATTER_AMOUNT_TIER_9
	movement_onehanded_acc_penalty_mod = -MOVEMENT_ACCURACY_PENALTY_MULT_TIER_5
	accuracy_unwielded_mod = -HIT_ACCURACY_MULT_TIER_3
	scatter_unwielded_mod = SCATTER_AMOUNT_TIER_7
	recoil_unwielded_mod = -RECOIL_AMOUNT_TIER_5
	icon_state = "m7_grip"
	attach_icon = "m7_grip"
	wield_delay_mod = WIELD_DELAY_NONE
	size_mod = 1

/obj/item/attachable/bayonet/canc
	name = "\improper CMA M2 bayonet"
	desc = "A relic of a bygone era, this once-common bayonet is no longer in service of any branch of the UNSCDF since the Colonial Military Authority's absorption."

/obj/item/attachable/bayonet
	name = "\improper M5 combat knife"
	desc = "An older issue UNSCDF fighting knife developed and produced by Misriah Armory. Neatly fits into boot-mounted holsters, and can- in emergencies- be utilized to dig out shrapnel."
