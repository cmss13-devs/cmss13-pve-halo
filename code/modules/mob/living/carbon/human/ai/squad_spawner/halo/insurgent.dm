/datum/human_ai_squad_preset/insurgent
	faction = FACTION_INSURGENT

/datum/human_ai_squad_preset/insurgent/partisan_patrol
	name = "Partisan Patrol Team (Armored, SMG + Pistol)"
	desc = "A pair of untrained and underequipped partisans."
	ai_to_spawn = list(
		/datum/equipment_preset/insurgent/partisan/smg = 1,
		/datum/equipment_preset/insurgent/partisan = 1,
	)

/datum/human_ai_squad_preset/insurgent/partisan_patrol/plainclothes
	name = "Partisan Patrol Team (Plainclothes, SMG + Pistol)"
	desc = "A pair of untrained and underequipped partisans."
	ai_to_spawn = list(
		/datum/equipment_preset/insurgent/partisan/plainclothes/smg = 1,
		/datum/equipment_preset/insurgent/partisan/plainclothes = 1,
	)

/datum/human_ai_squad_preset/insurgent/partisan_squad
	name = "Partisan Assault Squad"
	desc = "A squad of untrained and underequipped partisans, lead by a leader."
	ai_to_spawn = list(
		/datum/equipment_preset/insurgent/partisan/lead = 1,
		/datum/equipment_preset/insurgent/partisan/smg = 2,
		/datum/equipment_preset/insurgent/partisan = 1,
	)
