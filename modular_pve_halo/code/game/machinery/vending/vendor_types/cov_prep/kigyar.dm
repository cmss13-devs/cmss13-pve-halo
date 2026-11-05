/obj/structure/machinery/cm_vending/covenant/kigyar
	required_species = list(SPECIES_LIST_RUUHTIAN)

// ==== KIGYAR WARRIOR ====

/obj/structure/machinery/cm_vending/covenant/kigyar/warrior
	name = "\improper kig-yar warrior equipment locker"
	desc = "A nanolaminate equipment locker intended for low-rate kig-yar warriors."
	vendor_role = list(JOB_COV_LANCE_STANDARD) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now

/obj/structure/machinery/cm_vending/covenant/kigyar/warrior/get_listed_products(mob/user)
	return GLOB.cm_vending_kigyar_minor

GLOBAL_LIST_INIT(cm_vending_kigyar_minor, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/marine/covenant, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeveless)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeves)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/partial, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Undersuit (Full-Coverage)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/fullbody, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/kigyar, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Combat Harness", 0, /obj/item/clothing/suit/marine/ruuhtian/minor, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("Gauntlets", 0 , /obj/item/clothing/gloves/marine/ruuhtian/minor, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Foot Guards", 0 , /obj/item/clothing/shoes/ruuhtian/minor, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR ACCESSORIES", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/ruuhtian/minor, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Large)", 0, /obj/item/clothing/accessory/pads/ruuhtian/minor/variant_2, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/ruuhtian/bicep/minor, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (BUY ONE)", 0, null, null, null),
		list("Helmet", 10, /obj/item/clothing/head/helmet/marine/ruuhtian, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Superior)", 15, /obj/item/clothing/head/helmet/marine/ruuhtian/better, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Eye-Piece Headset", 10, /obj/item/clothing/head/helmet/marine/ruuhtian/headset, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/ruuhtian/minor, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

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

		list("WEAPONS", 0, null, null, null),
		list("Plasma Pistol", 0, /obj/item/weapon/gun/energy/plasma/plasma_pistol, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Needler", 15, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 30, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("(Kig-Yar) Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger/kigyar, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),

))

// ==== KIGYAR OBEDIENTARY ====

/obj/structure/machinery/cm_vending/covenant/kigyar/obedientary
	name = "\improper kig-yar obedientary equipment locker"
	desc = "A nanolaminate equipment locker intended for low-rate kig-yar warriors."
	vendor_role = list(JOB_COV_LANCE_OBEDIENTARY) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now

/obj/structure/machinery/cm_vending/covenant/kigyar/obedientary/get_listed_products(mob/user)
	return GLOB.cm_vending_kigyar_major

GLOBAL_LIST_INIT(cm_vending_kigyar_major, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/marine/covenant, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeveless)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeves)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/partial, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Undersuit (Full-Coverage)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/fullbody, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/kigyar, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Combat Harness", 0, /obj/item/clothing/suit/marine/ruuhtian/major, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("Gauntlets", 0 , /obj/item/clothing/gloves/marine/ruuhtian/major, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Foot Guards", 0 , /obj/item/clothing/shoes/ruuhtian/major, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR ACCESSORIES", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/ruuhtian/major, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Large)", 0, /obj/item/clothing/accessory/pads/ruuhtian/major/variant_2, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/ruuhtian/bicep/major, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (BUY ONE)", 0, null, null, null),
		list("Helmet", 10, /obj/item/clothing/head/helmet/marine/ruuhtian, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Superior)", 15, /obj/item/clothing/head/helmet/marine/ruuhtian/better, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Eye-Piece Headset", 10, /obj/item/clothing/head/helmet/marine/ruuhtian/headset, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/ruuhtian/major, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

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

		list("WEAPONS", 0, null, null, null),
		list("Plasma Pistol", 0, /obj/item/weapon/gun/energy/plasma/plasma_pistol, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Needler", 10, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 20, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("(Kig-Yar) Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger/kigyar, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),

))

// ==== KIGYAR SPECIALIST ====

/obj/structure/machinery/cm_vending/covenant/kigyar/specialist
	name = "\improper kig-yar specialist equipment locker"
	desc = "A nanolaminate equipment locker intended for kig-yar specialists."
	vendor_role = list(JOB_COV_LANCE_SPECIALIST) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now

/obj/structure/machinery/cm_vending/covenant/kigyar/specialist/get_listed_products(mob/user)
	return GLOB.cm_vending_kigyar_specialist

