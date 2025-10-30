GLOBAL_LIST_INIT(blocked_droppod_tiles, typecacheof(list(/turf/open/space/transit, /turf/open/space))) // Don't drop at these tiles.


/obj/structure/halo_droppod
	name = "\improper M8823 HEV drop pod"
	health = 4000 //Hopefully immune to most things. Probably not.
	icon = 'icons/halo/obj/structures/drop_pod.dmi'
	icon_state = "drop_pod"
	layer = 5.1
	pixel_x = -16
	density = TRUE

// Vars that are important when interacting with the pod as a player
	var/gm_locked = TRUE // whether or not the pod is locked to only be able to be controlled by the gm
	var/locked = FALSE // if the pod is locked and unable to be opened
	var/closed = TRUE
	var/can_launch = TRUE
	var/pod_state = POD_READY

// Vars of importance when launching
	var/landing_scatter = 5 // Scatter from the landing point
	var/time_to_drop = 5 SECONDS // Time it takes to launch when firing
	var/time_to_land = 22 SECONDS // time it takes from launching to reach the ground
	var/landing_time = 1 SECONDS
	var/target_x = 1
	var/target_y = 1
	var/target_z = 2

// failure vars
	var/failure_chance = 10
	var/failure_type

// other vars
	var/image/occupant_image
	var/image/door_image
	var/overlay_icon_state = "pod_overlay"
	var/door_icon_state = "pod_door"
	var/occupant_angle = -90
	var/occupant_x = 16
	var/occupant_y = 10
	var/occupant_dir = 2
	var/mob/living/occupant
	var/door_delay = 2 SECONDS
	COOLDOWN_DECLARE(door_cooldown)
	var/datum/turf_reservation/reservation

/obj/structure/halo_droppod/Initialize()
	. = ..()
	handle_overlays()


/obj/structure/halo_droppod/proc/handle_overlays(mob/living/user)
	overlays.Cut()
	if(closed)
		door_icon_state = "[initial(door_icon_state)]"
	if(!closed)
		door_icon_state = "[initial(door_icon_state)]_open"
	var/door_image = image(src.icon, loc, door_icon_state, 5.5)
	overlays += door_image
	var/pod_overlay = image(src.icon, loc, overlay_icon_state, 5.4)
	overlays += pod_overlay
	if(occupant && user)
		occupant_image = image(user.appearance, loc, layer = 5.2)
		occupant_image.pixel_x = occupant_x
		occupant_image.pixel_y = occupant_y
		occupant_image.dir = occupant_dir
		if(user.body_position == LYING_DOWN)
			occupant_image.transform = occupant.transform.Turn(occupant_angle)
		overlays += occupant_image

/obj/structure/halo_droppod/proc/toggle_door(mob/living/user)
	if(closed)
		if(user)
			visible_message(SPAN_NOTICE("[user] pulls a lever and opens the [src]s door."), SPAN_NOTICE("You pull a lever and open the [src]s door."))
		playsound(src, 'sound/effects/odst_pod/pod_door_open.ogg')
		closed = FALSE
		handle_overlays(user)
		return
	if(!closed)
		visible_message(SPAN_NOTICE("[user] pulls a lever and closes the [src]s door."), SPAN_NOTICE("You pull a lever and close the [src]s door."))
		playsound(src, 'sound/effects/odst_pod/pod_door_close.ogg')
		closed = TRUE
		handle_overlays(user)
		return

/obj/structure/halo_droppod/proc/open_door(mob/living/user)
	if(closed)
		if(user)
			visible_message(SPAN_NOTICE("[user] pulls a lever and opens the [src]s door."), SPAN_NOTICE("You pull a lever and open the [src]s door."))
		playsound(src, 'sound/effects/odst_pod/pod_door_open.ogg')
		closed = FALSE
		handle_overlays(user)
		return

