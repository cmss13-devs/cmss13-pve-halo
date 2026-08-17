/datum/equipment_preset/unsc/pfc/recon
	name = "UNSC Recon Rifleman"
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/pfc/recon

/datum/equipment_preset/unsc/pfc/recon/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME2 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/medic/recon
	name = "UNSC Recon Corpsman"
	skills = /datum/skills/combat_medic/recon

/datum/equipment_preset/unsc/medic/recon/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_NE4 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/rto/recon
	name = "UNSC Recon Radio Telephone Operator"
	skills = /datum/skills/pfc/recon

/datum/equipment_preset/unsc/rto/recon/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME2 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/spec/recon
	name = "UNSC Recon Weapons Specialist"
	skills = /datum/skills/specialist

/datum/equipment_preset/unsc/spec/recon/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME2 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/tl/recon
	name = "UNSC Recon Fireteam Leader"
	skills = /datum/skills/tl/recon

/datum/equipment_preset/unsc/tl/recon/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/leader/recon
	name = "UNSC Recon Squad Sergeant"

/datum/equipment_preset/unsc/leader/recon/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_ME5 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/unsc/platco/recon
	name = "UNSC Recon Platoon Commander"
	skills = /datum/skills/SO

/datum/equipment_preset/unsc/platco/recon/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_MO1 = JOB_PLAYTIME_TIER_0)

// =================================
// EQUIPPED PRESETS
// =================================

// ====================== RIFLEMAN ======================

/datum/equipment_preset/unsc/pfc/recon/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/pfc/recon/equipped/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_marine_backpack(new_human, "standard")
	add_forecon_standard_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/pfc/recon/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

/datum/equipment_preset/unsc/pfc/recon/equipped_scout
	name = parent_type::name + " - Scout (Equipped)"

/datum/equipment_preset/unsc/pfc/recon/equipped_scout/load_gear(mob/living/carbon/human/new_human)
	add_forecon_scout_basics(new_human)
	add_marine_backpack(new_human, "standard")
	add_forecon_scout_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/pfc/recon/equipped_scout/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== CORPSMAN ======================

/datum/equipment_preset/unsc/medic/recon/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/medic/recon/equipped/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_marine_backpack(new_human, "corpsman")
	add_forecon_corpsman_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/medic/recon/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

/datum/equipment_preset/unsc/medic/recon/equipped_scout
	name = parent_type::name + " - Scout (Equipped)"

/datum/equipment_preset/unsc/medic/recon/equipped_scout/load_gear(mob/living/carbon/human/new_human)
	add_forecon_scout_basics(new_human)
	add_marine_backpack(new_human, "corpsman")
	add_forecon_scout_corpsman_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/medic/recon/equipped_scout/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== RTO ======================

/datum/equipment_preset/unsc/rto/recon/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/rto/recon/equipped/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_marine_backpack(new_human, "rto")
	add_forecon_standard_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/rto/recon/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

/datum/equipment_preset/unsc/rto/recon/equipped_scout
	name = parent_type::name + " - Scout (Equipped)"

/datum/equipment_preset/unsc/rto/recon/equipped_scout/load_gear(mob/living/carbon/human/new_human)
	add_forecon_scout_basics(new_human)
	add_marine_backpack(new_human, "rto")
	add_forecon_scout_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/rto/recon/equipped_scout/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== FTL ======================

/datum/equipment_preset/unsc/tl/recon/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/tl/recon/equipped/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_marine_backpack(new_human, "sergeant")
	add_forecon_standard_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/tl/recon/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

/datum/equipment_preset/unsc/tl/recon/equipped_scout
	name = parent_type::name + " - Scout (Equipped)"

/datum/equipment_preset/unsc/tl/recon/equipped_scout/load_gear(mob/living/carbon/human/new_human)
	add_forecon_scout_basics(new_human)
	add_marine_backpack(new_human, "sergeant")
	add_forecon_scout_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/tl/recon/equipped_scout/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== SPEC (SPNKR) ======================

/datum/equipment_preset/unsc/spec/recon/equipped_spnkr
	name = parent_type::name + " (SPNKr, Equipped)"

/datum/equipment_preset/unsc/spec/recon/equipped_spnkr/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_marine_backpack(new_human, "spnkr")
	add_forecon_standard_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/spec/recon/equipped_spnkr/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

/datum/equipment_preset/unsc/spec/recon/equipped_spnkr_scout
	name = parent_type::name + " - Scout (SPNKr, Equipped)"

/datum/equipment_preset/unsc/spec/recon/equipped_spnkr_scout/load_gear(mob/living/carbon/human/new_human)
	add_forecon_scout_basics(new_human)
	add_marine_backpack(new_human, "spnkr")
	add_forecon_scout_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/spec/recon/equipped_spnkr_scout/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== SPEC (SNIPER) ======================

/datum/equipment_preset/unsc/spec/recon/equipped_sniper
	name = parent_type::name + " (Sniper, Equipped)"

/datum/equipment_preset/unsc/spec/recon/equipped_sniper/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_srs99(new_human)
	add_forecon_lighter_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/spec/recon/equipped_sniper/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

/datum/equipment_preset/unsc/spec/recon/equipped_sniper_scout
	name = parent_type::name + " - Scout (Sniper, Equipped)"

