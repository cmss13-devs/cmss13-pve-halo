/datum/equipment_preset/unsc
	name = "UNSC"
	faction = FACTION_UNSC
	faction_group = FACTION_LIST_UNSC
	languages = list(LANGUAGE_ENGLISH)
	idtype = /obj/item/card/id/dogtag
	var/auto_squad_name_unsc
	var/ert_squad_halo = FALSE

/datum/equipment_preset/unsc/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_VERYLOW

/datum/equipment_preset/unsc/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(75;MALE,25;FEMALE)
	var/datum/preferences/A = new
	A.randomize_appearance(new_human)
	var/random_name = capitalize(pick(new_human.gender == MALE ? GLOB.first_names_male : GLOB.first_names_female)) + " " + capitalize(pick(GLOB.last_names))
	var/static/list/colors = list("BLACK" = list(15, 15, 10), "BROWN" = list(48, 38, 18), "BROWN" = list(48, 38, 18),"BLUE" = list(29, 51, 65), "GREEN" = list(40, 61, 39), "STEEL" = list(46, 59, 54))
	var/static/list/hair_colors = list("BLACK" = list(15, 15, 10), "BROWN" = list(48, 38, 18), "AUBURN" = list(77, 48, 36), "BLONDE" = list(95, 76, 44))
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
	if(new_human.gender == MALE)
		new_human.h_style = pick("Undercut", "Partly Shaved", "Side Undercut", "Side Hang Undercut (Reverse)", "Undercut, Top", "Medium Fade", "High Fade", "Coffee House Cut")
		new_human.f_style = pick("Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "3 O'clock Shadow", "3 O'clock Moustache", "5 O'clock Shadow", "5 O'clock Moustache", "7 O'clock Shadow", "7 O'clock Moustache",)
	else
		new_human.h_style = pick("Side Undercut", "Side Hang Undercut (Reverse)", "Undercut, Top", "CIA", "Mulder", "Pvt. Redding", "Pixie Cut Left", "Pixie Cut Right", "Bun")
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,35)

/datum/equipment_preset/unsc/load_preset(mob/living/carbon/human/new_human, randomise, count_participant)
	. = ..()
	if(!auto_squad_name_unsc || (should_block_game_interaction(new_human) && !ert_squad_halo))
		return
	if(!GLOB.data_core.manifest_modify(new_human.real_name, WEAKREF(new_human), assignment, rank))
		GLOB.data_core.manifest_inject(new_human)

	var/obj/item/card/id/ID = new_human.get_idcard()
	var/datum/money_account/acct = create_account(new_human, rand(30, 50), GLOB.paygrades[ID.paygrade])
	ID.associated_account_number = acct.account_number

	var/datum/squad/auto_squad = get_squad_by_name(auto_squad_name_unsc)
	if(auto_squad)
		transfer_marine_to_squad(new_human, auto_squad, new_human.assigned_squad, ID)
	if(!ert_squad_halo && !auto_squad.active)
		auto_squad.engage_squad(FALSE)

	if(!auto_squad)
		transfer_marine_to_squad(new_human, pick(GLOB.RoleAuthority.squads), new_human.assigned_squad, new_human.wear_id)

	new_human.marine_buyable_categories[MARINE_CAN_BUY_EAR] = 0
	new_human.sec_hud_set_ID()
	new_human.hud_set_squad()

	if(new_human.wear_l_ear)
		if(istype(new_human.wear_l_ear, /obj/item/device/radio/headset/almayer/marine))
			var/obj/item/device/radio/headset/almayer/marine/equipped_headset = new_human.wear_l_ear
			equipped_headset.add_hud_tracker(new_human)
	else if(new_human.wear_r_ear)
		if(istype(new_human.wear_r_ear, /obj/item/device/radio/headset/almayer/marine))
			var/obj/item/device/radio/headset/almayer/marine/equipped_headset = new_human.wear_r_ear
			equipped_headset.add_hud_tracker(new_human)

///Equipped Presets need doing///

