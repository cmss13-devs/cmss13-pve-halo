/datum/equipment_preset/insurgent
	name = FACTION_INSURGENT
	languages = list(LANGUAGE_ENGLISH)
	assignment = JOB_INSURGENT
	rank = FACTION_INSURGENT
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	faction = FACTION_INSURGENT
	origin_override = ORIGIN_CIVILIAN
	idtype = /obj/item/card/id/data

/datum/equipment_preset/insurgent/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/insurgent/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(60;MALE,40;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	random_name = capitalize(pick(new_human.gender == MALE ? GLOB.first_names_male : GLOB.first_names_female)) + " " + capitalize(pick(GLOB.last_names))
	new_human.change_real_name(new_human, random_name)
	new_human.name = new_human.real_name
	new_human.age = rand(22,45)

	var/static/list/colors = list("BLACK" = list(15, 15, 25), "BROWN" = list(102, 51, 0), "AUBURN" = list(139, 62, 19))
	var/static/list/hair_colors = colors.Copy() + list("BLONDE" = list(197, 164, 30), "CARROT" = list(174, 69, 42))
	var/hair_color = pick(hair_colors)
	new_human.r_hair = hair_colors[hair_color][1]
	new_human.g_hair = hair_colors[hair_color][2]
	new_human.b_hair = hair_colors[hair_color][3]
	new_human.r_facial = hair_colors[hair_color][1]
	new_human.g_facial = hair_colors[hair_color][2]
	new_human.b_facial = hair_colors[hair_color][3]
	var/eye_color = pick(colors)
	new_human.r_eyes = colors[eye_color][1]
	new_human.g_eyes = colors[eye_color][2]
	new_human.b_eyes = colors[eye_color][3]
	idtype = /obj/item/card/id/data
	if(new_human.gender == MALE)
		new_human.h_style = pick("Crewcut", "Shaved Head", "Buzzcut", "Undercut", "Side Undercut", "Pvt. Joker", "Marine Fade", "Low Fade", "Medium Fade", "High Fade", "No Fade", "Coffee House Cut", "Flat Top",)
		new_human.f_style = pick("5 O'clock Shadow", "Shaved", "Full Beard", "3 O'clock Moustache", "5 O'clock Shadow", "5 O'clock Moustache", "7 O'clock Shadow", "7 O'clock Moustache",)
	else
		new_human.h_style = pick("Ponytail 1", "Ponytail 2", "Ponytail 3", "Ponytail 4", "Pvt. Redding", "Pvt. Clarison", "Cpl. Dietrich", "Pvt. Vasquez", "Marine Bun", "Marine Bun 2", "Marine Flat Top",)
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,45)
	new_human.r_hair = rand(15,35)
	new_human.g_hair = rand(15,35)
	new_human.b_hair = rand(25,45)

//*****************************************************************************************************/

/datum/equipment_preset/insurgent/partisan
	name = "Partisan"
	assignment = JOB_INSURGENT
	rank = JOB_INSURGENT
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	role_comm_title = "PRT"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/clf

/datum/equipment_preset/insurgent/partisan/load_gear(mob/living/carbon/human/new_human)
	var/vest_mix = rand(1,4)
	var/weapon_mix = rand(1,6)
	add_worker_uniform(new_human)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)
	if(prob(70))
		switch(vest_mix)
			if(1)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest, WEAR_JACKET)
			if(2)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/ballistic, WEAR_JACKET)
			if(3)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/utility_vest, WEAR_JACKET)
			if(4)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc/police, WEAR_JACKET)
		if(prob(10))
			new_human.equip_to_slot_or_del(new /obj/item/weapon/twohanded/fireaxe, WEAR_L_HAND)
	switch(weapon_mix)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m6/full_m6a, WEAR_WAIST)
		if(2 to 3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m7/full, WEAR_WAIST)
		if(4 to 6)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/halo/ma2b, WEAR_L_HAND)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma2b(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma2b(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma2b(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma2b(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma2b(new_human), WEAR_IN_BELT)


	if(prob(80))
		var/random_helmet = rand(1,5)
		switch(random_helmet)
			if(1)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/head/hardhat/white, WEAR_HEAD)
			if(2)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/head/hardhat/dblue, WEAR_HEAD)
			if(3)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/head/headband/red, WEAR_HEAD)
			if(4)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/cm/black/civilian, WEAR_HEAD)
			if(5)
				new_human.equip_to_slot_or_del(new /obj/item/clothing/head/welding, WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov, WEAR_IN_BACK)

/datum/equipment_preset/insurgent/partisan/lead
	name = "Partisan Leader"
	assignment = JOB_INSURGENT_LEAD
	rank = JOB_INSURGENT_LEAD
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	role_comm_title = "PRTL"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/clf/leader

/datum/equipment_preset/insurgent/partisan/lead/load_gear(mob/living/carbon/human/new_human)
	add_worker_uniform(new_human)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc/police, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/neckguard/police, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/groin/police, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/bracers/police, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/unsc/police, WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/halo/m90/police, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m6/full_m6a, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/shotgun/buckshot/unsc, WEAR_IN_BACK)
