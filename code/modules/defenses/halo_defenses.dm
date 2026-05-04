

/obj/item/defenses/handheld/sentry/halo_cas_turret
	name = "handheld covenant phantom turret"
	desc = "You really shouldn't see this."
	icon = 'icons/obj/structures/machinery/defenses/wy_defenses.dmi'
	icon_state = "Normal wy_sentry_handheld"
	defense_type = /obj/structure/machinery/defenses/sentry/wy
	deployment_time = 5 SECONDS

/obj/structure/machinery/defenses/sentry/halo_cas_turret
	name = "halo CAS turret"
	desc = "You shouldn't see this one, even as a GM. Should be invisible to players, however."
	icon = 'icons/obj/structures/machinery/defenses/sentry.dmi'
	sentry_type = "uac_sentry"
	color = COLOR_PURPLE
	fire_delay = 2 SECONDS
	burst_fire_delay = 1
	burst = 10
	health = 6000
	health_max = 6000
	damage_mult = 1
	disassemble_time = INFINITY
	hack_time = INFINITY
	sentry_range = 14
	omni_directional = FALSE
	alpha = 100
	invisibility = SEE_INVISIBLE_OBSERVER
	density = 0
	handheld_type = /obj/item/defenses/handheld/sentry/halo_cas_turret
	ammo = new /obj/item/ammo_magazine/sentry/phantom_plasma_turret
	muzzleflash_iconstate = "muzzle_flash_blue"
	firing_sound = 'sound/weapons/halo/gun_plasmarifle_triplefire.ogg'
	has_camera = FALSE
	faction_group = FACTION_LIST_COVENANT
	var/detection_range = 12
	var/firing_angle = 135// THIS SHOULD HAVE EXISTED ALREADY. WHY IS IT A DEFINE IN SENTRY.DM????
	selected_categories = list(
		SENTRY_CATEGORY_IFF = FACTION_COVENANT,
	)

/obj/structure/machinery/defenses/sentry/halo_cas_turret/ex_act(severity)
	return

/obj/structure/machinery/defenses/sentry/halo_cas_turret/get_target(atom/movable/new_target) // ALL SO WE CAN CHANGE THE FIRING ANGLE WITHOUT ADJUSTING PRE-EXISTING CODE. FUCK MY CHUD LIFE FUCK MY CHUD LIFE FDUCK MY CHUD LIFE
	if(!islist(targets))
		return
	if(!targets.Find(new_target))
		targets.Add(new_target)

	if(!length(targets))
		return

	var/list/conscious_targets = list()
	var/list/unconscious_targets = list()

	for(var/atom/movable/A in targets) // orange allows sentry to fire through gas and darkness
		if(isliving(A))
			var/mob/living/M = A
			if(M.stat & DEAD)
				if(A == target)
					target = null
				targets.Remove(A)
				continue

			if(M.get_target_lock(faction_group) || M.invisibility || HAS_TRAIT(M, TRAIT_ABILITY_BURROWED) || M.is_ventcrawling)
				if(M == target)
					target = null
				targets.Remove(M)
				continue

		else if(!(A.type in other_targets))
			if(A == target)
				target = null
			targets.Remove(A)
			continue

		if(!omni_directional)
			var/opp
			var/adj
			switch(dir)
				if(NORTH)
					opp = x-A.x
					adj = A.y-y
				if(SOUTH)
					opp = x-A.x
					adj = y-A.y
				if(EAST)
					opp = y-A.y
					adj = A.x-x
				if(WEST)
					opp = y-A.y
					adj = x-A.x

			var/r = 9999
			if(adj != 0)
				r = abs(opp/adj)
			var/angledegree = arcsin(r/sqrt(1+(r*r)))
			if(adj < 0 || (angledegree*2) > firing_angle)
				if(A == target)
					target = null
				targets.Remove(A)
				continue

		var/list/turf/path = get_line(src, A, include_start_atom = FALSE)
		if(!length(path) || get_dist(src, A) > sentry_range)
			if(A == target)
				target = null
			targets.Remove(A)
			continue

		var/blocked = FALSE
		for(var/turf/T in path)
			if(T.density || T.opacity)
				blocked = TRUE
				break

			for(var/obj/structure/S in T)
				if(S.opacity)
					blocked = TRUE
					break

			for(var/obj/vehicle/multitile/V in T)
				blocked = TRUE
				break

			for(var/obj/effect/particle_effect/smoke/S in T)
				blocked = TRUE
				break

		if(!omni_directional)
			var/turf/F = get_step(src, src.dir)
			if(F.density || F.opacity)
				blocked = TRUE

			for(var/obj/structure/S in F)
				if(F.opacity)
					blocked = TRUE
					break

			for(var/obj/vehicle/multitile/V in F)
				blocked = TRUE
				break

		if(blocked)
			if(A == target)
				target = null
			targets.Remove(A)
			continue

		if(isliving(A))
			var/mob/living/M = A
			if(M.stat & UNCONSCIOUS)
				unconscious_targets += M
			else
				conscious_targets += M

	if(length(conscious_targets))
		target = pick(conscious_targets)
	else if(length(unconscious_targets))
		target = pick(unconscious_targets)

	if(!target) //No targets, don't bother firing
		return

	fire(target)

