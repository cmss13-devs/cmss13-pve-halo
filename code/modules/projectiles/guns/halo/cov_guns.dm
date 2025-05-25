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
	var/overheat_time = 5 SECONDS
	/// Heat gained per shot fired
	var/heat_per_shot = 4
	/// Whether or not the weapon has support for overheating overlays
	var/has_overheat_icon_state = TRUE
	/// Overheat cooldown
	COOLDOWN_DECLARE(cooldown)

	// Heat dispersion
	/// The amount of heat passively dispersed every second
	var/passive_dispersion = 4
	/// The amount of heat dispersed when the weapon has not fired for the duration of the dispersion_delay
	var/heat_dispersion = 5
	/// The delay until heat begins to disperse since the last shot
	var/dispersion_delay = 3 SECONDS


/obj/item/weapon/gun/energy/plasma/gun_safety_handle(mob/user)
	to_chat(user, SPAN_NOTICE("You toggle the power on the [src] [SPAN_BOLD(flags_gun_features & GUN_TRIGGER_SAFETY ? "off" : "on")]."))
	playsound(user, 'sound/weapons/handling/safety_toggle.ogg', 25, 1)

/obj/item/weapon/gun/energy/plasma/Fire(atom/target, mob/living/user, params, reflex, dual_wield)
	if(!COOLDOWN_FINISHED(src, cooldown))
		to_chat(user, SPAN_NOTICE("The [src] is still cooling down."))
		return
	. = ..()
	if(.)
		heat += heat_per_shot
		if(heat >= max_heat)
			overheat()

/obj/item/weapon/gun/energy/plasma/proc/overheat()
	usr.visible_message(SPAN_NOTICE("[usr]'s [src] overheats and vents scalding hot plasma from its side ports!"), SPAN_DANGER("Your [src] overheats and expels hot plasma from its side ports! Its hot!"))
	src.heat = 0
	playsound(src, 'sound/weapons/halo/plasma_overheat.ogg')
	COOLDOWN_START(src, cooldown, overheat_time)
	if(src.has_overheat_icon_state)
		icon_state = "[icon_state]_overheating"
		addtimer(CALLBACK(src, PROC_REF(reset_icon), src), overheat_time)

/obj/item/weapon/gun/energy/plasma/proc/start_process()
	START_PROCESSING(SSdcs, src)

/obj/item/weapon/gun/energy/plasma/process()


/obj/item/weapon/gun/energy/plasma/proc/reset_icon()
	icon_state = initial(icon_state)

/obj/item/weapon/gun/energy/plasma/plasma_pistol
	name = "Eos'Mak-pattern plasma pistol"
	desc = "An advanced plasma pistol belonging to the Covenant military. It fires bolts of superheated plasma using its internal supply."
	charge_cost = 10
	gun_category = GUN_CATEGORY_HANDGUN
	muzzle_flash_color = COLOR_PLASMA_TEAL
	flags_equip_slot = SLOT_WAIST
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_ONE_HAND_WIELDED
	ammo = /datum/ammo/energy/plasma/plasma_pistol

	fire_sound = "gun_lightplasma"
	empty_click = 'sound/weapons/halo/plasma_dryfire.ogg'

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
