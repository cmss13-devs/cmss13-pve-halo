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

/datum/equipment_preset/covenant/unggoy/minor
	name = parent_type::name + " Minor"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_MENIAL
	rank = JOB_COV_MENIAL
	paygrades = list(PAY_SHORT_COV_MINOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Menial"
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/unggoy/minor/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/covenant/unggoy/minor/equipped/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/unggoy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unggoy(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/unggoy(new_human), WEAR_FACE)
