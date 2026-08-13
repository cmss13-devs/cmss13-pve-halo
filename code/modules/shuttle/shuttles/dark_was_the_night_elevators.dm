/obj/docking_port/mobile/dwtn_cargo_elevator
	name="Cargo Elevator"
	id=MOBILE_DWTN_CARGO_ELEVATOR

	// Map information
	height=6
	width=8
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/dark_was_the_night/cargo_shuttle

	// Shuttle timings
	callTime = 30 SECONDS
	rechargeTime = 30 SECONDS
	ignitionTime = 5 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control
	var/elevator_network

/obj/docking_port/mobile/dwtn_cargo_elevator/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "elevator"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			if(istype(door, /obj/structure/machinery/door/poddoor/filler_object)) //poddoor filler was sneaking in
				continue
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/dwtn_cargo_elevator/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/dwtn_cargo_elevator/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/dwtn_cargo_elevator
	dir=NORTH
	width=8
	height=6
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit
	var/elevator_network = "dwtn_cargo"

/obj/docking_port/stationary/dwtn_cargo_elevator/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/dwtn_cargo_elevator/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/dwtn_cargo_elevator))
		var/obj/docking_port/mobile/dwtn_cargo_elevator/elevator = arriving_shuttle
		elevator.door_control.control_doors("unlock", "dwtn_cargo", TRUE)
		elevator.door_control.control_doors("open", "dwtn_cargo", TRUE)

	// open dock doors
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("unlock", "dwtn_cargo", TRUE)
	door_control.control_doors("open", "dwtn_cargo", TRUE)
	qdel(door_control)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/dwtn_cargo_elevator/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/dwtn_cargo_elevator/occupied
	name = "occupied"
	id = STAT_DWTN_CARGO_OCCUPIED
	airlock_exit = "dwtn_cargo"
	roundstart_template = /datum/map_template/shuttle/dark_was_the_night/cargo

/obj/docking_port/stationary/dwtn_cargo_elevator/empty
	name = "empty"
	id = STAT_DWTN_CARGO_EMPTY
	airlock_exit = "dwtn_cargo"

/obj/docking_port/stationary/dwtn_cargo_elevator/arrival
	name = "Upper Deck"
	id=STAT_DWTN_CARGO_ELEVATOR
	airlock_area = /area/dark_was_the_night/cargo_shuttle/upper
	airlock_exit = "dwtn_cargo"
	roundstart_template = /datum/map_template/shuttle/dark_was_the_night/cargo

/obj/docking_port/stationary/dwtn_cargo_elevator/exit
	name = "Lower Deck"
	id=STAT_DWTN_CARGO_ELEVATOR_EXIT
	airlock_area = /area/dark_was_the_night/cargo_shuttle/lower
	airlock_exit = "dwtn_cargo"

/datum/map_template/shuttle/dark_was_the_night/cargo/post_load(obj/docking_port/mobile/M)
	. = ..()
	var/datum/map_template/shuttle/dark_was_the_night/cargo/elev = M
	elev.elevator_network = elevator_network
	log_debug("Adding network [elevator_network] to [M.id]")

/area/dark_was_the_night/cargo_shuttle/upper
/area/dark_was_the_night/cargo_shuttle/lower

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_cargo_elevator/get_landing_zones()
	. = list()
	var/obj/docking_port/mobile/dwtn_cargo_elevator/shuttle = SSshuttle.getShuttle(shuttleId)

	for(var/obj/docking_port/stationary/dwtn_cargo_elevator/elev in SSshuttle.stationary)
		if(!shuttle.elevator_network)
			. += list(elev)
			continue
		if(shuttle.elevator_network == elev.elevator_network)
			. += list(elev)
			continue

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_cargo_elevator/elevator_call
	name = "\improper Elevator Call"
	desc = "Control panel for the elevator."
	shuttleId = MOBILE_DWTN_CARGO_ELEVATOR
	is_call = TRUE
	var/dockId
	var/datum/elevator/destination/site

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_cargo_elevator/elevator_call/get_landing_zones()
	return list(SSshuttle.getDock(dockId))

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_cargo_elevator/elevator_call/dwtn_cargo_elevator/occupied
	dockId = STAT_DWTN_CARGO_OCCUPIED

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_cargo_elevator/elevator_call/dwtn_cargo_elevator/empty
	dockId = STAT_DWTN_CARGO_EMPTY

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_cargo_elevator/elevator_call/dwtn_cargo_elevator/arrival
	dockId = STAT_DWTN_CARGO_ELEVATOR

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_cargo_elevator/elevator_call/dwtn_cargo_elevator/exit
	dockId = STAT_DWTN_CARGO_ELEVATOR_EXIT



//Ventral Elevator



