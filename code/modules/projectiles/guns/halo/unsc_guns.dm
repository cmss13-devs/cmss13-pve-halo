// Rifles

/obj/item/weapon/gun/rifle/halo
	name = "Halo rifle holder"
	mouse_pointer = 'icons/halo/effects/mouse_pointer/ma5c.dmi'
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_weapons.dmi'
	icon_state = null
	item_icons = list(
		WEAR_BACK = 'icons/halo/mob/humans/onmob/clothing/back/guns_by_type/rifles_32.dmi',
		WEAR_J_STORE = 'icons/halo/mob/humans/onmob/clothing/suit_storage/suit_storage_by_faction/suit_slot_unsc.dmi',
		WEAR_L_HAND = 'icons/halo/mob/humans/onmob/items_lefthand_halo.dmi',
		WEAR_R_HAND = 'icons/halo/mob/humans/onmob/items_righthand_halo.dmi'
	)

/obj/item/weapon/gun/rifle/halo/ma5c
	name = "MA5C ICWS assault rifle"
	desc = "A 7.62x51mm bullpup offering a slew of improvements from the B-variant. Reduced 1:7 twist and redesigned contact surfaces increase accuracy and stability in automatic, while the new 48 round magazine is highly reliable."
	icon_state = "ma5c"
	item_state = "ma5c"
	caliber = "7.62x51mm"

	fire_sound = "gun_ma5c"
	reload_sound = 'sound/weapons/halo/gun_ma5c_reload.ogg'
	cocked_sound = 'sound/weapons/halo/gun_ma5c_cocked.ogg'
	unload_sound = 'sound/weapons/halo/gun_ma5c_unload.ogg'
	empty_click = "ma5b_dryfire"
	empty_sound = null

	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	start_automatic = TRUE
	map_specific_decoration = FALSE

	starting_attachment_types = list(/obj/item/attachable/flashlight/ma5c)
	current_mag = /obj/item/ammo_magazine/rifle/halo/ma5c
	attachable_allowed = list(
		/obj/item/attachable/attached_gun/grenade/ma5c,
		/obj/item/attachable/flashlight/ma5c,
		/obj/item/attachable/ma5c_muzzle,
	)

/obj/item/weapon/gun/rifle/halo/ma5c/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 48, "muzzle_y" = 16,"rail_x" = 0, "rail_y" = 0, "under_x" = 27, "under_y" = 16, "stock_x" = 0, "stock_y" = 0, "special_x" = 48, "special_y" = 16)

/obj/item/weapon/gun/rifle/halo/ma5c/handle_starting_attachment()
	..()
	var/obj/item/attachable/ma5c_muzzle/integrated = new(src)
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
	scatter = SCATTER_AMOUNT_TIER_10
	burst_scatter_mult = SCATTER_AMOUNT_TIER_10
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_2
	recoil = RECOIL_AMOUNT_TIER_5
	fa_scatter_peak = 30
	fa_max_scatter = SCATTER_AMOUNT_TIER_8

/obj/item/weapon/gun/rifle/halo/ma5c/unloaded
	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_TRIGGER_SAFETY
	current_mag = null

