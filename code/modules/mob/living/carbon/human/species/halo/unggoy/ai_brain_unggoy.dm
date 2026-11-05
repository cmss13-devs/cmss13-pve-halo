/datum/human_ai_brain/unggoy/on_squad_member_death(mob/living/carbon/human/dead_member, datum/cause_data/cause_data)
	var/datum/human_ai_squad/squad = SShuman_ai.squad_id_dict["[squad_id]"]
	var/list/living_squadmates = squad.ai_in_squad.Copy()
	for(var/datum/human_ai_brain/squaddie as anything in living_squadmates)
		if(squaddie.tied_human.is_mob_incapacitated())
			living_squadmates -= squaddie
	var/turf/run_from = get_turf(cause_data.resolve_mob())
	if(length(living_squadmates) == 1)
		run_away(run_from)
