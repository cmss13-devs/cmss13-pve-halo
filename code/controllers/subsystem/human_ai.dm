
SUBSYSTEM_DEF(human_ai)
	name = "Human AI"
	priority = SS_PRIORITY_HUMAN_AI
	flags = SS_NO_INIT
	wait = 0.2 SECONDS
	/// A list of mobs scheduled to process
	var/list/mob/living/carbon/human/ai/current_run = list()

	var/ai_kill = FALSE

	/// List of current squads
	var/list/datum/human_ai_squad/squads = list()

	/// Dict of "id" : squad
	var/list/squad_id_dict = list()

	/// The current highest ID of any squad
	var/highest_squad_id = 0

	/// List of all existing orders
	var/list/datum/ongoing_action/existing_orders = list()

/datum/controller/subsystem/human_ai/stat_entry(msg)
	msg = "P:[length(GLOB.human_ai_brains)]"
	return ..()

/datum/admins/proc/toggle_human_ai()
	set name = "Toggle Human AI"
	set category = "Debug.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	SShuman_ai.ai_kill = !SShuman_ai.ai_kill
	message_admins("[key_name_admin(usr)] [SShuman_ai.ai_kill? "killed" : "revived"] all human AI.")

/datum/controller/subsystem/human_ai/fire(resumed = FALSE)
	if(ai_kill)
		return

	if(!resumed)
		src.current_run = GLOB.human_ai_brains.Copy()
	// Cache for sanic speed (lists are references anyways)
	var/list/current_run = src.current_run
	while(length(current_run))
		var/datum/human_ai_brain/brain = current_run[length(current_run)]
		current_run.len--
		if(!QDELETED(brain) && !brain.tied_human?.client)
			brain.process(wait * 0.1)

		if(MC_TICK_CHECK)
			return

/datum/controller/subsystem/human_ai/proc/create_new_squad()
	highest_squad_id++
	var/datum/human_ai_squad/new_squad = new
	squads += new_squad
	squad_id_dict["[highest_squad_id]"] = new_squad

/datum/controller/subsystem/human_ai/proc/get_squad(squad_id)
	RETURN_TYPE(/datum/human_ai_squad)

	if(!squad_id || !(squad_id in squad_id_dict))
		return null
	return squad_id_dict[squad_id]

/datum/controller/subsystem/human_ai/proc/create_new_order(datum/ongoing_action/path, ...)
	if(!path::order)
		stack_trace("Action of [path] was attempted to be created as an order.")
	existing_orders += new path(args)
