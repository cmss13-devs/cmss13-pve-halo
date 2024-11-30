// Rifles

/obj/item/weapon/gun/rifle/halo
	name = "Halo rifle holder"
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_weapons.dmi'
	item_icons = list(
		WEAR_BACK = 'icons/mob/humans/onmob/back_slot_halo.dmi',
        WEAR_J_STORE = 'icons/mob/humans/onmob/suit_slot_halo.dmi',
        WEAR_L_HAND = 'icons/mob/humans/onmob/items_lefthand_halo.dmi',
        WEAR_R_HAND = 'icons/mob/humans/onmob/items_righthand_halo.dmi'
    )

/obj/item/weapon/gun/rifle/halo/ma5c
	name = "MA5C ICWS assault rifle"
	desc = "Belonging to the MA5 individual combat weapons system platform and produced by Misriah Armory, the MA5C is a staple weapon among the UNSC marine corps. It uses a box magazine capable of holding 32 7.62x51mm full-metal-jacket rounds."
	icon_state = "ma5c"
	item_state = "ma5c"
	caliber = "7.62x51mm"

	fire_sound = "gun_ma5c"
	reload_sound = 'sound/weapons/gun_ma5c_reload.ogg'
	cocked_sound = 'sound/weapons/gun_ma5c_cocked.ogg'
	unload_sound = 'sound/weapons/gun_ma5c_unload.ogg'
	empty_sound = null

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	start_automatic = TRUE
	map_specific_decoration = FALSE

	starting_attachment_types = list(/obj/item/attachable/flashlight/ma5c, /obj/item/attachable/ma5c_barrel)
	current_mag = /obj/item/ammo_magazine/rifle/halo/ma5c
	attachable_allowed = list(
		/obj/item/attachable/ma5c_shroud,
		/obj/item/attachable/attached_gun/grenade/ma5c,
		/obj/item/attachable/flashlight/ma5c,
		/obj/item/attachable/ma5c_barrel,
	)

/obj/item/weapon/gun/rifle/halo/ma5c/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 16,"rail_x" = 0, "rail_y" = 0, "under_x" = 32, "under_y" = 16, "stock_x" = 0, "stock_y" = 0, "special_x" = 32, "special_y" = 16)

/obj/item/weapon/gun/rifle/halo/ma5c/handle_starting_attachment()
	..()
	var/obj/item/attachable/ma5c_shroud/integrated = new(src)
	integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated.Attach(src)
	update_attachable(integrated.slot)

/obj/item/weapon/gun/rifle/halo/ma5c/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_11)
	set_burst_amount(BURST_AMOUNT_TIER_4)
	set_burst_delay(FIRE_DELAY_TIER_11)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_8
	burst_scatter_mult = SCATTER_AMOUNT_TIER_10
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_2

/obj/item/weapon/gun/rifle/halo/br55
	name = "BR55 battle rifle"
	desc = "A standard-issue marksman rifle in use by the UNSC Marine Corps, the BR55 battle rifle has a reasonably high power, acceptable rate of fire, and high accuracy. It comes with a standard 36-round detachable box magazine of 9.5x40mm experimental HP-SAP-HE rounds, allowing it to reach higher velocities than the MA5 series despite the smaller propellant."
	icon_state = "br55"
	item_state = "br55"
	caliber = "9.5x40mm"

	fire_sound = "gun_br55"
	reload_sound = 'sound/weapons/gun_br55_reload.ogg'
	cocked_sound = 'sound/weapons/gun_br55_cocked.ogg'
	unload_sound = 'sound/weapons/gun_br55_unload.ogg'
	empty_sound = null

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	start_automatic = TRUE
	map_specific_decoration = FALSE

	starting_attachment_types = list(/obj/item/attachable/br55_barrel, /obj/item/attachable/scope/mini/br55)
	current_mag = /obj/item/ammo_magazine/rifle/halo/br55
	attachable_allowed = list(
		/obj/item/attachable/br55_barrel,
		/obj/item/attachable/br55_muzzle,
	)

/obj/item/weapon/gun/rifle/halo/br55/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 16,"rail_x" = 22, "rail_y" = 21, "under_x" = 32, "under_y" = 16, "stock_x" = 0, "stock_y" = 0, "special_x" = 32, "special_y" = 16)

