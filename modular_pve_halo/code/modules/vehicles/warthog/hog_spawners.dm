/obj/effect/vehicle_spawner/warthog
	name = "Scout Hog Spawner"
	icon = 'icons/halo/obj/vehicles/warthog.dmi'
	icon_state = "warthog_base"
	pixel_x = -16
	pixel_y = -16

/obj/effect/vehicle_spawner/warthog/Initialize()
	. = ..()
	spawn_vehicle()
	qdel(src)

/obj/effect/vehicle_spawner/warthog/spawn_vehicle()
	var/obj/vehicle/multitile/warthog/hog = new (loc)

	handle_direction(hog)
	load_hardpoints(hog)
	hog.update_icon()
	. = hog

/obj/effect/vehicle_spawner/warthog/load_hardpoints(obj/vehicle/multitile/warthog/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/warthog_wheels)

/obj/effect/vehicle_spawner/warthog/machinegun
	name = "Chaingun Hog Spawner"
	icon = 'icons/halo/obj/vehicles/warthog.dmi'
	icon_state = "warthog_base"
	pixel_x = -16
	pixel_y = -16

/obj/effect/vehicle_spawner/warthog/machinegun/spawn_vehicle()
	var/obj/vehicle/multitile/warthog/machinegun/hog = new (loc)

	handle_direction(hog)
	load_hardpoints(hog)
	hog.update_icon()
	. = hog

/obj/effect/vehicle_spawner/warthog/machinegun/load_hardpoints(obj/vehicle/multitile/warthog/V)
	. = ..()
	V.add_hardpoint(new /obj/item/hardpoint/special/vulcan)

/obj/effect/vehicle_spawner/warthog/gauss
	name = "Gauss Hog Spawner"
	icon = 'icons/halo/obj/vehicles/warthog.dmi'
	icon_state = "warthog_base"
	pixel_x = -16
	pixel_y = -16

/obj/effect/vehicle_spawner/warthog/gauss/spawn_vehicle()
	var/obj/vehicle/multitile/warthog/gauss/hog = new (loc)

	handle_direction(hog)
	load_hardpoints(hog)
	hog.update_icon()
	. = hog

/obj/effect/vehicle_spawner/warthog/gauss/load_hardpoints(obj/vehicle/multitile/warthog/V)
	. = ..()
	V.add_hardpoint(new /obj/item/hardpoint/special/vulcan/gauss)
