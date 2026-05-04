// Pistols

/obj/item/weapon/gun/pistol/halo
	name = "Halo pistol holder"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_weapons.dmi'
	icon_state = null
	item_icons = list(
		WEAR_BACK = 'icons/halo/mob/humans/onmob/clothing/back/guns_by_type/pistols_32.dmi',
		WEAR_J_STORE = 'icons/halo/mob/humans/onmob/clothing/suit_storage/suit_storage_by_faction/suit_slot_unsc.dmi',
		WEAR_L_HAND = 'icons/halo/mob/humans/onmob/items_lefthand_halo.dmi',
		WEAR_R_HAND = 'icons/halo/mob/humans/onmob/items_righthand_halo.dmi'
	)
	mouse_pointer = 'icons/halo/effects/mouse_pointer/magnum.dmi'
	reload_sound = 'sound/weapons/halo/gun_magnum_reload.ogg'
	unload_sound = 'sound/weapons/halo/gun_magnum_unload.ogg'
	cocked_sound = 'sound/weapons/halo/gun_magnum_cocked.ogg'
	drop_sound = 'sound/items/halo/drop_lightweapon.ogg'
	pickup_sound = 'sound/items/halo/grab_lightweapon.ogg'
	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK
	empty_sound = null

/obj/item/weapon/gun/pistol/halo/m6c
	name = "M6C service magnum"
	desc = "The M6C is a semi-automatic 12.7x40mm recoil-operated handgun with a standard 12 round magazine. It's set apart from other M6 platform sidearms in that it does not come equipped with a smart-link scope attached to the top of it. Some marines reportedly prefer it due to the less cumbersome nature."
	icon_state = "m6c"
	item_state = "m6"
	caliber = "12.7x40mm"
	current_mag = /obj/item/ammo_magazine/pistol/halo/m6c
	attachable_allowed = list(/obj/item/attachable/scope/mini/smartscope/m6c, /obj/item/attachable/flashlight/m6)
	fire_sound = "gun_m6c"
	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK

/obj/item/weapon/gun/pistol/halo/m6c/unloaded
	current_mag = null

/obj/item/weapon/gun/pistol/halo/m6c/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 27, "muzzle_y" = 21,"rail_x" = 16, "rail_y" = 16, "under_x" = 16, "under_y" = 16, "stock_x" = 18, "stock_y" = 15)

/obj/item/weapon/gun/pistol/halo/m6c/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_12)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_2
	scatter = SCATTER_AMOUNT_TIER_7
	scatter_unwielded = SCATTER_AMOUNT_TIER_5
	damage_mult = BASE_BULLET_DAMAGE_MULT

/obj/item/weapon/gun/pistol/halo/m6c/socom
	name = "M6C/SOCOM \"Automag\" pistol"
	desc = "A Special Operations Command modified M6C, otherwise known as the M6C/SOCOM. This sidearm features a variety of fine-tuned adjustments to better improve its performance in the field, while also receiving a slick new paintjob."
	icon_state = "m6c_socom"
	current_mag = /obj/item/ammo_magazine/pistol/halo/m6c/socom
	attachable_allowed = list(/obj/item/attachable/flashlight/m6c_socom, /obj/item/attachable/suppressor/m6c_socom)
	starting_attachment_types = list(/obj/item/attachable/flashlight/m6c_socom, /obj/item/attachable/suppressor/m6c_socom)

/obj/item/weapon/gun/pistol/halo/m6c/socom/unloaded
	current_mag = null

/obj/item/weapon/gun/pistol/halo/m6c/socom/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_12)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_2
	scatter = SCATTER_AMOUNT_TIER_7
	scatter_unwielded = SCATTER_AMOUNT_TIER_5
	damage_mult = BASE_BULLET_DAMAGE_MULT

/obj/item/weapon/gun/pistol/halo/m6c/socom/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 19, "muzzle_y" = 15,"rail_x" = 16, "rail_y" = 16, "under_x" = 19, "under_y" = 16, "stock_x" = 0, "stock_y" = 0)

/obj/item/weapon/gun/pistol/halo/m6c/m4a
	name = "M4A pistol"
	desc = "An antiquated 12.7x40mm pistol, popular among civilians and criminals alike. The M4A is a predecessor to the more commonly recognized M6 series of pistols by Misriah, removed from official service in 2414 when the M6 took stage.  It's regarded as being inaccurate with a blinding muzzle flash and deafening report, making it unsuited for most practical purposes, features that make it even more attractive to its most common users."
	icon_state = "m4a"
	current_mag = /obj/item/ammo_magazine/pistol/halo/m6c
	attachable_allowed = list(/obj/item/attachable/flashlight/m6)
	fire_sound = "gun_m6c"

/obj/item/weapon/gun/pistol/halo/m6c/m4a/unloaded
	current_mag = null

/obj/item/weapon/gun/pistol/halo/m6c/m4a/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 27, "muzzle_y" = 21,"rail_x" = 16, "rail_y" = 16, "under_x" = 16, "under_y" = 16, "stock_x" = 18, "stock_y" = 15)

