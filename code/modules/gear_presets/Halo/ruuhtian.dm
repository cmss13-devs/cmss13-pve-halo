/datum/equipment_preset/covenant/ruuhtian
	name = "Kig-Yar Ruuhtian"
	rank = JOB_COV_CIV
	assignment = JOB_COV_CIV
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	paygrades = list(PAY_SHORT_COV_CIV = JOB_PLAYTIME_TIER_0)
	faction = FACTION_KIGYAR
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
	add_jackal_basics(new_human)
	add_jackal_minor(new_human)

/datum/equipment_preset/covenant/ruuhtian/minor/plasma_pistol
	name = parent_type::name + " (Plasma Pistol)"

/datum/equipment_preset/covenant/ruuhtian/minor/plasma_pistol/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_minor(new_human)
	add_plasma_pistol_package(new_human)

/datum/equipment_preset/covenant/ruuhtian/minor/needler
	name = parent_type::name + " (Needler)"

/datum/equipment_preset/covenant/ruuhtian/minor/needler/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_minor(new_human)
	add_needler_package(new_human)

// =================================
// Major
// =================================

/datum/equipment_preset/covenant/ruuhtian/major
	name = parent_type::name + " Major"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_MAJOR
	rank = JOB_COV_MAJOR
	paygrades = list(PAY_SHORT_COV_MAJOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Major"
	skills = /datum/skills/combat_medic
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/ruuhtian/major/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_major(new_human)

/datum/equipment_preset/covenant/ruuhtian/major/needler
	name = parent_type::name + " (Needler)"

/datum/equipment_preset/covenant/ruuhtian/major/needler/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_major(new_human)
	add_needler_package(new_human)

/datum/equipment_preset/covenant/ruuhtian/major/plasma_rifle
	name = parent_type::name + " (Plasma Rifle)"

/datum/equipment_preset/covenant/ruuhtian/major/plasma_rifle/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_major(new_human)
	add_plasma_rifle_package(new_human)

// =================================
// Ultra
// =================================

/datum/equipment_preset/covenant/ruuhtian/ultra
	name = parent_type::name + " Ultra"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_ULTRA
	rank = JOB_COV_ULTRA
	paygrades = list(PAY_SHORT_COV_ULTRA = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Ultra"
	skills = /datum/skills/combat_medic
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/ruuhtian/ultra/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_ultra(new_human)

/datum/equipment_preset/covenant/ruuhtian/ultra/needler
	name = parent_type::name + " (Needler)"

/datum/equipment_preset/covenant/ruuhtian/ultra/needler/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_ultra(new_human)
	add_needler_package(new_human)

/datum/equipment_preset/covenant/ruuhtian/ultra/plasma_rifle
	name = parent_type::name + " (Plasma Rifle)"

/datum/equipment_preset/covenant/ruuhtian/ultra/plasma_rifle/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_ultra(new_human)
	add_plasma_rifle_package(new_human)

/datum/equipment_preset/covenant/ruuhtian/ultra/carbine
	name = parent_type::name + " (Carbine)"

/datum/equipment_preset/covenant/ruuhtian/ultra/carbine/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_ultra(new_human)
	add_cov_carbine_package(new_human)

// =================================
// Marksman/Sniper
// =================================

/datum/equipment_preset/covenant/ruuhtian/marksman
	name = parent_type::name + " Marksman"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_MARKSMAN
	rank = JOB_COV_MARKSMAN
	paygrades = list(PAY_SHORT_COV_MINOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Marksman"
	skills = /datum/skills/combat_medic
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/ruuhtian/marksman/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_marksman(new_human)

/datum/equipment_preset/covenant/ruuhtian/marksman/carbine
	name = parent_type::name + " (Carbine)"

/datum/equipment_preset/covenant/ruuhtian/marksman/carbine/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_marksman(new_human)
	add_cov_carbine_package(new_human)

/datum/equipment_preset/covenant/ruuhtian/sniper
	name = parent_type::name + " Sniper"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_SNIPER
	rank = JOB_COV_SNIPER
	paygrades = list(PAY_SHORT_COV_MAJOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Sniper"
	skills = /datum/skills/combat_medic
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/ruuhtian/sniper/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_sniper(new_human)

/datum/equipment_preset/covenant/ruuhtian/sniper/carbine
	name = parent_type::name + " (Carbine)"

/datum/equipment_preset/covenant/ruuhtian/sniper/carbine/load_gear(mob/living/carbon/human/new_human)
	add_jackal_basics(new_human)
	add_jackal_marksman(new_human)
	add_cov_carbine_package(new_human)

// =================================
// Procs
// =================================

/datum/equipment_preset/proc/add_jackal_basics(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/ruuhtian(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/covenant(new_human), WEAR_L_EAR)

/datum/equipment_preset/proc/add_jackal_minor(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/ruuhtian/minor(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/ruuhtian(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/ruuhtian/minor(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/ruuhtian/minor(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/covenant(new_human), WEAR_L_STORE)
	if(prob(75))
		var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/ruuhtian = 30, /obj/item/clothing/head/helmet/marine/ruuhtian/better = 10, /obj/item/clothing/head/helmet/marine/ruuhtian/headset = 60))
		new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)

/datum/equipment_preset/proc/add_jackal_major(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/ruuhtian/major(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/ruuhtian(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/ruuhtian/major(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/ruuhtian/major(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/covenant(new_human), WEAR_L_STORE)
	if(prob(90))
		var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/ruuhtian = 60, /obj/item/clothing/head/helmet/marine/ruuhtian/better = 20, /obj/item/clothing/head/helmet/marine/ruuhtian/headset = 20))
		new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)

/datum/equipment_preset/proc/add_jackal_ultra(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/ruuhtian/ultra(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/ruuhtian(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/ruuhtian/ultra(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/ruuhtian/ultra(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/covenant(new_human), WEAR_L_STORE)
	var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/ruuhtian = 20, /obj/item/clothing/head/helmet/marine/ruuhtian/better = 80, /obj/item/clothing/head/helmet/marine/ruuhtian/headset = 0))
	new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)

/datum/equipment_preset/proc/add_jackal_marksman(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/ruuhtian/minor(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/ruuhtian(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/ruuhtian/minor(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/ruuhtian/minor(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/covenant(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/ruuhtian/marksman(new_human), WEAR_HEAD)

/datum/equipment_preset/proc/add_jackal_sniper(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/ruuhtian/major(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/ruuhtian(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/ruuhtian/major(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/ruuhtian/major(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/covenant(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/ruuhtian/sniper(new_human), WEAR_HEAD)
