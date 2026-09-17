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
	paygrades = list(PAY_SHORT_ME1 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/pfc/odst
	name = "ODST Squad Rifleman"
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "ODST-RFN"
	skills = /datum/skills/pfc

/datum/equipment_preset/unsc/pfc/odst/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME2 = JOB_PLAYTIME_TIER_0)

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

/datum/equipment_preset/unsc/medic/odst
	name = "ODST Hospital Corpsman"
	role_comm_title = "ODST-HC"
	skills = /datum/skills/combat_medic

/datum/equipment_preset/unsc/medic/odst/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_NE4 = JOB_PLAYTIME_TIER_0)

/// Marine RTO
/datum/equipment_preset/unsc/rto
	name = "UNSC Radio Telephone Operator"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SMARTPREP)
	assignment = JOB_SQUAD_RTO
	rank = JOB_SQUAD_RTO
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RTO"
	skills = /datum/skills/pfc
	minimap_icon = "rto"

/datum/equipment_preset/unsc/rto/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME2 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/rto/odst
	name = "ODST Radio Telephone Operator"
	role_comm_title = "ODST-RTO"
	skills = /datum/skills/pfc

/datum/equipment_preset/unsc/rto/odst/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME2 = JOB_PLAYTIME_TIER_0)

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

/datum/equipment_preset/unsc/spec/odst
	name = "ODST Squad Weapons Specialist"
	role_comm_title = "ODST-Spc"
	skills = /datum/skills/specialist

/datum/equipment_preset/unsc/spec/odst/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME2 = JOB_PLAYTIME_TIER_0)

/// Fire Team Leader
/datum/equipment_preset/unsc/tl
	name = "UNSC Fireteam Leader"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_TL_PREP)
	assignment = JOB_SQUAD_TEAM_LEADER
	rank = JOB_SQUAD_TEAM_LEADER
	paygrades = list(PAY_SHORT_ME4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "FTL"
	skills = /datum/skills/tl
	minimap_icon = "tl"

/datum/equipment_preset/unsc/tl/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/tl/odst
	name = "ODST Fireteam Leader"
	role_comm_title = "ODST-FTL"
	skills = /datum/skills/tl

/datum/equipment_preset/unsc/tl/odst/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)

/// Marine Squad Sergeant
/datum/equipment_preset/unsc/leader
	name = "UNSC Squad Sergeant"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_LEADER, ACCESS_MARINE_DROPSHIP)
	assignment = JOB_SQUAD_LEADER
	rank = JOB_SQUAD_LEADER
	paygrades = list(PAY_SHORT_ME6 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SL"
	minimum_age = 27
	skills = /datum/skills/SL
	minimap_icon = "leader"

/datum/equipment_preset/unsc/leader/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME5 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/leader/odst
	name = "ODST Squad Sergeant"
	role_comm_title = "ODST-SL"
	minimum_age = 27
	skills = /datum/skills/SL

/datum/equipment_preset/unsc/leader/odst/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME5 = JOB_PLAYTIME_TIER_0)