/obj/item/weapon/gun/rifle/halo/ma5b
	name = "MA5B ICWS assault rifle"
	desc = "The older weapon sports a torrential 900RPM cyclic backed by 60 round magazine. Veterans and units expecting closer combat often select the B-variant if at all possible. However, these strengths would drive its successor's adoption."
	desc_lore = "While beloved by paper soldiers in all positions, it is violently unstable in automatic, and in semi its MOA wider. Even the saltiest veteran will admit the MA5C's practically hugging its user even in full auto, compared to the 'B. Even this might not have been enough but for its reliability problem. Magazines must be cared for carefully, or failures are frequent. In the desperate combat of the early Human-Covenant War, such care evaporated."
	icon_state = "ma5b"
	item_state = "ma5b"
	caliber = "7.62x51mm"
	mouse_pointer = 'icons/halo/effects/mouse_pointer/ma5b.dmi'

	fire_sound = "gun_ma5b"
	fire_rattle = "gun_ma5b"
	firesound_volume = 20
	reload_sound = 'sound/weapons/halo/ma5b/gun_ma5b_reload.ogg'
	cocked_sound = 'sound/weapons/halo/ma5b/gun_ma5b_cock.ogg'
	unload_sound = 'sound/weapons/halo/ma5b/gun_ma5b_unload.ogg'
	empty_click = "ma5b_dryfire"
	empty_sound = null

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	start_automatic = TRUE
	map_specific_decoration = FALSE
	current_mag = /obj/item/ammo_magazine/rifle/halo/ma5b
	attachable_allowed = list(
		/obj/item/attachable/ma5b_muzzle,
		/obj/item/attachable/flashlight/ma5b,
	)

/obj/item/weapon/gun/rifle/halo/ma5b/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 16,"rail_x" = 0, "rail_y" = 0, "under_x" = 48, "under_y" = 16, "stock_x" = 0, "stock_y" = 0, "special_x" = 48, "special_y" = 16)

/obj/item/weapon/gun/rifle/halo/ma5b/handle_starting_attachment()
	..()
	var/obj/item/attachable/ma5b_muzzle/integrated = new(src)
	integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated.Attach(src)
	update_attachable(integrated.slot)
	var/obj/item/attachable/flashlight/ma5b/integrated2 = new(src)
	integrated2.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated2.Attach(src)
	update_attachable(integrated2.slot)

/obj/item/weapon/gun/rifle/halo/ma5b/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_12)
	set_burst_amount(BURST_AMOUNT_TIER_5)
	set_burst_delay(FIRE_DELAY_TIER_11)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_9
	burst_scatter_mult = SCATTER_AMOUNT_TIER_9
	scatter_unwielded = SCATTER_AMOUNT_TIER_3
	damage_mult = BASE_BULLET_DAMAGE_MULT * 0.85
	recoil_unwielded = RECOIL_AMOUNT_TIER_3
	recoil = RECOIL_AMOUNT_TIER_5
	fa_scatter_peak = 60
	fa_max_scatter = SCATTER_AMOUNT_TIER_7
	effective_range_max = EFFECTIVE_RANGE_MAX_TIER_2

/obj/item/weapon/gun/rifle/halo/ma5b/unloaded
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_TRIGGER_SAFETY
	current_mag = null

/obj/item/weapon/gun/rifle/halo/ma3a
	name = "MA3A assault rifle"
	desc = "The MA5's predecessor had a notably short service history before being replaced by the more comprehensively designed MA5 series, though surplus from its large production run would often crop up in private security or rebel hands."
	desc_lore = " Lacking the integrated combat suite of the MA5 rifles, the MA3A instead most commonly featured a over-designed and prone to malfunction multi-mode conventional computer optic. Though excellent when it worked, the constant adjustments and poor battery-life drove soldiers mad, and led to its quick abandonment by mainline UNSCDF units."
	icon_state = "ma3a"
	item_state = "ma5c"
	caliber = "7.62x51mm"

	fire_sound = "gun_ma5c"
	reload_sound = 'sound/weapons/halo/gun_ma5c_reload.ogg'
	cocked_sound = 'sound/weapons/halo/gun_ma5c_cocked.ogg'
	unload_sound = 'sound/weapons/halo/gun_ma5c_unload.ogg'
	empty_sound = null

	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	start_automatic = TRUE
	map_specific_decoration = FALSE

	starting_attachment_types = list(/obj/item/attachable/flashlight/ma5c/ma3a, /obj/item/attachable/ma3a_barrel, /obj/item/attachable/scope/mini/ma3a)
	current_mag = /obj/item/ammo_magazine/rifle/halo/ma3a
	attachable_allowed = list(
		/obj/item/attachable/ma3a_shroud,
		/obj/item/attachable/flashlight/ma5c/ma3a,
		/obj/item/attachable/ma3a_barrel,
		/obj/item/attachable/scope/mini/ma3a,
	)

