/obj/item/weapon/gun/energy/plasma
	name = "Covenant weapon"
	desc = "An alien weapon that shoots plasma. You shouldn't be seeing this one though."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/covenant/covenant_weapons.dmi'
	icon_state = "plasma_pistol"
	var/works_in_cov_recharger = TRUE
	flags_gun_features = GUN_UNUSUAL_DESIGN|GUN_CAN_POINTBLANK
	works_in_recharger = FALSE

	// Heat gain
	/// The maximum heat the weapon can attain. The value of this should remain the same for all weapons.
	var/max_heat = 100
	/// The current heat of the weapon
	var/heat = 0
	/// The time it takes for overheating to cool down the weapon
	var/overheat_time = 8 SECONDS
	/// Heat gained per shot fired
	var/heat_per_shot = 4
	/// Whether or not the weapon has support for overheating overlays
	var/has_overheat_icon_state = TRUE
	/// Overheat cooldown
	COOLDOWN_DECLARE(cooldown)

	// Heat dispersion
	/// The amount of time it takes to manually vent the heat from the weapon
	var/manual_dispersion_delay = 4 SECONDS
	COOLDOWN_DECLARE(manual_cooldown)
	/// The amount of heat passively dispersed every second
	var/passive_dispersion = 2
	/// The amount of additional heat dispersed when the weapon has not fired for the duration of the dispersion_delay
	var/active_dispersion = 3
	/// The delay until additional heat begins to disperse since the last shot
	var/dispersion_delay = 5 SECONDS
	COOLDOWN_DECLARE(dispersion_cooldown)

	// Overlays
	var/image/overheat_overlay
	var/image/venting_overlay

	// Sounds
	var/overheat_sound = 'sound/weapons/halo/plasma_overheat.ogg'
	var/manual_vent_sound = 'sound/weapons/halo/plasma_overheat.ogg'
	var/close_vent_sound = 'sound/weapons/handling/safety_toggle.ogg'

/obj/item/weapon/gun/energy/plasma/Initialize()
	. = ..()
	overheat_overlay = image(icon, icon_state = "+overheat")
	venting_overlay = image(icon, icon_state = "+venting")
	start_process()

/obj/item/weapon/gun/energy/plasma/get_examine_text(mob/user)
	. = ..()
	. += SPAN_NOTICE("The heat reads [100.0*heat/max_heat]%.")

/obj/item/weapon/gun/energy/plasma/gun_safety_handle(mob/user)
	to_chat(user, SPAN_NOTICE("You toggle the power on the [src] [SPAN_BOLD(flags_gun_features & GUN_TRIGGER_SAFETY ? "off" : "on")]."))
	playsound(user, 'sound/weapons/handling/safety_toggle.ogg', 25, 1)

/obj/item/weapon/gun/energy/plasma/Fire(atom/target, mob/living/user, params, reflex, dual_wield)
	if(!COOLDOWN_FINISHED(src, cooldown) || !COOLDOWN_FINISHED(src, manual_cooldown))
		to_chat(usr, SPAN_NOTICE("The [src] is still cooling down."))
		return
	. = ..()
	if(.)
		heat += heat_per_shot
		COOLDOWN_START(src, dispersion_cooldown, dispersion_delay)
		if(heat >= max_heat)
			overheat()

/obj/item/weapon/gun/energy/plasma/unload()
	if(!COOLDOWN_FINISHED(src, cooldown) || !COOLDOWN_FINISHED(src, manual_cooldown))
		to_chat(usr, SPAN_NOTICE("The [src] is still cooling down."))
		return
	if(!heat >= 1)
		to_chat(usr, SPAN_NOTICE("Your [src] doesn't need to be purged of heat."))
	usr.visible_message(SPAN_NOTICE("[usr] manually vents their [src], carefully expelling the hot plasma into the air."), SPAN_DANGER("You manually vent your [src], carefully expelling the hot plasma into the air."))
	playsound(src, manual_vent_sound)
	heat = 0
	COOLDOWN_START(src, manual_cooldown, manual_dispersion_delay)
	if(has_overheat_icon_state)
		icon_state = "plasma_pistol_open"
		addtimer(CALLBACK(src, PROC_REF(reset_icon), src), manual_dispersion_delay)
		flick_overlay(src, venting_overlay, manual_dispersion_delay)
		addtimer(CALLBACK(src, PROC_REF(play_close_sound), src), manual_dispersion_delay)

