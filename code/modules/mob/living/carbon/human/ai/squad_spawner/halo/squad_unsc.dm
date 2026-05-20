/datum/human_ai_squad_preset/unsc
	faction = FACTION_UNSC

/datum/human_ai_squad_preset/unsc/rifleteam
	name = "UNSC, Rifle Team"
	desc = "UNSC patrol team, equipped with basic rifles and IFAKs."
	ai_to_spawn = list(
		/datum/equipment_preset/unsc/pfc/equipped = 2,
	)

/datum/human_ai_squad_preset/unsc/rifleteam/tl
	name = "UNSC, Rifle Team (TL)"
	desc = "UNSC patrol team, equipped with basic rifles and IFAKs."
	ai_to_spawn = list(
		/datum/equipment_preset/unsc/tl/equipped = 1,
		/datum/equipment_preset/unsc/pfc/equipped = 1,
	)

/datum/human_ai_squad_preset/unsc/atteam
	name = "UNSC, Anti-Tank Team"
	desc = "UNSC specialist Anti-tank team, equipped with basic rifles, a SPNKR and IFAKs."
	ai_to_spawn = list(
		/datum/equipment_preset/unsc/spec/equipped_spnkr = 1,
		/datum/equipment_preset/unsc/pfc/equipped = 1,
	)
/datum/human_ai_squad_preset/unsc/squad
	name = "UNSC, Fireteam"
	desc = "UNSC Patrol Fireteam, armed with basic rifles and IFAKs."
	ai_to_spawn = list(
		/datum/equipment_preset/unsc/tl/equipped = 1,
		/datum/equipment_preset/unsc/pfc/equipped = 3,
	)

/datum/human_ai_squad_preset/unsc/command
	name = "UNSC, Command Element"
	desc = "Best utilized as defended objective, central command element for the unit."
	ai_to_spawn = list(
		/datum/equipment_preset/unsc/leader/equipped= 1,
		/datum/equipment_preset/unsc/pfc/equipped = 2,
		/datum/equipment_preset/unsc/rto/equipped = 1,
		/datum/equipment_preset/unsc/medic/equipped = 1,
	)

/datum/human_ai_squad_preset/unsc/odst/rifleteam
	name = "ODST, Rifle Team"
	desc = "ODST fireteam, equipped with rifles and IFAKs."
	ai_to_spawn = list(
		/datum/equipment_preset/unsc/pfc/odst/equipped = 2,
	)

/datum/human_ai_squad_preset/unsc/odst/rifleteam/tl
	name = "ODST, Rifle Team (TL)"
	desc = "ODST fireteam, equipped with rifles and IFAKs."
	ai_to_spawn = list(
		/datum/equipment_preset/unsc/tl/odst/equipped = 1,
		/datum/equipment_preset/unsc/pfc/odst/equipped = 1,
	)

/datum/human_ai_squad_preset/unsc/odst/atteam
	name = "ODST, Anti-Tank Team"
	desc = "ODST specialist Anti-tank team, equipped with rifles, a SPNKR and IFAKs."
	ai_to_spawn = list(
		/datum/equipment_preset/unsc/spec/odst/equipped_spnkr = 1,
		/datum/equipment_preset/unsc/pfc/odst/equipped = 1,
	)
/datum/human_ai_squad_preset/unsc/odst/squad
	name = "ODST, Fireteam"
	desc = "ODST Fireteam, armed with rifles and IFAKs."
	ai_to_spawn = list(
		/datum/equipment_preset/unsc/tl/odst/equipped = 1,
		/datum/equipment_preset/unsc/pfc/odst/equipped = 2, // more than 4 hAI spawning in a single squad just looks meh and feels meh to control
	)

/datum/human_ai_squad_preset/unsc/odst/command
	name = "ODST, Command Element"
	desc = "Best utilized as defended objective, central command element for the unit."
	ai_to_spawn = list(
		/datum/equipment_preset/unsc/leader/odst/equipped= 1,
		/datum/equipment_preset/unsc/pfc/odst/equipped = 2,
		/datum/equipment_preset/unsc/rto/odst/equipped = 1,
		/datum/equipment_preset/unsc/medic/odst/equipped = 1,
	)
