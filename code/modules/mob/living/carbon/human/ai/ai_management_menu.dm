/datum/human_ai_management_menu

/datum/human_ai_management_menu/New()

/datum/human_ai_management_menu/proc/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "HumanAIManager")
		ui.open()

/datum/human_ai_management_menu/ui_state(mob/user)
	return GLOB.admin_state

/datum/human_ai_management_menu/ui_data(mob/user)
	var/list/data = list()

	//data["on_cooldown"] = !COOLDOWN_FINISHED(src, panel_emote_cooldown)

	return data

/datum/human_ai_management_menu/ui_static_data(mob/user)
	var/list/data = list()

	data["orders"] = list()
	for(var/datum/ongoing_action/order as anything in SShuman_ai.existing_orders)
		data["orders"] += list(list(
			"name" = order.name,
			"type" = order.type,
			"data" = order.tgui_data(),
			"ref" = REF(order),
		)
	)

	data["ai_humans"] = list()
	for(var/datum/human_ai_brain/brain as anything in GLOB.human_ai_brains)
		if(!brain.tied_human || brain.tied_human.stat == DEAD)
			continue

		data["ai_humans"] += list(list(
			"name" = brain.tied_human.real_name,
			"health" = FLOOR((brain.tied_human.health / brain.tied_human.maxHealth * 100), 1),
			"loc" = list(brain.tied_human.x, brain.tied_human.y, brain.tied_human.z),
			"faction" = brain.tied_human.faction,
			"ref" = REF(brain.tied_human),
			"brain_ref" = REF(brain),
			"in_combat" = brain.in_combat,
			"squad_id" = brain.squad_id,
		))

	data["squads"] = list()
	for(var/datum/human_ai_squad/squad as anything in SShuman_ai.squads)
		var/list/name_list = list()
		for(var/datum/human_ai_brain/brain as anything in squad.ai_in_squad)
			name_list += brain.tied_human?.real_name
		data["squads"] += list(list(
			"id" = squad.id,
			"members" = english_list(name_list),
			"order" = squad.assigned_order?.name,
			"ref" = REF(squad),
			"squad_leader" = squad.squad_leader?.tied_human?.real_name,
		))

	return data

/datum/human_ai_management_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("view_variables")
			if(!params["ref"])
				return

			var/datum/gotten_ref = locate(params["ref"])
			if(!istype(gotten_ref))
				return

			ui.user.client?.debug_variables(gotten_ref)
			return TRUE

		if("create_squad")
			SShuman_ai.create_new_squad()
			update_static_data(usr, ui)
			return TRUE

		if("assign_to_squad")
			if(!params["squad"] || !params["ai"])
				return

			var/datum/brain = locate(params["ai"])
			brain:add_to_squad(params["squad"])
			update_static_data(usr, ui)
			return TRUE

		if("assign_order")
			if(!params["squad"] || !params["order"])
				return

			var/datum/human_ai_squad/squad = SShuman_ai.get_squad("[params["squad"]]")
			squad.set_order(locate(params["order"]))
			update_static_data(usr, ui)
			return TRUE

		if("assign_sl")
			if(!params["squad"] || !params["ai"])
				return

			var/datum/brain = locate(params["ai"])
			var/datum/human_ai_squad/squad = SShuman_ai.get_squad("[params["squad"]]")
			squad.set_squad_leader(brain)
			update_static_data(usr, ui)
			return TRUE

		if("refresh")
			update_static_data(usr, ui)
			return TRUE

/client/proc/open_human_ai_management_panel()
	set name = "Human AI Management Panel"
	set category = "Debug.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	if(human_ai_menu)
		human_ai_menu.ui_interact(mob)
		return

	human_ai_menu = new /datum/human_ai_management_menu(src)

/client/proc/create_human_ai()
	set name = "Create Human AI"
	set category = "Debug.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	var/mob/living/carbon/human/ai/ai_human = new()
	cmd_admin_dress_human(ai_human)
	ai_human.forceMove(get_turf(mob))