/obj/item/weapon/gun/energy/plasma/proc/overheat(mob/living/carbon/human/user = usr)
	COOLDOWN_START(src, cooldown, overheat_time)
	user.visible_message(SPAN_NOTICE("[user]'s [src] overheats and vents scalding hot plasma from its side ports!"), SPAN_DANGER("Your [src] overheats and expels hot plasma from its side ports! IT'S HOT!"))
	user.take_overall_armored_damage(30, ARMOR_LASER, BURN, 50)
	heat = 0
	playsound(src, overheat_sound)
	if(has_overheat_icon_state)
		icon_state = "plasma_pistol_open"
		addtimer(CALLBACK(src, PROC_REF(reset_icon), src), overheat_time)
		flick_overlay(src, overheat_overlay, overheat_time)
		addtimer(CALLBACK(src, PROC_REF(play_close_sound), src), overheat_time)

/obj/item/weapon/gun/energy/plasma/proc/start_process()
	START_PROCESSING(SSdcs, src)

/obj/item/weapon/gun/energy/plasma/process()
	heat = max(heat - passive_dispersion, 0)
	if(COOLDOWN_FINISHED(src, dispersion_cooldown))
		heat = max(heat - active_dispersion)

/obj/item/weapon/gun/energy/plasma/proc/reset_icon()
	icon_state = initial(icon_state)

/obj/item/weapon/gun/energy/plasma/proc/play_close_sound()
	playsound(src, close_vent_sound)

/obj/item/weapon/gun/energy/plasma/plasma_pistol
	name = "Eos'Mak-pattern plasma pistol"
	desc = "An advanced plasma pistol belonging to the Covenant military. It fires bolts of superheated plasma using its internal supply."
	charge_cost = 10
	gun_category = GUN_CATEGORY_HANDGUN
	muzzle_flash_color = COLOR_PLASMA_TEAL
	flags_equip_slot = SLOT_WAIST
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_ONE_HAND_WIELDED|GUN_UNUSUAL_DESIGN
	ammo = /datum/ammo/energy/plasma/plasma_pistol

	fire_sound = "gun_lightplasma"
	empty_click = 'sound/weapons/halo/plasma_dryfire.ogg'

	var/datum/ammo/plasma_bolt = /datum/ammo/energy/plasma/plasma_pistol
	var/datum/ammo/overcharged_bolt = /datum/ammo/energy/plasma/plasma_pistol/overcharge
	var/overcharged = FALSE

/obj/item/weapon/gun/energy/plasma/plasma_pistol/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_SMG)
	set_burst_delay(FIRE_DELAY_TIER_SMG)
	set_burst_amount(BURST_AMOUNT_TIER_2)
	accuracy_mult = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_3
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_5
	burst_scatter_mult = SCATTER_AMOUNT_TIER_5
	scatter_unwielded = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_5
	fa_scatter_peak = SCATTER_AMOUNT_TIER_8

/obj/item/weapon/gun/energy/plasma/plasma_pistol/Initialize()
	plasma_bolt = GLOB.ammo_list[plasma_bolt] //Gun initialize calls replace_ammo() so we need to set these first.
	overcharged_bolt = GLOB.ammo_list[overcharged_bolt]

	. = ..()

/obj/item/weapon/gun/energy/plasma/plasma_pistol/unique_action(mob/living/carbon/human/user = usr)
	if(!COOLDOWN_FINISHED(src, cooldown) || !COOLDOWN_FINISHED(src, manual_cooldown))
		to_chat(usr, SPAN_NOTICE("The [src] is still cooling down."))
		return
	if(overcharged)
		user.visible_message(SPAN_NOTICE("[user] releases the trigger on the [src], no longer overcharging it!"), SPAN_DANGER("You stop overcharging the [src]!"))
		overcharged = FALSE
		toggle_ammo()
	else if(!overcharged)
		user.visible_message(SPAN_NOTICE("[user] holds down on the [src]s trigger and begins to overcharge it!"), SPAN_DANGER("You hold down on the [src]s trigger and begin to overcharge it!"))
		toggle_ammo()
		overcharged = TRUE

/obj/item/weapon/gun/energy/plasma/plasma_pistol/Fire(atom/target, mob/living/user, params, reflex, dual_wield)
	. = ..()
	if(.)
		if(overcharged)
			overheat()
			overcharged = FALSE
			toggle_ammo()

/obj/item/weapon/gun/energy/plasma/plasma_pistol/proc/toggle_ammo()
	if(ammo == plasma_bolt)
		ammo = overcharged_bolt
		charge_cost = 100
	else if(ammo == overcharged_bolt)
		ammo = plasma_bolt
		charge_cost = 10