/obj/item/weapon/gun/rifle/halo/br55/handle_starting_attachment()
	..()
	var/obj/item/attachable/br55_muzzle/integrated = new(src)
	integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated.Attach(src)
	update_attachable(integrated.slot)

/obj/item/weapon/gun/rifle/halo/br55/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_7)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_SMG)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_8
	burst_scatter_mult = SCATTER_AMOUNT_TIER_10
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_2

// SMGs

/obj/item/weapon/gun/smg/halo
	name = "halo smg holder"
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_weapons.dmi'
	item_icons = list(
		WEAR_BACK = 'icons/mob/humans/onmob/back_slot_halo.dmi',
        WEAR_J_STORE = 'icons/mob/humans/onmob/suit_slot_halo.dmi',
        WEAR_L_HAND = 'icons/mob/humans/onmob/items_lefthand_halo.dmi',
        WEAR_R_HAND = 'icons/mob/humans/onmob/items_righthand_halo.dmi'
    )

/obj/item/weapon/gun/smg/halo/m7
	name = "M7 submachine gun"
	icon_state = "m7"
	item_state = "m7"
	caliber = "5x23mm"

	fire_sound = "gun_m7"

// shotguns

/obj/item/weapon/gun/shotgun/pump/halo
	name = "Halo shotgun holder"
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_weapons.dmi'
	item_icons = list(
		WEAR_BACK = 'icons/mob/humans/onmob/back_slot_halo.dmi',
        WEAR_J_STORE = 'icons/mob/humans/onmob/suit_slot_halo.dmi',
        WEAR_L_HAND = 'icons/mob/humans/onmob/items_lefthand_halo.dmi',
        WEAR_R_HAND = 'icons/mob/humans/onmob/items_righthand_halo.dmi'
    )

/obj/item/weapon/gun/shotgun/pump/halo/m90
	name = "\improper M90 CAWS"
	desc = "Built and produced by Weapon System Technology, the M90 CAWS is a contemporary pump-action shotgun employed by the UNSC for CQC scenarios. It feeds twelve 8-gauge shotgun shells from it's internal tubular magazine."
	icon_state = "m90"
	item_state = "m90"
	fire_sound = "gun_m90"
	pump_sound = 'sound/weapons/gun_m90_pump.ogg'
	reload_sound = 'sound/weapons/gun_m90_reload.ogg'
	current_mag = /obj/item/ammo_magazine/internal/shotgun/m90
	attachable_allowed = list(/obj/item/attachable/stock/type23/wood)
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_INTERNAL_MAG
	flags_equip_slot = SLOT_BACK
	gauge = "8g"

/obj/item/weapon/gun/shotgun/pump/halo/m90/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 19,"rail_x" = 13, "rail_y" = 21, "under_x" = 24, "under_y" = 15, "stock_x" = 16, "stock_y" = 15, "special_x" = 32, "special_y" = 16)

/obj/item/weapon/gun/shotgun/pump/halo/m90/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_8)
	accuracy_mult = BASE_ACCURACY_MULT
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_4
	scatter_unwielded = SCATTER_AMOUNT_TIER_1
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_1
	recoil_unwielded = RECOIL_AMOUNT_TIER_1

/obj/item/weapon/gun/shotgun/pump/halo/m90/handle_starting_attachment()
	..()
	var/obj/item/attachable/m90_muzzle/integrated = new(src)
	integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated.Attach(src)
	update_attachable(integrated.slot)

// snipers

