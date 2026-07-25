/datum/human_ai_squad_preset/covenant/unggoy_specops
	faction = FACTION_SPECOPS_UNGGOY

/datum/human_ai_squad_preset/covenant/unggoy_specops/specops_unggoy_pair
	name = "SpecOps Pair (Unggoy)"
	desc = "A duo of Special Operations Unggoy, both equipped with plasma rifles."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/specops/plasma_rifle = 2,
	)

/datum/human_ai_squad_preset/covenant/unggoy_specops/specops_unggoy_levy
	name = "SpecOps Levy (Unggoy)"
	desc = "A trio of Special Operations Unggoy, two equipped with plasma rifles and one with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/specops/needler = 1,
		/datum/equipment_preset/covenant/unggoy/specops/plasma_rifle = 2,
	)

/datum/human_ai_squad_preset/covenant/unggoy_specops/specops_unggoy_pair_cloaked
	name = "SpecOps Pair (Unggoy) !!CLOAKED!!"
	desc = "A duo of Special Operations Unggoy, both equipped with plasma rifles. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/specops/cloaking = 2,
	)

/datum/human_ai_squad_preset/covenant/unggoy_specops/specops_unggoy_pair_ultra
	name = "SpecOps Pair (Ultra, Unggoy)"
	desc = "A duo of Special Operations Unggoy, both equipped with plasma rifles."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/specops_ultra/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/specops/plasma_rifle = 1,
	)

/datum/human_ai_squad_preset/covenant/unggoy_specops/specops_unggoy_pair_ultra_cloaked
	name = "SpecOps Pair (Ultra, Unggoy) !!CLOAKED!!"
	desc = "A duo of Special Operations Unggoy, one of which an Ultra, both equipped with plasma rifles. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/specops_ultra/cloaking = 1,
		/datum/equipment_preset/covenant/unggoy/specops/cloaking = 1,
	)

/datum/human_ai_squad_preset/covenant/unggoy_specops/specops_elite_team
	name = "SpecOps Lance Command Team (Unggoy)"
	desc = "A Special Operations Sangheili paired with a Special Operations Unggoy, with a plasma rifle and needler respectively. Typically found leading a Special Operations Lance."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/specops/needler = 1,
	)

/datum/human_ai_squad_preset/covenant/unggoy_specops/specops_elite_team_cloaked
	name = "SpecOps Lance Command Team (Unggoy) !!CLOAKED!!"
	desc = "A Special Operations Sangheili paired with a Special Operations Unggoy, both with plasma rifles. Typically found leading a Special Operations Lance. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops/cloaking = 1,
		/datum/equipment_preset/covenant/unggoy/specops/cloaking = 1,
	)

/datum/human_ai_squad_preset/covenant/unggoy_specops/specops_elite_ultra_team
	name = "SpecOps Ultra Taskforce (Unggoy)"
	desc = "A Special Operations Sangheili paired with two Special Operations Unggoy Ultras."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/specops_ultra/plasma_rifle = 2,
	)

/datum/human_ai_squad_preset/covenant/unggoy_specops/specops_elite_ultra_team_cloaked
	name = "SpecOps Ultra Taskforce (Unggoy) !!CLOAKED!!"
	desc = "A Special Operations Sangheili paired with two Special Operations Unggoy Ultras. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops_ultra/cloaking = 1,
		/datum/equipment_preset/covenant/unggoy/specops_ultra/cloaking = 2,
	)
