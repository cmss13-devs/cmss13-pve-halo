/obj/docking_port/mobile/station_tram_golf
	name="Tram Golf"
	id=MOBILE_STATION_TRAM_GOLF

	// Map information
	height=4
	width=6
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/mackay_station/elevator/tram_golf

	// Shuttle timings
	callTime = 20 SECONDS
	rechargeTime = 10 SECONDS
	ignitionTime = 5 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control
	var/elevator_network

/obj/docking_port/mobile/station_tram_golf/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "Tram"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			if(istype(door, /obj/structure/machinery/door/poddoor/filler_object)) //poddoor filler was sneaking in
				continue
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/station_tram_golf/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/station_tram_golf/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/station_tram_golf
	dir=NORTH
	width=6
	height=4
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit
	var/elevator_network = "tram_golf"

/obj/docking_port/stationary/station_tram_golf/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/station_tram_golf/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/station_tram_golf))
		var/obj/docking_port/mobile/station_tram_golf/elevator = arriving_shuttle
		elevator.door_control.control_doors("unlock", airlock_exit)

	// open dock doors
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("unlock", FALSE, TRUE)
	door_control.control_doors("open", FALSE, TRUE)
	qdel(door_control)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/station_tram_golf/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/station_tram_golf/occupied
	name = "occupied"
	id = STAT_STATION_OCCUPIED
	airlock_exit = "north"
	roundstart_template = /datum/map_template/shuttle/mackay_station/golf

/obj/docking_port/stationary/station_tram_golf/empty
	name = "empty"
	id = STAT_STATION_EMPTY
	airlock_exit = "north"

/obj/docking_port/stationary/station_tram_golf/arrival
	name = "Golf Arrival"
	id=STAT_STATION_SECTOR_GOLF
	airlock_area = /area/mackay_station/elevator/tram_golf
	airlock_exit = "north"
	roundstart_template = /datum/map_template/shuttle/mackay_station/golf

/obj/docking_port/stationary/station_tram_golf/exit
	name = "Golf Exit"
	id=STAT_STATION_SECTOR_GOLF_EXIT
	airlock_area = /area/mackay_station/elevator/tram_golf/exit
	airlock_exit = "north"

/obj/docking_port/mobile/station_tram_romeo
	name="Tram Romeo"
	id=MOBILE_STATION_TRAM_ROMEO

	// Map information
	height=4
	width=6
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/mackay_station/elevator/tram_romeo

	// Shuttle timings
	callTime = 20 SECONDS
	rechargeTime = 10 SECONDS
	ignitionTime = 5 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control
	var/elevator_network

/obj/docking_port/mobile/station_tram_romeo/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "Tram"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			if(istype(door, /obj/structure/machinery/door/poddoor/filler_object)) //poddoor filler was sneaking in
				continue
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/station_tram_romeo/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/station_tram_romeo/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/station_tram_romeo
	dir=NORTH
	width=6
	height=4
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit
	var/elevator_network = "tram_romeo"

/obj/docking_port/stationary/station_tram_romeo/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/station_tram_romeo/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/station_tram_romeo))
		var/obj/docking_port/mobile/station_tram_romeo/elevator = arriving_shuttle
		elevator.door_control.control_doors("unlock", airlock_exit)

	// open dock doors
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("unlock", FALSE, TRUE)
	door_control.control_doors("open", FALSE, TRUE)
	qdel(door_control)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/station_tram_romeo/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/station_tram_romeo/occupied
	name = "occupied"
	id = STAT_STATION_OCCUPIED
	airlock_exit = "south"
	roundstart_template = /datum/map_template/shuttle/mackay_station/romeo

/obj/docking_port/stationary/station_tram_romeo/empty
	name = "empty"
	id = STAT_STATION_EMPTY
	airlock_exit = "south"