/obj/structure/halo_droppod/proc/close_door(mob/living/user)
	if(!closed)
		if(user)
			visible_message(SPAN_NOTICE("[user] pulls a lever and closes the [src]s door."), SPAN_NOTICE("You pull a lever and close the [src]s door."))
		playsound(src, 'sound/effects/odst_pod/pod_door_close.ogg')
		closed = TRUE
		handle_overlays(user)
		return

/obj/structure/halo_droppod/proc/enter_pod(mob/living/user)
	if(closed)
		if(locked)
			to_chat(user, SPAN_NOTICE("You try to enter the pod, but it's locked."))
			return
		to_chat(user, SPAN_NOTICE("You try to enter the pod, but it's closed."))
		return
	if(occupant)
		to_chat(user, SPAN_NOTICE("There's someone already in the pod."))
		return
	to_chat(user, SPAN_NOTICE("You enter the pod."))

	user.forceMove(src)
	occupant = user
	playsound(src, "droppod_enter")
	addtimer(CALLBACK(src, PROC_REF(close_door), user), 2.5 SECONDS)
	handle_overlays(user)

/obj/structure/halo_droppod/proc/exit_pod(mob/living/user)
	if(closed)
		open_door(user)
	if(!occupant)
		return
	var/turf/exit_turf = get_step(src, SOUTH)
	occupant.forceMove(get_turf(exit_turf))
	occupant = null
	to_chat(user, SPAN_NOTICE("You exit the pod."))
	playsound(src, "droppod_enter")
	handle_overlays(user)

/obj/structure/halo_droppod/attack_hand(mob/living/user)
	if(!COOLDOWN_FINISHED(src, door_cooldown))
		return
	if(locked)
		to_chat(user, SPAN_NOTICE("You try to open the pod, but it's locked."))
		return
	if(occupant)
		to_chat(user, SPAN_NOTICE("You try to open the pod, but it's locked from the inside."))
		return
	toggle_door(user)
	COOLDOWN_START(src, door_cooldown, door_delay)

/obj/structure/halo_droppod/MouseDrop_T(mob/target, mob/user)
	. = ..()
	if(ishuman(target))
		visible_message(SPAN_NOTICE("[user] begins to enter the [src]."), SPAN_NOTICE("You begin to enter the [src]."))
		if(!do_after(user, 3 SECONDS, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_GENERIC, target, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_GENERIC))
			to_chat(user, SPAN_NOTICE("You are interrupted!"))
		enter_pod(target)
	else
		to_chat(user, SPAN_NOTICE("[target] cannot enter the pod."))

// ============== CODE TO DROP ==============

/obj/structure/halo_droppod/return_temperature()
	if(loc)
		return 290

/obj/structure/halo_droppod/proc/set_target(mob/living/user, new_x, new_y)
	target_x = new_x
	target_y = new_y
	var/mob/notified_user = LAZYACCESS(occupant, 1)
	. = checklanding(notified_user)
	if(notified_user && .)
		to_chat(user, SPAN_NOTICE("Coordinates set!"))

/obj/structure/halo_droppod/proc/checklanding(mob/living/user, optional_turf)
	var/turf/target = optional_turf ? optional_turf : locate(target_x, target_y, target_z)
	if(target.density)
		if(user)
			to_chat(user, SPAN_NOTICE("Dense area!"))
		return FALSE
	if(is_type_in_typecache(target, GLOB.blocked_droppod_tiles))
		if(user)
			to_chat(user, SPAN_NOTICE("Hazardous area!"))
		return FALSE
	var/area/targetarea = get_area(target)
	if(targetarea.no_droppod) // Thou shall not pass!
		if(user)
			to_chat(user, SPAN_NOTICE("Invalid area!"))
		return FALSE
	if(targetarea.ceiling > CEILING_METAL)
		if(user)
			to_chat(user, SPAN_NOTICE("Area underground!"))
		return FALSE
	for(var/atom/movable/object in target.contents)
		if(object.density)
			if(user)
				to_chat(user, SPAN_NOTICE("Dense object detected!"))
			return FALSE
	return TRUE

