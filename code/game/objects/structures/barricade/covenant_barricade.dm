/obj/structure/covenant_barricade
	name = "covenant defense barrier"
	desc = "A strong nanolaminate barrier. Practically invulnerable to all forms of small-arms fire."
	breakable = FALSE
	indestructible = TRUE
	icon = 'icons/halo/obj/structures/cov_barriers.dmi'
	icon_state = "cov_barrier"
	var/is_wide = FALSE // whether the barricade is wide or not and thus requires bounds to be adjusted on rotation
	density = TRUE

	var/pixel_adjustment

/obj/structure/covenant_barricade/Destroy()
	. = ..()
	UnregisterSignal(src, COMSIG_ATOM_DIR_CHANGE)

/obj/structure/covenant_barricade/Initialize()
	. = ..()
	update_dirs()
	RegisterSignal(src, COMSIG_ATOM_DIR_CHANGE, PROC_REF(update_dirs))

/obj/structure/covenant_barricade/update_icon()
	. = ..()
	update_dirs()

/obj/structure/covenant_barricade/proc/update_dirs(atom/movable/source, olddir, newdir)
	SIGNAL_HANDLER
	overlays.Cut()
	switch(newdir || dir)
		if(NORTH, SOUTH)
			if(is_wide)
				bound_width = 64
				bound_height = 32
		if(EAST, WEST)
			if(is_wide)
				bound_width = 32
				bound_height = 64
	if(newdir == WEST && is_wide || newdir == EAST && is_wide)
		pixel_adjustment = 64
	if(dir == WEST && is_wide || dir == EAST && is_wide)
		pixel_adjustment = 64
	var/image/overlay = image(icon, icon_state = "[initial(icon_state)]_o", layer = 4.4, pixel_y = pixel_adjustment)
	overlays += overlay

/obj/structure/covenant_barricade/wide
	name = "covenant triptych barrier"
	icon_state = "cov_triplebarrier"
	is_wide = TRUE


//TEMP

/obj/structure/reagent_dispensers/fueltank/cov
	name = "Plasma Battery"
	desc = "Covenant Plasma Battery"
	icon = 'modular_pve_halo/icons/covProps32x32.dmi'
	icon_state = "plasmabattery"
	light_range = 4
	light_power = 0.5
	light_color = LIGHT_COLOR_BLUE

/obj/structure/prop/static_tank/fuel/cov
	name = "Large Plasma Battery"
	desc = "Covenant Plasma Battery"
	icon = 'modular_pve_halo/icons/covProps64x64.dmi'
	icon_state = "fuel thingy"

/obj/structure/machinery/telecomms/relay/preset/ice_colony/cov
	name = "Covenant Relay Antenna"
	desc = "Covenant Relay Antenna"
	icon = 'modular_pve_halo/icons/covAntenna.dmi'
	icon_state = "antenna"
	id = "Covenant Station Relay"
	unslashable = FALSE
	unacidable = FALSE

/obj/structure/bed/chair/comfy/cov
	name = "covenant stool"
	desc = "A floating purple stool"
	icon = 'modular_pve_halo/icons/covProps32x32.dmi'
	icon_state = "floaty stool"
	color = null

/obj/item/device/assembly/prox_sensor/cov
	name = "covenant proximity sensor"
	desc = "Used for scanning and alerting when someone enters a certain proximity."
	icon = 'modular_pve_halo/icons/covProps32x32.dmi'
	icon_state = "sentry spotter"

/obj/item/device/assembly/prox_sensor/cov/active
	name = "armed covenant proximity sensor"
	range = 6
	anchored = TRUE

/obj/item/device/assembly/prox_sensor/cov/active/New()
	..()
	secured = TRUE
	scanning = TRUE
	update_icon()
	START_PROCESSING(SSobj, src)