/obj/item/weapon/gun/rifle/halo/ma3a/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 16, "rail_x" = 16, "rail_y" = 16, "under_x" = 32, "under_y" = 16, "stock_x" = 0, "stock_y" = 0, "special_x" = 32, "special_y" = 16)

/obj/item/weapon/gun/rifle/halo/ma3a/handle_starting_attachment()
	..()
	var/obj/item/attachable/ma3a_shroud/integrated = new(src)
	integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated.Attach(src)
	update_attachable(integrated.slot)

/obj/item/weapon/gun/rifle/halo/ma3a/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_11)
	set_burst_amount(BURST_AMOUNT_TIER_2)
	set_burst_delay(FIRE_DELAY_TIER_10)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_5
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_8
	scatter = SCATTER_AMOUNT_TIER_2
	burst_scatter_mult = SCATTER_AMOUNT_TIER_3
	scatter_unwielded = SCATTER_AMOUNT_TIER_3
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_3
	recoil = RECOIL_AMOUNT_TIER_4
	fa_scatter_peak = 30
	fa_max_scatter = 2

/obj/item/weapon/gun/rifle/halo/ma3a/unloaded
	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_TRIGGER_SAFETY
	current_mag = null

/obj/item/weapon/gun/rifle/halo/vk78
	name = "VK78 surplus rifle"
	desc = "The Colonial Military Authority's replacement for the aging HMG-38, this 6.5x48mm rifle spent more of its lifetime shooting targets than it had any combatant. Its rugged action and conventional layout has seen this weapon outlive the CMA, going on to arm militia, criminals, and sometimes homesteaders. Listen for that distinct bark on patrol, it's probably not friendly."
	icon_state = "vk78"
	item_state = "vk78"
	caliber = "6.5x48mm"

	fire_sound = "gun_ma5c"
	reload_sound = 'sound/weapons/halo/gun_ma5c_reload.ogg'
	cocked_sound = 'sound/weapons/halo/gun_ma5c_cocked.ogg'
	unload_sound = 'sound/weapons/halo/gun_ma5c_unload.ogg'
	empty_sound = null

	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	start_automatic = TRUE
	map_specific_decoration = FALSE

	starting_attachment_types = list(/obj/item/attachable/vk78_barrel, /obj/item/attachable/scope/mini/vk78)
	current_mag = /obj/item/ammo_magazine/rifle/halo/vk78
	attachable_allowed = list(
		/obj/item/attachable/vk78_front,
		/obj/item/attachable/vk78_barrel,
		/obj/item/attachable/scope/mini/vk78,
	)

/obj/item/weapon/gun/rifle/halo/vk78/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 16,"rail_x" = 16, "rail_y" = 16, "under_x" = 32, "under_y" = 16, "stock_x" = 0, "stock_y" = 0, "special_x" = 32, "special_y" = 16)


/obj/item/weapon/gun/rifle/halo/vk78/handle_starting_attachment()
	..()
	var/obj/item/attachable/vk78_front/integrated = new(src)
	integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated.Attach(src)
	update_attachable(integrated.slot)


/obj/item/weapon/gun/rifle/halo/vk78/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_10)
	set_burst_amount(BURST_AMOUNT_TIER_2)
	set_burst_delay(FIRE_DELAY_TIER_10)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_2
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_4
	scatter = SCATTER_AMOUNT_TIER_3
	burst_scatter_mult = SCATTER_AMOUNT_TIER_2
	scatter_unwielded = SCATTER_AMOUNT_TIER_3
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_3
	recoil = RECOIL_AMOUNT_TIER_4
	fa_scatter_peak = 30
	fa_max_scatter = 2


