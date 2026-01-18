/datum/equipment_preset/unsc/spartan
	name = "Spartan"
	assignment = JOB_SQUAD_SPECIALIST
	rank = JOB_SQUAD_SPECIALIST
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	paygrades = list(PAY_SHORT_NE6 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/covenant/spartan
	role_comm_title = "Spartan"
	languages = list(LANGUAGE_ENGLISH)
	var/access_list = ACCESS_LIST_MARINE_MAIN

/datum/equipment_preset/unsc/spartan/New()
	. = ..()
	access = get_access(access_list)

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

// =================================
// Standard Loadout
// =================================

/datum/equipment_preset/unsc/spartan/equipped
	name = "Spartan Equipped"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/unsc/spartan/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/spartan(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/unsc/mjolnir(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc/mjolnir(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/spartan(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/spartan(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/foxtrot(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/halo/ma5c(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma5c(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma5c(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma5c(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma5c(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma5c(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/unsc/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/unsc(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/unsc/corpsman(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/unsc/corpsman(new_human), WEAR_IN_BACK)
