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

/datum/equipment_preset/covenant/sangheili/zealot/cloaking
	name = parent_type::name + " (Cloaked)"

/datum/equipment_preset/covenant/sangheili/zealot/cloaking/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_zealot(new_human)
	add_plasma_rifle_package(new_human)
	camouflage(new_human)

// =================================
// Special Operations
// =================================

/datum/equipment_preset/covenant/sangheili/specops
	name = parent_type::name + " SpecOps (Plasma Rifle)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	faction = FACTION_SPECOPS_SANGHEILI
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_SPECOPS
	rank = JOB_COV_SPECOPS
	paygrades = list(PAY_SHORT_SANG_MAJOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SpecOps"
	skills = /datum/skills/covenant/sangheili
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/sangheili/specops/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics_fullbody(new_human)
	add_elite_specops(new_human)
	add_plasma_rifle_package(new_human)

/datum/equipment_preset/covenant/sangheili/specops/carbine
	name =  parent_type::name + "SpecOps (Carbine)"

/datum/equipment_preset/covenant/sangheili/specops/carbine/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics_fullbody(new_human)
	add_elite_specops(new_human)
	add_cov_carbine_package(new_human)

/datum/equipment_preset/covenant/sangheili/specops/cloaking
	name = parent_type::name + " (Cloaked)"

/datum/equipment_preset/covenant/sangheili/specops/cloaking/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_specops(new_human)
	add_plasma_rifle_package(new_human)
	camouflage(new_human)

// =================================
// Special Operations Ultra
// =================================

/datum/equipment_preset/covenant/sangheili/specops_ultra
	name = parent_type::name + " SpecOps Ultra (Plasma Rifle)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	faction = FACTION_SPECOPS_SANGHEILI
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_SPECOPS_ULTRA
	rank = JOB_COV_SPECOPS_ULTRA
	paygrades = list(PAY_SHORT_COV_ULTRA = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SpecOps Ultra"
	skills = /datum/skills/covenant/sangheili
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/sangheili/specops_ultra/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics_fullbody(new_human)
	add_elite_specops_ultra(new_human)
	add_plasma_rifle_package(new_human)

/datum/equipment_preset/covenant/sangheili/specops_ultra/carbine
	name =  parent_type::name + "SpecOps Ultra (Carbine)"

/datum/equipment_preset/covenant/sangheili/specops_ultra/carbine/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics_fullbody(new_human)
	add_elite_specops_ultra(new_human)
	add_cov_carbine_package(new_human)

/datum/equipment_preset/covenant/sangheili/specops_ultra/cloaking
	name = parent_type::name + " (Cloaked)"

/datum/equipment_preset/covenant/sangheili/specops_ultra/cloaking/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_specops_ultra(new_human)
	add_plasma_rifle_package(new_human)
	camouflage(new_human)

// =================================
// Stealth
// =================================

/datum/equipment_preset/covenant/sangheili/stealth
	name = parent_type::name + " Stealth (Plasma Rifle)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	faction = FACTION_SPECOPS_SANGHEILI
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_STEALTH
	rank = JOB_COV_STEALTH
	paygrades = list(PAY_SHORT_COV_MAJOR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Stealth"
	skills = /datum/skills/covenant/sangheili
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/sangheili/stealth/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics_fullbody(new_human)
	add_elite_stealth(new_human)
	add_plasma_rifle_package(new_human)

/datum/equipment_preset/covenant/sangheili/stealth/needler
	name =  parent_type::name + "Stealth (Needler)"

/datum/equipment_preset/covenant/sangheili/stealth/needler/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_stealth(new_human)
	add_needler_package(new_human)

/datum/equipment_preset/covenant/sangheili/stealth/needler/cloaking
	name =  parent_type::name + " (Cloaked)"

/datum/equipment_preset/covenant/sangheili/stealth/needler/cloaking/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_stealth(new_human)
	add_needler_package(new_human)
	camouflage(new_human)

/datum/equipment_preset/covenant/sangheili/stealth/cloaking
	name = parent_type::name + " (Cloaked)"

/datum/equipment_preset/covenant/sangheili/stealth/cloaking/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics(new_human)
	add_elite_stealth(new_human)
	add_plasma_rifle_package(new_human)
	camouflage(new_human)

// =================================
// Honor Guard
// =================================

/datum/equipment_preset/covenant/sangheili/honor_guard
	name = parent_type::name + " Honor Guard"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/covenant
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_COV_HONOR_GUARD
	rank = JOB_COV_HONOR_GUARD
	paygrades = list(PAY_SHORT_SANG_HONOR_GUARD = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Honor Guard"
	skills = /datum/skills/covenant/sangheili
	languages = list(LANGUAGE_SANGHEILI)

/datum/equipment_preset/covenant/sangheili/honor_guard/load_gear(mob/living/carbon/human/new_human)
	add_elite_basics_fullbody(new_human)
	add_elite_honor_guard(new_human)
	add_plasma_rifle_package(new_human)

//Procs

/datum/equipment_preset/proc/add_elite_basics(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	var/obj/item/clothing/under/marine/covenant/sangheili/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/covenant(new_human), WEAR_L_EAR)

/datum/equipment_preset/proc/add_elite_basics_fullbody(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/covenant/sangheili/fullbody(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/covenant(new_human), WEAR_L_EAR)

/datum/equipment_preset/proc/add_elite_minor(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/minor(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/minor(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/minor(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/minor(new_human), WEAR_WAIST)
	var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/sangheili/minor = 70, /obj/item/clothing/head/helmet/marine/sangheili/minor/manta_hat = 30))
	var/pick_pads = pick_weight(list(/obj/item/clothing/accessory/pads/sangheili/minor = 50, /obj/item/clothing/accessory/pads/sangheili/minor/variant_2 = 30, /obj/item/clothing/accessory/pads/sangheili/minor/variant_3 = 20))
	new_human.equip_to_slot_or_del(new pick_hat(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new pick_pads(new_human), WEAR_ACCESSORY)

/datum/equipment_preset/proc/add_elite_major(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/major(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/major(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/major(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/major(new_human), WEAR_WAIST)
	var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/sangheili/major = 70, /obj/item/clothing/head/helmet/marine/sangheili/major/manta_hat = 30))
	var/pick_pads = pick_weight(list(/obj/item/clothing/accessory/pads/sangheili/major = 50, /obj/item/clothing/accessory/pads/sangheili/major/variant_2 = 30, /obj/item/clothing/accessory/pads/sangheili/major/variant_3 = 20))
	new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new pick_pads, WEAR_ACCESSORY)

/datum/equipment_preset/proc/add_elite_ultra(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/ultra(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/ultra(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/ultra(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/ultra(new_human), WEAR_WAIST)
	var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/sangheili/ultra = 50, /obj/item/clothing/head/helmet/marine/sangheili/ultra/manta_hat = 50))
	var/pick_pads = pick_weight(list(/obj/item/clothing/accessory/pads/sangheili/ultra = 50, /obj/item/clothing/accessory/pads/sangheili/ultra/variant_2 = 25, /obj/item/clothing/accessory/pads/sangheili/ultra/variant_3 = 25))
	new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new pick_pads, WEAR_ACCESSORY)

/datum/equipment_preset/proc/add_elite_zealot(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/cloaking/zealot(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/zealot(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/zealot(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/zealot(new_human), WEAR_WAIST)
	var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/sangheili/zealot = 50, /obj/item/clothing/head/helmet/marine/sangheili/zealot/manta_hat = 50))
	var/pick_pads = pick_weight(list(/obj/item/clothing/accessory/pads/sangheili/zealot = 20, /obj/item/clothing/accessory/pads/sangheili/zealot/variant_2 = 20, /obj/item/clothing/accessory/pads/sangheili/zealot/variant_3 = 60))
	new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new pick_pads, WEAR_ACCESSORY)

/datum/equipment_preset/proc/add_elite_specops(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/cloaking/specops(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/specops(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/specops(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/specops(new_human), WEAR_WAIST)
	var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/sangheili/specops = 30, /obj/item/clothing/head/helmet/marine/sangheili/specops/manta_hat = 0, /obj/item/clothing/head/helmet/marine/sangheili/specops/assault = 70))
	var/pick_pads = pick_weight(list(/obj/item/clothing/accessory/pads/sangheili/specops = 25, /obj/item/clothing/accessory/pads/sangheili/specops/variant_2 = 25, /obj/item/clothing/accessory/pads/sangheili/specops/variant_3 = 50))
	new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new pick_pads, WEAR_ACCESSORY)

/datum/equipment_preset/proc/add_elite_specops_ultra(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/cloaking/specops/ultra(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/specops/ultra(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/specops/ultra(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/specops/ultra(new_human), WEAR_WAIST)
	var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/sangheili/specops/ultra = 20, /obj/item/clothing/head/helmet/marine/sangheili/specops/ultra/manta_hat = 0, /obj/item/clothing/head/helmet/marine/sangheili/specops/ultra/assault = 80))
	var/pick_pads = pick_weight(list(/obj/item/clothing/accessory/pads/sangheili/specops/ultra = 25, /obj/item/clothing/accessory/pads/sangheili/specops/ultra/variant_2 = 25, /obj/item/clothing/accessory/pads/sangheili/specops/ultra/variant_3 = 50))
	new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new pick_pads, WEAR_ACCESSORY)

/datum/equipment_preset/proc/add_elite_stealth(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/cloaking/stealth(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/stealth(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/stealth(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/stealth(new_human), WEAR_WAIST)
	var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/sangheili/stealth = 10, /obj/item/clothing/head/helmet/marine/sangheili/stealth/manta_hat = 10, /obj/item/clothing/head/helmet/marine/sangheili/stealth/assault = 80))
	var/pick_pads = pick_weight(list(/obj/item/clothing/accessory/pads/sangheili/stealth = 15, /obj/item/clothing/accessory/pads/sangheili/stealth/variant_2 = 80, /obj/item/clothing/accessory/pads/sangheili/stealth/variant_3 = 5))
	new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new pick_pads, WEAR_ACCESSORY)

/datum/equipment_preset/proc/add_elite_honor_guard(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/shielded/sangheili/honor_guard(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/sangheili/honor_guard(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/sangheili/honor_guard(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/covenant/sangheili/honor_guard(new_human), WEAR_WAIST)
	var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/sangheili/honor_guard = 100))
	var/pick_pads = pick_weight(list(/obj/item/clothing/accessory/pads/sangheili/honor_guard = 100))
	new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new pick_pads, WEAR_ACCESSORY)

/datum/equipment_preset/proc/camouflage(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	for(var/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/camouflage in new_human)
		camouflage.attack_self(new_human)
