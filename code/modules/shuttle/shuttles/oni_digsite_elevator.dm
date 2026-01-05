/obj/docking_port/mobile/digsite_elevator
	name="Digsite_Elevator"
	id=MOBILE_DIGSITE_ELEVATOR

	// Map information
	height=6
	width=8
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/oni_digsite/elevator/digsite_elevator

	// Shuttle timings
	callTime = 30 SECONDS
	rechargeTime = 30 SECONDS
	ignitionTime = 5 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control
	var/elevator_network

/obj/docking_port/mobile/digsite_elevator/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "elevator"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			if(istype(door, /obj/structure/machinery/door/poddoor/filler_object)) //poddoor filler was sneaking in
				continue
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/digsite_elevator/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/digsite_elevator/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/digsite_elevator
	dir=NORTH
	width=6
	height=4
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit
	var/elevator_network = "tram_golf"

/obj/docking_port/stationary/digsite_elevator/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/digsite_elevator/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/digsite_elevator))
		var/obj/docking_port/mobile/digsite_elevator/elevator = arriving_shuttle
		elevator.door_control.control_doors("unlock", "digsite", TRUE)
		elevator.door_control.control_doors("open", "digsite", TRUE)

	// open dock doors
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("unlock", "digsite", TRUE)
	door_control.control_doors("open", "digsite", TRUE)
	qdel(door_control)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/digsite_elevator/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/digsite_elevator/occupied
	name = "occupied"
	id = STAT_DIGSITE_OCCUPIED
	airlock_exit = "digsite"
	roundstart_template = /datum/map_template/shuttle/mackay_station/golf

/obj/docking_port/stationary/digsite_elevator/empty
	name = "empty"
	id = STAT_DIGSITE_EMPTY
	airlock_exit = "digsite"

/obj/docking_port/stationary/digsite_elevator/arrival
	name = "Digsite Entry"
	id=STAT_DIGSITE_ELEVATOR
	airlock_area = /area/oni_digsite/elevator/digsite_elevator
	airlock_exit = "digsite"
	roundstart_template = /datum/map_template/shuttle/mackay_station/golf

/obj/docking_port/stationary/digsite_elevator/exit
	name = "Digsite Exit"
	id=STAT_DIGSITE_ELEVATOR_EXIT
	airlock_area = /area/mackay_station/elevator/digsite_elevator/exit
	airlock_exit = "digsite"

/datum/map_template/shuttle/oni_digsite_451/digsite_elevator/post_load(obj/docking_port/mobile/M)
	. = ..()
	var/datum/map_template/shuttle/oni_digsite_451/digsite_elevator/elev = M
	elev.elevator_network = elevator_network
	log_debug("Adding network [elevator_network] to [M.id]")

/area/oni_digsite/elevator/digsite_elevator/entry
/area/oni_digsite/elevator/digsite_elevator/exit

/obj/structure/machinery/computer/shuttle/elevator_controller/digsite_elevator/get_landing_zones()
	. = list()
	var/obj/docking_port/mobile/digsite_elevator/shuttle = SSshuttle.getShuttle(shuttleId)

	for(var/obj/docking_port/stationary/digsite_elevator/elev in SSshuttle.stationary)
		if(!shuttle.elevator_network)
			. += list(elev)
			continue
		if(shuttle.elevator_network == elev.elevator_network)
			. += list(elev)
			continue

/obj/structure/machinery/computer/shuttle/elevator_controller/digsite_elevator/elevator_call
	name = "\improper Elevator Call"
	desc = "Control panel for the elevator."
	shuttleId = MOBILE_DIGSITE_ELEVATOR
	is_call = TRUE
	var/dockId
	var/datum/elevator/destination/site

/obj/structure/machinery/computer/shuttle/elevator_controller/digsite_elevator/elevator_call/get_landing_zones()
	return list(SSshuttle.getDock(dockId))

/obj/structure/machinery/computer/shuttle/elevator_controller/digsite_elevator/elevator_call/sdigsite_elevator/occupied
	dockId = STAT_DIGSITE_OCCUPIED

/obj/structure/machinery/computer/shuttle/elevator_controller/digsite_elevator/elevator_call/digsite_elevator/empty
	dockId = STAT_DIGSITE_EMPTY

/obj/structure/machinery/computer/shuttle/elevator_controller/digsite_elevator/elevator_call/digsite_elevator/arrival
	dockId = STAT_DIGSITE_ELEVATOR

/obj/structure/machinery/computer/shuttle/elevator_controller/digsite_elevator/elevator_call/digsite_elevator/exit
	dockId = STAT_DIGSITE_ELEVATOR_EXIT