/obj/docking_port/stationary/station_tram_romeo/arrival
	name = "Romeo Arrival"
	id=STAT_STATION_SECTOR_ROMEO
	airlock_area = /area/mackay_station/elevator/tram_romeo
	airlock_exit = "south"
	roundstart_template = /datum/map_template/shuttle/mackay_station/romeo

/obj/docking_port/stationary/station_tram_romeo/exit
	name = "Romeo Exit"
	id=STAT_STATION_SECTOR_ROMEO_EXIT
	airlock_area = /area/mackay_station/elevator/tram_romeo/exit
	airlock_exit = "south"

/obj/docking_port/mobile/station_tram_bravo
	name="Tram Bravo"
	id=MOBILE_STATION_TRAM_BRAVO

	// Map information
	height=4
	width=6
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/mackay_station/elevator/tram_bravo

	// Shuttle timings
	callTime = 20 SECONDS
	rechargeTime = 10 SECONDS
	ignitionTime = 5 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control
	var/elevator_network

/obj/docking_port/mobile/station_tram_bravo/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "Tram"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			if(istype(door, /obj/structure/machinery/door/poddoor/filler_object)) //poddoor filler was sneaking in
				continue
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/station_tram_bravo/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/station_tram_bravo/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/station_tram_bravo
	dir=NORTH
	width=6
	height=4
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit
	var/elevator_network = "tram_bravo"

/obj/docking_port/stationary/station_tram_bravo/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/station_tram_bravo/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/station_tram_bravo))
		var/obj/docking_port/mobile/station_tram_bravo/elevator = arriving_shuttle
		elevator.door_control.control_doors("unlock", airlock_exit)

	// open dock doors
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("unlock", FALSE, TRUE)
	door_control.control_doors("open", FALSE, TRUE)
	qdel(door_control)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/station_tram_bravo/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/station_tram_bravo/occupied
	name = "occupied"
	id = STAT_STATION_OCCUPIED
	airlock_exit = "north"
	roundstart_template = /datum/map_template/shuttle/mackay_station/bravo

/obj/docking_port/stationary/station_tram_bravo/empty
	name = "empty"
	id = STAT_STATION_EMPTY
	airlock_exit = "north"

/obj/docking_port/stationary/station_tram_bravo/arrival
	name = "Bravo Arrival"
	id=STAT_STATION_SECTOR_BRAVO
	airlock_area = /area/mackay_station/elevator/tram_bravo
	airlock_exit = "north"
	roundstart_template = /datum/map_template/shuttle/mackay_station/bravo

/obj/docking_port/stationary/station_tram_bravo/exit
	name = "Bravo Exit"
	id=STAT_STATION_SECTOR_BRAVO_EXIT
	airlock_area = /area/mackay_station/elevator/tram_bravo/exit
	airlock_exit = "north"

/obj/docking_port/mobile/fire_control
	name="Fire Control Elevator"
	id=MOBILE_STATION_FIRE_CONTROL

	// Map information
	height=6
	width=5
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/mackay_station/elevator/fire_control

	// Shuttle timings
	callTime = 20 SECONDS
	rechargeTime = 10 SECONDS
	ignitionTime = 5 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control
	var/elevator_network

/obj/docking_port/mobile/fire_control/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "Tram"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			if(istype(door, /obj/structure/machinery/door/poddoor/filler_object)) //poddoor filler was sneaking in
				continue
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/fire_control/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/fire_control/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/fire_control
	dir=NORTH
	width=5
	height=6
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit
	var/elevator_network = "fire_control"

/obj/docking_port/stationary/fire_control/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/fire_control/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/fire_control))
		var/obj/docking_port/mobile/fire_control/elevator = arriving_shuttle
		elevator.door_control.control_doors("unlock", airlock_exit)

	// open dock doors
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("unlock", FALSE, TRUE)
	door_control.control_doors("open", FALSE, TRUE)
	qdel(door_control)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/fire_control/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/fire_control/occupied
	name = "occupied"
	id = STAT_STATION_OCCUPIED
	airlock_exit = "east"
	roundstart_template = /datum/map_template/shuttle/mackay_station/fire_control

