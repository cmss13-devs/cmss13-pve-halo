
//========== PISTOL BELTS ==========
/obj/item/storage/belt/gun/m6
	name = "\improper M6 general pistol holster rig"
	desc = "The M276 is the standard load-bearing equipment of the UNSC. It consists of a modular belt with various clips. This version has a holster assembly that allows one to carry the most common pistols. It also contains side pouches that can store most pistol magazines."
	icon = 'icons/halo/obj/items/clothing/belts.dmi'
	icon_state = "m6_holster"
	item_state = "s_marinebelt"
	item_icons = list(
		WEAR_WAIST = 'icons/halo/mob/humans/onmob/belt.dmi',
		WEAR_J_STORE = 'icons/halo/mob/humans/onmob/suit_slot_halo.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/items_lefthand_1.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/items_righthand_1.dmi')
	storage_slots = 7
	can_hold = list(
		/obj/item/weapon/gun/pistol/halo,
		/obj/item/ammo_magazine/pistol/halo,
	)
	has_gamemode_skin = FALSE

/obj/item/storage/belt/gun/m6/full_m6c/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/pistol/halo/m6c())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/pistol/halo/m6c(src)

/obj/item/storage/belt/gun/m6/full_m6g/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/pistol/halo/m6g())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/pistol/halo/m6g(src)
//========== SPECIAL BELTS ==========

/obj/item/storage/belt/gun/m7
	name = "\improper M7 holster rig"
	desc = "Special issue M7 holster rig, uncommonly issued to UNSC support and specialist personnel as a PDW."
	icon = 'icons/halo/obj/items/clothing/belts.dmi'
	icon_state = "m7_holster"
	item_state = "s_marinebelt"
	storage_slots = 3
	max_w_class = 6
	can_hold = list(
		/obj/item/weapon/gun/smg/halo/m7,
		/obj/item/ammo_magazine/smg/halo/m7,
	)
	holster_slots = list(
		"1" = list(
			"icon_x" = 0,
			"icon_y" = 0))
	item_icons = list(
		WEAR_WAIST = 'icons/halo/mob/humans/onmob/belt.dmi',
		WEAR_J_STORE = 'icons/halo/mob/humans/onmob/suit_slot_halo.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/items_lefthand_1.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/items_righthand_1.dmi')

/obj/item/storage/belt/gun/m7/full/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/smg/halo/m7())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/smg/halo/m7(src)
//========== POUCHES ==========

/obj/item/storage/pouch/pistol/unsc
	name = "\improper M6 pistol holster"
	icon = 'icons/halo/obj/items/clothing/pouches.dmi'
	icon_state = "m6"
	gun_underlay_path = 'icons/halo/obj/items/clothing/belts.dmi'
	icon_x = 5
	can_hold = list(
		/obj/item/weapon/gun/pistol/halo,
		/obj/item/ammo_magazine/pistol/halo,
	)

/obj/item/storage/pouch/magazine/pistol/unsc
	name = "pistol magazine pouch"
	icon = 'icons/halo/obj/items/clothing/pouches.dmi'
	icon_state = "pistolmag"
	can_hold = list(/obj/item/ammo_magazine/pistol/halo)

/obj/item/storage/pouch/magazine/pistol/unsc/large
	name = "large pistol magazine pouch"
	icon_state = "pistolmag_large"
	storage_slots = 6

//========== BACKPACKS ==========

/obj/item/storage/backpack/marine/satchel/rto/unsc
	name = "UNSC radio backpack"
	icon = 'icons/halo/obj/items/clothing/back.dmi'
	icon_state = "radiopack"
	item_state = "radiopack"
	item_icons = list(
		WEAR_BACK = 'icons/halo/mob/humans/onmob/back_slot_halo.dmi',
		WEAR_L_HAND = 'icons/halo/mob/humans/onmob/items_lefthand_halo.dmi',
		WEAR_R_HAND = 'icons/halo/mob/humans/onmob/items_righthand_halo.dmi')
	networks_receive = list(FACTION_UNSC)
	networks_transmit = list(FACTION_UNSC)
	phone_category = PHONE_UNSC

/obj/item/storage/backpack/marine/satchel/unsc
	name = "UNSC buttpack"
	desc = "A standard-issue buttpack for the infantry of the UNSC."
	icon = 'icons/halo/obj/items/clothing/back.dmi'
	icon_state = "buttpack"
	item_state = "buttpack"
	item_icons = list(
		WEAR_BACK = 'icons/halo/mob/humans/onmob/back_slot_halo.dmi',
		WEAR_L_HAND = 'icons/halo/mob/humans/onmob/items_lefthand_halo.dmi',
		WEAR_R_HAND = 'icons/halo/mob/humans/onmob/items_righthand_halo.dmi')

/obj/item/storage/backpack/marine/unsc
	name = "UNSC rucksack"
	desc = "A large tan rucksack that attaches directly to the M52B armor's attachment points. Standard issue, used by just about every UNSC branch since the 25th century."
	icon = 'icons/halo/obj/items/clothing/back.dmi'
	icon_state = "rucksack"
	item_state = "rucksack"
	item_icons = list(
		WEAR_BACK = 'icons/halo/mob/humans/onmob/back_slot_halo.dmi',
		WEAR_L_HAND = 'icons/halo/mob/humans/onmob/items_lefthand_halo.dmi',
		WEAR_R_HAND = 'icons/halo/mob/humans/onmob/items_righthand_halo.dmi')

/obj/item/storage/backpack/marine/ammo_rack/spnkr
	name = "SPNKr tube storage backpack"
	desc = "Two individual cloth bags, each capable of storing one M19 twin-tube unit for the M41 SPNKr."
	icon = 'icons/halo/obj/items/clothing/back.dmi'
	icon_state = "spnkrpack_0"
	base_icon_state = "spnkrpack"
	item_state = "spnkrpack"
	storage_slots = 2
	can_hold = list(/obj/item/ammo_magazine/spnkr)
	has_gamemode_skin = FALSE
	item_icons = list(
		WEAR_BACK = 'icons/halo/mob/humans/onmob/back_slot_halo.dmi',
		WEAR_L_HAND = 'icons/halo/mob/humans/onmob/items_lefthand_halo.dmi',
		WEAR_R_HAND = 'icons/halo/mob/humans/onmob/items_righthand_halo.dmi')

/obj/item/storage/backpack/marine/ammo_rack/spnkr/filled/fill_preset_inventory()
	for(var/i = 1 to storage_slots)
		new /obj/item/ammo_magazine/spnkr(src)
	update_icon()