/datum/equipment_preset/unsc/spec/recon/equipped_sniper_scout/load_gear(mob/living/carbon/human/new_human)
	add_forecon_scout_basics(new_human)
	add_srs99(new_human)
	add_forecon_scout_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/spec/recon/equipped_sniper_scout/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== SQUAD LEADER ======================

/datum/equipment_preset/unsc/leader/recon/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/leader/recon/equipped/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_marine_backpack(new_human, "sergeant")
	add_forecon_lighter_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/leader/recon/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

/datum/equipment_preset/unsc/leader/recon/equipped_scout
	name = parent_type::name + " - Scout (Equipped)"

/datum/equipment_preset/unsc/leader/recon/equipped_scout/load_gear(mob/living/carbon/human/new_human)
	add_forecon_scout_basics(new_human)
	add_marine_backpack(new_human, "sergeant")
	add_forecon_scout_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/leader/recon/equipped_scout/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// ====================== PLATCO ======================

/datum/equipment_preset/unsc/platco/recon/equipped
	name = parent_type::name + " (Equipped)"

/datum/equipment_preset/unsc/platco/recon/equipped/load_gear(mob/living/carbon/human/new_human)
	add_forecon_basics(new_human)
	add_marine_backpack(new_human, "sergeant")
	add_forecon_lighter_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/platco/recon/equipped/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

/datum/equipment_preset/unsc/platco/recon/equipped_scout
	name = parent_type::name + " - Scout (Equipped)"

/datum/equipment_preset/unsc/platco/recon/equipped_scout/load_gear(mob/living/carbon/human/new_human)
	add_forecon_scout_basics(new_human)
	add_marine_backpack(new_human, "sergeant")
	add_forecon_scout_gear(new_human)
	add_ma5b(new_human)

/datum/equipment_preset/unsc/platco/recon/equipped_scout/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_HIGH

// =================================
// PROCS
// =================================

/datum/equipment_preset/proc/add_forecon_scout_basics(mob/living/carbon/human/new_human)
	new_human.undershirt = "Marine Undershirt"
	new_human.underwear = "Marine Boxers"
	if(!istype(new_human))
		return
	var/obj/item/clothing/under/marine/unsc/forecon/uniform = new()
	var/roll_uniform = pick_weight(list("standard" = 5, "rolled" = 85, "jacketless" = 10))
	switch(roll_uniform)
		if("rolled")
			uniform.roll_suit_sleeves(new_human)
		if("jacketless")
			uniform.roll_suit_jacket(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/unsc(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)

/datum/equipment_preset/proc/add_forecon_basics(mob/living/carbon/human/new_human)
	new_human.undershirt = "Marine Undershirt"
	new_human.underwear = "Marine Boxers"
	if(!istype(new_human))
		return
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/unsc/forecon(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/unsc(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)

/datum/equipment_preset/proc/add_forecon_standard_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	if(prob(90)) // if the marine wears a helmet or not
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/unsc/forecon(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc/forecon(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/bracers/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/thigh/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/unsc/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/unsc/(new_human), WEAR_L_STORE)

/datum/equipment_preset/proc/add_forecon_corpsman_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	if(prob(90)) // if the marine wears a helmet or not
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/unsc/forecon(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/unsc(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc/forecon(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/bracers/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/thigh/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/unsc/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/unsc/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/unsc/(new_human), WEAR_L_STORE)

/datum/equipment_preset/proc/add_forecon_lighter_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	if(prob(90)) // if the marine wears a helmet or not
		var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/unsc/forecon = 25, /obj/item/clothing/head/cmcap/boonie/halo/unsc/forecon = 25, /obj/item/clothing/head/cmcap/halo/unsc/forecon = 25, /obj/item/clothing/head/cmbandana/halo/unsc/forecon = 25))
		new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc/forecon(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/greaves/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/bracers/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/pads/unsc/thigh/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/unsc/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/unsc/(new_human), WEAR_L_STORE)

/datum/equipment_preset/proc/add_forecon_scout_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	if(prob(90)) // if the marine wears a helmet or not
		var/pick_hat = pick_weight(list(/obj/item/clothing/head/cmcap/boonie/halo/unsc/forecon = 35, /obj/item/clothing/head/cmcap/halo/unsc/forecon = 35, /obj/item/clothing/head/cmbandana/halo/unsc/forecon = 30))
		new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc/forecon_flakvest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/unsc/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/unsc/(new_human), WEAR_L_STORE)


/datum/equipment_preset/proc/add_forecon_scout_corpsman_gear(mob/living/carbon/human/new_human)
	if(!istype(new_human))
		return
	if(prob(90)) // if the marine wears a helmet or not
		var/pick_hat = pick_weight(list(/obj/item/clothing/head/helmet/marine/unsc/forecon = 25, /obj/item/clothing/head/cmcap/boonie/halo/unsc/forecon = 25, /obj/item/clothing/head/cmcap/halo/unsc/forecon = 25, /obj/item/clothing/head/cmbandana/halo/unsc/forecon = 25))
		new_human.equip_to_slot_or_del(new pick_hat, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/unsc/forecon_flakvest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/unsc(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/unsc/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/unsc/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/unsc/(new_human), WEAR_L_STORE)

