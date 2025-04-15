/datum/human_ai_squad_preset/insurgent
	faction = FACTION_INSURGENT

/datum/human_ai_squad_preset/insurgent/partisan_patrol
	name = "Partisan Patrol Team"
	desc = "A pair of untrained and underequipped partisans."
	ai_to_spawn = list(
		/datum/equipment_preset/insurgent/partisan = 2
	)

/datum/human_ai_squad_preset/insurgent/partisan_squad
	name = "Partisan Assault Squad"
	desc = "A squad of untrained and underequipped partisans, lead by a leader."
	ai_to_spawn = list(
		/datum/equipment_preset/insurgent/partisan = 4,
		/datum/equipment_preset/insurgent/partisan/lead = 1
	)
