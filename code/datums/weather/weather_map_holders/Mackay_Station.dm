/datum/weather_ss_map_holder/mackay_station
	name = "Mackay Station Map Holder"

	warn_time = 1 MINUTES
	min_time_between_events = 30 MINUTES
	min_time_between_checks = 0
	min_check_variance = 0

	no_weather_turf_icon_state = "strata_clearsky"

/datum/weather_ss_map_holder/mackay_station/should_affect_area(area/A)
	return !CEILING_IS_PROTECTED(A.ceiling, CEILING_GLASS)

/datum/weather_ss_map_holder/mackay_station/should_start_event()
	return TRUE
