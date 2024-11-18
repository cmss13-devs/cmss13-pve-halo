/obj/item/weapon/gun/rifle/halo
	name = "halo gun holder"
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_weapons.dmi'

/obj/item/weapon/gun/rifle/halo/ma5c
	name = "MA5C ICWS assault rifle"
	desc = "Belonging to the MA5 individual combat weapons system platform and produced by Misriah Armory, the MA5C is a staple weapon among the UNSC marine corps. It uses a box magazine capable of holding 32 7.62x51mm full-metal-jacket rounds."
	icon_state = "ma5c"
	item_state = "ma5c"

	item_icons = list(
		WEAR_BACK = 'icons/mob/humans/onmob/back_slot_halo.dmi',
        WEAR_J_STORE = 'icons/mob/humans/onmob/suit_slot_halo.dmi',
        WEAR_L_HAND = 'icons/mob/humans/onmob/items_lefthand_halo.dmi',
        WEAR_R_HAND = 'icons/mob/humans/onmob/items_righthand_halo.dmi'
    )

	fire_sound = "gun_ma5c"
	reload_sound = 'sound/weapons/gun_ma5c_reload.ogg'
	cocked_sound = 'sound/weapons/gun_ma5c_cocked.ogg'
	empty_sound = 'sound/weapons/gun_ma5c_unload.ogg'
	unload_sound = 'sound/weapons/gun_ma5c_unload.ogg'

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
