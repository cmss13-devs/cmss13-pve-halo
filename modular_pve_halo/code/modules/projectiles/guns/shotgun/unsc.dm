
// shotguns

/obj/item/weapon/gun/shotgun/pump/halo
	name = "Halo shotgun holder"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_weapons.dmi'
	icon_state = null
	item_icons = list(
		WEAR_BACK = 'icons/halo/mob/humans/onmob/clothing/back/guns_by_type/shotguns_32.dmi',
		WEAR_J_STORE = 'icons/halo/mob/humans/onmob/clothing/suit_storage/suit_storage_by_faction/suit_slot_unsc.dmi',
		WEAR_L_HAND = 'icons/halo/mob/humans/onmob/items_lefthand_halo.dmi',
		WEAR_R_HAND = 'icons/halo/mob/humans/onmob/items_righthand_halo.dmi'
	)

/obj/item/weapon/gun/shotgun/pump/halo/m90
	name = "\improper M90 CAWS"
	desc = "Built and produced by Weapon System Technology, the M90 CAWS is a contemporary pump-action shotgun employed by the UNSC for CQC scenarios. It feeds twelve 8-gauge shotgun shells from it's internal tubular magazine."
	icon_state = "m90"
	item_state = "m90"
	fire_sound = "gun_m90"
	pump_sound = 'sound/weapons/halo/gun_m90_pump.ogg'
	reload_sound = 'sound/weapons/halo/gun_m90_reload.ogg'
	mouse_pointer = 'icons/halo/effects/mouse_pointer/shotgun.dmi'
	current_mag = /obj/item/ammo_magazine/internal/shotgun/m90
	attachable_allowed = list(/obj/item/attachable/flashlight/m90)
	starting_attachment_types = list(/obj/item/attachable/flashlight/m90)
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_INTERNAL_MAG
	flags_equip_slot = SLOT_BACK
	gauge = "8g"

/obj/item/weapon/gun/shotgun/pump/halo/m90/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 19,"rail_x" = 13, "rail_y" = 21, "under_x" = 29, "under_y" = 15, "stock_x" = 16, "stock_y" = 15, "special_x" = 27, "special_y" = 16)

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

/obj/item/weapon/gun/shotgun/pump/halo/m90/unloaded
	current_mag = /obj/item/ammo_magazine/internal/shotgun/m90/unloaded
	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_INTERNAL_MAG|GUN_TRIGGER_SAFETY

/obj/item/weapon/gun/shotgun/pump/halo/m90/police
	name = "\improper WMT Law Enforcement Shotgun"
	desc = "Made and produced by WMT, it is a civilian variation of the M90 CAWS for use by Law Enforcement... though can sometimes be found in the hands of civilians."
	icon_state = "m90_police"
	attachable_allowed = list(/obj/item/attachable/flashlight/m90/police)
	starting_attachment_types = list(/obj/item/attachable/flashlight/m90/police)
	current_mag = /obj/item/ammo_magazine/internal/shotgun/m90/police

