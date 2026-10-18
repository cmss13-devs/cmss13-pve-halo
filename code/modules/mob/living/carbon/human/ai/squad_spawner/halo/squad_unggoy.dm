/datum/human_ai_squad_preset/covenant/unggoy
	faction = FACTION_UNGGOY

/datum/human_ai_squad_preset/covenant/unggoy/unggoy_pair
	name = "Pair (Unggoy)"
	desc = "A pair of Unggoy Minors, both armed with plasma pistols."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 2,
	)

/datum/human_ai_squad_preset/covenant/unggoy/unggoy_levy
	name = "Levy (Unggoy)"
	desc = "A Covenant Levy is the equivalent of a fireteam in their military. Two Minors and one Major, all armed with plasma pistols."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/major/plasma_pistol = 1,
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 2,
	)

/datum/human_ai_squad_preset/covenant/unggoy/unggoy_levy_heavy
	name = "Levy (Heavy, Unggoy)"
	desc = "One Major and Minor with plasma pistols, and a Heavy with a plasma rifle."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/major/plasma_pistol = 1,
		/datum/equipment_preset/covenant/unggoy/heavy/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 1,
	)

/datum/human_ai_squad_preset/covenant/unggoy/unggoy_levy_ultra
	name = "Levy (Ultra, Unggoy)"
	desc = "An Ultra armed with a plasma rifle, accompanied by one Major with a needler and one Minor with a plasma pistol."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/unggoy/ultra/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/major/needler = 1,
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 1,
	)

/datum/human_ai_squad_preset/covenant/unggoy/lance_leader
	name = "Lance Command Team (Unggoy)"
	desc = "The command team of a Covenant Unggoy Lance, the equivalent of a squad in the Covenant military. One Sangheili armed with a plasma rifle accompanied by an Unggoy Ultra with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/minor/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/ultra/needler = 1,
	)

/datum/human_ai_squad_preset/covenant/unggoy/sangheili_major_levy
	name = "Sangheili Major Team (Unggoy)"
	desc = "Often put in charge of several lances of Sangheili or heavy pieces of equipment. One Sangheili Major with a plasma rifle accompanied by an Unggoy Ultra with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/major/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/ultra/needler = 1,
	)

/datum/human_ai_squad_preset/covenant/unggoy/sangheili_ultra_levy
	name = "Sangheili Ultra Team (Unggoy)"
	desc = "Typically serving as military advisors or operating on independent missions, Ultras are often found together. Sangheili Ultra and Unggoy Ultra equipped with plasma rifles, as well as an Unggoy Ultra with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/ultra/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/ultra/needler = 1,
		/datum/equipment_preset/covenant/unggoy/ultra/plasma_rifle = 1,
	)