/// Marine Rifleman
/datum/equipment_preset/unsc/pfc
	name = "UNSC Squad Rifleman"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_SQUAD_MARINE
	rank = JOB_SQUAD_MARINE
	paygrades = list(PAY_SHORT_ME2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RFN"
	skills = /datum/skills/pfc
	minimap_icon = "private"

/datum/equipment_preset/unsc/pfc/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)

/// Marine Corpsman
/datum/equipment_preset/unsc/medic
	name = "UNSC Hospital Corpsman"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_MEDBAY)
	assignment = JOB_SQUAD_MEDIC
	rank = JOB_SQUAD_MEDIC
	paygrades = list(PAY_SHORT_NE5 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "HC"
	skills = /datum/skills/combat_medic
	minimap_icon = "medic"

/datum/equipment_preset/unsc/medic/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_NE4 = JOB_PLAYTIME_TIER_0)

/// Marine RTO
/datum/equipment_preset/unsc/rto
	name = "UNSC Radio Telephone Operator"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	assignment = JOB_SQUAD_RTO
	rank = JOB_SQUAD_RTO
	paygrades = list(PAY_SHORT_ME4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RTO"
	skills = /datum/skills/pfc
	minimap_icon = "rto"

/datum/equipment_preset/unsc/rto/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)

/// Marine Spec
/datum/equipment_preset/unsc/spec
	name = "UNSC Squad Weapons Specialist"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	assignment = JOB_SQUAD_SPECIALIST
	rank = JOB_SQUAD_SPECIALIST
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Spc"
	skills = /datum/skills/specialist
	minimap_icon = "spec"

/datum/equipment_preset/unsc/spec/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME2 = JOB_PLAYTIME_TIER_0)

/// Fire Team Leader
/datum/equipment_preset/unsc/tl
	name = "UNSC Fireteam Leader "
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_TL_PREP)
	assignment = JOB_SQUAD_TEAM_LEADER
	rank = JOB_SQUAD_TEAM_LEADER
	paygrades = list(PAY_SHORT_ME5 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "FTL"
	skills = /datum/skills/tl
	minimap_icon = "tl"

/datum/equipment_preset/unsc/tl/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME4 = JOB_PLAYTIME_TIER_0)

/// Marine Squad Sergeant
/datum/equipment_preset/unsc/leader
	name = "UNSC Squad Sergeant"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_LEADER, ACCESS_MARINE_DROPSHIP)
	assignment = JOB_SQUAD_LEADER
	rank = JOB_SQUAD_LEADER
	paygrades = list(PAY_SHORT_ME7 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SqdSgt"
	minimum_age = 27
	skills = /datum/skills/SL
	minimap_icon = "leader"

/datum/equipment_preset/unsc/leader/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME6 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/pc
	name = "UNSC Platoon Commander"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/silver
	assignment = JOB_SO
	rank = JOB_SO
	paygrades = list(PAY_SHORT_MO2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "PltCo"
	minimum_age = 25
	skills = /datum/skills/SO
	minimap_icon = list("cic" = COLOR_SILVER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC
	var/access_list = ACCESS_LIST_MARINE_MAIN

/datum/equipment_preset/unsc/pc/New()
	. = ..()
	access = get_access(access_list)

/datum/equipment_preset/unsc/pc/load_status(mob/living/carbon/human/new_human, client/mob_client)
	. = ..()
	new_human.nutrition = NUTRITION_VERYLOW
	if(!new_human.client)
		return

	add_verb(new_human.client, /client/proc/commander_rename_platoon)

/datum/equipment_preset/unsc/pc/handle_late_join(mob/living/carbon/human/new_human, late_join)
	if(late_join)
		return

	add_verb(new_human.client, /client/proc/commander_rename_platoon)

	do_rename_platoon(new_human.client.prefs.platoon_name)

/datum/equipment_preset/unsc/pc/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_MO1 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/pilot
	name = "UNSC Pilot"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/silver
	access = list(ACCESS_MARINE_COMMAND, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_PILOT)
	assignment = JOB_DROPSHIP_PILOT
	rank = JOB_DROPSHIP_PILOT
	paygrades = list(PAY_SHORT_MO1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "PO"
	skills = /datum/skills/pilot
	minimap_icon = "pilot"