/obj/item/weapon/gun/rifle/halo/vk78/unloaded
	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_TRIGGER_SAFETY
	current_mag = null


/obj/item/weapon/gun/rifle/halo/br55
	name = "BR55 battle rifle"
	desc = "The UNSC Marine Corps' new DMR. Noticeably more powerful than the MA5, a novel rifling scheme offers excellent accuracy and precision over any range. Standard issue mag is a 36 rounder of 9.5x40mm HP-SAP-HE, using new propellants and a very high chamber pressure for much improved muzzle velocity compared to the MA5 series."
	icon_state = "br55"
	item_state = "br55"
	caliber = "9.5x40mm"
	mouse_pointer = 'icons/halo/effects/mouse_pointer/br55.dmi'

	fire_sound = "gun_br55"
	reload_sound = 'sound/weapons/halo/gun_br55_reload.ogg'
	cocked_sound = 'sound/weapons/halo/gun_br55_cocked.ogg'
	unload_sound = 'sound/weapons/halo/gun_br55_unload.ogg'
	empty_sound = null

	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	start_automatic = FALSE
	map_specific_decoration = FALSE

	starting_attachment_types = list(/obj/item/attachable/br55_barrel, /obj/item/attachable/scope/mini/br55)
	current_mag = /obj/item/ammo_magazine/rifle/halo/br55
	attachable_allowed = list(
		/obj/item/attachable/br55_barrel,
		/obj/item/attachable/br55_muzzle,
		/obj/item/attachable/scope/mini/br55,
	)

/obj/item/weapon/gun/rifle/halo/br55/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 16,"rail_x" = 24, "rail_y" = 20, "under_x" = 32, "under_y" = 16, "stock_x" = 0, "stock_y" = 0, "special_x" = 32, "special_y" = 16)

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
	accuracy_mult = BASE_ACCURACY_MULT
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_5
	burst_scatter_mult = SCATTER_AMOUNT_TIER_5
	scatter_unwielded = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_3
	recoil = RECOIL_AMOUNT_TIER_4
	fa_scatter_peak = 16
	fa_max_scatter = 2

/obj/item/weapon/gun/rifle/halo/br55/unloaded
	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_TRIGGER_SAFETY
	current_mag = null

/obj/item/weapon/gun/rifle/halo/dmr
	name = "M392 DMR"
	desc = "The M392 Designated-Marksman-Rifle is a 7.62x51mm bullpup rifle featuring a 15 round magazine and commonly, a scope. The weapon was most notably used by UNSCDF Army units and the defunct Colonial-Military-Authority before and during the Insurrection. The rifle is mechanically simple compared to its contemporary brethren and this has led to its popularity on the black market, alongside its greater availability ever since the shuttering of the CMA."
	icon_state = "dmr"
	item_state = "dmr"
	caliber = "7.62x51mm"
	mouse_pointer = 'icons/halo/effects/mouse_pointer/br55.dmi'

	fire_sound = null
	fire_sounds = list('sound/weapons/halo/gun_m392_1.ogg', 'sound/weapons/halo/gun_m392_2.ogg', 'sound/weapons/halo/gun_m392_3.ogg')
	reload_sound = 'sound/weapons/halo/gun_br55_reload.ogg'
	cocked_sound = 'sound/weapons/halo/gun_br55_cocked.ogg'
	unload_sound = 'sound/weapons/halo/gun_br55_unload.ogg'
	empty_sound = null


	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	start_automatic = FALSE
	map_specific_decoration = FALSE


	starting_attachment_types = list(/obj/item/attachable/dmr_front, /obj/item/attachable/dmr_barrel, /obj/item/attachable/scope/mini/dmr)
	current_mag = /obj/item/ammo_magazine/rifle/halo/dmr
	attachable_allowed = list(
		/obj/item/attachable/dmr_front,
		/obj/item/attachable/dmr_barrel,
		/obj/item/attachable/scope/mini/dmr,
	)


