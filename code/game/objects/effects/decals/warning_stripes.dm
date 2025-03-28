/obj/effect/decal/warning_stripes
	name = "warning stripes"
	gender = PLURAL
	icon = 'icons/effects/warning_stripes.dmi'
	layer = WEED_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	var/initial_icon_state

/obj/effect/decal/warning_stripes/Initialize(mapload, ...)
	. = ..()
	initial_icon_state = icon_state

/obj/effect/decal/warning_stripes/setDir(newdir)
	. = ..()
	switch(newdir)
		if(NORTH)
			icon_state = initial_icon_state
		if(SOUTH)
			switch(initial_icon_state)
				if("W")
					icon_state = "E"
				if("N")
					icon_state = "S"
				if("E")
					icon_state = "W"
				if("S")
					icon_state = "N"
				if("SE-out")
					icon_state = "NW-out"
				if("SW-out")
					icon_state = "NE-out"
				if("NW-out")
					icon_state = "SE-out"
				if("NE-out")
					icon_state = "SW-out"

		if(EAST)
			switch(initial_icon_state)
				if("W")
					icon_state = "N"
				if("N")
					icon_state = "E"
				if("E")
					icon_state = "S"
				if("S")
					icon_state = "W"
				if("SE-out")
					icon_state = "SW-out"
				if("SW-out")
					icon_state = "NW-out"
				if("NW-out")
					icon_state = "NE-out"
				if("NE-out")
					icon_state = "SE-out"
		if(WEST)
			switch(initial_icon_state)
				if("W")
					icon_state = "S"
				if("N")
					icon_state = "W"
				if("E")
					icon_state = "N"
				if("S")
					icon_state = "E"
				if("SE-out")
					icon_state = "NE-out"
				if("SW-out")
					icon_state = "SE-out"
				if("NW-out")
					icon_state = "SW-out"
				if("NE-out")
					icon_state = "NW-out"

/obj/effect/decal/warning_stripes/asteroid
	icon_state = "warning"


/obj/effect/decal/sand_overlay
	name = "sandy edge"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	unacidable = TRUE
	icon = 'icons/turf/overlays.dmi'
	layer = TURF_LAYER

/obj/effect/decal/sand_overlay/sand1
	icon_state = "sand1_s"
/obj/effect/decal/sand_overlay/sand1/corner1
	icon_state = "sand1_c"
/obj/effect/decal/sand_overlay/sand2
	icon_state = "sand2_s"
/obj/effect/decal/sand_overlay/sand2/corner2
	icon_state = "sand2_c"

/obj/effect/decal/grass_overlay
	name = "grass edge"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	unacidable = TRUE
	icon = 'icons/turf/floors/auto_strata_grass.dmi'
	layer = TURF_LAYER

/obj/effect/decal/grass_overlay/grass1
	icon_state = "grass_outercorner"

/obj/effect/decal/grass_overlay/grass1/inner
	name = "grass edge"
	icon_state = "grass_innercorner"

/obj/effect/decal/siding
	name = "siding"
	icon = 'icons/turf/floors/floors.dmi'
	icon_state = "siding1"

/obj/effect/decal/siding/wood_siding
	name = "wood siding"
	icon_state = "wood_siding1"

/obj/effect/decal/unsc
	name = "informative decal"
	icon = 'icons/halo/effects/area_signs.dmi'
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = TURF_LAYER
	plane = FLOOR_PLANE
	unacidable = TRUE

/obj/effect/decal/unsc/armory
	icon_state = "armory"

/obj/effect/decal/unsc/commons
	icon_state = "commons"

/obj/effect/decal/unsc/infirmary
	icon_state = "infirmary"

/obj/effect/decal/unsc/umbilicals
	icon_state = "umbilicals"

/obj/effect/decal/unsc/tram
	icon_state = "tram"

/obj/effect/decal/unsc/shipping
	icon_state = "shipping"

/obj/effect/decal/unsc/security
	icon_state = "security"

/obj/effect/decal/unsc/recreation
	icon_state = "recreation"

/obj/effect/decal/unsc/maint
	icon_state = "maint"

/obj/effect/decal/unsc/lifepods
	icon_state = "lifepods"

/obj/effect/decal/unsc/hangar
	icon_state = "hangar"

/obj/effect/decal/unsc/firecontrol
	icon_state = "firecontrol"

/obj/effect/decal/unsc/engi
	icon_state = "engi"

/obj/effect/decal/unsc/airlock
	icon_state = "airlock"

/obj/effect/decal/unsc/bridge
	icon_state = "bridge"

/obj/effect/decal/unsc/cryo
	icon_state = "cryo"

/obj/effect/decal/unsc/cryo/a
	icon_state = "cryo_a"

/obj/effect/decal/unsc/cryo/b
	icon_state = "cryo_b"

/obj/effect/decal/unsc/cryo/c
	icon_state = "cryo_c"
