/datum/equipment_preset/covenant/unggoy
	name = "Unggoy"
	rank = JOB_COV_CIV
	assignment = JOB_COV_MINOR
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_COV_CIV = JOB_PLAYTIME_TIER_0)
	faction = FACTION_COVENANT
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/unggoy/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_UNGGOY)
	random_name = capitalize(pick(GLOB.first_names_unggoy)) + pick(GLOB.last_names_unggoy)
	var/final_name = random_name
	new_human.change_real_name(new_human, final_name)
	new_human.gender = MALE
	new_human.body_type = "ung"
	new_human.skin_color = "unggoy1"
	var/static/list/eye_color_list = list("Magenta" = list(141, 39, 85), "Orange" = list(158, 67, 28), "Green" = list(24, 105, 17))
	eye_color = pick(eye_color_list)
	new_human.r_eyes = eye_color_list[eye_color][1]
	new_human.g_eyes = eye_color_list[eye_color][2]
	new_human.b_eyes = eye_color_list[eye_color][3]

/datum/equipment_preset/covenant/unggoy/load_id(mob/living/carbon/human/new_human)
	. = ..()

/datum/equipment_preset/covenant/unggoy/load_name(mob/living/carbon/human/new_human, randomise, client/mob_client)
	random_name = capitalize(pick(GLOB.first_names_unggoy)) + pick(GLOB.last_names_unggoy)
	var/final_name = random_name
	new_human.change_real_name(new_human, final_name)
	new_human.gender = MALE
	new_human.body_type = "ung"
	new_human.skin_color = "unggoy1"
	var/static/list/eye_color_list = list("Magenta" = list(141, 39, 85), "Orange" = list(158, 67, 28), "Green" = list(24, 105, 17))
	eye_color = pick(eye_color_list)
	new_human.r_eyes = eye_color_list[eye_color][1]
	new_human.g_eyes = eye_color_list[eye_color][2]
	new_human.b_eyes = eye_color_list[eye_color][3]

// BASIC ROLES

// MINOR
/datum/equipment_preset/covenant/unggoy/minor
	name = parent_type::name + " Minor"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_MINOR
	rank = JOB_COV_MINOR
	paygrades = list(PAY_SHORT_COV_MINOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Minor"
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/unggoy/minor/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/covenant/unggoy/minor/equipped/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/unggoy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unggoy/minor(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/unggoy(new_human), WEAR_FACE)

// MAJOR
/datum/equipment_preset/covenant/unggoy/major
	name = parent_type::name + " Major"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_MAJOR
	rank = JOB_COV_MAJOR
	paygrades = list(PAY_SHORT_COV_MAJOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Major"
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/unggoy/major/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/covenant/unggoy/major/equipped/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/unggoy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unggoy/major(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/unggoy(new_human), WEAR_FACE)

// HEAVY
/datum/equipment_preset/covenant/unggoy/heavy
	name = parent_type::name + " Heavy"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_HEAVY
	rank = JOB_COV_HEAVY
	paygrades = list(PAY_SHORT_COV_HEAVY = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Heavy"
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/unggoy/heavy/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/covenant/unggoy/heavy/equipped/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/unggoy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unggoy/heavy(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/unggoy(new_human), WEAR_FACE)

// Ultra
/datum/equipment_preset/covenant/unggoy/ultra
	name = parent_type::name + " Ultra"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_ULTRA
	rank = JOB_COV_ULTRA
	paygrades = list(PAY_SHORT_COV_ULTRA = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Ultra"
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/unggoy/ultra/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/covenant/unggoy/ultra/equipped/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/unggoy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unggoy/ultra(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/unggoy(new_human), WEAR_FACE)

// SpecOps
/datum/equipment_preset/covenant/unggoy/specops
	name = parent_type::name + " SpecOps"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_SPECOPS
	rank = JOB_COV_SPECOPS
	paygrades = list(PAY_SHORT_COV_MAJOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SpecOps"
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/unggoy/specops/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/covenant/unggoy/specops/equipped/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/unggoy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/stealth/unggoy_specops(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/unggoy(new_human), WEAR_FACE)

/datum/equipment_preset/covenant/unggoy/specops/lesser
	name = parent_type::name + " (Lesser Rank)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_SPECOPS
	rank = JOB_COV_SPECOPS
	paygrades = list(PAY_SHORT_COV_MINOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SpecOps"
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/unggoy/specops/lesser/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/covenant/unggoy/specops/lesser/equipped/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/unggoy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/stealth/unggoy_specops(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/unggoy(new_human), WEAR_FACE)

// SpecOps Ultra
/datum/equipment_preset/covenant/unggoy/specops_ultra
	name = parent_type::name + " SpecOps Ultra"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_SPECOPS_ULTRA
	rank = JOB_COV_SPECOPS_ULTRA
	paygrades = list(PAY_SHORT_COV_ULTRA = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SpecOps Ultra"
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/unggoy/specops_ultra/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/covenant/unggoy/specops_ultra/equipped/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/unggoy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/stealth/unggoy_specops/ultra(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/unggoy(new_human), WEAR_FACE)

// Deacon
/datum/equipment_preset/covenant/unggoy/deacon
	name = parent_type::name + " Deacon"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_DEACON
	rank = JOB_COV_DEACON
	paygrades = list(PAY_SHORT_COV_DEACON = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Deacon"
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/unggoy/deacon/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/covenant/unggoy/deacon/equipped/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/unggoy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unggoy/deacon(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/unggoy(new_human), WEAR_FACE)
