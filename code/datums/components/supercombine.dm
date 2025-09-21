/datum/component/supercombine
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS
	var/needles_to_supercombine = 20
	var/supercombine_dissipation = 1
	var/needles
	var/time_to_dissipate = 3 SECONDS
	var/shooter
	var/direction
	var/mob/living/carbon/parent_carbon
	COOLDOWN_DECLARE(delay_to_dissipation)

/datum/component/supercombine/Initialize(needles, shooter, direction, needles_to_supercombine = 20, supercombine_dissipation = 2)
	. = ..()
	if(!iscarbon(parent))
		return
	src.needles = needles
	src.needles_to_supercombine = needles_to_supercombine
	src.supercombine_dissipation = supercombine_dissipation
	src.shooter = shooter
	src.direction = direction

/datum/component/supercombine/InheritComponent(datum/component/supercombine/supercombine_new, i_am_original, amount = 1)
	. = ..()
	parent_carbon = parent
	if(!supercombine_new)
		needles += amount
	else
		needles += supercombine_new.needles
	COOLDOWN_START(src, delay_to_dissipation, time_to_dissipate)
	if(needles >= needles_to_supercombine)
		var/turf/turf = get_turf(parent_carbon)
		var/cause_data = create_cause_data("supercombine explosion", shooter)
		cell_explosion(turf, 50, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, direction, cause_data)
		flick_overlay(parent_carbon, image('icons/halo/effects/supercombine.dmi', null, "supercombine"), 3)
		playsound(parent_carbon, 'sound/effects/halo/supercombine.ogg')
		src.needles = 0

/datum/component/supercombine/process(delta_time)
	if(COOLDOWN_FINISHED(src, delay_to_dissipation))
		needles = max(needles - supercombine_dissipation * delta_time, 0)
	if(needles <= 0)
		UnregisterFromParent()

/datum/component/supercombine/RegisterWithParent()
	START_PROCESSING(SSdcs, src)

/datum/component/supercombine/UnregisterFromParent()
	STOP_PROCESSING(SSdcs, src)
	needles = 0
