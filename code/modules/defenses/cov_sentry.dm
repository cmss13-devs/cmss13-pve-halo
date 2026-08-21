
#define COV_SNIPER_SENTRY_RANGE 14

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
	omni_directional = FALSE
	ammo = new /obj/item/ammo_magazine/sentry/covenant
	firing_sound = 'sound/weapons/halo/gun_plasmarifle_1.ogg'
	pixel_x = -16
	light_on = TRUE
	light_range = 4
	light_power = 0.5
	light_color = LIGHT_COLOR_PINK

/obj/structure/machinery/defenses/sentry/covenant/dmr
	sentry_range = 14

/obj/structure/machinery/defenses/sentry/covenant/dmr/set_range()
	switch(dir)
		if(EAST)
			range_bounds = SQUARE(x + (COV_SNIPER_SENTRY_RANGE/2), y, COV_SNIPER_SENTRY_RANGE)
		if(WEST)
			range_bounds = SQUARE(x - (COV_SNIPER_SENTRY_RANGE/2), y, COV_SNIPER_SENTRY_RANGE)
		if(NORTH)
			range_bounds = SQUARE(x, y + (COV_SNIPER_SENTRY_RANGE/2), COV_SNIPER_SENTRY_RANGE)
		if(SOUTH)
			range_bounds = SQUARE(x, y - (COV_SNIPER_SENTRY_RANGE/2), COV_SNIPER_SENTRY_RANGE)


/obj/structure/machinery/defenses/sentry/covenant/get_examine_text(mob/living/carbon/human/user)
	. = ..()
	var/list/origin = .
	var/insert_line
	if(iscovenant(user))
		origin[1] = "[icon2html(src, user)] This is a Shuku-pattern sentry turret"
		insert_line = ".."
	else
		origin[1] = "[icon2html(src, user)] This is a Type-2 Automated Plasma Turret"
		insert_line = ".."
	origin.Insert(2, insert_line)

/obj/structure/machinery/defenses/sentry/covenant/omni
	name = "Omni Directional Automated Plasma Turret"
	desc = "An automated weapon built by the Covenant, it fires a burst of plasma bolts. "
	icon = 'modular_pve_halo/icons/covProps64x64.dmi'
	defense_type = "Normal"
	sentry_type = "covsentry"
	defense_icon = "defense_base"
	fire_delay = 5
	sentry_range = 5
	omni_directional = TRUE
	damage_mult = 2

/obj/structure/machinery/defenses/sentry/covenant/omni/get_examine_text(mob/living/carbon/human/user)
	. = ..()
	var/list/origin = .
	var/insert_line
	if(iscovenant(user))
		origin[1] = "[icon2html(src, user)] This is a Shuku-pattern Omni-Directional sentry turret"
		insert_line = ".."
	else
		origin[1] = "[icon2html(src, user)] This is a Type-2 Omni-Directional Automated Plasma Turret"
		insert_line = ".."
	origin.Insert(2, insert_line)
