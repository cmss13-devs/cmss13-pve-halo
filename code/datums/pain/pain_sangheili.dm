/datum/pain/sangheili
	max_pain = 225

	threshold_mild = null
	threshold_discomforting = null
	threshold_moderate = null
	threshold_distressing = null
	threshold_severe = null
	threshold_horrible = 200

	feels_pain = TRUE

/datum/pain/sangheili/activate_horrible()
	pain_slowdown = PAIN_SPEED_MED
	new /datum/effects/pain/human/distressing(source_mob)

/datum/pain/sangheili/oxy_kill(mob/living/source)
	return
