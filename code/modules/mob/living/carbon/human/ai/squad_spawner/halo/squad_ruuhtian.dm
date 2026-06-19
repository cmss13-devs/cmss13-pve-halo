/datum/human_ai_squad_preset/covenant/ruuhtian
	faction = FACTION_KIGYAR

/datum/human_ai_squad_preset/covenant/ruuhtian/ruuhtian_pair
	name = "Pair (Ruuhtian)"
	desc = "A pair of Ruuhtian Minors, both armed with plasma pistols."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/ruuhtian/minor/plasma_pistol = 2,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian/ruuhtian_levy
	name = "Levy (Ruuhtian)"
	desc = "A Covenant Levy is the equivalent of a fireteam in their military. Two Minors armed with plasma pistols and one Major armed with a plasma rifle.."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/ruuhtian/major/plasma_rifle = 1,
		/datum/equipment_preset/covenant/ruuhtian/minor/plasma_pistol = 2,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian/ruuhtian_levy_ultra
	name = "Levy (Ultra, Ruuhtian)"
	desc = "An Ultra armed with a plasma rifle, accompanied by one Major with a needler and one Minor with a plasma pistol."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/ruuhtian/ultra/plasma_rifle = 1,
		/datum/equipment_preset/covenant/ruuhtian/major/needler = 1,
		/datum/equipment_preset/covenant/ruuhtian/minor/plasma_pistol = 1,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian/lance_leader
	name = "Lance Command Team (Ruuhtian)"
	desc = "The command team of a Covenant Ruuhtian Lance, the equivalent of a squad in the Covenant military. One Sangheili armed with a plasma rifle accompanied by a Ruuhtian Ultra with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/minor/plasma_rifle = 1,
		/datum/equipment_preset/covenant/ruuhtian/ultra/needler = 1,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian/sangheili_major_levy
	name = "Sangheili Major Team (Ruuhtian)"
	desc = "Often put in charge of several lances of Sangheili or heavy pieces of equipment. One Sangheili Major with a plasma rifle accompanied by a Ruuhtian Ultra with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/major/plasma_rifle = 1,
		/datum/equipment_preset/covenant/ruuhtian/ultra/needler = 1,
	)

/datum/human_ai_squad_preset/covenant/ruuhtian/sangheili_ultra_levy
	name = "Sangheili Ultra Team (Ruuhtian)"
	desc = "Typically serving as military advisors or operating on independent missions, Ultras are often found together. Sangheili Ultra and Ruuhtian Ultra equipped with plasma rifles, as well as a Ruuhtian Ultra with a needler."
	ai_to_spawn = list(
		/datum/equipment_preset/covenant/sangheili/ultra/plasma_rifle = 1,
		/datum/equipment_preset/covenant/ruuhtian/ultra/needler = 1,
		/datum/equipment_preset/covenant/ruuhtian/ultra/plasma_rifle = 1,
	)