/obj/item/weapon/gun/rifle/halo/dmr/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 48, "muzzle_y" = 16,"rail_x" = 28, "rail_y" = 16, "under_x" = 32, "under_y" = 16, "stock_x" = 0, "stock_y" = 0, "special_x" = 32, "special_y" = 16)


/obj/item/weapon/gun/rifle/halo/dmr/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_5)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_3
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_6
	scatter_unwielded = SCATTER_AMOUNT_TIER_5
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_4
	recoil = RECOIL_AMOUNT_TIER_5
	fa_scatter_peak = 16
	fa_max_scatter = 2


/obj/item/weapon/gun/rifle/halo/dmr/unloaded
	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_TRIGGER_SAFETY
	current_mag = null

// SMGs

/obj/item/weapon/gun/smg/halo
	name = "halo smg holder"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_weapons.dmi'
	icon_state = null
	item_icons = list(
		WEAR_BACK = 'icons/halo/mob/humans/onmob/clothing/back/guns_by_type/smgs_32.dmi',
		WEAR_J_STORE = 'icons/halo/mob/humans/onmob/clothing/suit_storage/suit_storage_by_faction/suit_slot_unsc.dmi',
		WEAR_L_HAND = 'icons/halo/mob/humans/onmob/items_lefthand_halo.dmi',
		WEAR_R_HAND = 'icons/halo/mob/humans/onmob/items_righthand_halo.dmi',
		WEAR_WAIST = 'icons/halo/mob/humans/onmob/clothing/suit_storage/suit_storage_by_faction/suit_slot_unsc.dmi'
	)

/obj/item/weapon/gun/smg/halo/m7
	name = "M7 submachine gun"
	desc = "Compact SMG in 5mm caseless. Collapsable stock, folding grip, just the ticket for a pocket hose. The M7 has found its home in boarding, protection detail, and special operations for its compact size and surprising stopping power."
	icon_state = "m7"
	item_state = "m7"
	caliber = "5x23mm"
	mouse_pointer = 'icons/halo/effects/mouse_pointer/ma5b.dmi'

	fire_sound = "gun_m7"
	fire_rattle = "gun_m7"
	reload_sound = 'sound/weapons/halo/gun_m7_reload.ogg'
	cocked_sound = 'sound/weapons/halo/gun_m7_cocked.ogg'
	unload_sound = 'sound/weapons/halo/gun_m7_unload.ogg'
	empty_sound = null
	w_class = SIZE_LARGE

	flags_gun_features = GUN_AUTO_EJECT_CASINGS|GUN_CAN_POINTBLANK
	start_automatic = TRUE
	map_specific_decoration = FALSE
	current_mag = /obj/item/ammo_magazine/smg/halo/m7
	starting_attachment_types = list(/obj/item/attachable/stock/m7, /obj/item/attachable/stock/m7/grip/folded_down)
	attachable_allowed = list(
		/obj/item/attachable/stock/m7,
		/obj/item/attachable/stock/m7/grip,
		/obj/item/attachable/flashlight/m7,
		/obj/item/attachable/reddot/m7,
		/obj/item/attachable/suppressor/m7,
	)

/obj/item/weapon/gun/smg/halo/m7/folded_up
	starting_attachment_types = list(/obj/item/attachable/stock/m7, /obj/item/attachable/stock/m7/grip)

/obj/item/weapon/gun/smg/halo/m7/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 27, "muzzle_y" = 15,"rail_x" = 16, "rail_y" = 16, "under_x" = 30, "under_y" = 15, "stock_x" = 13, "stock_y" = 14, "special_x" = 11, "special_y" = 16)

/obj/item/weapon/gun/smg/halo/m7/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_12)
	set_burst_delay(FIRE_DELAY_TIER_12)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	accuracy_mult = BASE_ACCURACY_MULT
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_8
	burst_scatter_mult = SCATTER_AMOUNT_TIER_9
	scatter_unwielded = SCATTER_AMOUNT_TIER_8
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_2
	fa_scatter_peak = 40
	fa_max_scatter = 3

