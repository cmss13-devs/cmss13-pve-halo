

/obj/item/ammo_magazine/sentry/covenant
	name = "Plasma Battery"
	desc = "You arent meant to see this, ignore it."
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/wy.dmi'
	icon_state = "wy22e5"
	max_rounds = 99999
	default_ammo = /datum/ammo/energy/halo_plasma/plasma_rifle/covenant_sentry_turret

/obj/structure/machinery/defenses/sentry/covenant
	name = "Automated Plasma Turret"
	desc = "An automated weapon built by the Covenant, it fires a burst of plasma bolts. "
	icon = 'modular_pve_halo/icons/covProps64x64.dmi'
	defense_type = "Normal"
	sentry_type = "covsentry"
	defense_icon = "defense_base"
	fire_delay = 6
	burst_fire_delay = 3
	burst = 3
	health = 350
	health_max = 350
	damage_mult = 2.5
	disassemble_time = 20 SECONDS
	hack_time = 25 SECONDS
	sentry_range = 7
	omni_directional = FALSE
	ammo = new /obj/item/ammo_magazine/sentry/covenant
	firing_sound = 'sound/weapons/halo/gun_plasmarifle_1.ogg'
	pixel_x = -16
	light_on = TRUE
	light_range = 4
	light_power = 0.5
	light_color = LIGHT_COLOR_PINK

/obj/structure/machinery/defenses/sentry/covenant/premade
	immobile = TRUE
	turned_on = TRUE

/obj/structure/machinery/defenses/sentry/covenant/premade/Initialize()
	. = ..()
	if(selected_categories[SENTRY_CATEGORY_IFF])
		selected_categories[SENTRY_CATEGORY_IFF] = FACTION_COVENANT

/obj/structure/machinery/defenses/sentry/covenant/premade/get_examine_text(mob/user)
	. = ..()
	. += SPAN_NOTICE("It seems this one's bolts have been securely welded into the floor, and the access panel locked. You can't interact with it.")

/obj/structure/machinery/defenses/sentry/covenant/premade/attackby(obj/item/O, mob/user)
	return

/obj/structure/machinery/defenses/sentry/covenant/premade/power_on()
	return

/obj/structure/machinery/defenses/sentry/covenant/premade/power_off()
	return

/obj/structure/machinery/defenses/sentry/covenant/premade/damaged_action()
	return

/obj/structure/machinery/defenses/sentry/covenant/omni
	name = "Omni Directional Automated Plasma Turret"
	desc = "An automated weapon built by the Covenant, it fires a burst of plasma bolts. "
	icon = 'modular_pve_halo/icons/covProps64x64.dmi'
	defense_type = "Normal"
	sentry_type = "covsentry"
	defense_icon = "defense_base"
	fire_delay = 5
	omni_directional = TRUE
	damage_mult = 1.5

/obj/structure/machinery/defenses/sentry/covenant/omni/premade
	immobile = TRUE
	turned_on = TRUE

/obj/structure/machinery/defenses/sentry/covenant/omni/premade/Initialize()
	. = ..()
	if(selected_categories[SENTRY_CATEGORY_IFF])
		selected_categories[SENTRY_CATEGORY_IFF] = FACTION_COVENANT

/obj/structure/machinery/defenses/sentry/covenant/omni/premade/get_examine_text(mob/user)
	. = ..()
	. += SPAN_NOTICE("It seems this one's bolts have been securely welded into the floor, and the access panel locked. You can't interact with it.")

/obj/structure/machinery/defenses/sentry/covenant/omni/premade/attackby(obj/item/O, mob/user)
	return

/obj/structure/machinery/defenses/sentry/covenant/omni/premade/power_on()
	return

/obj/structure/machinery/defenses/sentry/covenant/omni/premade/power_off()
	return

/obj/structure/machinery/defenses/sentry/covenant/omni/premade/damaged_action()
	return