/obj/item/weapon/gun/rifle/sniper/halo
	name = "SRS99-AM sniper rifle"
	desc = "The SRS99-AM sniper rifle is the standard issue sniper rifle across all branches of the UNSC due to it's extreme capabilities. It has a 4 round detachable box magazine of 14.5x114mm APFSDS ammunition and modularity allowing the entire barrel system to be removed and replaced with alternative variants."
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_weapons.dmi'
	icon_state = "srs99"
	item_state = "srs99"
	caliber = "14.5x114mm"
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	worn_x_dimension = 64
	worn_y_dimension = 64
	item_icons = list(
		WEAR_BACK = 'icons/mob/humans/onmob/back_slot_halo_64.dmi',
        WEAR_L_HAND = 'icons/mob/humans/onmob/items_lefthand_halo_64.dmi',
        WEAR_R_HAND = 'icons/mob/humans/onmob/items_righthand_halo_64.dmi'
    )

	fire_sound = "gun_srs99"
	reload_sound = 'sound/weapons/gun_srs99_reload.ogg'
	cocked_sound = 'sound/weapons/gun_srs99_cocked.ogg'
	unload_sound = 'sound/weapons/gun_srs99_unload.ogg'
	empty_sound = null

	current_mag = /obj/item/ammo_magazine/rifle/halo/sniper
	force = 12
	wield_delay = WIELD_DELAY_HORRIBLE //Ends up being 1.6 seconds due to scope
	zoomdevicename = "scope"
	attachable_allowed = list(/obj/item/attachable/srs_assembly, /obj/item/attachable/scope/variable_zoom/oracle, /obj/item/attachable/srs_barrel, /obj/item/attachable/bipod/srs_bipod)
	starting_attachment_types = list(/obj/item/attachable/scope/variable_zoom/oracle, /obj/item/attachable/srs_barrel, /obj/item/attachable/bipod/srs_bipod)
	flags_gun_features = GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER
	map_specific_decoration = FALSE
	skill_locked = FALSE
	flags_item = TWOHANDED

/obj/item/weapon/gun/rifle/sniper/halo/verb/toggle_scope_zoom_level()
	set name = "Toggle Scope Zoom Level"
	set category = "Weapons"
	set src in usr
	var/obj/item/attachable/scope/variable_zoom/S = attachments["rail"]
	S.toggle_zoom_level()

/obj/item/weapon/gun/rifle/sniper/halo/handle_starting_attachment()
	..()
	var/obj/item/attachable/srs_assembly/S = new(src)
	S.flags_attach_features &= ~ATTACH_REMOVABLE
	S.Attach(src)
	update_attachable(S.slot)

/obj/item/weapon/gun/rifle/sniper/halo/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 38, "muzzle_y" = 21,"rail_x" = 21, "rail_y" = 24, "under_x" = 32, "under_y" = 14, "special_x" = 48, "special_y" = 17)


/obj/item/weapon/gun/rifle/sniper/halo/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_SNIPER)
	set_burst_amount(BURST_AMOUNT_TIER_1)
	accuracy_mult = BASE_ACCURACY_MULT * 3 //you HAVE to be able to hit
	scatter = SCATTER_AMOUNT_TIER_8
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5

// rocket launchers

/obj/item/weapon/gun/halo_launcher // im a lazy bastard and dont want to deal with killing all of the dumb procs sorry :)
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_weapons.dmi'

/obj/item/weapon/gun/halo_launcher/spankr
	name = "\improper M41 SPNKr"
	desc = "The M41 SPNKr is a reusable rocket launcher system with multi-role capabilities, including the ability to lock onto air and ground targets. Commonly referred to as the Jackhammer by the UNSC forces equipped with it."
	icon_state = "spankr"
	item_state = "spankr"
	layer = ABOVE_OBJ_LAYER
	bonus_overlay_layer = UPPER_ITEM_LAYER
	bonus_overlay_x = -2
	bonus_overlay_y = 1
	var/cover_open = FALSE
	current_mag = /obj/item/ammo_magazine/spankr
	aim_slowdown = SLOWDOWN_ADS_SUPERWEAPON
	flags_gun_features = GUN_WIELDED_FIRING_ONLY
	fire_sound = "gun_spankr"
	reload_sound = 'sound/weapons/gun_spankr_reload.ogg'
	unload_sound = 'sound/weapons/gun_spankr_unload.ogg'

/obj/item/weapon/gun/halo_launcher/spankr/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_5)
	accuracy_mult = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_4
	scatter = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_3

/obj/item/weapon/gun/halo_launcher/spankr/clicked(mob/user, list/mods)
	if(!mods["alt"] || !CAN_PICKUP(user, src))
		return ..()
	else
		if(!locate(src) in list(user.get_active_hand(), user.get_inactive_hand()))
			return TRUE
		if(user.get_active_hand() && user.get_inactive_hand())
			to_chat(user, SPAN_WARNING("You can't do that with your hands full!"))
			return TRUE
		if(!cover_open)
			playsound(src.loc, 'sound/handling/smartgun_open.ogg', 50, TRUE, 3)
			to_chat(user, SPAN_NOTICE("You open [src]'s feed cover, allowing the [current_mag.name] to be removed."))
			cover_open = TRUE
		else
			playsound(src.loc, 'sound/handling/smartgun_close.ogg', 50, TRUE, 3)
			to_chat(user, SPAN_NOTICE("You close [src]'s feed cover."))
			cover_open = FALSE
		update_icon()
		return TRUE

