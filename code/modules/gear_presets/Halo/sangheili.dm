/datum/equipment_preset/covenant
	name = "COVENANT"
	faction = FACTION_COVENANT
	languages = list(LANGUAGE_SANGHEILI)
	var/random_name
	var/eye_color

/datum/equipment_preset/covenant/sangheili
	name = "Sangheili"
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/covenant/sangheili/load_race(mob/living/carbon/human/new_human, client/mob_client)
	random_name = capitalize(pick(GLOB.first_names_sangheili)) + " " + capitalize(pick(GLOB.last_names_sangheili))
	var/final_name = random_name
	new_human.change_real_name(new_human, final_name)
	new_human.set_species(SPECIES_SANGHEILI)
	new_human.gender = MALE
	var/static/list/eye_color_list = list("Magenta" = list(141, 39, 85), "Orange" = list(158, 67, 28), "Green" = list(24, 105, 17))
	eye_color = pick(eye_color_list)
	new_human.r_eyes = eye_color_list[eye_color][1]
	new_human.g_eyes = eye_color_list[eye_color][2]
	new_human.b_eyes = eye_color_list[eye_color][3]