/obj/docking_port/stationary/fire_control/empty
	name = "empty"
	id = STAT_STATION_EMPTY
	airlock_exit = "east"

/obj/docking_port/stationary/fire_control/arrival
	name = "Fire Control Arrival"
	id=STAT_STATION_FIRE_CONTROL
	airlock_area = /area/mackay_station/elevator/fire_control
	airlock_exit = "east"
	roundstart_template = /datum/map_template/shuttle/mackay_station/fire_control

/obj/docking_port/stationary/fire_control/exit
	name = "Fire Control Exit"
	id=STAT_STATION_FIRE_CONTROL_EXIT
	airlock_area = /area/mackay_station/elevator/fire_control/exit
	airlock_exit = "east"

/obj/docking_port/mobile/hangar
	name="Hangar Elevator"
	id=MOBILE_STATION_HANGAR

	// Map information
	height=12
	width=13
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/mackay_station/elevator/hangar

	// Shuttle timings
	callTime = 20 SECONDS
	rechargeTime = 10 SECONDS
	ignitionTime = 5 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control
	var/elevator_network

/obj/docking_port/mobile/hangar/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "Tram"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			if(istype(door, /obj/structure/machinery/door/poddoor/filler_object)) //poddoor filler was sneaking in
				continue
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/hangar/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/hangar/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/hangar
	dir=NORTH
	width=13
	height=12
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit
	var/elevator_network = "hangar"

/obj/docking_port/stationary/hangar/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/hangar/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/hangar))
		var/obj/docking_port/mobile/hangar/elevator = arriving_shuttle
		elevator.door_control.control_doors("open", airlock_exit)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/hangar/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/hangar/occupied
	name = "occupied"
	id = STAT_STATION_OCCUPIED
	airlock_exit = "north"
	roundstart_template = /datum/map_template/shuttle/mackay_station/hangar

/obj/docking_port/stationary/hangar/empty
	name = "empty"
	id = STAT_STATION_EMPTY
	airlock_exit = "north"

/obj/docking_port/stationary/hangar/arrival
	name = "Hangar Arrival"
	id=STAT_STATION_HANGAR
	airlock_area = /area/mackay_station/elevator/hangar
	airlock_exit = "north"
	roundstart_template = /datum/map_template/shuttle/mackay_station/hangar

/obj/docking_port/stationary/hangar/exit
	name = "Hangar Exit"
	id=STAT_STATION_HANGAR_EXIT
	airlock_area = /area/mackay_station/elevator/hangar/exit
	airlock_exit = "south"

/datum/map_template/shuttle/mackay_station/golf/post_load(obj/docking_port/mobile/M)
	. = ..()
	var/datum/map_template/shuttle/mackay_station/golf/elev = M
	elev.elevator_network = elevator_network
	log_debug("Adding network [elevator_network] to [M.id]")

/area/mackay_station/elevator/tram_golf/entry
/area/mackay_station/elevator/tram_golf/exit

/datum/map_template/shuttle/mackay_station/romeo/post_load(obj/docking_port/mobile/M)
	. = ..()
	var/datum/map_template/shuttle/mackay_station/romeo/elev = M
	elev.elevator_network = elevator_network
	log_debug("Adding network [elevator_network] to [M.id]")

/area/mackay_station/elevator/tram_romeo/entry
/area/mackay_station/elevator/tram_romeo/exit

/datum/map_template/shuttle/mackay_station/bravo/post_load(obj/docking_port/mobile/M)
	. = ..()
	var/datum/map_template/shuttle/mackay_station/bravo/elev = M
	elev.elevator_network = elevator_network
	log_debug("Adding network [elevator_network] to [M.id]")

/area/mackay_station/elevator/tram_bravo/entry
/area/mackay_station/elevator/tram_bravo/exit

