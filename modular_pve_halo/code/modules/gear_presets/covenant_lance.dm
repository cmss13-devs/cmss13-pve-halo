// Warrior
/datum/equipment_preset/covenant/lance
	name = "Lance Member"
	faction_group = FACTION_LIST_COVENANT
	flags = null

/datum/equipment_preset/covenant/lance/load_gear(mob/living/carbon/human/new_human, client/mob_client)
	if(new_human.client && new_human.client.prefs.species == SPECIES_RUUHTIAN)
		new_human.set_species(SPECIES_RUUHTIAN)
	else
		new_human.set_species(SPECIES_UNGGOY)

/datum/equipment_preset/covenant/lance/lance_standard
	name = "Lance Warrior"
	rank = JOB_COV_LANCE_STANDARD
	assignment = JOB_COV_LANCE_STANDARD
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_COV_2 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/lance/lance_standard/lesser
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_COV_1 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/covenant/lance/lance_standard/greater
	name = parent_type::name + " (Greater Rank)"
	paygrades = list(PAY_SHORT_COV_3 = JOB_PLAYTIME_TIER_0)

// Specialist

/datum/equipment_preset/covenant/lance/lance_specialist
	name = "Lance Specialist"
	rank = JOB_COV_LANCE_OBEDIENTARY
	assignment = JOB_COV_LANCE_OBEDIENTARY
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_COV_3 = JOB_PLAYTIME_TIER_0)
	faction_group = FACTION_LIST_COVENANT
	skills = /datum/skills/covenant/unggoy

/datum/equipment_preset/covenant/lance/lance_specialist/lesser
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_COV_2 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/covenant/lance/lance_specialist/greater
	name = parent_type::name + " (Greater Rank)"
	paygrades = list(PAY_SHORT_COV_4 = JOB_PLAYTIME_TIER_0)

// Obedientary

/datum/equipment_preset/covenant/lance/lance_obedientary
	name = "Lance Obedientary"
	rank = JOB_COV_LANCE_OBEDIENTARY
	assignment = JOB_COV_LANCE_OBEDIENTARY
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_COV_5 = JOB_PLAYTIME_TIER_0)
	faction_group = FACTION_LIST_COVENANT
	skills = /datum/skills/covenant/obedientary

/datum/equipment_preset/covenant/lance/lance_obedientary/lesser
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_COV_4 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/covenant/lance/lance_obedientary/greater
	name = parent_type::name + " (Greater Rank)"
	paygrades = list(PAY_SHORT_COV_6 = JOB_PLAYTIME_TIER_0)

// Ultra

/datum/equipment_preset/covenant/lance/lance_ultra
	name = "Lance Ultra"
	rank = JOB_COV_LANCE_ULTRA
	assignment = JOB_COV_LANCE_OBEDIENTARY
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_COV_5 = JOB_PLAYTIME_TIER_0)
	faction_group = FACTION_LIST_COVENANT
	skills = /datum/skills/covenant/obedientary

// Leader

/datum/equipment_preset/covenant/lance/lance_leader
	name = "Lance Leader"
	rank = JOB_COV_LANCE_LEADER
	assignment = JOB_COV_LANCE_LEADER
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_COV_S2 = JOB_PLAYTIME_TIER_0)
	faction_group = FACTION_LIST_COVENANT
	skills = /datum/skills/covenant/sangheili

/datum/equipment_preset/covenant/lance/lance_leader/minor_greater
	name = parent_type::name + " (Minor+)"
	paygrades = list(PAY_SHORT_COV_S3 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/covenant/lance/lance_leader/major_lesser
	name = parent_type::name + " (Major-)"
	paygrades = list(PAY_SHORT_COV_S4 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/covenant/lance/lance_leader/major
	name = parent_type::name + " (Major)"
	paygrades = list(PAY_SHORT_COV_S5 = JOB_PLAYTIME_TIER_0)