// PlatCo
/datum/equipment_preset/unsc/platco
	name = "UNSC Platoon Commander"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/dogtag
	assignment = JOB_SO
	rank = JOB_SO
	paygrades = list(PAY_SHORT_MO2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "PltCo"
	minimum_age = 25
	skills = /datum/skills/SO
	minimap_icon = list("cic" = COLOR_SILVER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC
	var/access_list = ACCESS_LIST_MARINE_MAIN

/datum/equipment_preset/unsc/platco/New()
	. = ..()
	access = get_access(access_list)

/datum/equipment_preset/unsc/platco/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_MO1 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/platco/odst
	name = "ODST Platoon Commander"
	paygrades = list(PAY_SHORT_MO2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "PltCo-ODST"
	skills = /datum/skills/SO

/datum/equipment_preset/unsc/platco/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_MO1 = JOB_PLAYTIME_TIER_0)

// Pilot
/datum/equipment_preset/unsc/pilot
	name = "UNSC Marine Pilot"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_MARINE_COMMAND, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_PILOT)
	assignment = "Pilot"
	rank = JOB_DROPSHIP_PILOT
	paygrades = list(PAY_SHORT_MO3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Pilot"
	skills = /datum/skills/pilot
	minimap_icon = "pilot"

/datum/equipment_preset/unsc/pilot/copilot
	name = "UNSC Marine Pilot (Co-Pilot)"
	idtype = /obj/item/card/id/dogtag
	access = list(ACCESS_MARINE_COMMAND, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_PILOT)
	assignment = "Pilot"
	rank = JOB_DROPSHIP_PILOT
	paygrades = list(PAY_SHORT_MO2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Pilot"
	skills = /datum/skills/pilot
	minimap_icon = "pilot"

/datum/equipment_preset/unsc/pilot/navy
	name = "UNSC Navy Pilot"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/dogtag
	access = list(ACCESS_MARINE_COMMAND, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_PILOT)
	assignment = JOB_DROPSHIP_PILOT
	rank = JOB_DROPSHIP_PILOT
	paygrades = list(PAY_SHORT_NO3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Pilot"
	skills = /datum/skills/pilot
	minimap_icon = "pilot"

// =================================
// EQUIPPED PRESETS
// =================================

// ====================== RIFLEMAN ======================

/datum/equipment_preset/unsc/pfc/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/pfc/equipped/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "Marine Undershirt"
	new_human.underwear = "Marine Boxers"
	//back
	add_marine_basics(new_human)
	add_marine_backpack(new_human, "standard")
	add_standard_marine_gear(new_human)
	if(prob(50))
		add_ma5c(new_human)
	else
		add_ma5b(new_human)

/datum/equipment_preset/unsc/pfc/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== SPEC (SNIPER) ======================

/datum/equipment_preset/unsc/spec/equipped_sniper
	name = parent_type::name + " (Sniper, Equipped)"

/datum/equipment_preset/unsc/spec/equipped_sniper/load_gear(mob/living/carbon/human/new_human)
	add_marine_basics(new_human)
	add_sniper_marine_gear(new_human)
	add_srs99(new_human)
	if(prob(50))
		add_ma5c(new_human)
	else
		add_ma5b(new_human)


/datum/equipment_preset/unsc/spec/equipped_sniper/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

/datum/equipment_preset/unsc/spec/equipped_sniper/ai_sniper
	name = parent_type::name + " (Sniper, Equipped AI LOADOUT)"

/datum/equipment_preset/unsc/spec/equipped_sniper/ai_sniper/load_gear(mob/living/carbon/human/new_human)
	add_marine_basics(new_human)
	add_sniper_marine_gear(new_human)
	add_srs99(new_human)
	if(prob(50))
		add_ma5c(new_human)
	else
		add_ma5b(new_human)

/datum/equipment_preset/unsc/spec/equipped_sniper/ai_sniper/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== SPEC (SPNKR) ======================

/datum/equipment_preset/unsc/spec/equipped_spnkr
	name = parent_type::name + " (SPNKr, Equipped)"

/datum/equipment_preset/unsc/spec/equipped_spnkr/load_gear(mob/living/carbon/human/new_human)
	add_marine_basics(new_human)
	add_spnkr_marine_gear(new_human)
	add_marine_backpack(new_human, "spnkr")
	if(prob(50))
		add_ma5c(new_human)
	else
		add_ma5b(new_human)

/datum/equipment_preset/unsc/spec/equipped_spnkr/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

/datum/equipment_preset/unsc/spec/equipped_spnkr/ai_man
	name = parent_type::name + " (SPNKr, Equipped, HAI LOADOUT)"

/datum/equipment_preset/unsc/spec/equipped_spnkr/ai_man/load_gear(mob/living/carbon/human/new_human)
	add_marine_basics(new_human)
	add_spnkr_marine_gear(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/halo_launcher/spnkr(new_human), WEAR_BACK)
	if(prob(50))
		add_ma5c(new_human)
	else
		add_ma5b(new_human)

/datum/equipment_preset/unsc/spec/equipped_spnkr/ai_man/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== CORPSMAN ======================

/datum/equipment_preset/unsc/medic/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/medic/equipped/load_gear(mob/living/carbon/human/new_human)
	add_marine_basics(new_human)
	add_corpsman_marine_gear(new_human)
	add_marine_backpack(new_human, "corpsman")
	if(prob(50))
		add_ma5c(new_human)
	else
		add_ma5b(new_human)

/datum/equipment_preset/unsc/medic/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== RTO ======================

/datum/equipment_preset/unsc/rto/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/rto/equipped/load_gear(mob/living/carbon/human/new_human)
	add_marine_basics(new_human)
	add_standard_marine_gear(new_human)
	add_marine_backpack(new_human, "rto")
	if(prob(50))
		add_ma5c(new_human)
	else
		add_ma5b(new_human)

/datum/equipment_preset/unsc/rto/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== FTL ======================

/datum/equipment_preset/unsc/tl/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/tl/equipped/load_gear(mob/living/carbon/human/new_human)
	add_marine_basics(new_human)
	add_standard_marine_gear(new_human)
	add_marine_backpack(new_human, "standard")
	add_br55(new_human)

/datum/equipment_preset/unsc/tl/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== SQUAD LEADER ======================

/datum/equipment_preset/unsc/leader/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/leader/equipped/load_gear(mob/living/carbon/human/new_human)
	add_marine_basics(new_human)
	add_sergeant_marine_gear(new_human)
	add_marine_backpack(new_human, "sergeant")
	add_br55(new_human)

/datum/equipment_preset/unsc/leader/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== PLATCO ======================

/datum/equipment_preset/unsc/platco/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/platco/equipped/load_gear(mob/living/carbon/human/new_human)
	add_marine_basics(new_human)
	add_sergeant_marine_gear(new_human)
	add_marine_backpack(new_human, "sergeant")
	add_br55(new_human)

/datum/equipment_preset/unsc/platco/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== PILOTS ======================

/datum/equipment_preset/unsc/pilot/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/pilot/equipped/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_pilot_gear(new_human)
	add_m7(new_human)

/datum/equipment_preset/unsc/pilot/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

/datum/equipment_preset/unsc/pilot/equipped_light
	name = parent_type::name + " (Equipped, Light)"

/datum/equipment_preset/unsc/pilot/equipped_light/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_light_pilot_gear(new_human)
	add_m7(new_human)

/datum/equipment_preset/unsc/pilot/copilot/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/pilot/copilot/equipped/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_copilot_gear(new_human)
	add_m7(new_human)

/datum/equipment_preset/unsc/pilot/copilot/equipped_light
	name = parent_type::name + " (Equipped, Light)"

/datum/equipment_preset/unsc/pilot/copilot/equipped_light/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_light_copilot_gear(new_human)
	add_m7(new_human)

/datum/equipment_preset/unsc/pilot/navy/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/pilot/navy/equipped/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_navy_pilot_gear(new_human)
	add_m7(new_human)
// ODST

//rifleman
/datum/equipment_preset/unsc/pfc/odst/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/pfc/odst/equipped/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "Marine Undershirt"
	new_human.underwear = "Marine Boxers"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/unsc(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/unsc/ferrymen(new_human), WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/unsc/odst(new_human), WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/unsc/odst(new_human), WEAR_BODY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc/odst(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/halo/br55(new_human), WEAR_J_STORE)
	//accessories
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/odst(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves/odst(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/bracers/odst(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/groin/odst(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves/odst(new_human), WEAR_ACCESSORY)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/br55/extended(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/br55/extended(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/br55(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/br55(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/br55(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/unsc/full(new_human), WEAR_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)

/datum/equipment_preset/unsc/pfc/odst/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// =================================
// PROCS
// =================================

// basics

/datum/equipment_preset/proc/add_marine_basics(mob/living/carbon/human/new_human)
	new_human.undershirt = "Marine Undershirt"
	new_human.underwear = "Marine Boxers"
	if(!istype(new_human))
		return
	var/obj/item/clothing/under/marine/unsc/uniform = new()
	var/roll_uniform = pick_weight(list("standard" = 80, "rolled" = 15, "jacketless" = 5))
	switch(roll_uniform)
		if("rolled")
			uniform.roll_suit_sleeves(new_human)
		if("jacketless")
			uniform.roll_suit_jacket(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/unsc(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)

/datum/equipment_preset/proc/add_odst_basics(mob/living/carbon/human/new_human)
	new_human.undershirt = "Marine Undershirt"
	new_human.underwear = "Marine Boxers"
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/unsc/odst(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/unsc(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)

/datum/equipment_preset/proc/add_oni_secfor_basics(mob/living/carbon/human/new_human)
	new_human.undershirt = "Marine Undershirt"
	new_human.underwear = "Marine Boxers"
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/unsc/oni(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/oni(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)

/datum/equipment_preset/proc/add_onist_basics(mob/living/carbon/human/new_human)
	new_human.undershirt = "Marine Undershirt"
	new_human.underwear = "Marine Boxers"
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/unsc/odst/oni(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/oni(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)

// equipment

/datum/equipment_preset/proc/add_marine_backpack(mob/living/carbon/human/new_human, backpack_type)
	if(!istype(new_human))
		return
	switch(backpack_type)
		if("corpsman")
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/unsc(new_human), WEAR_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/unsc/corpsman(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/unsc/corpsman(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer/halo(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/unsc/field/corpsman(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/unsc/field/corpsman(new_human), WEAR_IN_BACK)
		if("sergeant")
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/unsc(new_human), WEAR_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/tear_packet/medical_packet(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/unsc(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator/sergeant(new_human), WEAR_IN_BACK)
		if("spnkr")
			new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/spnkr/filled/launcher(new_human), WEAR_BACK)
		if("rto")
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/rto/unsc(new_human), WEAR_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/tear_packet/medical_packet(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/unsc(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/signal/unsc(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator/sergeant(new_human), WEAR_IN_BACK)
		if("standard")
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/unsc(new_human), WEAR_BACK)
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human), WEAR_IN_BACK)
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/tear_packet/medical_packet(new_human), WEAR_IN_BACK)
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/unsc(new_human), WEAR_IN_BACK)
				new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/unsc(new_human), WEAR_BACK)
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human), WEAR_IN_BACK)
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human), WEAR_IN_BACK)
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/tear_packet/medical_packet(new_human), WEAR_IN_BACK)
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/unsc(new_human), WEAR_IN_BACK)
				new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_BACK)
				new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_BACK)
				new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool(new_human), WEAR_IN_BACK)

/datum/equipment_preset/proc/add_standard_marine_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	if(prob(90)) // if the marine wears a helmet or not
		var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/unsc = 50, /obj/item/clothing/head/helmet/marine/unsc/variant_2 = 50))
		new_human.equip_to_slot_or_del(new pick_hat(new_human), WEAR_HEAD)
		add_marine_accessory_visor(new_human)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/neckguard(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/thigh(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/unsc/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/unsc/(new_human), WEAR_L_STORE)

/datum/equipment_preset/proc/add_corpsman_marine_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	if(prob(90)) // if the marine wears a helmet or not
		var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/unsc = 50, /obj/item/clothing/head/helmet/marine/unsc/variant_2 = 50))
		new_human.equip_to_slot_or_del(new pick_hat(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/unsc(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/neckguard(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/thigh(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/unsc/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/unsc/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/unsc/(new_human), WEAR_L_STORE)

/datum/equipment_preset/proc/add_sergeant_marine_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	if(prob(90)) // if the marine wears a helmet or not
		var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/unsc = 25, /obj/item/clothing/head/helmet/marine/unsc/variant_2 = 25, /obj/item/clothing/head/cmcap/halo/unsc = 50))
		new_human.equip_to_slot_or_del(new pick_hat(new_human), WEAR_HEAD)
		if(istype(new_human.head, /obj/item/clothing/head/helmet/marine/unsc))
			add_marine_accessory_visor(new_human)
		else
			add_marine_accessory_eyes(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/neckguard(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/thigh(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/unsc/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/unsc/(new_human), WEAR_L_STORE)

/datum/equipment_preset/proc/add_sniper_marine_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	if(prob(90)) // if the marine wears a helmet or not
		var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/unsc = 25, /obj/item/clothing/head/helmet/marine/unsc/variant_2 = 25, /obj/item/clothing/head/cmcap/halo/unsc = 25, , /obj/item/clothing/head/cmcap/boonie = 25))
		new_human.equip_to_slot_or_del(new pick_hat(new_human), WEAR_HEAD)
		if(istype(new_human.head, /obj/item/clothing/head/helmet/marine/unsc))
			add_marine_accessory_visor(new_human)
		else
			add_marine_accessory_eyes(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc(new_human), WEAR_JACKET)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/neckguard(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/thigh(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/unsc/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/unsc/(new_human), WEAR_L_STORE)

/datum/equipment_preset/proc/add_spnkr_marine_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/unsc/variant_2(new_human), WEAR_HEAD)
	add_marine_accessory_visor(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/neckguard(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/bracers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/groin(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/thigh(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/unsc/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/unsc/(new_human), WEAR_L_STORE)

/datum/equipment_preset/proc/add_pilot_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/unsc/pilot(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/thigh(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/unsc(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol/unsc/large/m6g(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/halo/m6g(new_human), WEAR_IN_R_STORE)

/datum/equipment_preset/proc/add_light_pilot_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc/forecon_flakvest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/unsc/pilot(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/unsc(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol/unsc/large/m6g(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/halo/m6g(new_human), WEAR_IN_R_STORE)

/datum/equipment_preset/proc/add_copilot_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/unsc/pilot/weapons_operator(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/thigh(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/unsc(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol/unsc/large/m6g(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/halo/m6g(new_human), WEAR_IN_R_STORE)

/datum/equipment_preset/proc/add_light_copilot_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc/forecon_flakvest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/unsc/pilot/weapons_operator(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/unsc(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol/unsc/large/m6g(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/halo/m6g(new_human), WEAR_IN_R_STORE)

/datum/equipment_preset/proc/add_navy_pilot_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/unsc/pilot/navy(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/thigh(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/unsc(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol/unsc/large/m6g(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/halo/m6g(new_human), WEAR_IN_R_STORE)

/datum/equipment_preset/proc/add_ma5c(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/halo/ma5c(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m52b/mag/ma5c(new_human), WEAR_ACCESSORY)
	var/random_magcount = rand(6, 10)
	for(var/i in 1 to random_magcount)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma5c(new_human), WEAR_IN_BELT)

/datum/equipment_preset/proc/add_ma5b(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/halo/ma5b(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m52b/mag/ma5b(new_human), WEAR_ACCESSORY)
	var/random_magcount = rand(6, 10)
	for(var/i in 1 to random_magcount)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/ma5b(new_human), WEAR_IN_BELT)

/datum/equipment_preset/proc/add_br55(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/halo/br55(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m52b/mag/br55(new_human), WEAR_ACCESSORY)
	var/random_magcount = rand(6, 10)
	for(var/i in 1 to random_magcount)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/halo/br55(new_human), WEAR_IN_BELT)

/datum/equipment_preset/proc/add_srs99(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/sniper/halo(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m52b/mag/srs99(new_human), WEAR_ACCESSORY)

/datum/equipment_preset/proc/add_m7(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m7/full(new_human), WEAR_J_STORE)
	var/random_magcount = rand(6, 10)
	for(var/i in 1 to random_magcount)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/halo/m7(new_human), WEAR_IN_BELT)

/datum/equipment_preset/proc/add_marine_accessory_visor(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	if(prob(75))
		var/pick_visor = pick_weight(list(/obj/item/prop/helmetgarb/halo/visor = 60, /obj/item/prop/helmetgarb/halo/visor/silver = 15, /obj/item/prop/helmetgarb/halo/visor/large = 10, /obj/item/prop/helmetgarb/halo/visor/large/silver = 10, /obj/item/clothing/glasses/scouter = 5))
		new_human.equip_to_slot_or_del(new pick_visor(new_human), WEAR_IN_HELMET)

/datum/equipment_preset/proc/add_marine_accessory_eyes(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	if(prob(75))
		var/pick_eyes = pick_weight(list(/obj/item/clothing/glasses/scouter = 20, /obj/item/clothing/glasses/sunglasses/big/unsc = 60, /obj/item/clothing/glasses/sunglasses/big/unsc/silver = 20))
		new_human.equip_to_slot_or_del(new pick_eyes(new_human), WEAR_EYES)
