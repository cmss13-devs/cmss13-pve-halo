/datum/squad_type/covenant_lance
	name = "Lance"
	lead_name = "Lance Leader"
	lead_icon = "leader"
	sub_squad = "Levy"
	sub_leader = "Levy Leader"

/datum/squad/marine/covenant
	name = SQUAD_COVENANT
	equipment_color = "#5070D3"
	chat_color = "#5070D3"
	access = list(ACCESS_UPP_GENERAL)
	radio_freq = COV_SQ1_FREQ
	minimap_color = MINIMAP_SQUAD_CHARLIE
	use_stripe_overlay = FALSE
	usable = TRUE
	faction = FACTION_COVENANT
	squad_type = "Lance"

/datum/squad/marine/covenant_2
	name = SQUAD_COVENANT_2
	equipment_color = "#D1479F"
	chat_color = "#D1479F"
	access = list(ACCESS_UPP_GENERAL)
	radio_freq = COV_SQ2_FREQ
	minimap_color = MINIMAP_SQUAD_CHARLIE
	use_stripe_overlay = FALSE
	usable = TRUE
	faction = FACTION_COVENANT
	squad_type = "Lance"
