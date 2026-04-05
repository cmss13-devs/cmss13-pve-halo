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
	switch(newdir)
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
	var/image/overlay = image(icon, icon_state = "[initial(icon_state)]_o", layer = 4.4, pixel_y = pixel_adjustment)
	overlays += overlay

/obj/structure/covenant_barricade/wide
	name = "covenant triptych barrier"
	icon_state = "cov_triplebarrier"
	is_wide = TRUE
