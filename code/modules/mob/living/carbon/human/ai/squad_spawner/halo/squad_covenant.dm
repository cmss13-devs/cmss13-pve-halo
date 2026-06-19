/datum/human_ai_squad_preset/covenant
	faction = FACTION_COVENANT

// =====================
// STANDARD COVENANT
// =====================

/datum/human_ai_squad_preset/covenant/pair
	name = "Pair (Mixed)"
	desc = "A pair of Ruuhtian and Unggoy Minors, both armed with plasma pistols."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/ruuhtian/minor/plasma_pistol = 1,
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 1,
	)

/datum/human_ai_squad_preset/covenant/levy
	name = "Levy (Mixed)"
	desc = "A Covenant Levy is the equivalent of a fireteam in their military. Two Minors armed with plasma pistols and one Major armed with a plasma rifle.."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/ruuhtian/major/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 2,
	)

/datum/human_ai_squad_preset/covenant/levy_ultra
	name = "Levy (Ultra, Mixed)"
	desc = "A Ruuhtian Ultra armed with a plasma rifle, accompanied by one Unggoy Major with a needler and one Unggoy Minor with a plasma pistol."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/ruuhtian/ultra/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/major/needler = 1,
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 1,
	)

/datum/human_ai_squad_preset/covenant/sangheili_lance_leader
	name = "Lance Command Team (Mixed)"
	desc = "The command team of a Covenant Ruuhtian Lance, the equivalent of a squad in the Covenant military. One Sangheili armed with a plasma rifle accompanied by an Unggoy Ultra with a needler and a Ruuhtian Minor armed with a plasma pistol."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/minor/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/ultra/needler = 1,
		/datum/equipment_preset/covenant/ruuhtian/minor/plasma_pistol = 1,
	)

/datum/human_ai_squad_preset/covenant/sangheili_major_levy
	name = "Sangheili Major Team (Mixed)"
	desc = "Often put in charge of several lances of Sangheili or heavy pieces of equipment. One Sangheili Major with a plasma rifle accompanied by a Ruuhtian Ultra with a needler and an Unggoy Minor with a plasma pistol."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/major/plasma_rifle = 1,
		/datum/equipment_preset/covenant/ruuhtian/ultra/needler = 1,
		/datum/equipment_preset/covenant/unggoy/minor/plasma_pistol = 1,
	)

/datum/human_ai_squad_preset/covenant/sangheili_ultra_levy
	name = "Sangheili Ultra Team (Mixed)"
	desc = "Typically serving as military advisors or operating on independent missions, Ultras are often found together. Sangheili Ultra and Unggoy Ultra equipped with plasma rifles, as well as a Ruuhtian Ultra with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/ultra/plasma_rifle = 1,
		/datum/equipment_preset/covenant/unggoy/ultra/needler = 1,
		/datum/equipment_preset/covenant/ruuhtian/ultra/plasma_rifle = 1,
	)