/obj/item/weapon/gun/pistol/halo/m6c/m4a/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_8)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_2
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_4
	scatter = SCATTER_AMOUNT_TIER_7
	scatter_unwielded = SCATTER_AMOUNT_TIER_5
	damage_mult = BASE_BULLET_DAMAGE_MULT - BULLET_DAMAGE_MULT_TIER_1

/obj/item/weapon/gun/pistol/halo/m6g
	name = "M6G service magnum"
	desc = "The M6G service magnum is a high-power sidearm utilized by the UNSC, using 12.7x40mm rounds held in a 8 round magazine. With a longer barrel, the M6G is more accurate and has a higher velocity than the M6C."
	icon_state = "m6g"
	item_state = "m6"
	caliber = "12.7x40mm"
	current_mag = /obj/item/ammo_magazine/pistol/halo/m6g
	attachable_allowed = list(/obj/item/attachable/scope/mini/smartscope/m6g, /obj/item/attachable/flashlight/m6)
	fire_sound = "gun_m6g"

/obj/item/weapon/gun/pistol/halo/m6g/unloaded
	current_mag = null

/obj/item/weapon/gun/pistol/halo/m6g/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 27, "muzzle_y" = 21,"rail_x" = 16, "rail_y" = 16, "under_x" = 16, "under_y" = 16, "stock_x" = 18, "stock_y" = 15)

/obj/item/weapon/gun/pistol/halo/m6g/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_9)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_4
	scatter = SCATTER_AMOUNT_TIER_8
	scatter_unwielded = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_4
	velocity_add = AMMO_SPEED_TIER_1

/obj/item/weapon/gun/pistol/halo/m6d
	name = "M6D service magnum"
	desc = "The M6D service magnum is a high-power sidearm in use by the UNSC, particularly with officers and some special forces troops. Fires 12.7x40mm Semi-Armour-Piercing-High-Explosive (SAPHE) rounds out of a 12 round magazine."
	desc_lore = "Its extended magazine and custom grip give it a striking profile which many consider unwieldy and bulky, though others will swear on the weapons power and accuracy with its integrated KFA-2 scope."
	icon_state = "m6d"
	item_state = "m6"
	caliber = "12.7x40mm"
	current_mag = /obj/item/ammo_magazine/pistol/halo/m6d
	attachable_allowed = list(/obj/item/attachable/scope/variable_zoom/m6d, /obj/item/attachable/flashlight/m6)
	fire_sound = "gun_m6d"
	unload_sound = 'sound/weapons/halo/m6d/gun_m6d_unload.ogg'
	reload_sound = 'sound/weapons/halo/m6d/gun_m6d_reload.ogg'
	cocked_sound = 'sound/weapons/halo/m6d/gun_m6d_cock.ogg'
	empty_click = 'sound/weapons/halo/m6d/gun_m6d_dryfire.ogg'

/obj/item/weapon/gun/pistol/halo/m6d/unloaded
	current_mag = null

/obj/item/weapon/gun/pistol/halo/m6d/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 27, "muzzle_y" = 21,"rail_x" = 16, "rail_y" = 16, "under_x" = 16, "under_y" = 16, "stock_x" = 18, "stock_y" = 15)

/obj/item/weapon/gun/pistol/halo/m6d/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_9)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_6
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_6
	scatter = SCATTER_AMOUNT_TIER_10
	scatter_unwielded = SCATTER_AMOUNT_TIER_9
	damage_mult = BASE_BULLET_DAMAGE_MULT * 2
	velocity_add = AMMO_SPEED_TIER_2

/obj/item/weapon/gun/pistol/halo/m6d/handle_starting_attachment()
	..()
	var/obj/item/attachable/scope/variable_zoom/m6d/scope = new(src)
	scope.flags_attach_features &= ~ATTACH_REMOVABLE
	scope.Attach(src)
	scope.hidden = TRUE
	update_attachable(scope.slot)

/obj/item/weapon/gun/pistol/halo/m6a
	name = "M6A service magnum"
	desc = "The M6A is a semi-automatic 12.7x40mm recoil-operated handgun with a standard 12 round magazine. This variation is often given out to security and law enforcement firms as a more compact version of the standard template, though with less stopping power."
	icon_state = "m6a"
	item_state = "m6"
	caliber = "12.7x40mm"
	current_mag = /obj/item/ammo_magazine/pistol/halo/m6a
	attachable_allowed = list(/obj/item/attachable/flashlight/m6)
	fire_sound = "gun_m6c"

/obj/item/weapon/gun/pistol/halo/m6a/unloaded
	current_mag = null

/obj/item/weapon/gun/pistol/halo/m6a/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 27, "muzzle_y" = 21,"rail_x" = 16, "rail_y" = 16, "under_x" = 16, "under_y" = 16, "stock_x" = 18, "stock_y" = 15)


/obj/item/weapon/gun/pistol/halo/m6a/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_9)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_2
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_3
	scatter = SCATTER_AMOUNT_TIER_7
	scatter_unwielded = SCATTER_AMOUNT_TIER_5
	damage_mult =  BASE_BULLET_DAMAGE_MULT - BULLET_DAMAGE_MULT_TIER_4
