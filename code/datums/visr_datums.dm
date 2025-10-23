/datum/visr
	var/friendly_color = COLOR_LIGHT_GREEN
	var/neutral_color = COLOR_VERY_SOFT_YELLOW
	var/enemy_color = COLOR_LASER_RED
	var/object_color = LIGHT_COLOR_BLUE
	var/objective_color = COLOR_YELLOW

	var/list/friendly_factions = list(FACTION_UNSC, FACTION_UEG_POLICE)
	var/list/enemy_factions = list(FACTION_COVENANT, FACTION_INSURGENT)
	var/nvg_level = 4

/datum/visr/covenant
	friendly_color = COLOR_PLASMA_TEAL
	friendly_factions = list(FACTION_COVENANT)
	enemy_factions = list(FACTION_LIST_HUMANOID)