GLOBAL_LIST_INIT(cm_vending_kigyar_specialist, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/marine/covenant, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeveless)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeves)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/partial, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Undersuit (Full-Coverage)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/fullbody, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/kigyar, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("SPECIALIST WEAPON (TAKE ONE)", 0, null, null, null),
		list("Needle Rifle", 0, list(/obj/item/weapon/gun/rifle/needle_rifle, /obj/effect/essentials_set/needle_rifle_ammo), MARINE_CAN_BUY_KIT, VENDOR_ITEM_MANDATORY),
		list("Carbine", 0, /obj/item/weapon/gun/rifle/covenant_carbine/unloaded, MARINE_CAN_BUY_KIT, VENDOR_ITEM_MANDATORY),

		list("ARMOR EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Combat Harness", 0, /obj/item/clothing/suit/marine/ruuhtian/minor, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("Gauntlets", 0 , /obj/item/clothing/gloves/marine/ruuhtian/minor, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Foot Guards", 0 , /obj/item/clothing/shoes/ruuhtian/minor, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR ACCESSORIES", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/ruuhtian/minor, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Large)", 0, /obj/item/clothing/accessory/pads/ruuhtian/minor/variant_2, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/ruuhtian/bicep/minor, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (BUY ONE)", 0, null, null, null),
		list("Helmet", 10, /obj/item/clothing/head/helmet/marine/ruuhtian, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Superior)", 15, /obj/item/clothing/head/helmet/marine/ruuhtian/better, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Assault Helmet", 25, /obj/item/clothing/head/helmet/marine/ruuhtian/assault/minor, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Eye-Piece Headset", 10, /obj/item/clothing/head/helmet/marine/ruuhtian/headset, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/ruuhtian/minor, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

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

		list("WEAPONS", 0, null, null, null),
		list("Plasma Pistol", 0, /obj/item/weapon/gun/energy/plasma/plasma_pistol, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Needler", 10, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 20, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("(Kig-Yar) Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger/kigyar, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),

))

// ==== KIGYAR EVOCATI ====

/obj/structure/machinery/cm_vending/covenant/kigyar/evocati
	name = "\improper kig-yar evocati equipment locker"
	desc = "A nanolaminate equipment locker intended for kig-yar within the Evocati order."
	vendor_role = list(JOB_COV_LANCE_ULTRA) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now

/obj/structure/machinery/cm_vending/covenant/kigyar/evocati/get_listed_products(mob/user)
	return GLOB.cm_vending_kigyar_evocati

GLOBAL_LIST_INIT(cm_vending_kigyar_evocati, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/marine/covenant, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeveless)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeves)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/partial, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Undersuit (Full-Coverage)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/fullbody, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/kigyar, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Combat Harness", 0, /obj/item/clothing/suit/marine/ruuhtian/ultra, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("Gauntlets", 0 , /obj/item/clothing/gloves/marine/ruuhtian/ultra, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Foot Guards", 0 , /obj/item/clothing/shoes/ruuhtian/ultra, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR ACCESSORIES", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/ruuhtian/ultra, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Large)", 0, /obj/item/clothing/accessory/pads/ruuhtian/ultra/variant_2, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/ruuhtian/bicep/ultra, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (BUY ONE)", 0, null, null, null),
		list("Helmet", 0, /obj/item/clothing/head/helmet/marine/ruuhtian, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Superior)", 5, /obj/item/clothing/head/helmet/marine/ruuhtian/better, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Assault Helmet", 10, /obj/item/clothing/head/helmet/marine/ruuhtian/assault/ultra, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Eye-Piece Headset", 0, /obj/item/clothing/head/helmet/marine/ruuhtian/headset, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/ruuhtian/ultra, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

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

		list("WEAPONS", 0, null, null, null),
		list("Plasma Pistol", 0, /obj/item/weapon/gun/energy/plasma/plasma_pistol, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Needler", 5, /obj/item/weapon/gun/smg/covenant_needler/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Plasma Rifle", 10, /obj/item/weapon/gun/energy/plasma/plasma_rifle, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("(Kig-Yar) Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger/kigyar, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),

))

// ==========================
// ==== SPECOPS KIGYAR ====
// ==========================

// ==== KIGYAR SPECOPS ====

/obj/structure/machinery/cm_vending/covenant/kigyar/specops
	name = "\improper kig-yar Special Operations equipment locker"
	desc = "A nanolaminate equipment locker intended for kig-yar within the Special Warfarge Group, Special Operations."
	vendor_role = list(JOB_COV_LANCE_STANDARD) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now
	color = COLOR_PURPLE

/obj/structure/machinery/cm_vending/covenant/kigyar/specops/get_listed_products(mob/user)
	return GLOB.cm_vending_kigyar_specops

