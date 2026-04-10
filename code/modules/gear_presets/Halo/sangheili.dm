/datum/equipment_preset/covenant
	name = "COVENANT"
	faction = FACTION_COVENANT
	languages = list(LANGUAGE_SANGHEILI)
	idtype = /obj/item/card/id/covenant
	var/random_name
	var/eye_color

/datum/equipment_preset/covenant/sangheili
	name = "Sangheili"
	rank = JOB_COV_CIV
	assignment = JOB_COV_CIV
	faction = FACTION_SANGHEILI
	faction_group = FACTION_LIST_COVENANT
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	paygrades = list(PAY_SHORT_COV_CIV = JOB_PLAYTIME_TIER_0)
	faction = FACTION_COVENANT
	skills = /datum/skills/covenant/sangheili

/datum/equipment_preset/covenant/sangheili/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_SANGHEILI)
	random_name = capitalize(pick(GLOB.first_names_sangheili)) + " " + capitalize(pick(GLOB.last_names_sangheili))
	var/final_name = random_name
	new_human.change_real_name(new_human, final_name)
	new_human.gender = MALE
	new_human.body_type = "sang"
	new_human.skin_color = pick("sang1", "sang2")
	var/static/list/eye_color_list = list("Magenta" = list(141, 39, 85), "Orange" = list(158, 67, 28), "Green" = list(24, 105, 17))
	eye_color = pick(eye_color_list)
	new_human.r_eyes = eye_color_list[eye_color][1]
	new_human.g_eyes = eye_color_list[eye_color][2]
	new_human.b_eyes = eye_color_list[eye_color][3]

/datum/equipment_preset/covenant/sangheili/load_id(mob/living/carbon/human/new_human)
	. = ..()

/datum/equipment_preset/covenant/sangheili/load_name(mob/living/carbon/human/new_human, randomise, client/mob_client)
	random_name = capitalize(pick(GLOB.first_names_sangheili)) + " " + capitalize(pick(GLOB.last_names_sangheili))
	var/final_name = random_name
	new_human.change_real_name(new_human, final_name)
	new_human.gender = MALE
	new_human.body_type = "sang"
	new_human.skin_color = pick("sang1", "sang2")
	var/static/list/eye_color_list = list("Magenta" = list(141, 39, 85), "Orange" = list(158, 67, 28), "Green" = list(24, 105, 17))
	eye_color = pick(eye_color_list)
	new_human.r_eyes = eye_color_list[eye_color][1]
	new_human.g_eyes = eye_color_list[eye_color][2]
	new_human.b_eyes = eye_color_list[eye_color][3]

// =================================
// Minor
// =================================