/obj/docking_port/mobile/dwtn_ventral_elevator
	name="Ventral Cargo Elevator"
	id=MOBILE_DWTN_VENTRAL_ELEVATOR

	// Map information
	height=6
	width=7
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/dark_was_the_night/cargo_shuttle/ventral

	// Shuttle timings
	callTime = 30 SECONDS
	rechargeTime = 30 SECONDS
	ignitionTime = 5 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control
	var/elevator_network

/obj/docking_port/mobile/dwtn_ventral_elevator/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "elevator"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			if(istype(door, /obj/structure/machinery/door/poddoor/filler_object)) //poddoor filler was sneaking in
				continue
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/dwtn_ventral_elevator/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/dwtn_ventral_elevator/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/dwtn_ventral_elevator
	dir=NORTH
	width=7
	height=6
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit
	var/elevator_network = "dwtn_ventral_cargo"

/obj/docking_port/stationary/dwtn_ventral_elevator/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/dwtn_ventral_elevator/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/dwtn_ventral_elevator))
		var/obj/docking_port/mobile/dwtn_ventral_elevator/elevator = arriving_shuttle
		elevator.door_control.control_doors("unlock", "dwtn_ventral_cargo", TRUE)
		elevator.door_control.control_doors("open", "dwtn_ventral_cargo", TRUE)

	// open dock doors
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("unlock", "dwtn_ventral_cargo", TRUE)
	door_control.control_doors("open", "dwtn_ventral_cargo", TRUE)
	qdel(door_control)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/dwtn_ventral_elevator/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/dwtn_ventral_elevator/occupied
	name = "occupied"
	id = STAT_DWTN_VENTRAL_OCCUPIED
	airlock_exit = "dwtn_ventral_cargo"
	roundstart_template = /datum/map_template/shuttle/dark_was_the_night/ventral

/obj/docking_port/stationary/dwtn_ventral_elevator/empty
	name = "empty"
	id = STAT_DWTN_VENTRAL_EMPTY
	airlock_exit = "dwtn_ventral_cargo"

/obj/docking_port/stationary/dwtn_ventral_elevator/arrival
	name = "Upper Deck"
	id=STAT_DWTN_VENTRAL_ELEVATOR
	airlock_area = /area/dark_was_the_night/cargo_shuttle/ventral/upper
	airlock_exit = "dwtn_ventral_cargo"
	roundstart_template = /datum/map_template/shuttle/dark_was_the_night/ventral

/obj/docking_port/stationary/dwtn_ventral_elevator/exit
	name = "Lower Deck"
	id=STAT_DWTN_VENTRAL_ELEVATOR_EXIT
	airlock_area = /area/dark_was_the_night/cargo_shuttle/ventral/lower
	airlock_exit = "dwtn_ventral_cargo"

/datum/map_template/shuttle/dark_was_the_night/cargo/ventral/post_load(obj/docking_port/mobile/M)
	. = ..()
	var/datum/map_template/shuttle/dark_was_the_night/cargo/ventral/elev = M
	elev.elevator_network = elevator_network
	log_debug("Adding network [elevator_network] to [M.id]")

/area/dark_was_the_night/cargo_shuttle/ventral/upper
/area/dark_was_the_night/cargo_shuttle/ventral/lower

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_ventral_elevator/get_landing_zones()
	. = list()
	var/obj/docking_port/mobile/dwtn_ventral_elevator/shuttle = SSshuttle.getShuttle(shuttleId)

	for(var/obj/docking_port/stationary/dwtn_ventral_elevator/elev in SSshuttle.stationary)
		if(!shuttle.elevator_network)
			. += list(elev)
			continue
		if(shuttle.elevator_network == elev.elevator_network)
			. += list(elev)
			continue

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_ventral_elevator/elevator_call
	name = "\improper Elevator Call"
	desc = "Control panel for the elevator."
	shuttleId = MOBILE_DWTN_VENTRAL_ELEVATOR
	is_call = TRUE
	var/dockId
	var/datum/elevator/destination/site

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_ventral_elevator/elevator_call/get_landing_zones()
	return list(SSshuttle.getDock(dockId))

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_ventral_elevator/elevator_call/dwtn_ventral_elevator/occupied
	dockId = STAT_DWTN_VENTRAL_OCCUPIED

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_ventral_elevator/elevator_call/dwtn_ventral_elevator/empty
	dockId = STAT_DWTN_VENTRAL_OCCUPIED

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_ventral_elevator/elevator_call/dwtn_ventral_elevator/arrival
	dockId = STAT_DWTN_VENTRAL_ELEVATOR

/obj/structure/machinery/computer/shuttle/elevator_controller/dwtn_ventral_elevator/elevator_call/dwtn_ventral_elevator/exit
	dockId = STAT_DWTN_VENTRAL_ELEVATOR_EXIT
