/obj/item/weapon/gun/rifle/halo/m247
	name = "M247 General Purpose Machinegun"
	desc = "The M247 GPMG is chambered for the ubiquitous M118 7.62×51mm FMJ AP cartridge, unlike the M247H, which uses the 12.7mm high velocity cartridge. The M247 GPMG has been deployed in a variety of configurations; being a general-purpose machine gun, the M247 is fed via a belt box on the right side of the gun and is usually deployed on a tripod. In this infantry-portable configuration, the weapon can be folded up and carried with ease. The weapon's mobility allows personnel to quickly establish defensive perimeters or to provide suppressing fire."
	icon_state = "m247"
	item_state = "m247"
	caliber = "7.62x51mm"

	fire_sound = "gun_m247_burst"
	reload_sound = 'sound/weapons/handling/gun_sg_reload.ogg'
	cocked_sound = 'sound/weapons/halo/gun_ma5c_cocked.ogg'
	unload_sound = 'sound/weapons/handling/gun_sg_unload.ogg'
	empty_click = "ma5b_dryfire"
	empty_sound = null

	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	start_automatic = TRUE
	map_specific_decoration = FALSE

	current_mag = /obj/item/ammo_magazine/rifle/halo/m247
	bonus_overlay_layer = 21

/obj/item/weapon/gun/rifle/halo/m247/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 48, "muzzle_y" = 16,"rail_x" = 0, "rail_y" = 0, "under_x" = 48, "under_y" = 16, "stock_x" = 16, "stock_y" = 16, "special_x" = 48, "special_y" = 16)

/obj/item/weapon/gun/rifle/halo/m247/handle_starting_attachment()
	..()
	var/obj/item/attachable/m247_muzzle/muzzle = new(src)
	muzzle.flags_attach_features &= ~ATTACH_REMOVABLE
	muzzle.Attach(src)
	update_attachable(muzzle.slot)
	var/obj/item/attachable/m247_stock/stock = new(src)
	stock.flags_attach_features &= ~ATTACH_REMOVABLE
	stock.Attach(src)
	update_attachable(stock.slot)
	var/obj/item/attachable/bipod/m247_bipod/bipod = new(src)
	bipod.flags_attach_features &= ~ATTACH_REMOVABLE
	bipod.Attach(src)
	update_attachable(bipod.slot)
	var/obj/item/attachable/scope/variable_zoom/m247/scope = new(src)
	scope.flags_attach_features &= ~ATTACH_REMOVABLE
	scope.Attach(src)
	scope.hidden = TRUE
	update_attachable(scope.slot)

/obj/item/weapon/gun/rifle/halo/m247/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_SG)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_10
	burst_scatter_mult = SCATTER_AMOUNT_TIER_10
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_2
	recoil = RECOIL_AMOUNT_TIER_5
	fa_scatter_peak = 40
	fa_max_scatter = SCATTER_AMOUNT_TIER_7
