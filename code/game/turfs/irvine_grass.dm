
/turf/open/irvine_grass
	icon = 'icons/turf/floors/auto_strata_grass.dmi'
	icon_state = "grass_0"

/turf/open/irvine_grass/is_weedable()
	return TRUE

/turf/open/irvine_grass/get_dirt_type()
	return DIRT_TYPE_IRVINE_GRASS

/turf/open/irvine_grass/can_dig_xeno_tunnel()
	return TRUE

/turf/open/irvine_grass/Initialize(mapload, ...)
	. = ..()
	update_icon()