/obj/structure/machinery/defenses/sentry/halo_cas_turret/actual_fire(atom/firing_target, projectiles_to_fire = 1, recursive) // this is all to make individual rounds in a burst actually have noise. they didnt before, for some reason.
	if(!firing_target || !(firing_target in targets))
		return

	var/obj/projectile/new_projectile = new(src, create_cause_data(initial(name), owner_mob, src))
	new_projectile.generate_bullet(new ammo.default_ammo)
	new_projectile.damage *= damage_mult
	new_projectile.accuracy *= accuracy_mult
	GIVE_BULLET_TRAIT(new_projectile, /datum/element/bullet_trait_iff, faction_group)

	new_projectile.fire_at(firing_target, src, owner_mob, new_projectile.ammo.max_range, new_projectile.ammo.shell_speed, null, FALSE)

	muzzle_flash(Get_Angle(get_turf(src), firing_target))
	if(firing_sound)
		playsound(loc, firing_sound, 75, 1)

	ammo.current_rounds--
	track_shot()

	if(ammo.current_rounds == 0)
		handle_empty()
		return

	if(projectiles_to_fire > 1)
		addtimer(CALLBACK(src, PROC_REF(actual_fire), firing_target, (projectiles_to_fire - 1), TRUE), burst_fire_delay)

/obj/structure/machinery/defenses/sentry/halo_cas_turret/fire(atom/A) // This is to remove the annoying beep.
	if(!(world.time-last_fired >= fire_delay) || !turned_on || !ammo || QDELETED(target))
		return

	if(ammo && ammo.current_rounds <= 0)
		if(COOLDOWN_FINISHED(src, no_ammo_message_cooldown))
			visible_message(SPAN_WARNING("[src] beeps steadily and its ammo light blinks red."))
			COOLDOWN_START(src, no_ammo_message_cooldown, (3 SECONDS))

		return

	last_fired = world.time
	COOLDOWN_START(src, beep_fire_sound_cooldown, (30 SECONDS))

	if(QDELETED(owner_mob))
		owner_mob = src

	if(omni_directional)
		setDir(get_dir(src, A))

	actual_fire(A, burst, FALSE)

	if(length(targets))
		addtimer(CALLBACK(src, PROC_REF(get_target)), fire_delay)

	if(!engaged_timer)
		SEND_SIGNAL(src, COMSIG_SENTRY_ENGAGED_ALERT, src)
		engaged_timer = addtimer(CALLBACK(src, PROC_REF(reset_engaged_timer)), 60)

	if(!low_ammo_timer && ammo?.current_rounds && (ammo?.current_rounds < (ammo?.max_rounds * 0.25)))
		SEND_SIGNAL(src, COMSIG_SENTRY_LOW_AMMO_ALERT, src)
		low_ammo_timer = addtimer(CALLBACK(src, PROC_REF(reset_low_ammo_timer)), 20)

/obj/structure/machinery/defenses/sentry/halo_cas_turret/Initialize()
	. = ..()
	placed = TRUE
	power_on()

