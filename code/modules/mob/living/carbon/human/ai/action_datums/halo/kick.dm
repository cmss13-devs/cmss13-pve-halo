/datum/ai_action/kick
	name = "Walk Kick Sangheili"
	species_restricted = SPECIES_SANGHEILI

/datum/ai_action/kick/get_weight(datum/human_ai_brain/brain)
	if(!brain.current_target)
		return 0

	if(brain.hold_position)
		return 0

	if(brain.sniper_home)
		return 0

	if(!brain.tried_reload && (brain.primary_weapon || length(brain.secondary_weapons)))
		return 0

	return 5

/datum/ai_action/kick/trigger_action()
	. = ..()
	if(!brain.current_target)
		return ONGOING_ACTION_COMPLETED

	if(brain.current_cover && !brain.in_cover)
		return ONGOING_ACTION_COMPLETED

	var/mob/tied_human = brain.tied_human
	if(get_dist(tied_human, brain.current_target) <= 1)
		if(prob(70))
			//tied_human.a_intent_change(INTENT_HARM)
			var/datum/action/human_action/activable/covenant/sangheili_kick/kicking = locate(/datum/action/human_action/activable/covenant/sangheili_kick) in tied_human.actions
			INVOKE_ASYNC(kicking, TYPE_PROC_REF(/datum/action/human_action/activable/covenant/sangheili_kick, use_ability), brain.current_target, tied_human)
			tied_human.face_atom(brain.current_target)

	if(!brain.move_to_next_turf(get_turf(brain.current_target)))
		return ONGOING_ACTION_COMPLETED

	return ONGOING_ACTION_COMPLETED