/datum/equipment_preset/covenant/sangheili/minor
	name = parent_type::name + " Minor (Plasma Rifle)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_MINOR
	rank = JOB_COV_MINOR
	paygrades = list(PAY_SHORT_SANG_MINOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Minor"
	skills = /datum/skills/covenant/sangheili
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/sangheili/minor/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_minor(new_human)
	add_plasma_rifle_package(new_human)

/datum/equipment_preset/covenant/sangheili/minor/needler
	name = parent_type::name + " Minor (Needler)"

/datum/equipment_preset/covenant/sangheili/minor/needler/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_minor(new_human)
	add_needler_package(new_human)

/datum/equipment_preset/covenant/sangheili/minor/carbine
	name = "Sangheili Minor (Carbine)"

/datum/equipment_preset/covenant/sangheili/minor/carbine/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_minor(new_human)
	add_cov_carbine_package(new_human)

// =================================
// Major
// =================================

/datum/equipment_preset/covenant/sangheili/major
	name = parent_type::name + " Major (Plasma Rifle)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_MAJOR
	rank = JOB_COV_MAJOR
	paygrades = list(PAY_SHORT_SANG_MAJOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Major"
	skills = /datum/skills/covenant/sangheili
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/sangheili/major/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_major(new_human)
	add_plasma_rifle_package(new_human)

/datum/equipment_preset/covenant/sangheili/major/needler
	name = parent_type::name + " Major (Needler)"

/datum/equipment_preset/covenant/sangheili/major/needler/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_major(new_human)
	add_needler_package(new_human)

/datum/equipment_preset/covenant/sangheili/major/carbine
	name = parent_type::name + " Major (Carbine)"

/datum/equipment_preset/covenant/sangheili/major/carbine/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_major(new_human)
	add_cov_carbine_package(new_human)

// =================================
// Ultra
// =================================

/datum/equipment_preset/covenant/sangheili/ultra
	name = parent_type::name + " Ultra (Plasma Rifle)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_ULTRA
	rank = JOB_COV_ULTRA
	paygrades = list(PAY_SHORT_SANG_ULTRA = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Ultra"
	skills = /datum/skills/covenant/sangheili
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/sangheili/ultra/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_ultra(new_human)
	add_plasma_rifle_package(new_human)

/datum/equipment_preset/covenant/sangheili/ultra/carbine
	name = parent_type::name + " Ultra (Carbine)"

/datum/equipment_preset/covenant/sangheili/ultra/carbine/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_ultra(new_human)
	add_cov_carbine_package(new_human)

// =================================
// Zealot
// =================================

/datum/equipment_preset/covenant/sangheili/zealot
	name = parent_type::name + " Zealot (Plasma Rifle)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_ZEALOT
	rank = JOB_COV_ZEALOT
	paygrades = list(PAY_SHORT_SANG_ZEALOT = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Zealot"
	skills = /datum/skills/covenant/sangheili
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/sangheili/zealot/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_zealot(new_human)
	add_plasma_rifle_package(new_human)

/datum/equipment_preset/covenant/sangheili/zealot/carbine
	name = parent_type::name + " Zealot (Carbine)"

/datum/equipment_preset/covenant/sangheili/zealot/carbine/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_zealot(new_human)
	add_cov_carbine_package(new_human)

// The Stealth Elites

/datum/equipment_preset/covenant/sangheili/stealth
	name = parent_type::name + " Stealth (Plasma Rifle)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_STEALTH
	rank = JOB_COV_STEALTH
	paygrades = list(PAY_SHORT_SANG_MINOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Stealth"
	skills = /datum/skills/covenant/sangheili
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/sangheili/stealth/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_stealth(new_human)
	add_plasma_rifle_package(new_human)

/datum/equipment_preset/covenant/sangheili/zealot/stealth
	name = parent_type::name + " Stealth Zealot (Plasma Rifle)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_ZEALOT
	rank = JOB_COV_ZEALOT
	paygrades = list(PAY_SHORT_SANG_ZEALOT = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Zealot"
	skills = /datum/skills/covenant/sangheili
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/sangheili/zealot/stealth/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_stealth_zealot(new_human)
	add_plasma_rifle_package(new_human)

//Procs

/datum/equipment_preset/proc/add_elite_basics(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/sangheili(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/covenant(new_human), WEAR_L_EAR)

/datum/equipment_preset/proc/add_elite_minor(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/sangheili/minor(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/minor(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/minor(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/minor(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/minor(new_human), WEAR_WAIST)

/datum/equipment_preset/proc/add_elite_major(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/sangheili/major(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/major(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/major(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/major(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/major(new_human), WEAR_WAIST)

/datum/equipment_preset/proc/add_elite_ultra(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/sangheili/ultra(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/ultra(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/ultra(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/ultra(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/ultra(new_human), WEAR_WAIST)

/datum/equipment_preset/proc/add_elite_zealot(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/sangheili/zealot(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/zealot(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/zealot(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/zealot(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/zealot(new_human), WEAR_WAIST)

/datum/equipment_preset/proc/add_elite_stealth(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/sangheili/minor(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/stealth/minor(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/minor(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/minor(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/minor(new_human), WEAR_WAIST)

/datum/equipment_preset/proc/add_elite_stealth_zealot(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/sangheili/zealot(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/stealth/zealot(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/zealot(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/zealot(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/zealot(new_human), WEAR_WAIST)
