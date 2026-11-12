/obj/structure/machinery/cm_vending/covenant/sangheili
	required_species = list(SPECIES_LIST_SANGHEILI)

// ==== SANGHEILI LANCE LEADER (MINOR) ====

/obj/structure/machinery/cm_vending/covenant/sangheili/minor
	name = "\improper sangheili minor equipment locker"
	desc = "A nanolaminate equipment locker intended for sangheili minors."
	vendor_role = list(JOB_COV_LANCE_LEADER) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now

/obj/structure/machinery/cm_vending/covenant/sangheili/minor/get_listed_products(mob/user)
	return GLOB.cm_vending_sangheili_minor

GLOBAL_LIST_INIT(cm_vending_sangheili_minor, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/marine/covenant, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),
		list("Undersuit", 0, /obj/item/clothing/under/marine/covenant/sangheili, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Partial)", 0, /obj/item/clothing/under/marine/covenant/sangheili/partial, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Undersuit (Full-Coverage)", 0, /obj/item/clothing/under/marine/covenant/sangheili/fullbody, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/sangheili, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Combat Harness", 0, /obj/item/clothing/suit/marine/shielded/sangheili/minor, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("Gauntlets", 0 , /obj/item/clothing/gloves/marine/sangheili/minor, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Greaves", 0 , /obj/item/clothing/shoes/sangheili/minor, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR ACCESSORIES", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/sangheili/minor, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Large)", 5, /obj/item/clothing/accessory/pads/sangheili/minor/variant_3, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Slim)", 5, /obj/item/clothing/accessory/pads/sangheili/minor/variant_2, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (BUY ONE)", 0, null, null, null),
		list("Helmet", 0, /obj/item/clothing/head/helmet/marine/sangheili/minor, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Wide)", 5, /obj/item/clothing/head/helmet/marine/sangheili/minor/manta_hat, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/sangheili/minor, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

		list("POUCHES (TAKE TWO)", 0, null, null, null),
		list("Large General Shellcase", 0, /obj/item/storage/pouch/general/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Ammo Shellcases", 0, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Ammo Shellcases", 5, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tool Shellcases", 0, /obj/item/storage/pouch/tools/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase", 0, /obj/item/storage/pouch/medkit/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase (Full)", 0, /obj/item/storage/pouch/medkit/covenant/full_elite, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases", 10, /obj/item/storage/pouch/medkit/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases (Full)", 10, /obj/item/storage/pouch/medkit/covenant/large/full_elite, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases", 0, /obj/item/storage/pouch/medkit/covenant/vials, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases (Full)", 0, /obj/item/storage/pouch/medkit/covenant/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("WEAPONS", 0, null, null, null),
		list("Needler", 0, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 0, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Repeater", 10, /obj/item/weapon/gun/energy/plasma/plasma_repeater, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Carbine", 10, /obj/item/weapon/gun/rifle/covenant_carbine/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("Curveblade", 0, /obj/item/weapon/covenant/curveblade, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
))

// ==== SANGHEILI LANCE LEADER (MAJOR) ====

/obj/structure/machinery/cm_vending/covenant/sangheili/major
	name = "\improper sangheili major equipment locker"
	desc = "A nanolaminate equipment locker intended for sangheili majors."
	vendor_role = list(JOB_COV_LANCE_LEADER) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now

/obj/structure/machinery/cm_vending/covenant/sangheili/major/get_listed_products(mob/user)
	return GLOB.cm_vending_sangheili_major

GLOBAL_LIST_INIT(cm_vending_sangheili_major, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/marine/covenant, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),
		list("Undersuit", 0, /obj/item/clothing/under/marine/covenant/sangheili, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Partial)", 0, /obj/item/clothing/under/marine/covenant/sangheili/partial, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Undersuit (Full-Coverage)", 0, /obj/item/clothing/under/marine/covenant/sangheili/fullbody, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/sangheili, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Combat Harness", 0, /obj/item/clothing/suit/marine/shielded/sangheili/major, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("Gauntlets", 0 , /obj/item/clothing/gloves/marine/sangheili/major, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Greaves", 0 , /obj/item/clothing/shoes/sangheili/major, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR ACCESSORIES", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/sangheili/major, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Large)", 5, /obj/item/clothing/accessory/pads/sangheili/major/variant_3, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Slim)", 5, /obj/item/clothing/accessory/pads/sangheili/major/variant_2, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (BUY ONE)", 0, null, null, null),
		list("Helmet", 0, /obj/item/clothing/head/helmet/marine/sangheili/major, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Wide)", 5, /obj/item/clothing/head/helmet/marine/sangheili/major/manta_hat, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/sangheili/major, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

		list("POUCHES (TAKE TWO)", 0, null, null, null),
		list("Large General Shellcase", 0, /obj/item/storage/pouch/general/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Ammo Shellcases", 0, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Ammo Shellcases", 5, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tool Shellcases", 0, /obj/item/storage/pouch/tools/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase", 0, /obj/item/storage/pouch/medkit/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase (Full)", 0, /obj/item/storage/pouch/medkit/covenant/full_elite, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases", 10, /obj/item/storage/pouch/medkit/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases (Full)", 10, /obj/item/storage/pouch/medkit/covenant/large/full_elite, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases", 0, /obj/item/storage/pouch/medkit/covenant/vials, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases (Full)", 0, /obj/item/storage/pouch/medkit/covenant/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("WEAPONS", 0, null, null, null),
		list("Needler", 0, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 0, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Repeater", 10, /obj/item/weapon/gun/energy/plasma/plasma_repeater, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Carbine", 10, /obj/item/weapon/gun/rifle/covenant_carbine/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("Curveblade", 0, /obj/item/weapon/covenant/curveblade, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
))

// ==========================
// ==== SPECOPS SANGHEILI ====
// ==========================

// ==== SANGHEILI SPECOPS ====

/obj/structure/machinery/cm_vending/covenant/sangheili/specops
	name = "\improper sangheili Special Operations equipment locker"
	desc = "A nanolaminate equipment locker intended for sangheili Special Operations."
	vendor_role = list(JOB_COV_LANCE_OBEDIENTARY) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now
	color = COLOR_PURPLE

/obj/structure/machinery/cm_vending/covenant/sangheili/specops/get_listed_products(mob/user)
	return GLOB.cm_vending_sangheili_specops

GLOBAL_LIST_INIT(cm_vending_sangheili_specops, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/marine/covenant, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),
		list("Undersuit", 0, /obj/item/clothing/under/marine/covenant/sangheili, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Partial)", 0, /obj/item/clothing/under/marine/covenant/sangheili/partial, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Undersuit (Full-Coverage)", 0, /obj/item/clothing/under/marine/covenant/sangheili/fullbody, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/sangheili, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Combat Harness", 0, /obj/item/clothing/suit/marine/shielded/sangheili/cloaking/specops, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("Gauntlets", 0 , /obj/item/clothing/gloves/marine/sangheili/specops, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Greaves", 0 , /obj/item/clothing/shoes/sangheili/specops, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR ACCESSORIES", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/sangheili/specops, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Large)", 5, /obj/item/clothing/accessory/pads/sangheili/specops/variant_3, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Slim)", 5, /obj/item/clothing/accessory/pads/sangheili/specops/variant_2, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (BUY ONE)", 0, null, null, null),
		list("Helmet", 0, /obj/item/clothing/head/helmet/marine/sangheili/specops, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Wide)", 5, /obj/item/clothing/head/helmet/marine/sangheili/specops/manta_hat, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Assault)", 15, /obj/item/clothing/head/helmet/marine/sangheili/specops/assault, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/sangheili/specops, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

		list("POUCHES (TAKE TWO)", 0, null, null, null),
		list("Large General Shellcase", 0, /obj/item/storage/pouch/general/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Ammo Shellcases", 0, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tool Shellcases", 0, /obj/item/storage/pouch/tools/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases", 0, /obj/item/storage/pouch/medkit/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases (Full)", 0, /obj/item/storage/pouch/medkit/covenant/large/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases", 0, /obj/item/storage/pouch/medkit/covenant/vials, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases (Full)", 0, /obj/item/storage/pouch/medkit/covenant/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("WEAPONS", 0, null, null, null),
		list("Needler", 0, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 0, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Repeater", 0, /obj/item/weapon/gun/energy/plasma/plasma_repeater, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Carbine", 0, /obj/item/weapon/gun/rifle/covenant_carbine/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("Curveblade", 0, /obj/item/weapon/covenant/curveblade, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
))

// ==== SANGHEILI LANCE LEADER (MAJOR) ====

/obj/structure/machinery/cm_vending/covenant/sangheili/specops_ultra
	name = "\improper sangheili Special Operations Officer equipment locker"
	desc = "A nanolaminate equipment locker intended for sangheili Special Operations Officers."
	vendor_role = list(JOB_COV_LANCE_LEADER) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now
	color = COLOR_FLOORTILE_GRAY

/obj/structure/machinery/cm_vending/covenant/sangheili/specops_ultra/get_listed_products(mob/user)
	return GLOB.cm_vending_sangheili_specops_ultra

GLOBAL_LIST_INIT(cm_vending_sangheili_specops_ultra, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/marine/covenant, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),
		list("Undersuit", 0, /obj/item/clothing/under/marine/covenant/sangheili, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Partial)", 0, /obj/item/clothing/under/marine/covenant/sangheili/partial, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Undersuit (Full-Coverage)", 0, /obj/item/clothing/under/marine/covenant/sangheili/fullbody, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/sangheili, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Combat Harness", 0, /obj/item/clothing/suit/marine/shielded/sangheili/cloaking/specops/ultra, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("Gauntlets", 0 , /obj/item/clothing/gloves/marine/sangheili/specops/ultra, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Greaves", 0 , /obj/item/clothing/shoes/sangheili/specops/ultra, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR ACCESSORIES", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/sangheili/specops/ultra, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Large)", 5, /obj/item/clothing/accessory/pads/sangheili/specops/ultra/variant_3, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Slim)", 5, /obj/item/clothing/accessory/pads/sangheili/specops/ultra/variant_2, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (BUY ONE)", 0, null, null, null),
		list("Helmet", 0, /obj/item/clothing/head/helmet/marine/sangheili/specops/ultra, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Wide)", 5, /obj/item/clothing/head/helmet/marine/sangheili/specops/ultra/manta_hat, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Assault)", 15, /obj/item/clothing/head/helmet/marine/sangheili/specops/ultra/assault, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/sangheili/specops/ultra, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

		list("POUCHES (TAKE TWO)", 0, null, null, null),
		list("Large General Shellcase", 0, /obj/item/storage/pouch/general/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Ammo Shellcases", 0, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tool Shellcases", 0, /obj/item/storage/pouch/tools/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases", 0, /obj/item/storage/pouch/medkit/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases (Full)", 0, /obj/item/storage/pouch/medkit/covenant/large/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases", 0, /obj/item/storage/pouch/medkit/covenant/vials, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases (Full)", 0, /obj/item/storage/pouch/medkit/covenant/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("WEAPONS", 0, null, null, null),
		list("Needler", 0, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 0, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Repeater", 0, /obj/item/weapon/gun/energy/plasma/plasma_repeater, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Carbine", 0, /obj/item/weapon/gun/rifle/covenant_carbine/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("Curveblade", 0, /obj/item/weapon/covenant/curveblade, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
))
