/datum/equipment_preset/covenant/ruuhtian
	name = "Kig-Yar Ruuhtian"
	rank = JOB_COV_CIV
	assignment = JOB_COV_CIV
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	paygrades = list(PAY_SHORT_COV_CIV = JOB_PLAYTIME_TIER_0)
	faction = FACTION_COVENANT
	skills = /datum/skills/combat_medic
	languages = list(LANGUAGE_SANGHEILI, LANGUAGE_UNGGOY)

/datum/equipment_preset/covenant/ruuhtian/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_RUUHTIAN)
	random_name = capitalize(pick(GLOB.first_names_jackal))
	var/final_name = random_name
	new_human.change_real_name(new_human, final_name)
	new_human.gender = MALE
	if(new_human.gender == MALE)
		new_human.h_style = pick_weight(list("Mohawk" = 60, "Ruffle" = 20, "Ruffle - Slick" = 20))
	new_human.body_type = "ruuht"
	new_human.skin_color = pick_weight(list("ruuht1" = 60, "ruuht2" = 20, "ruuht3" = 20))
	var/static/list/eye_color_list = list("Yellow" = list(210, 164, 40), "Orange" = list(199, 110, 38), "Purple" = list(155, 100, 194), "Blue" = list(104, 120, 212))
	eye_color = pick(eye_color_list)
	new_human.r_eyes = eye_color_list[eye_color][1]
	new_human.g_eyes = eye_color_list[eye_color][2]
	new_human.b_eyes = eye_color_list[eye_color][3]

/datum/equipment_preset/covenant/ruuhtian/load_id(mob/living/carbon/human/new_human)
	. = ..()

/datum/equipment_preset/covenant/ruuhtian/load_name(mob/living/carbon/human/new_human, randomise, client/mob_client)
	random_name = capitalize(pick(GLOB.first_names_jackal))
	var/final_name = random_name
	new_human.change_real_name(new_human, final_name)
	new_human.gender = MALE
	if(new_human.gender == MALE)
		new_human.h_style = pick_weight(list("Mohawk" = 60, "Ruffle" = 20, "Ruffle - Slick" = 20))
	new_human.body_type = "ruuht"
	new_human.skin_color = pick_weight(list("ruuht1" = 60, "ruuht2" = 20, "ruuht3" = 20))
	var/static/list/eye_color_list = list("Yellow" = list(210, 164, 40), "Orange" = list(199, 110, 38), "Purple" = list(155, 100, 194), "Blue" = list(104, 120, 212))
	eye_color = pick(eye_color_list)
	new_human.r_eyes = eye_color_list[eye_color][1]
	new_human.g_eyes = eye_color_list[eye_color][2]
	new_human.b_eyes = eye_color_list[eye_color][3]

// BASIC ROLES

// =================================
// Minor
// =================================

/datum/equipment_preset/covenant/ruuhtian/minor
	name = parent_type::name + " Minor"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_MINOR
	rank = JOB_COV_MINOR
	paygrades = list(PAY_SHORT_COV_MINOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Minor"
	skills = /datum/skills/combat_medic
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/ruuhtian/minor/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/ruuhtian(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/ruuhtian/headset(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/ruuhtian/minor(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/ruuhtian(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/ruuhtian/minor(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/ruuhtian/minor(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/covenant(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/plasma/plasma_pistol(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/covenant(new_human), WEAR_L_STORE)

/datum/equipment_preset/covenant/ruuhtian/major
	name = parent_type::name + " Major"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_MINOR
	rank = JOB_COV_MINOR
	paygrades = list(PAY_SHORT_COV_MINOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Major"
	skills = /datum/skills/combat_medic
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/ruuhtian/major/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/ruuhtian(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/ruuhtian(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/ruuhtian/major(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/ruuhtian(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/ruuhtian/major(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/ruuhtian/major(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/covenant(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/covenant_needler(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/needler_crystal, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/needler_crystal, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/needler_crystal, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/needler_crystal, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/needler_crystal, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/covenant(new_human), WEAR_L_STORE)

/datum/equipment_preset/covenant/ruuhtian/ultra
	name = parent_type::name + " Ultra"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_MINOR
	rank = JOB_COV_MINOR
	paygrades = list(PAY_SHORT_COV_MINOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Ultra"
	skills = /datum/skills/combat_medic
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/ruuhtian/ultra/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/ruuhtian(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/ruuhtian/major(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/ruuhtian/ultra(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/ruuhtian(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/ruuhtian/ultra(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/ruuhtian/ultra(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/covenant(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/plasma/plasma_rifle(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/covenant(new_human), WEAR_L_STORE)
