/datum/equipment_preset/covenant/ruuhtian
	name = "Kig-Yar Ruuhtian"
	rank = JOB_COV_CIV
	assignment = JOB_COV_CIV
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	paygrades = list(PAY_SHORT_COV_CIV = JOB_PLAYTIME_TIER_0)
	faction = FACTION_COVENANT
	skills = /datum/skills/covenant/ruuhtian
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
