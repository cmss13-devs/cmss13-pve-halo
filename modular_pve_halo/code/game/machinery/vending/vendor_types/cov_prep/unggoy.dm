/obj/structure/machinery/cm_vending/covenant/unggoy
	required_species = list(SPECIES_LIST_UNGGOY)

// ==== UNGGOY WARRIOR ====

GLOBAL_LIST_INIT(cm_vending_unggoy_minor, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Unggoy Minor Basics", 0, list(/obj/item/clothing/under/marine/covenant/unggoy, /obj/item/device/radio/headset/almayer/marine/covenant, /obj/item/clothing/suit/marine/unggoy/minor), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/unggoy, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("METHANE TANK (TAKE ONE)", 0, null, null, null),
		list("Pointy Tank", 0, /obj/item/storage/backpack/covenant/unggoy/minor/pointy, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_MANDATORY),
		list("Curlback Tank", 0, /obj/item/storage/backpack/covenant/unggoy/minor/curlback, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Pronged Tank", 5, /obj/item/storage/backpack/covenant/unggoy/minor/doubleprong, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Canister Tank", 5, /obj/item/storage/backpack/covenant/unggoy/minor/canister, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("METHANE MASK (TAKE ONE)", 0, null, null, null),
		list("Standard Mask", 0, /obj/item/clothing/mask/gas/unggoy, MARINE_CAN_BUY_MASK, VENDOR_ITEM_MANDATORY),
		list("Full-Face Mask", 5, /obj/item/clothing/mask/gas/unggoy/specops, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("ARMOR ATTACHMENTS", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/unggoy/minor, null, VENDOR_ITEM_REGULAR),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/unggoy/bicep/minor, null, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/unggoy/minor, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

		list("POUCHES (TAKE TWO)", 0, null, null, null),
		list("Large General Shellcase", 0, /obj/item/storage/pouch/general/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Ammo Shellcases", 0, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Ammo Shellcases", 5, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tool Shellcases", 0, /obj/item/storage/pouch/tools/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase", 0, /obj/item/storage/pouch/medkit/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase (Full)", 0, /obj/item/storage/pouch/medkit/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases", 10, /obj/item/storage/pouch/medkit/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases (Full)", 10, /obj/item/storage/pouch/medkit/covenant/large/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases", 0, /obj/item/storage/pouch/medkit/covenant/vials, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases (Full)", 0, /obj/item/storage/pouch/medkit/covenant/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ADDITIONAL ARMOR", 0, null, null, null),
		list("Arm Bracers", 10, /obj/item/clothing/gloves/marine/unggoy/minor, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),
		list("Leg Greaves", 10, /obj/item/clothing/shoes/unggoy/minor, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_REGULAR),

		list("WEAPONS", 0, null, null, null),
		list("Plasma Pistol", 0, /obj/item/weapon/gun/energy/plasma/plasma_pistol, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Needler", 15, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 30, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
))

/obj/structure/machinery/cm_vending/covenant/unggoy/warrior
	name = "\improper unggoy warrior equipment locker"
	desc = "A nanolaminate equipment locker intended for low-rate unggoy warriors."
	vendor_role = list(JOB_COV_LANCE_STANDARD) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now

/obj/structure/machinery/cm_vending/covenant/unggoy/warrior/get_listed_products(mob/user)
	return GLOB.cm_vending_unggoy_minor

// ==== UNGGOY OBEDIENTARY ====

/obj/structure/machinery/cm_vending/covenant/unggoy/obedientary
	name = "\improper unggoy obedientary equipment locker"
	desc = "A nanolaminate equipment locker intended for mid-rate unggoy warriors."
	vendor_role = list(JOB_COV_LANCE_OBEDIENTARY) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now

/obj/structure/machinery/cm_vending/covenant/unggoy/obedientary/get_listed_products(mob/user)
	return GLOB.cm_vending_unggoy_major

GLOBAL_LIST_INIT(cm_vending_unggoy_major, list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Unggoy Minor Basics", 0, list(/obj/item/clothing/under/marine/covenant/unggoy, /obj/item/device/radio/headset/almayer/marine/covenant, /obj/item/clothing/suit/marine/unggoy/major), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/unggoy, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),

		list("METHANE TANK (TAKE ONE)", 0, null, null, null),
		list("Pointy Tank", 0, /obj/item/storage/backpack/covenant/unggoy/major/pointy, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_MANDATORY),
		list("Curlback Tank", 0, /obj/item/storage/backpack/covenant/unggoy/major/curlback, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Pronged Tank", 5, /obj/item/storage/backpack/covenant/unggoy/major/doubleprong, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Canister Tank", 5, /obj/item/storage/backpack/covenant/unggoy/major/canister, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("METHANE MASK (TAKE ONE)", 0, null, null, null),
		list("Standard Mask", 0, /obj/item/clothing/mask/gas/unggoy, MARINE_CAN_BUY_MASK, VENDOR_ITEM_MANDATORY),
		list("Full-Face Mask", 0, /obj/item/clothing/mask/gas/unggoy/specops, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("ARMOR ATTACHMENTS", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/unggoy/major, null, VENDOR_ITEM_REGULAR),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/unggoy/bicep/major, null, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/unggoy/major, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

		list("POUCHES (TAKE TWO)", 0, null, null, null),
		list("Large General Shellcase", 0, /obj/item/storage/pouch/general/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Ammo Shellcases", 0, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Ammo Shellcases", 5, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tool Shellcases", 0, /obj/item/storage/pouch/tools/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase", 0, /obj/item/storage/pouch/medkit/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase (Full)", 0, /obj/item/storage/pouch/medkit/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases", 10, /obj/item/storage/pouch/medkit/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases (Full)", 10, /obj/item/storage/pouch/medkit/covenant/large/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases", 5, /obj/item/storage/pouch/medkit/covenant/vials, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases (Full)", 5, /obj/item/storage/pouch/medkit/covenant/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ADDITIONAL ARMOR", 0, null, null, null),
		list("Arm Bracers", 10, /obj/item/clothing/gloves/marine/unggoy/major, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),
		list("Leg Greaves", 10, /obj/item/clothing/shoes/unggoy/major, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_REGULAR),

		list("WEAPONS", 0, null, null, null),
		list("Plasma Pistol", 0, /obj/item/weapon/gun/energy/plasma/plasma_pistol, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Needler", 10, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 20, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
))

// ==== UNGGOY SPECIALIST ====

/obj/structure/machinery/cm_vending/covenant/unggoy/specialist
	name = "\improper unggoy specialist equipment locker"
	desc = "A nanolaminate equipment locker intended for unggoy specialists."
	vendor_role = list(JOB_COV_LANCE_SPECIALIST) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now

/obj/structure/machinery/cm_vending/covenant/unggoy/specialist/get_listed_products(mob/user)
	return GLOB.cm_vending_unggoy_specialist

GLOBAL_LIST_INIT(cm_vending_unggoy_specialist, list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Unggoy Minor Basics", 0, list(/obj/item/clothing/under/marine/covenant/unggoy, /obj/item/device/radio/headset/almayer/marine/covenant, /obj/item/clothing/suit/marine/unggoy/heavy), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/unggoy, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),

		list("SPECIALIST WEAPON (TAKE ONE)", 0, null, null, null),
		list("Heavy Plasma Repeater", 0, /obj/item/weapon/gun/energy/plasma/heavy_repeater, MARINE_CAN_BUY_KIT, VENDOR_ITEM_MANDATORY),

		list("METHANE TANK (TAKE ONE)", 0, null, null, null),
		list("Pointy Tank", 0, /obj/item/storage/backpack/covenant/unggoy/heavy/pointy, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_MANDATORY),
		list("Curlback Tank", 0, /obj/item/storage/backpack/covenant/unggoy/heavy/curlback, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Pronged Tank", 5, /obj/item/storage/backpack/covenant/unggoy/heavy/doubleprong, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Canister Tank", 5, /obj/item/storage/backpack/covenant/unggoy/heavy/canister, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("METHANE MASK (TAKE ONE)", 0, null, null, null),
		list("Standard Mask", 0, /obj/item/clothing/mask/gas/unggoy, MARINE_CAN_BUY_MASK, VENDOR_ITEM_MANDATORY),
		list("Full-Face Mask", 0, /obj/item/clothing/mask/gas/unggoy/specops, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Assault Helmet", 15, /obj/item/clothing/head/helmet/marine/unggoy/heavy, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("ARMOR ATTACHMENTS", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/unggoy/heavy, null, VENDOR_ITEM_REGULAR),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/unggoy/bicep/heavy, null, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/unggoy/heavy, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

		list("POUCHES (TAKE TWO)", 0, null, null, null),
		list("Large General Shellcase", 0, /obj/item/storage/pouch/general/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Ammo Shellcases", 0, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Ammo Shellcases", 5, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tool Shellcases", 0, /obj/item/storage/pouch/tools/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase", 0, /obj/item/storage/pouch/medkit/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase (Full)", 0, /obj/item/storage/pouch/medkit/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases", 10, /obj/item/storage/pouch/medkit/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases (Full)", 10, /obj/item/storage/pouch/medkit/covenant/large/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases", 5, /obj/item/storage/pouch/medkit/covenant/vials, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases (Full)", 5, /obj/item/storage/pouch/medkit/covenant/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ADDITIONAL ARMOR", 0, null, null, null),
		list("Arm Bracers", 10, /obj/item/clothing/gloves/marine/unggoy/heavy, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),
		list("Leg Greaves", 10, /obj/item/clothing/shoes/unggoy/heavy, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_REGULAR),

		list("WEAPONS", 0, null, null, null),
		list("Plasma Pistol", 0, /obj/item/weapon/gun/energy/plasma/plasma_pistol, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Needler", 10, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 20, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
))

// ==== UNGGOY EVOCATI ====

/obj/structure/machinery/cm_vending/covenant/unggoy/evocati
	name = "\improper unggoy evocati equipment locker"
	desc = "A nanolaminate equipment locker intended for unggoy within the Evocati order."
	vendor_role = list(JOB_COV_LANCE_ULTRA) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now

/obj/structure/machinery/cm_vending/covenant/unggoy/evocati/get_listed_products(mob/user)
	return GLOB.cm_vending_unggoy_ultra

GLOBAL_LIST_INIT(cm_vending_unggoy_ultra, list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Unggoy Minor Basics", 0, list(/obj/item/clothing/under/marine/covenant/unggoy, /obj/item/device/radio/headset/almayer/marine/covenant, /obj/item/clothing/suit/marine/unggoy/ultra), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/unggoy, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),

		list("METHANE TANK (TAKE ONE)", 0, null, null, null),
		list("Pointy Tank", 0, /obj/item/storage/backpack/covenant/unggoy/ultra/pointy, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_MANDATORY),
		list("Curlback Tank", 0, /obj/item/storage/backpack/covenant/unggoy/ultra/curlback, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Pronged Tank", 5, /obj/item/storage/backpack/covenant/unggoy/ultra/doubleprong, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Canister Tank", 5, /obj/item/storage/backpack/covenant/unggoy/ultra/canister, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("METHANE MASK (TAKE ONE)", 0, null, null, null),
		list("Standard Mask", 0, /obj/item/clothing/mask/gas/unggoy, MARINE_CAN_BUY_MASK, VENDOR_ITEM_MANDATORY),
		list("Full-Face Mask", 0, /obj/item/clothing/mask/gas/unggoy/specops, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Assault Helmet", 10, /obj/item/clothing/head/helmet/marine/unggoy/ultra, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("ARMOR ATTACHMENTS", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/unggoy/ultra, null, VENDOR_ITEM_REGULAR),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/unggoy/bicep/ultra, null, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/unggoy/ultra, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

		list("POUCHES (TAKE TWO)", 0, null, null, null),
		list("Large General Shellcase", 0, /obj/item/storage/pouch/general/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Ammo Shellcases", 0, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Ammo Shellcases", 5, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tool Shellcases", 0, /obj/item/storage/pouch/tools/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase", 0, /obj/item/storage/pouch/medkit/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Shellcase (Full)", 0, /obj/item/storage/pouch/medkit/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases", 10, /obj/item/storage/pouch/medkit/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases (Full)", 10, /obj/item/storage/pouch/medkit/covenant/large/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases", 5, /obj/item/storage/pouch/medkit/covenant/vials, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases (Full)", 5, /obj/item/storage/pouch/medkit/covenant/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ADDITIONAL ARMOR", 0, null, null, null),
		list("Arm Bracers", 10, /obj/item/clothing/gloves/marine/unggoy/ultra, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),
		list("Leg Greaves", 10, /obj/item/clothing/shoes/unggoy/ultra, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_REGULAR),

		list("WEAPONS", 0, null, null, null),
		list("Plasma Pistol", 0, /obj/item/weapon/gun/energy/plasma/plasma_pistol, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Needler", 5, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 10, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
))

// ==========================
// ==== SPECOPS UNGGOY ====
// ==========================

GLOBAL_LIST_INIT(cm_vending_unggoy_specops, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Unggoy SpecOps Basics", 0, list(/obj/item/clothing/under/marine/covenant/unggoy, /obj/item/device/radio/headset/almayer/marine/covenant, /obj/item/clothing/suit/marine/unggoy/cloaking/specops), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/unggoy, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("METHANE TANK (TAKE ONE)", 0, null, null, null),
		list("Pointy Tank", 0, /obj/item/storage/backpack/covenant/unggoy/specops/pointy, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_MANDATORY),
		list("Curlback Tank", 0, /obj/item/storage/backpack/covenant/unggoy/specops/curlback, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Pronged Tank", 5, /obj/item/storage/backpack/covenant/unggoy/specops/doubleprong, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Canister Tank", 5, /obj/item/storage/backpack/covenant/unggoy/specops/canister, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("METHANE MASK (TAKE ONE)", 0, null, null, null),
		list("Standard Mask", 0, /obj/item/clothing/mask/gas/unggoy, MARINE_CAN_BUY_MASK, VENDOR_ITEM_MANDATORY),
		list("Full-Face Mask", 5, /obj/item/clothing/mask/gas/unggoy/specops, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Assault Helmet", 25, /obj/item/clothing/head/helmet/marine/unggoy/specops, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("ARMOR ATTACHMENTS", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/unggoy/specops, null, VENDOR_ITEM_REGULAR),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/unggoy/bicep/specops, null, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/unggoy/specops, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

		list("POUCHES (TAKE TWO)", 0, null, null, null),
		list("Large General Shellcase", 0, /obj/item/storage/pouch/general/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Ammo Shellcases", 0, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tool Shellcases", 0, /obj/item/storage/pouch/tools/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases", 0, /obj/item/storage/pouch/medkit/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases (Full)", 0, /obj/item/storage/pouch/medkit/covenant/large/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases", 0, /obj/item/storage/pouch/medkit/covenant/vials, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases (Full)", 0, /obj/item/storage/pouch/medkit/covenant/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ADDITIONAL ARMOR", 0, null, null, null),
		list("Arm Bracers", 10, /obj/item/clothing/gloves/marine/unggoy/specops, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),
		list("Leg Greaves", 10, /obj/item/clothing/shoes/unggoy/specops, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_REGULAR),

		list("WEAPONS", 0, null, null, null),
		list("Needler", 0, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 0, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Repeater", 20, /obj/item/weapon/gun/energy/plasma/plasma_repeater, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Carbine", 20, list(/obj/item/weapon/gun/smg/covenant_needler, /obj/effect/essentials_set/carbine_ammo), MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
))

/obj/structure/machinery/cm_vending/covenant/unggoy/specops
	name = "\improper unggoy Special Operations equipment locker"
	desc = "A nanolaminate equipment locker intended for Special Operations unggoy warriors."
	vendor_role = list(JOB_COV_LANCE_STANDARD) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now
	color = COLOR_PURPLE

/obj/structure/machinery/cm_vending/covenant/unggoy/specops/get_listed_products(mob/user)
	return GLOB.cm_vending_unggoy_specops

// ==== SPECOPS ULTRA ====

GLOBAL_LIST_INIT(cm_vending_unggoy_specops_ultra, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Unggoy SpecOps Ultra Basics", 0, list(/obj/item/clothing/under/marine/covenant/unggoy, /obj/item/device/radio/headset/almayer/marine/covenant, /obj/item/clothing/suit/marine/unggoy/cloaking/specops_ultra), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/unggoy, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("METHANE TANK (TAKE ONE)", 0, null, null, null),
		list("Pointy Tank", 0, /obj/item/storage/backpack/covenant/unggoy/specops_ultra/pointy, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_MANDATORY),
		list("Curlback Tank", 0, /obj/item/storage/backpack/covenant/unggoy/specops_ultra/curlback, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Pronged Tank", 5, /obj/item/storage/backpack/covenant/unggoy/specops_ultra/doubleprong, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Canister Tank", 5, /obj/item/storage/backpack/covenant/unggoy/specops_ultra/canister, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("METHANE MASK (TAKE ONE)", 0, null, null, null),
		list("Standard Mask", 0, /obj/item/clothing/mask/gas/unggoy, MARINE_CAN_BUY_MASK, VENDOR_ITEM_MANDATORY),
		list("Full-Face Mask", 0, /obj/item/clothing/mask/gas/unggoy/specops, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Assault Helmet", 15, /obj/item/clothing/head/helmet/marine/unggoy/specops_ultra, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("ARMOR ATTACHMENTS", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/unggoy/specops_ultra, null, VENDOR_ITEM_REGULAR),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/unggoy/bicep/specops_ultra, null, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/unggoy/specops_ultra, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

		list("POUCHES (TAKE TWO)", 0, null, null, null),
		list("Large General Shellcase", 0, /obj/item/storage/pouch/general/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Ammo Shellcases", 0, /obj/item/storage/pouch/magazine/covenant, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tool Shellcases", 0, /obj/item/storage/pouch/tools/covenant/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases", 0, /obj/item/storage/pouch/medkit/covenant/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Expanded Medical Shellcases (Full)", 0, /obj/item/storage/pouch/medkit/covenant/large/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases", 0, /obj/item/storage/pouch/medkit/covenant/vials, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Vial Shellcases (Full)", 0, /obj/item/storage/pouch/medkit/covenant/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ADDITIONAL ARMOR", 0, null, null, null),
		list("Arm Bracers", 5, /obj/item/clothing/gloves/marine/unggoy/specops_ultra, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),
		list("Leg Greaves", 5, /obj/item/clothing/shoes/unggoy/specops_ultra, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_REGULAR),

		list("WEAPONS", 0, null, null, null),
		list("Needler", 0, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 0, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Repeater", 10, /obj/item/weapon/gun/energy/plasma/plasma_repeater, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Carbine", 10, list(/obj/item/weapon/gun/smg/covenant_needler, /obj/effect/essentials_set/carbine_ammo), MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Heavy Plasma Repeater", 25, /obj/item/weapon/gun/energy/plasma/heavy_repeater, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
))

/obj/structure/machinery/cm_vending/covenant/unggoy/specops_ultra
	name = "\improper unggoy Special Operations Ultra equipment locker"
	desc = "A nanolaminate equipment locker intended for Special Operations unggoy warriors."
	vendor_role = list(JOB_COV_LANCE_SPECIALIST) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now
	color = COLOR_FLOORTILE_GRAY

/obj/structure/machinery/cm_vending/covenant/unggoy/specops_ultra/get_listed_products(mob/user)
	return GLOB.cm_vending_unggoy_specops_ultra
