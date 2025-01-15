/datum/equipment_preset/unsc
	name = "UNSC"
	faction = FACTION_UNSC
	faction_group = FACTION_LIST_UNSC
	languages = list(LANGUAGE_ENGLISH)
	idtype = /obj/item/card/id/dogtag
	var/auto_squad_name
	var/ert_squad = FALSE

/datum/equipment_preset/unsc/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_VERYLOW

/datum/equipment_preset/unsc/load_preset(mob/living/carbon/human/new_human, randomise, count_participant)
	. = ..()
	if(!auto_squad_name || (should_block_game_interaction(new_human) && !ert_squad))
		return
	if(!GLOB.data_core.manifest_modify(new_human.real_name, WEAKREF(new_human), assignment, rank))
		GLOB.data_core.manifest_inject(new_human)

	var/obj/item/card/id/ID = new_human.get_idcard()
	var/datum/money_account/acct = create_account(new_human, rand(30, 50), GLOB.paygrades[ID.paygrade])
	ID.associated_account_number = acct.account_number

	var/datum/squad/auto_squad = get_squad_by_name(auto_squad_name)
	if(auto_squad)
		transfer_marine_to_squad(new_human, auto_squad, new_human.assigned_squad, ID)
	if(!ert_squad && !auto_squad.active)
		auto_squad.engage_squad(FALSE)

	if(!auto_squad)
		transfer_marine_to_squad(new_human, pick(GLOB.RoleAuthority.squads), new_human.assigned_squad, new_human.wear_id)

	new_human.marine_buyable_categories[MARINE_CAN_BUY_EAR] = 0
	new_human.sec_hud_set_ID()
	new_human.hud_set_squad()

///Equipped Presets need doing///

/// Marine Rifleman
/datum/equipment_preset/unsc/pfc
	name = "UNSC Squad Rifleman"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_MARINE_PREP)
	assignment = JOB_UNSC_MARINE
	rank = JOB_UNSC_MARINE
	paygrades = list(PAY_SHORT_UNSCT_ME2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RFN"
	skills = /datum/skills/pfc
	minimap_icon = "private"

/datum/equipment_preset/unsc/pfc/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_UNSCT_ME3 = JOB_PLAYTIME_TIER_0)

/// Marine Corpsman
/datum/equipment_preset/unsc/medic
	name = "UNSC Hospital Corpsman"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_MEDBAY)
	assignment = JOB_UNSC_MEDIC
	rank = JOB_UNSC_MEDIC
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
	assignment = JOB_UNSC_RTO
	rank = JOB_UNSC_RTO
	paygrades = list(PAY_SHORT_UNSC_ME4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RTO"
	skills = /datum/skills/pfc
	minimap_icon = "rto"

/datum/equipment_preset/unsc/rto/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_UNSC_ME3 = JOB_PLAYTIME_TIER_0)

/// Marine Spec
/datum/equipment_preset/unsc/spec
	name = "UNSC Squad Weapons Specialist"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	assignment = JOB_UNSC_SPECIALIST
	rank = JOB_UNSC_SPECIALIST
	paygrades = list(PAY_SHORT_UNSC_ME2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Spc"
	skills = /datum/skills/specialist
	minimap_icon = "spec"

/datum/equipment_preset/unsc/spec/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_UNSC_ME3 = JOB_PLAYTIME_TIER_0)

/// Fire Team Leader
/datum/equipment_preset/unsc/tl
	name = "UNSC Fireteam Leader "
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_TL_PREP)
	assignment = JOB_UNSC_TEAM_LEADER
	rank = JOB_UNSC_TEAM_LEADER
	paygrades = list(PAY_SHORT_UNSC_ME5 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "FTL"
	skills = /datum/skills/tl
	minimap_icon = "tl"

/datum/equipment_preset/unsc/tl/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_UNSC_ME4 = JOB_PLAYTIME_TIER_0)

/// Marine Squad Sergeant
/datum/equipment_preset/unsc/leader
	name = "UNSC Squad Sergeant"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_LEADER, ACCESS_MARINE_DROPSHIP)
	assignment = JOB_UNSC_LEADER
	rank = JOB_UNSC_LEADER
	paygrades = list(PAY_SHORT_UNSC_ME7 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SqdSgt"
	minimum_age = 27
	skills = /datum/skills/SL
	minimap_icon = "leader"

/datum/equipment_preset/unsc/leader/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_UNSC_ME6 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/pc
	name = "UNSC Platoon Commander"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/silver
	assignment = JOB_UNSC_SO
	rank = JOB_UNSC_SO
	paygrades = list(PAY_SHORT_UNSC_MO2 = JOB_PLAYTIME_TIER_0)
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
	paygrades = list(PAY_SHORT_UNSC_MO1 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/pilot
	name = "UNSC Pilot"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/silver
	access = list(ACCESS_MARINE_COMMAND, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_PILOT)
	assignment = JOB_UNSC_PO
	rank = JOB_UNSC_PO
	paygrades = list(PAY_SHORT_UNSC_MO1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "PO"
	skills = /datum/skills/pilot
	minimap_icon = "pilot"