GLOBAL_LIST_INIT(cm_vending_kigyar_specops, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/marine/covenant, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeveless)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeves)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/partial, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Undersuit (Full-Coverage)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/fullbody, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/kigyar, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Combat Harness", 0, /obj/item/clothing/suit/marine/ruuhtian/cloaking/specops, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("Gauntlets", 0 , /obj/item/clothing/gloves/marine/ruuhtian/specops, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Foot Guards", 0 , /obj/item/clothing/shoes/ruuhtian/specops, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR ACCESSORIES", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/ruuhtian/specops, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Large)", 0, /obj/item/clothing/accessory/pads/ruuhtian/specops/variant_2, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/ruuhtian/bicep/specops, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (BUY ONE)", 0, null, null, null),
		list("Helmet", 0, /obj/item/clothing/head/helmet/marine/ruuhtian, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Superior)", 5, /obj/item/clothing/head/helmet/marine/ruuhtian/better, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Assault Helmet", 25, /obj/item/clothing/head/helmet/marine/ruuhtian/assault/specops, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Eye-Piece Headset", 0, /obj/item/clothing/head/helmet/marine/ruuhtian/headset, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/ruuhtian/specops, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

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
		list("Plasma Repeater", 20, /obj/item/weapon/gun/energy/plasma/plasma_repeater, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),
		list("Carbine", 20, /obj/item/weapon/gun/rifle/covenant_carbine/unloaded, MARINE_CAN_BUY_SECONDARY, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("(Kig-Yar) Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger/kigyar, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),

))

// ==== KIGYAR SPECOPS ULTRA ====

/obj/structure/machinery/cm_vending/covenant/kigyar/specops_ultra
	name = "\improper kig-yar Special Operations Ultra equipment locker"
	desc = "A nanolaminate equipment locker intended for kig-yar within Evocati Order and the Special Warfarge Group, Special Operations."
	vendor_role = list(JOB_COV_LANCE_SPECIALIST) // placeholder for now. this can be changed in game during testing or whatever, but the role defines dont exist right now
	color = COLOR_FLOORTILE_GRAY

/obj/structure/machinery/cm_vending/covenant/kigyar/specops_ultra/get_listed_products(mob/user)
	return GLOB.cm_vending_kigyar_specops_ultra

GLOBAL_LIST_INIT(cm_vending_kigyar_specops_ultra, list(
		list("ESSENTIAL EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/marine/covenant, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeveless)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Undersuit (Sleeves)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/partial, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Undersuit (Full-Coverage)", 0, /obj/item/clothing/under/marine/covenant/ruuhtian/fullbody, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Liquid Sustainment Unit (FIELD RATION)", 0, /obj/item/reagent_container/food/snacks/covenant/ration/kigyar, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Combat Harness", 0, /obj/item/clothing/suit/marine/ruuhtian/cloaking/specops_ultra, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("Gauntlets", 0 , /obj/item/clothing/gloves/marine/ruuhtian/specops/specops_ultra, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Foot Guards", 0 , /obj/item/clothing/shoes/ruuhtian/specops/specops_ultra, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("ARMOR ACCESSORIES", 0, null, null, null),
		list("Shoulder Pads", 0, /obj/item/clothing/accessory/pads/ruuhtian/specops_ultra, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Pads (Large)", 0, /obj/item/clothing/accessory/pads/ruuhtian/specops_ultra/variant_2, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Bicep Armor", 0, /obj/item/clothing/accessory/pads/ruuhtian/bicep/specops_ultra, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (BUY ONE)", 0, null, null, null),
		list("Helmet", 0, /obj/item/clothing/head/helmet/marine/ruuhtian, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Helmet (Superior)", 5, /obj/item/clothing/head/helmet/marine/ruuhtian/better, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Assault Helmet", 15, /obj/item/clothing/head/helmet/marine/ruuhtian/assault/specops_ultra, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Eye-Piece Headset", 0, /obj/item/clothing/head/helmet/marine/ruuhtian/headset, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("BELT (TAKE ONE)", 0, null, null, null),
		list("Standard Belt", 0, /obj/item/storage/belt/marine/covenant/ruuhtian/specops_ultra, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

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
		list("Plasma Repeater", 10, /obj/item/weapon/gun/energy/plasma/plasma_repeater, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("Carbine", 10, /obj/item/weapon/gun/rifle/covenant_carbine/unloaded, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("Needle Rifle", 25, list(/obj/item/weapon/gun/rifle/needle_rifle, /obj/effect/essentials_set/needle_rifle_ammo), MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Plasma Grenade", 5, /obj/item/explosive/grenade/high_explosive/plasma, null, VENDOR_ITEM_REGULAR),
		list("Prybar", 0, /obj/item/tool/crowbar/tactical, null, VENDOR_ITEM_REGULAR),
		list("(Kig-Yar) Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger/kigyar, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),
		list("Pain-glass Blade", 0, /obj/item/weapon/covenant/blamite_dagger, MARINE_CAN_BUY_COMBAT_SHOES, VENDOR_ITEM_REGULAR),

))