/obj/item/weapon/gun/smg/halo/m7/socom
	name = "M7S submachine gun"
	starting_attachment_types = list(
		/obj/item/attachable/stock/m7,
		/obj/item/attachable/stock/m7/grip/folded_down,
		/obj/item/attachable/flashlight/m7,
		/obj/item/attachable/reddot/m7,
		/obj/item/attachable/suppressor/m7,
	)

/obj/item/weapon/gun/smg/halo/m7/socom/folded_up
	starting_attachment_types = list(
		/obj/item/attachable/stock/m7,
		/obj/item/attachable/stock/m7/grip,
		/obj/item/attachable/flashlight/m7,
		/obj/item/attachable/reddot/m7,
		/obj/item/attachable/suppressor/m7,
	)

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
	desc = "Built and produced by Weapon System Technology, the M90 CAWS is a contemporary pump-action shotgun employed by the UNSCDF. It feeds twelve 8-gauge shotgun shells from internal tube with an iconic top-loading system."
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

// snipers

/obj/item/weapon/gun/rifle/sniper/halo
	name = "SRS99-AM sniper rifle"
	desc = "The SRS99-AM sniper rifle is the UNSCDF's new standard issue sniper rifle. Feeds a 4 round mag of 14.5x114mm APFSDS with incredible performance at extreme range. One quirk of the weapon is a significant level of modularity, particularly in the barrel which may be replaced quickly or swapped entirely."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_weapons.dmi'
	icon_state = "srs99"
	item_state = "srs99"
	caliber = "14.5x114mm"
	mouse_pointer = 'icons/halo/effects/mouse_pointer/srs99.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	worn_x_dimension = 64
	worn_y_dimension = 64
	item_icons = list(
		WEAR_BACK = 'icons/halo/mob/humans/onmob/clothing/back/guns_by_type/marksman_rifles_64.dmi',
		WEAR_L_HAND = 'icons/halo/mob/humans/onmob/items_lefthand_halo_64.dmi',
		WEAR_R_HAND = 'icons/halo/mob/humans/onmob/items_righthand_halo_64.dmi'
	)

	fire_sound = "gun_srs99"
	reload_sound = 'sound/weapons/halo/gun_srs99_reload.ogg'
	cocked_sound = 'sound/weapons/halo/gun_srs99_cocked.ogg'
	unload_sound = 'sound/weapons/halo/gun_srs99_unload.ogg'
	empty_sound = null

	current_mag = /obj/item/ammo_magazine/rifle/halo/sniper
	force = 12
	wield_delay = WIELD_DELAY_HORRIBLE
	flags_equip_slot = SLOT_BLOCK_SUIT_STORE|SLOT_BACK
	zoomdevicename = "scope"
	attachable_allowed = list(/obj/item/attachable/srs_assembly, /obj/item/attachable/scope/variable_zoom/oracle, /obj/item/attachable/srs_barrel, /obj/item/attachable/bipod/srs_bipod)
	starting_attachment_types = list(/obj/item/attachable/scope/variable_zoom/oracle, /obj/item/attachable/srs_barrel, /obj/item/attachable/bipod/srs_bipod)
	flags_gun_features = GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER
	map_specific_decoration = FALSE
	skill_locked = FALSE
	flags_item = TWOHANDED
	var/can_change_barrel = TRUE

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
	scatter = SCATTER_AMOUNT_TIER_3
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/rifle/sniper/halo/unloaded
	flags_gun_features = GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER|GUN_TRIGGER_SAFETY
	current_mag = null

/obj/item/weapon/mateba_key/halo_sniper
	name = "SRS99 barrel key"
	desc = "A key for the SRS99 barrel, used to unlock the mechanism and allow the user to remove the barrel."

