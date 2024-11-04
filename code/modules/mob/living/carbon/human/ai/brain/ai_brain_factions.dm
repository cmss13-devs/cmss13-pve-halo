/datum/human_ai_faction
	var/faction = FACTION_NEUTRAL
	VAR_PROTECTED/shoot_to_kill = TRUE

	VAR_PROTECTED/list/in_combat_lines = list()
	VAR_PROTECTED/list/exit_combat_lines = list()
	VAR_PROTECTED/list/squad_member_death_lines = list()
	VAR_PROTECTED/list/grenade_thrown_lines = list()

	VAR_PROTECTED/list/friendly_factions = list()
	VAR_PROTECTED/list/neutral_factions = list()

/datum/human_ai_faction/proc/apply_faction_data(datum/human_ai_brain/brain)
	if(length(in_combat_lines))
		brain.in_combat_lines = in_combat_lines

	if(length(exit_combat_lines))
		brain.exit_combat_lines = exit_combat_lines

	if(length(squad_member_death_lines))
		brain.squad_member_death_lines = squad_member_death_lines

	if(length(grenade_thrown_lines))
		brain.grenade_thrown_lines = grenade_thrown_lines

	brain.shoot_to_kill = shoot_to_kill
	brain.friendly_factions = friendly_factions
	brain.neutral_factions = neutral_factions

/datum/human_ai_faction/proc/reapply_faction_data()
	for(var/datum/human_ai_brain/brain in GLOB.human_ai_brains)
		if(brain.tied_human?.faction == faction)
			apply_faction_data(brain)

/datum/human_ai_faction/proc/add_friendly_faction(faction)
	if(faction in friendly_factions)
		return
	friendly_factions += faction
	if(faction in neutral_factions)
		neutral_factions -= faction
	reapply_faction_data()

/datum/human_ai_faction/proc/add_neutral_faction(faction)
	if(faction in neutral_factions)
		return
	neutral_factions += faction
	if(faction in friendly_factions)
		friendly_factions -= faction
	reapply_faction_data()

/datum/human_ai_faction/proc/remove_friendly_faction(faction)
	if(!(faction in friendly_factions))
		return
	friendly_factions -= faction
	reapply_faction_data()

/datum/human_ai_faction/proc/remove_neutral_faction(faction)
	if(!(faction in neutral_factions))
		return
	neutral_factions -= faction
	reapply_faction_data()

/datum/human_ai_faction/proc/get_friendly_factions()
	return friendly_factions

/datum/human_ai_faction/proc/get_neutral_factions()
	return neutral_factions

/datum/human_ai_faction/proc/set_shoot_to_kill(new_kill = TRUE)
	shoot_to_kill = new_kill
	reapply_faction_data()

/datum/human_ai_faction/proc/get_shoot_to_kill()
	return shoot_to_kill

/datum/human_ai_faction/clf
	faction = FACTION_CLF
	friendly_factions = list(
		FACTION_COLONIST,
	)


/datum/human_ai_faction/uscm
	faction = FACTION_MARINE
	friendly_factions = list(
		FACTION_COLONIST,
		FACTION_TWE,
		FACTION_WY,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_UPP,
		FACTION_MERCENARY,
		FACTION_SURVIVOR,
	)

/datum/human_ai_faction/upp
	faction = FACTION_UPP
	friendly_factions = list(
		FACTION_COLONIST,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MARINE,
		FACTION_MERCENARY,
		FACTION_TWE,
		FACTION_SURVIVOR,
	)
	in_combat_lines = list( // zonenote: tweak these. They're entirely the stereotype of "communist russkie" when we can do better than that. also languages
		"For the UPP!",
		"Die, you animal!",
		"Capitalist dog!",
		"Shoot them!",
		"For glorious Union!",
		"Attacking!",
		"We will bury them!",
		"Uraaaa!!",
		"URAAA!!",
		"To your last breath!",
		"You're worth nothing!",
		"This is the end, for you!",
		"Die!",
		"*warcry",
	)
	exit_combat_lines = list(
		"I need a break...",
		"Phew, that was tough work.",
		"I think we can stop shooting now?",
		"One step closer to victory!",
		"Finally, break time.",
	)
	squad_member_death_lines = list(
		"Man down!",
		"Comrade!!",
		"Get together!",
		"Damn!",
		"Taking hits!",
	)


/datum/human_ai_faction/wy
	faction = FACTION_WY
	friendly_factions = list(
		FACTION_COLONIST,
		FACTION_TWE,
		FACTION_MARINE,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MERCENARY,
		FACTION_SURVIVOR,
	)

/datum/human_ai_faction/wy_deathsquad
	faction = FACTION_WY_DEATHSQUAD
	friendly_factions = list(
		FACTION_WY,
	)
	in_combat_lines = list(
		"Visual confirmed, engaging.",
		"Engaging hostile.",
		"Eliminating hostile.",
		"Engaging.",
		"Contact.",
		"Viscon, proceeding."
	)
	exit_combat_lines = list(
		"Hostilities ceased.",
		"Ceasing engagement."
	)
	squad_member_death_lines = list(
		"Allied unit disabled.",
		"Friendly unit decomissioned.",
		"Allied unit decomissioned.",
		"Friendly unit disabled."
	)
	grenade_thrown_lines = list() // Wouldn't need to call this out
