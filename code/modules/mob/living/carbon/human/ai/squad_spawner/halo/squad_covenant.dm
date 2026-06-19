/datum/human_ai_squad_preset/covenant
	faction = FACTION_COVENANT

// =====================
// STANDARD COVENANT
// =====================

/datum/human_ai_squad_preset/covenant/unggoy_pair
	name = "Unggoy Pair"
	desc = "A pair of Unggoy Minors, both armed with plasma pistols."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 2,
	)

/datum/human_ai_squad_preset/covenant/unggoy_levy
	name = "Unggoy Levy"
	desc = "A Covenant Levy is the equivalent of a fireteam in their military. Two Minors and one Major, all armed with plasma pistols."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/major/plasma_pistol = 1,
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 2,
	)

/datum/human_ai_squad_preset/covenant/unggoy_levy_heavy
	name = "Unggoy Levy (Heavy)"
	desc = "One Major and Minor with plasma pistols, and a Heavy with a plasma rifle."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/major/plasma_pistol = 1,
		/datum/equipment_preset/covenant/unggoy/heavy/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 1,
	)

/datum/human_ai_squad_preset/covenant/unggoy_levy_ultra
	name = "Unggoy Levy (Ultra)"
	desc = "An Ultra armed with a plasma rifle, accompanied by one Major with a needler and one Minor with a plasma pistol."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/ultra/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/major/needler = 1,
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 1,
	)

/datum/human_ai_squad_preset/covenant/lance_leader
	name = "Lance Command Team"
	desc = "The command team of a Covenant Unggoy Lance, the equivalent of a squad in the Covenant military. One Sangheili armed with a plasma rifle accompanied by an Unggoy Ultra with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/minor/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/ultra/needler = 1,
	)

/datum/human_ai_squad_preset/covenant/sangheili_major_levy
	name = "Sangheili Major Team"
	desc = "Often put in charge of several lances of Sangheili or heavy pieces of equipment. One Sangheili Major with a plasma rifle accompanied by an Unggoy Ultra with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/major/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/ultra/needler = 1,
	)

/datum/human_ai_squad_preset/covenant/sangheili_ultra_levy
	name = "Sangheili Ultra Team"
	desc = "Typically serving as military advisors or operating on independent missions, Ultras are often found together. Sangheili Ultra and Unggoy Ultra equipped with plasma rifles, as well as an Unggoy Ultra with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/ultra/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/ultra/needler = 1,
		/datum/equipment_preset/covenant/unggoy/ultra/plasma_rifle = 1,
	)

// =====================
// SPECIAL OPERATIONS
// =====================

/datum/human_ai_squad_preset/covenant/specops_unggoy_pair
	name = "Special Operations Unggoy Pair"
	desc = "A duo of Special Operations Unggoy, both equipped with plasma rifles."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/specops/plasma_rifle = 2,
	)

/datum/human_ai_squad_preset/covenant/specops_unggoy_levy
	name = "Special Operations Unggoy Levy"
	desc = "A trio of Special Operations Unggoy, two equipped with plasma rifles and one with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/specops/needler = 1,
		/datum/equipment_preset/covenant/unggoy/specops/plasma_rifle = 2,
	)

/datum/human_ai_squad_preset/covenant/specops_unggoy_pair_cloaked
	name = "Special Operations Unggoy Pair !!CLOAKED!!"
	desc = "A duo of Special Operations Unggoy, both equipped with plasma rifles. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/specops/cloaking = 2,
	)

/datum/human_ai_squad_preset/covenant/specops_unggoy_pair_ultra
	name = "Special Operations Unggoy Pair (Ultra)"
	desc = "A duo of Special Operations Unggoy, both equipped with plasma rifles."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/specops_ultra/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/specops/plasma_rifle = 1,
	)

/datum/human_ai_squad_preset/covenant/specops_unggoy_pair_ultra_cloaked
	name = "Special Operations Unggoy Pair (Ultra) !!CLOAKED!!"
	desc = "A duo of Special Operations Unggoy, one of which an Ultra, both equipped with plasma rifles. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/specops_ultra/cloaking = 1,
		/datum/equipment_preset/covenant/unggoy/specops/cloaking = 1,
	)

/datum/human_ai_squad_preset/covenant/specops_elite_team
	name = "Special Operations Lance Command Team"
	desc = "A Special Operations Sangheili paired with a Special Operations Unggoy, with a plasma rifle and needler respectively. Typically found leading a Special Operations Lance."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/specops/needler = 1,
	)

/datum/human_ai_squad_preset/covenant/specops_elite_team_cloaked
	name = "Special Operations Lance Command Team !!CLOAKED!!"
	desc = "A Special Operations Sangheili paired with a Special Operations Unggoy, both with plasma rifles. Typically found leading a Special Operations Lance. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops/cloaking = 1,
		/datum/equipment_preset/covenant/unggoy/specops/cloaking = 1,
	)

/datum/human_ai_squad_preset/covenant/specops_elite_ultra_team
	name = "Special Operations Ultra Taskforce"
	desc = "A Special Operations Sangheili paired with two Special Operations Unggoy Ultras."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/specops_ultra/plasma_rifle = 2,
	)

/datum/human_ai_squad_preset/covenant/specops_elite_ultra_team_cloaked
	name = "Special Operations Ultra Taskforce !!CLOAKED!!"
	desc = "A Special Operations Sangheili paired with two Special Operations Unggoy Ultras. Cloaked."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/specops_ultra/cloaking = 1,
		/datum/equipment_preset/covenant/unggoy/specops_ultra/cloaking = 2,
	)
