/turf/open/floor/forerunner
	name = "metallic flooring"
	icon = 'icons/halo/turf/floors/forerunner.dmi'
	icon_state = "forerunner_1"
	hull_floor = TRUE

/turf/open/floor/forerunner/random/Initialize()
	icon_state = "forerunner_[rand(1, 6)]"

/obj/structure/prop/invuln/the_gate
	name = "The Red Gate"
	desc = "You see nothing beyond the veil of red."
	icon = 'icons/halo/obj/structures/red_gate.dmi'
	icon_state = "gate_2"

/obj/structure/prop/invuln/the_gate/Initialize()
	. = ..()
	overlays += emissive_appearance(icon, "glow", src, 5.3, reset_transform = FALSE)
