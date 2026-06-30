/datum/human_ai_brain/unggoy/on_squad_member_death(mob/living/carbon/human/dead_member, datum/cause_data/cause_data)
	var/datum/human_ai_squad/squad = SShuman_ai.squad_id_dict["[squad_id]"]
	var/list/living_squadmates = squad.ai_in_squad.Copy()
	for(var/datum/human_ai_brain/squaddie as anything in living_squadmates)
		if(squaddie.tied_human.is_mob_incapacitated())
			living_squadmates -= squaddie
	var/turf/run_from = get_turf(cause_data.resolve_mob())
	if(length(living_squadmates) == 1)
		run_away(run_from)

/datum/human_ai_brain/unggoy/proc/run_away(turf/running_from)
	var/running_range = 12
	if(!running_from)
		if(!current_target)
			return
		running_from = get_turf(current_target)
	var/turf/origin_turf = get_turf(tied_human)
	var/run_dir = make_dir_cardinal(get_dir(running_from, origin_turf))
	var/turf/hor_dir = get_step(origin_turf, run_dir)
	var/turf/left_corner = locate(origin_turf.x - running_range, origin_turf.y - running_range, origin_turf.z)
	var/list/run_turfs = CORNER_OUTLINE(left_corner, 2 * running_range + 1, 2 * running_range + 1)
	var/x_sign = sign(hor_dir.x - origin_turf.x)
	var/y_sign = sign(hor_dir.y - origin_turf.y)
	if(x_sign)
		for(var/turf/run_turf as anything in run_turfs)
			if(sign(run_turf.x - origin_turf.x) == x_sign)
				continue
			run_turfs -= run_turf
	if(y_sign)
		for(var/turf/run_turf as anything in run_turfs)
			if(sign(run_turf.y - origin_turf.y) == y_sign)
				continue
			run_turfs -= run_turf
#ifdef TESTING
	for(var/turf/highlight as anything in run_turfs)
		highlight.color = COLOR_RED
#endif
	var/search_interations = 0
	while(search_interations <= 10)
		var/turf/checking_turf = pick(run_turfs)
#ifdef TESTING
		checking_turf.color = COLOR_ORANGE
#endif
		if(checking_turf.density || istype(checking_turf, /turf/open/space))
			run_turfs -= checking_turf
			search_interations++
			continue
		for(var/obj/obstruction as anything in checking_turf.contents)
			if(obstruction.density)
				run_turfs -= checking_turf
				search_interations++
				continue
		if(move_to_next_turf(checking_turf))
			quick_approach = checking_turf
			exit_combat()
#ifdef TESTING
			checking_turf.color = COLOR_GREEN
#endif
			return TRUE
		else
			run_turfs -= checking_turf
			search_interations++
			continue

	return



