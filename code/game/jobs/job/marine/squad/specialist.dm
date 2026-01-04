#define PFC_VARIANT "Private First Class"
#define LCPL_VARIANT "Lance Corporal"

/datum/job/marine/specialist
	title = JOB_SQUAD_SPECIALIST
	total_positions = 4
	spawn_positions = 4
	allow_additional = 1
	scaled = 1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/unsc/spec
	gear_preset_secondary = /datum/equipment_preset/unsc/spec/lesser_rank
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>You are the very rare and valuable weapon expert</a>, trained to use special equipment. You can serve a variety of roles, so choose carefully."
	job_options = list(LCPL_VARIANT = "LCPL", PFC_VARIANT = "PFC")

/datum/job/marine/specialist/set_spawn_positions(count)
	spawn_positions = spec_slot_formula(count)

/datum/job/marine/specialist/handle_job_options(option)
	if(option != LCPL_VARIANT)
		gear_preset = gear_preset_secondary
	else
		gear_preset = initial(gear_preset)

/datum/job/marine/specialist/get_total_positions(latejoin = 0)
	var/positions = spawn_positions
	if(latejoin)
		positions = spec_slot_formula(get_total_marines())
		if(positions <= total_positions_so_far)
			positions = total_positions_so_far
		else
			total_positions_so_far = positions
	else
		total_positions_so_far = positions
	return positions

/datum/job/marine/specialist/on_cryo(mob/living/carbon/human/cryoing)
	var/specialist_set = get_specialist_set(cryoing)
	if(isnull(specialist_set))
		return
	GLOB.specialist_set_datums[specialist_set].refund_set(cryoing)

/datum/job/marine/specialist/whiskey
	title = JOB_WO_SQUAD_SPECIALIST
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/spec

/obj/effect/landmark/start/marine/spec
	name = JOB_SQUAD_SPECIALIST
	icon_state = "spec_spawn"
	job = /datum/job/marine/specialist

/obj/effect/landmark/start/marine/spec/alpha
	icon_state = "spec_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/spec/bravo
	icon_state = "spec_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/spec/charlie
	icon_state = "spec_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/spec/delta
	icon_state = "spec_spawn_delta"
	squad = SQUAD_MARINE_4

/obj/effect/landmark/start/marine/spec/odst
	name = JOB_SQUAD_SPECIALIST_ODST
	squad = SQUAD_ODST
	job = /datum/job/marine/specialist/ai/odst

/datum/job/marine/specialist/ai
	total_positions = 2
	spawn_positions = 2

/datum/job/marine/specialist/ai/odst
	title = JOB_SQUAD_SPECIALIST_ODST
	gear_preset = /datum/equipment_preset/unsc/spec/odst
	gear_preset_secondary = /datum/equipment_preset/unsc/spec/odst/lesser_rank

/datum/job/marine/specialist/ai/set_spawn_positions(count)
	return spawn_positions

/datum/job/marine/specialist/ai/get_total_positions(latejoin = 0)
	return latejoin ? total_positions : spawn_positions

#undef PFC_VARIANT
#undef LCPL_VARIANT