/obj/structure/halo_droppod/proc/find_new_target(mob/user)
	var/turf/turf_1 = locate(target_x + landing_scatter, target_y + landing_scatter, target_z)
	var/turf/turf_2 = locate(target_x - landing_scatter, target_y - landing_scatter, target_z)
	var/list/block = block(turf_1, turf_2)
	shuffle_inplace(block)
	for(var/turf/attemptdrop in block)
		if(!checklanding(optional_turf = attemptdrop))
			continue
		return attemptdrop

	if(user)
		to_chat(user, SPAN_WARNING("RECALCULATION FAILED!"))
	return locate(target_x, target_y, target_z) //no other alt spots found, we return our orig

/obj/structure/halo_droppod/proc/start_launch_pod(mob/user, commanded_drop = FALSE)
	if(!occupant)
		return

	// if(!locate(/obj/structure/drop_pod_launcher) in get_turf(src))
	//	if(user)
	//		to_chat(user, SPAN_NOTICE("Error. Cannot launch [src] without a droppod launcher."))
	//	return

	if(pod_state != POD_READY)
		if(user)
			to_chat(user, SPAN_NOTICE("Error. Unable to drop."))
		return

	var/turf/target = locate(target_x, target_y, target_z)
	if(!commanded_drop) //we randomise the landing slightly, its already randomised for mass launch
		target = find_new_target()
		target_x = target.x
		target_y = target.y

	if(!checklanding(user))
		return

	for(var/mob/podder in occupant)
		podder.forceMove(src)

	if(user)
		log_game("[key_name(user)] launched pod [src] at [AREACOORD(target)]")

	pod_state = POD_INFLIGHT
	update_icon()
	flick("[icon_state]_closing", src)
	addtimer(CALLBACK(src, PROC_REF(launch_pod), user), 2.5 SECONDS)

/obj/structure/halo_droppod/proc/launch_pod(mob/user)
	if(!can_launch)
		return

	playsound(src, 'sound/effects/escape_pod_launch.ogg', 70)
	playsound(src, 'sound/effects/escape_pod_launch.ogg', 70)
	reservation = SSmapping.request_turf_block_reservation(3, 3, 1, turf_type_override = /turf/open/space/transit/drop_pod)
	var/turf/bottom_left_turf = reservation.bottom_left_turfs[1]
	var/turf/top_right_turf = reservation.top_right_turfs[1]
	var/middle_x = bottom_left_turf.x + floor((top_right_turf.x - bottom_left_turf.x) / 2)
	var/middle_y = bottom_left_turf.y + floor((top_right_turf.y - bottom_left_turf.y) / 2)
	var/turf/selectedturf = locate(middle_x, middle_y, bottom_left_turf.z)
	if(!selectedturf)
		CRASH("No droppod free turf found")
	forceMove(selectedturf)
	addtimer(CALLBACK(src, PROC_REF(finish_drop), user, selectedturf), time_to_land)

/obj/structure/halo_droppod/proc/finish_drop(mob/user, turf/reservedturf)
	var/turf/targetturf = locate(target_x, target_y, target_z)
	for(var/atom/target in targetturf.contents)
		if(!target.density)
			continue
		if(user)
			to_chat(user, SPAN_WARNING("WARNING! TARGET ZONE OCCUPIED! EVADING!"))
		targetturf = find_new_target(user)
		break
	forceMove(targetturf)
	pixel_z = 500
	animate(src, pixel_z = initial(pixel_z), time = landing_time, easing = LINEAR_EASING)
	addtimer(CALLBACK(src, PROC_REF(do_drop), targetturf, user), landing_time)

/obj/structure/halo_droppod/proc/do_drop(turf/targetturf, mob/user)
	var/datum/cause_data/cause_data = create_cause_data("[src]", user)
	explosion(targetturf, light_impact_range = 2, explosion_cause_data = cause_data)
	playsound(targetturf, "droppod_land", 100)
	addtimer(CALLBACK(src, PROC_REF(complete_drop), user), 2 SECONDS)

/obj/structure/halo_droppod/proc/complete_drop(mob/user)
	pod_state = POD_LANDED
	exit_pod(user)
	update_icon()