/datum/map_template/shuttle/mackay_station/fire_control/post_load(obj/docking_port/mobile/M)
	. = ..()
	var/datum/map_template/shuttle/mackay_station/fire_control/elev = M
	elev.elevator_network = elevator_network
	log_debug("Adding network [elevator_network] to [M.id]")

/area/mackay_station/elevator/fire_control/entry
/area/mackay_station/elevator/fire_control/exit

/datum/map_template/shuttle/mackay_station/hangar/post_load(obj/docking_port/mobile/M)
	. = ..()
	var/datum/map_template/shuttle/mackay_station/hangar/elev = M
	elev.elevator_network = elevator_network
	log_debug("Adding network [elevator_network] to [M.id]")

/area/mackay_station/elevator/hangar/entry
/area/mackay_station/elevator/hangar/exit

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_golf/get_landing_zones()
	. = list()
	var/obj/docking_port/mobile/station_tram_golf/shuttle = SSshuttle.getShuttle(shuttleId)

	for(var/obj/docking_port/stationary/station_tram_golf/elev in SSshuttle.stationary)
		if(!shuttle.elevator_network)
			. += list(elev)
			continue
		if(shuttle.elevator_network == elev.elevator_network)
			. += list(elev)
			continue

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_golf/elevator_call
	name = "\improper Tram Call"
	desc = "Control panel for the tram"
	shuttleId = MOBILE_STATION_TRAM_GOLF
	is_call = TRUE
	var/dockId
	var/datum/elevator/destination/site

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_golf/elevator_call/get_landing_zones()
	return list(SSshuttle.getDock(dockId))

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_golf/elevator_call/station_tram_golf/occupied
	dockId = STAT_STATION_OCCUPIED

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_golf/elevator_call/station_tram_golf/empty
	dockId = STAT_STATION_EMPTY

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_golf/elevator_call/station_tram_golf/arrival
	dockId = STAT_STATION_SECTOR_GOLF

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_golf/elevator_call/station_tram_golf/exit
	dockId = STAT_STATION_SECTOR_GOLF_EXIT

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_romeo/get_landing_zones()
	. = list()
	var/obj/docking_port/mobile/station_tram_romeo/shuttle = SSshuttle.getShuttle(shuttleId)

	for(var/obj/docking_port/stationary/station_tram_romeo/elev in SSshuttle.stationary)
		if(!shuttle.elevator_network)
			. += list(elev)
			continue
		if(shuttle.elevator_network == elev.elevator_network)
			. += list(elev)
			continue

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_romeo/elevator_call
	name = "\improper Tram Call"
	desc = "Control panel for the tram"
	shuttleId = MOBILE_STATION_TRAM_ROMEO
	is_call = TRUE
	var/dockId
	var/datum/elevator/destination/site

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_romeo/elevator_call/get_landing_zones()
	return list(SSshuttle.getDock(dockId))

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_romeo/elevator_call/station_tram_romeo/occupied
	dockId = STAT_STATION_OCCUPIED

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_romeo/elevator_call/station_tram_romeo/empty
	dockId = STAT_STATION_EMPTY

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_romeo/elevator_call/station_tram_romeo/arrival
	dockId = STAT_STATION_SECTOR_ROMEO

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_romeo/elevator_call/station_tram_romeo/exit
	dockId = STAT_STATION_SECTOR_ROMEO_EXIT

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_bravo/get_landing_zones()
	. = list()
	var/obj/docking_port/mobile/station_tram_bravo/shuttle = SSshuttle.getShuttle(shuttleId)

	for(var/obj/docking_port/stationary/station_tram_bravo/elev in SSshuttle.stationary)
		if(!shuttle.elevator_network)
			. += list(elev)
			continue
		if(shuttle.elevator_network == elev.elevator_network)
			. += list(elev)
			continue

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_bravo/elevator_call
	name = "\improper Tram Call"
	desc = "Control panel for the tram"
	shuttleId = MOBILE_STATION_TRAM_BRAVO
	is_call = TRUE
	var/dockId
	var/datum/elevator/destination/site

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_bravo/elevator_call/get_landing_zones()
	return list(SSshuttle.getDock(dockId))

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_bravo/elevator_call/station_tram_bravo/occupied
	dockId = STAT_STATION_OCCUPIED

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_bravo/elevator_call/station_tram_bravo/empty
	dockId = STAT_STATION_EMPTY

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_bravo/elevator_call/station_tram_bravo/arrival
	dockId = STAT_STATION_SECTOR_BRAVO

