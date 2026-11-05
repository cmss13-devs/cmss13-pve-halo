/obj/docking_port/mobile/oni_elevator
	name="ONI Elevator"
	id=MOBILE_ONI_ELEVATOR

	// Map information
	height=6
	width=6
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/slade_point/elevator/oni_elevator

	// Shuttle timings
	callTime = 30 SECONDS
	rechargeTime = 30 SECONDS
	ignitionTime = 5 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control
	var/elevator_network

/obj/docking_port/mobile/oni_elevator/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "elevator"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			if(istype(door, /obj/structure/machinery/door/poddoor/filler_object)) //poddoor filler was sneaking in
				continue
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/oni_elevator/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/oni_elevator/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/oni_elevator
	dir=NORTH
	width=6
	height=6
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit
	var/elevator_network = "oni"

/obj/docking_port/stationary/oni_elevator/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/oni_elevator/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/oni_elevator))
		var/obj/docking_port/mobile/oni_elevator/elevator = arriving_shuttle
		elevator.door_control.control_doors("unlock", "oni", TRUE)
		elevator.door_control.control_doors("open", "oni", TRUE)

	// open dock doors
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("unlock", "oni", TRUE)
	door_control.control_doors("open", "oni", TRUE)
	qdel(door_control)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/oni_elevator/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/oni_elevator/occupied
	name = "occupied"
	id = STAT_ONI_OCCUPIED
	airlock_exit = "oni"
	roundstart_template = /datum/map_template/shuttle/slade_point/oni_elevator

/obj/docking_port/stationary/oni_elevator/empty
	name = "empty"
	id = STAT_ONI_EMPTY
	airlock_exit = "oni"

/obj/docking_port/stationary/oni_elevator/arrival
	name = "Alpha Site Entrance"
	id=STAT_ONI_ELEVATOR
	airlock_area = /area/slade_point/elevator/oni_elevator/entry
	airlock_exit = "oni"
	roundstart_template = /datum/map_template/shuttle/slade_point/oni_elevator

/obj/docking_port/stationary/oni_elevator/exit
	name = "Data Center - Sublevel 7"
	id=STAT_ONI_ELEVATOR_EXIT
	airlock_area = /area/slade_point/elevator/oni_elevator/exit
	airlock_exit = "oni"

/datum/map_template/shuttle/slade_point/oni_elevator/post_load(obj/docking_port/mobile/M)
	. = ..()
	var/datum/map_template/shuttle/slade_point/oni_elevator/elev = M
	elev.elevator_network = elevator_network
	log_debug("Adding network [elevator_network] to [M.id]")

/area/slade_point/elevator/oni_elevator/entry
/area/slade_point/elevator/oni_elevator/exit

/obj/structure/machinery/computer/shuttle/elevator_controller/oni_elevator/get_landing_zones()
	. = list()
	var/obj/docking_port/mobile/oni_elevator/shuttle = SSshuttle.getShuttle(shuttleId)

	for(var/obj/docking_port/stationary/oni_elevator/elev in SSshuttle.stationary)
		if(!shuttle.elevator_network)
			. += list(elev)
			continue
		if(shuttle.elevator_network == elev.elevator_network)
			. += list(elev)
			continue

/obj/structure/machinery/computer/shuttle/elevator_controller/oni_elevator/elevator_call
	name = "\improper Elevator Call"
	desc = "Control panel for the elevator."
	shuttleId = MOBILE_ONI_ELEVATOR
	is_call = TRUE
	var/dockId
	var/datum/elevator/destination/site

/obj/structure/machinery/computer/shuttle/elevator_controller/oni_elevator/elevator_call/get_landing_zones()
	return list(SSshuttle.getDock(dockId))

/obj/structure/machinery/computer/shuttle/elevator_controller/oni_elevator/elevator_call/oni_elevator/occupied
	dockId = STAT_ONI_OCCUPIED

/obj/structure/machinery/computer/shuttle/elevator_controller/oni_elevator/elevator_call/oni_elevator/empty
	dockId = STAT_ONI_EMPTY

/obj/structure/machinery/computer/shuttle/elevator_controller/oni_elevator/elevator_call/oni_elevator/arrival
	dockId = STAT_ONI_ELEVATOR

/obj/structure/machinery/computer/shuttle/elevator_controller/oni_elevator/elevator_call/oni_elevator/exit
	dockId = STAT_ONI_ELEVATOR_EXIT
