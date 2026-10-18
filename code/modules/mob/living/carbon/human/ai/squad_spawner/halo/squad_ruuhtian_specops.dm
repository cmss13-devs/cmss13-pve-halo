/datum/human_ai_squad_preset/covenant/ruuhtian_specops
	faction = FACTION_SPECOPS_KIGYAR

/datum/human_ai_squad_preset/covenant/ruuhtian_specops/specops_ruuhtian_pair
	name = "SpecOps Pair (Ruuhtian)"
	desc = "A duo of Special Operations Ruuhtian, both equipped with plasma rifles."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/ruuhtian/specops/plasma_rifle = 2,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian_specops/specops_ruuhtian_levy
	name = "SpecOps Levy (Ruuhtian)"
	desc = "A trio of Special Operations Ruuhtian, two equipped with plasma rifles and one with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/ruuhtian/specops/needler = 1,
		/datum/equipment_preset/covenant/ruuhtian/specops/plasma_rifle = 2,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian_specops/specops_ruuhtian_pair_cloaked
	name = "SpecOps Pair (Ruuhtian) !!CLOAKED!!"
	desc = "A duo of Special Operations Ruuhtian, both equipped with plasma rifles. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/ruuhtian/specops/cloaking = 2,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian_specops/specops_ruuhtian_pair_ultra
	name = "SpecOps Pair (Ultra, Ruuhtian)"
	desc = "A duo of Special Operations Ruuhtian, both equipped with plasma rifles."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/ruuhtian/specops_ultra/plasma_rifle = 1,
		/datum/equipment_preset/covenant/ruuhtian/specops/plasma_rifle = 1,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian_specops/specops_ruuhtian_pair_ultra_cloaked
	name = "SpecOps Pair (Ultra, Ruuhtian) !!CLOAKED!!"
	desc = "A duo of Special Operations Ruuhtian, one of which an Ultra, both equipped with plasma rifles. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/ruuhtian/specops_ultra/cloaking = 1,
		/datum/equipment_preset/covenant/ruuhtian/specops/cloaking = 1,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian_specops/specops_elite_team
	name = "SpecOps Lance Command Team (Ruuhtian)"
	desc = "A Special Operations Sangheili paired with a Special Operations Ruuhtian, with a plasma rifle and needler respectively. Typically found leading a Special Operations Lance."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops/plasma_rifle = 1,
		/datum/equipment_preset/covenant/ruuhtian/specops/needler = 1,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian_specops/specops_elite_team_cloaked
	name = "SpecOps Lance Command Team (Ruuhtian) !!CLOAKED!!"
	desc = "A Special Operations Sangheili paired with a Special Operations Ruuhtian, both with plasma rifles. Typically found leading a Special Operations Lance. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops/cloaking = 1,
		/datum/equipment_preset/covenant/ruuhtian/specops/cloaking = 1,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian_specops/specops_elite_ultra_team
	name = "SpecOps Ultra Taskforce (Ruuhtian)"
	desc = "A Special Operations Sangheili paired with two Special Operations Ruuhtian Ultras."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops/plasma_rifle = 1,
		/datum/equipment_preset/covenant/ruuhtian/specops_ultra/plasma_rifle = 2,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian_specops/specops_elite_ultra_team_cloaked
	name = "SpecOps Ultra Taskforce (Ruuhtian) !!CLOAKED!!"
	desc = "A Special Operations Sangheili paired with two Special Operations Ruuhtian Ultras. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops_ultra/cloaking = 1,
		/datum/equipment_preset/covenant/ruuhtian/specops_ultra/cloaking = 2,
	)
