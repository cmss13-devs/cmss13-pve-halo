/datum/weather_ss_map_holder/cop_brighton
	name = "COP Brighton Map Holder"

	min_time_between_events = 30 MINUTES
	no_weather_turf_icon_state = "strata_clearsky"

	potential_weather_events = list(
		/datum/weather_event/snow/infinite,
	)

/datum/weather_ss_map_holder/cop_brighton/should_affect_area(area/A)
	return !CEILING_IS_PROTECTED(A.ceiling, CEILING_GLASS)

/datum/weather_ss_map_holder/cop_brighton/should_start_event()
	if (prob(PROB_WEATHER_COP_BRIGHTON))
		return TRUE
	return FALSE