/obj/structure/machinery/defenses/sentry/halo_cas_turret/set_range()
	if(omni_directional)
		range_bounds = SQUARE(x, y, detection_range)
		return
	switch(dir)
		if(EAST)
			range_bounds = SQUARE(x + (detection_range/2), y, detection_range)
		if(WEST)
			range_bounds = SQUARE(x - (detection_range/2), y, detection_range)
		if(NORTH)
			range_bounds = SQUARE(x, y + (detection_range/2), detection_range)
		if(SOUTH)
			range_bounds = SQUARE(x, y - (detection_range/2), detection_range)

/obj/structure/machinery/defenses/sentry/halo_cas_turret/setDir(newDir) // this way we can update it any time the dir is set instead of having to fight with it
	. = ..()
	set_range()

/obj/item/ammo_magazine/sentry/phantom_plasma_turret
	name = "phantom powerbank"
	desc = "You shouldn't see this, normally."
	color = COLOR_PURPLE
	caliber = "plasma"
	max_rounds = 5000
	default_ammo = /datum/ammo/energy/halo_plasma/phantom_plasma_turret


/obj/item/ammo_magazine/sentry/phantom_main_turret
	name = "phantom powerbank"
	desc = "You shouldn't see this, normally."
	color = COLOR_PURPLE
	caliber = "plasma"
	max_rounds = 5000
	default_ammo = /datum/ammo/energy/halo_plasma/phantom_main_turret

/obj/item/ammo_magazine/sentry/pelican_main_turret
	name = "pelican magazine"
	desc = "You shouldn't see this, normally."
	color = COLOR_DARK_MODERATE_LIME_GREEN
	caliber = "9.5x40mm"
	max_rounds = 5000
	default_ammo = /datum/ammo/bullet/rifle/br55

/obj/item/ammo_magazine/sentry/pelican_rocket_pod
	name = "pelican rocket magazine"
	desc = "You shouldn't see this, normally."
	color = COLOR_GREEN
	caliber = "missile"
	max_rounds = 5000
	default_ammo = /datum/ammo/rocket/pelican_missile_pod

/obj/structure/machinery/defenses/sentry/halo_cas_turret/phantom_plasma_turret
	name = "\improper phantom side turret"
	desc = "The side gunner plasma turret on a phantom. Should be invisible to players."
	color = COLOR_STRONG_VIOLET

/obj/structure/machinery/defenses/sentry/halo_cas_turret/phantom_main_turret
	name = "\improper phantom main turret"
	desc = "The primary plasma turret on the phantom."
	omni_directional = TRUE
	firing_sound = 'sound/weapons/halo/phantom_gun/gun_phantom_turret.ogg'
	burst = 1
	fire_delay = 3 SECONDS
	detection_range = 10
	sentry_range = 10
	ammo = new /obj/item/ammo_magazine/sentry/phantom_main_turret

/obj/structure/machinery/defenses/sentry/halo_cas_turret/pelican_main_turret
	name = "\improper pelican main turret"
	desc = "The primary turret on the pelican."
	firing_sound = 'sound/weapons/halo/pelican_gun/pelican_gun.ogg'
	color = COLOR_DARK_MODERATE_LIME_GREEN
	omni_directional = TRUE
	burst = 3
	burst_fire_delay = 0.2 SECONDS
	fire_delay = 1 SECONDS
	detection_range = 16
	sentry_range = 16
	accuracy_mult = 2
	damage_mult = 1.5
	ammo = new /obj/item/ammo_magazine/sentry/pelican_main_turret
	faction_group = FACTION_LIST_UNSC
	selected_categories = list(
		SENTRY_CATEGORY_IFF = FACTION_UNSC,
	)

/obj/structure/machinery/defenses/sentry/halo_cas_turret/pelican_rocket_pod
	name = "\improper pelican rocket pod"
	desc = "The rocket pods on the pelican."
	firing_sound = "gun_missile_pod"
	sentry_range = 11
	detection_range = 11
	color = COLOR_GREEN
	burst = 3
	burst_fire_delay = 0.5 SECONDS
	fire_delay = 5 SECONDS
	ammo = new /obj/item/ammo_magazine/sentry/pelican_rocket_pod
	faction_group = FACTION_LIST_UNSC
	selected_categories = list(
		SENTRY_CATEGORY_IFF = FACTION_UNSC,
	)
	firing_angle = 80