/obj/item/weapon/gun/halo_launcher/spankr/replace_magazine(mob/user, obj/item/ammo_magazine/magazine)
	if(!cover_open)
		to_chat(user, SPAN_WARNING("[src]'s cover is closed! You can't put a new [current_mag.name] tube in! d<b>(alt-click to open it)</b>"))
		return
	return ..()

/obj/item/weapon/gun/halo_launcher/spankr/unload(mob/user, reload_override, drop_override, loc_override)
	if(!cover_open)
		to_chat(user, SPAN_WARNING("[src]'s cover is closed! You can't take out the [current_mag.name]! <b>(alt-click to open it)</b>"))
		return
	else if(in_chamber)
		to_chat(user, SPAN_WARNING("The safety mechanism prevents you from removing the [current_mag.name] from the [src] until all rounds have been fired."))
		return
	return ..()

/obj/item/weapon/gun/halo_launcher/spankr/update_icon()
	. = ..()
	if(cover_open)
		overlays += image("+[base_gun_icon]_cover_open")
	else
		overlays += image("+[base_gun_icon]_cover_closed")

/obj/item/weapon/gun/halo_launcher/spankr/able_to_fire(mob/living/user)
	. = ..()
	if(.)
		if(cover_open)
			to_chat(user, SPAN_WARNING("You can't fire [src] with the feed cover open! <b>(alt-click to close)</b>"))
			return FALSE


// Pistols

/obj/item/weapon/gun/pistol/halo
	name = "Halo pistol holder"
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_weapons.dmi'
	item_icons = list(
		WEAR_BACK = 'icons/mob/humans/onmob/back_slot_halo.dmi',
        WEAR_J_STORE = 'icons/mob/humans/onmob/suit_slot_halo.dmi',
        WEAR_L_HAND = 'icons/mob/humans/onmob/items_lefthand_halo.dmi',
        WEAR_R_HAND = 'icons/mob/humans/onmob/items_righthand_halo.dmi'
    )

/obj/item/weapon/gun/pistol/halo/magnum
	name = "M6C service magnum"
	desc = "The M6C is a semi-automatic 12.7x40mm recoil-operated handgun with a standard 12 round magazine. It's set apart from other M6 platform sidearms in that it does not come equipped with a smart-link scope attached to the top of it. Some marines reportedly prefer it due to the less cumbersome nature."
	icon_state = "m6c"
	item_state = "vp70"
	caliber = "12.7x40mm"
	current_mag = /obj/item/ammo_magazine/pistol/halo/magnum

	drop_sound = 'sound/items/drop_lightweapon.ogg'
	pickup_sound = 'sound/items/grab_lightweapon.ogg'
	fire_sound = "gun_m6c"
	reload_sound = 'sound/weapons/gun_magnum_reload.ogg'
	unload_sound = 'sound/weapons/gun_magnum_unload.ogg'
	cocked_sound = 'sound/weapons/gun_magnum_cocked.ogg'
	empty_sound = null

/obj/item/weapon/gun/pistol/halo/magnum/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 27, "muzzle_y" = 21,"rail_x" = 3, "rail_y" = 14, "under_x" = 21, "under_y" = 30, "stock_x" = 18, "stock_y" = 15)


/obj/item/weapon/gun/pistol/halo/magnum/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_11)
	accuracy_mult = BASE_ACCURACY_MULT
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_7
	burst_scatter_mult = SCATTER_AMOUNT_TIER_7
	scatter_unwielded = SCATTER_AMOUNT_TIER_7
	damage_mult = BASE_BULLET_DAMAGE_MULT

/obj/item/weapon/gun/pistol/halo/magnum/m6g
	name = "M6G service magnum"
	desc = "The M6G service magnum is a high-power sidearm utilized by the UNSC, using 12.7x40mm rounds held in a 8 round magazine. With a longer barrel and a smartscope attached, the M6G is more accurate and has a higher velocity than the M6C."
	icon_state = "m6g"
	current_mag = /obj/item/ammo_magazine/pistol/halo/magnum/m6g

	fire_sound = "gun_m6g"