/obj/structure/machinery/computer/shuttle/elevator_controller/station_tram_bravo/elevator_call/station_tram_bravo/exit
	dockId = STAT_STATION_SECTOR_BRAVO_EXIT

/obj/structure/machinery/computer/shuttle/elevator_controller/fire_control/get_landing_zones()
	. = list()
	var/obj/docking_port/mobile/fire_control/shuttle = SSshuttle.getShuttle(shuttleId)

	for(var/obj/docking_port/stationary/fire_control/elev in SSshuttle.stationary)
		if(!shuttle.elevator_network)
			. += list(elev)
			continue
		if(shuttle.elevator_network == elev.elevator_network)
			. += list(elev)
			continue

/obj/structure/machinery/computer/shuttle/elevator_controller/fire_control/elevator_call
	name = "\improper Elevator Call"
	desc = "Control panel for the elevator"
	shuttleId = MOBILE_STATION_FIRE_CONTROL
	is_call = TRUE
	var/dockId
	var/datum/elevator/destination/site

/obj/structure/machinery/computer/shuttle/elevator_controller/fire_control/elevator_call/get_landing_zones()
	return list(SSshuttle.getDock(dockId))

/obj/structure/machinery/computer/shuttle/elevator_controller/fire_control/elevator_call/fire_control/occupied
	dockId = STAT_STATION_OCCUPIED

/obj/structure/machinery/computer/shuttle/elevator_controller/fire_control/elevator_call/fire_control/empty
	dockId = STAT_STATION_EMPTY

/obj/structure/machinery/computer/shuttle/elevator_controller/fire_control/elevator_call/fire_control/arrival
	dockId = STAT_STATION_FIRE_CONTROL

/obj/structure/machinery/computer/shuttle/elevator_controller/fire_control/elevator_call/fire_control/exit
	dockId = STAT_STATION_FIRE_CONTROL_EXIT

/obj/structure/machinery/computer/shuttle/elevator_controller/hangar/get_landing_zones()
	. = list()
	var/obj/docking_port/mobile/hangar/shuttle = SSshuttle.getShuttle(shuttleId)

	for(var/obj/docking_port/stationary/hangar/elev in SSshuttle.stationary)
		if(!shuttle.elevator_network)
			. += list(elev)
			continue
		if(shuttle.elevator_network == elev.elevator_network)
			. += list(elev)
			continue

/obj/structure/machinery/computer/shuttle/elevator_controller/hangar/elevator_call
	name = "\improper Elevator Call"
	desc = "Control panel for the elevator"
	shuttleId = MOBILE_STATION_HANGAR
	is_call = TRUE
	var/dockId
	var/datum/elevator/destination/site

/obj/structure/machinery/computer/shuttle/elevator_controller/hangar/elevator_call/get_landing_zones()
	return list(SSshuttle.getDock(dockId))

/obj/structure/machinery/computer/shuttle/elevator_controller/hangar/elevator_call/hangar/occupied
	dockId = STAT_STATION_OCCUPIED

/obj/structure/machinery/computer/shuttle/elevator_controller/hangar/elevator_call/hangar/empty
	dockId = STAT_STATION_EMPTY

/obj/structure/machinery/computer/shuttle/elevator_controller/hangar/elevator_call/hangar/arrival
	dockId = STAT_STATION_HANGAR

/obj/structure/machinery/computer/shuttle/elevator_controller/hangar/elevator_call/hangar/exit
	dockId = STAT_STATION_HANGAR_EXIT