/obj/item/weapon/gun/rifle/sniper/halo/attackby(obj/item/subject, mob/user)
	if(istype(subject, /obj/item/weapon/mateba_key/halo_sniper) && can_change_barrel)
		if(attachments["muzzle"])
			var/obj/item/attachable/attachment = attachments["special"]
			visible_message(SPAN_NOTICE("[user] begins stripping [attachment] from [src]."),
			SPAN_NOTICE("You begin stripping [attachment] from [src]."), null, 4)

			if(!do_after(usr, 35, INTERRUPT_ALL, BUSY_ICON_FRIENDLY))
				return

			if(!(attachment == attachments[attachment.slot]))
				return

			visible_message(SPAN_NOTICE("[user] unlocks and removes [attachment] from [src]."),
			SPAN_NOTICE("You unlocks removes [attachment] from [src]."), null, 4)
			attachment.Detach(user, src)
			playsound(src, 'sound/handling/attachment_remove.ogg', 15, 1, 4)
			update_icon()
	. = ..()

/obj/item/weapon/gun/rifle/sniper/halo/able_to_fire(mob/living/user)
	if(!attachments["muzzle"])
		to_chat(user, SPAN_WARNING("You can't fire the [src] without a barrel!"))
		return
	. = ..()

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
	desc = "Semi-automatic 12.7x40mm recoil-operated pistol. Feed mechanism and grip has been redesigned, attempting to remedy the breakage problem alongside reliability faults. Its 'pugnose' design offers superior use in close quarters, but also incomplete powder burn resulting in lower performance than expected."
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
	desc = "Vintage 12.7x40mm pistol, popular among civilians and criminals alike. Predecessor to the more commonly recognized M6 series, officially replaced in 2414. Common complaints were its inaccuracy, followed by a blinding, dirty muzzle flash and deafening report. These attributes would also be what gave it a second life among its new users."
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
	desc = "With a longer barrel and polygonal rifling, the M6G is more accurate and has a higher velocity. Capacity reverted to 8 rounds in a bid to reduce size of weapon and ammo, unfortunately also making it no longer backwards compatible."
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
	desc = "The D-variant has a sterling reputation as a powerful and accurate weapon. To some with its integrated KFA-2 low power smart-link sight, in built up urban centers it's even a fine alternative to a sniper rifle. However, not all that glitters is gold, with some users swearing the added bulk makes it unacceptably unwieldy."
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

/obj/item/weapon/gun/pistol/halo/m6g/unloaded
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
	desc = "Phased-out member of the M6 family. Unique to the A-variant action is a recoil absorbing design, but velocity loss and accuracy issues were endemic until its replacement. Now seen in security and law enforcement use as a more compact, comfortable carry."
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

// Grenades

/obj/item/explosive/grenade/high_explosive/m15/unsc
	name = "M9 fragmentation grenade"
	desc = "The UNSCDF's standard issue frag grenade. 190 gram Composition L filler reliably saturates a 15 meter radius with fragments."
	desc_lore = "Rumors spread about how every new posting someone gets, the design of the M9 fragmentation grenade looks different from the last ones they held."
	icon = 'icons/halo/obj/items/weapons/grenades.dmi'
	icon_state = "m9"
	item_state = "m9"
	falloff_mode = EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL_HALF

/obj/item/explosive/grenade/high_explosive/m15/unsc/launchable
	name = "40mm explosive grenade"
	desc = "A 40mm explosive grenade. It's unable to be primed by hand and must be loaded into the bottom of a rifle's grenade launcher."
	icon = 'icons/halo/obj/items/weapons/grenades.dmi'
	icon_state = "he_40mm"
	item_state = "he_40mm"
	caliber = "40mm"
	hand_throwable = FALSE
	has_arm_sound = FALSE
	dangerous = FALSE
	dual_purpose = TRUE
	underslug_launchable = TRUE
