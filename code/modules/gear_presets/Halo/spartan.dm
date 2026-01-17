/datum/equipment_preset/unsc/spartan
	name = "Spartan"
	assignment = JOB_SQUAD_SPECIALIST
	rank = JOB_SQUAD_SPECIALIST
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	paygrades = list(PAY_SHORT_NE6 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/covenant/spartan

/datum/equipment_preset/unsc/spartan/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_SPARTAN)
	var/static/list/colors = list("BLACK" = list(15, 15, 10), "BROWN" = list(48, 38, 18), "BROWN" = list(48, 38, 18),"BLUE" = list(29, 51, 65), "GREEN" = list(40, 61, 39), "STEEL" = list(46, 59, 54))
	var/random_name = "[capitalize(pick(GLOB.first_names_spartan))]-[rand(100,1000)]"
	var/final_name = random_name
	new_human.change_real_name(new_human, final_name)
	new_human.gender = MALE
	new_human.body_type = "spartan"
	new_human.skin_color = "pale1"
	var/eye_color = pick(colors)
	new_human.r_eyes = colors[eye_color][1]
	new_human.g_eyes = colors[eye_color][2]
	new_human.b_eyes = colors[eye_color][3]
	new_human.age = rand(17,35)

/datum/equipment_preset/unsc/spartan/load_name(mob/living/carbon/human/new_human, randomise, client/mob_client)
	new_human.set_species(SPECIES_SPARTAN)
	var/static/list/colors = list("BLACK" = list(15, 15, 10), "BROWN" = list(48, 38, 18), "BROWN" = list(48, 38, 18),"BLUE" = list(29, 51, 65), "GREEN" = list(40, 61, 39), "STEEL" = list(46, 59, 54))
	var/random_name = "[capitalize(pick(GLOB.first_names_spartan))]-[rand(100,1000)]"
	var/final_name = random_name
	new_human.change_real_name(new_human, final_name)
	new_human.gender = MALE
	new_human.body_type = "spartan"
	new_human.skin_color = "pale1"
	var/eye_color = pick(colors)
	new_human.r_eyes = colors[eye_color][1]
	new_human.g_eyes = colors[eye_color][2]
	new_human.b_eyes = colors[eye_color][3]
	new_human.age = rand(17,35)
