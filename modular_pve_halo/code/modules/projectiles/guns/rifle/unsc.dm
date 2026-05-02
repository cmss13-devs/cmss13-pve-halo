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
	desc = "Belonging to the MA5 individual combat weapons system platform and produced by Misriah Armory, the MA5C is a staple weapon among the UNSC marine corps. It uses a box magazine capable of holding 32 7.62x51mm full-metal-jacket rounds."
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

	starting_attachment_types = list(/obj/item/attachable/flashlight/ma5)
	current_mag = /obj/item/ammo_magazine/rifle/halo/ma5c
	attachable_allowed = list(
		/obj/item/attachable/attached_gun/grenade/ma5,
		/obj/item/attachable/flashlight/ma5,
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
	desc = "The MA5B is an older member of the MA5 line produced by Misriah Armory, though still in use by the Marine Corps and Army. Fires a standard 7.62x51mm round in 60 round magazines, with superior firerate to the MA5C, though less stability and accuracy."
	desc_lore = "While the MA5C was developed to meet many of the issues the UNSC Marine Corps found with the MA5B rifle, primarily its unreliable magazines and poor long-range performance, it remains popular among veterans and close quarter specialists. Especially when paired with 'shredder' ammunition."
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
	starting_attachment_types = list(/obj/item/attachable/flashlight/ma5)
	attachable_allowed = list(
		/obj/item/attachable/ma5b_muzzle,
		/obj/item/attachable/flashlight/ma5,
		/obj/item/attachable/attached_gun/grenade/ma5,
	)

/obj/item/weapon/gun/rifle/halo/ma5b/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 16,"rail_x" = 0, "rail_y" = 0, "under_x" = 29, "under_y" = 16, "stock_x" = 0, "stock_y" = 0, "special_x" = 48, "special_y" = 16)

/obj/item/weapon/gun/rifle/halo/ma5b/handle_starting_attachment()
	..()
	var/obj/item/attachable/ma5b_muzzle/integrated = new(src)
	integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated.Attach(src)
	update_attachable(integrated.slot)

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
	desc = "An old predecessor to the MA5 line, the MA3A had a notably short service history before being replaced by the more comprehensively designed MA5 series, nonetheless, enough were made to feed the private-security and would-be rebel markets for decades to come. Lacking the integrated combat suite of the MA5 rifles, the MA3A instead most commonly featured a over-designed and prone to malfunction multi-mode conventional computer optic. While robust in its capabilities, the constant adjustments and poor battery-life led to its quick abandonment by mainline UNSCDF units."
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

	starting_attachment_types = list(/obj/item/attachable/flashlight/ma5/ma3a, /obj/item/attachable/ma3a_barrel, /obj/item/attachable/scope/mini/ma3a)
	current_mag = /obj/item/ammo_magazine/rifle/halo/ma3a
	attachable_allowed = list(
		/obj/item/attachable/ma3a_shroud,
		/obj/item/attachable/flashlight/ma5/ma3a,
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
	desc = "The Colonial-Military-Authorities replacement for the ageing HMG-38, this 6.5x48mm rifle spent more of its life-time shooting targets than it had any combatant. Benefiting from a more ergonomically conventional layout, and exceptional mechanical simplicity, the Vk78 has long survived the CMA's downfall in the hands of militia-men, criminals, homesteaders and rebels alike. Listen for that distinct bark on patrol, it's probably not friendly."
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
	desc = "A standard-issue marksman rifle in use by the UNSC Marine Corps, the BR55 battle rifle has a reasonably high power, acceptable rate of fire, and high accuracy. It comes with a standard 36-round detachable box magazine of 9.5x40mm experimental HP-SAP-HE rounds, allowing it to reach higher velocities than the MA5 series despite the smaller propellant."
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
	recoil = RECOIL_AMOUNT_TIER_5
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
