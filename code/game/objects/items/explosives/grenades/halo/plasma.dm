/obj/item/explosive/grenade/high_explosive/plasma
	name = "\improper Anskum-pattern plasma grenade"
	icon = 'icons/halo/obj/items/weapons/grenades.dmi'
	desc = "The M47 HSDP is a small, but powerful smoke grenade. Based off the same platform as the M40 HEDP. Can be fired from a PN 30mm UGL for impact detonation, or primed in-hand and thrown to detonate after 2 seconds."
	icon_state = "plasma"
	item_state = "plasma"
	det_time = 30
	underslug_launchable = FALSE
	harmful = TRUE
	//antigrief_protection = FALSE
	arm_sound = 'sound/weapons/halo/firebomb_throw.ogg'
	explosion_power = 125
	explosion_falloff = 20
	shrapnel_count = 32
	shrapnel_type = /datum/ammo/bullet/shrapnel/incendiary/heavy
	dual_purpose = FALSE
	falloff_mode = EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL_HALF
	light_power = 0.4
	light_range = 1.1
	var/datum/looping_sound/plasma_hiss/hiss_loop
	var/list/atoms_it_can_stick_to = list(/obj/vehicle, /mob/living, /obj/structure/machinery/defenses)
	var/attached = FALSE
	var/attached_icon = "stuck_plasma"
	var/time_triggered

/obj/item/explosive/grenade/high_explosive/plasma/New()
	hiss_loop = new(src)
	..()

/obj/item/explosive/grenade/high_explosive/plasma/Destroy()
	QDEL_NULL(hiss_loop)
	return ..()

/obj/item/explosive/grenade/high_explosive/plasma/activate()
	..()
	if(active)
		time_triggered = world.time
		hiss_loop.start()
		set_light_on(TRUE)


/obj/item/explosive/grenade/high_explosive/plasma/prime(mob/living/user)
	set waitfor = 0
	if(!attached) //if it is attached then the component thing does special behaviour
		cell_explosion(src.loc, explosion_power, explosion_falloff, falloff_mode, null, cause_data)
		new /obj/effect/overlay/temp/sebb(get_turf(src))
		new /obj/effect/overlay/temp/emp_sparks(get_turf(src))
		for(var/mob/living/target_living in range(3, get_turf(src)))
			if(!check_for_obstacles_projectile(get_turf(src), get_turf(target_living), GLOB.ammo_list[/datum/ammo/bullet/shrapnel/incendiary/heavy]))
				var/datum/reagent/napalm/blue/reagent = new()
				target_living.TryIgniteMob(5, reagent)
		if(shrapnel_count)
			create_shrapnel(loc, shrapnel_count, , ,shrapnel_type, cause_data)
		apply_explosion_overlay()
		empulse(src, 1, 2) // mini EMP
		qdel(src)

/obj/item/explosive/grenade/high_explosive/plasma/launch_impact(atom/hit_atom)
	. = ..()
	if(active)
		for(var/atomtype in atoms_it_can_stick_to)
			if(istype(hit_atom, atomtype))
				var/datum/launch_metadata/LM = launch_metadata
				var/zone
				if (istype(LM.thrower, /mob/living))
					var/mob/living/L = LM.thrower
					zone = check_zone(L.zone_selected)
				else
					zone = rand_zone("chest", 75) //Hits a random part of the body, geared towards the chest
				hit_atom.AddComponent(/datum/component/status_effect/plasma_stuck, src, zone)
			else if(isturf(hit_atom))
				for(var/obj/vehicle/multitile/big_car in hit_atom)
					hit_atom = big_car
					hit_atom.AddComponent(/datum/component/status_effect/plasma_stuck, src)
					return


/datum/looping_sound/plasma_hiss
	start_sound = list('sound/weapons/halo/firebomb_throw.ogg' = 1)
	mid_sounds = list('sound/weapons/halo/firebomb_loop2.ogg' = 1,'sound/weapons/halo/firebomb_loop1.ogg' = 1)
	mid_length = 1 SECONDS

/datum/component/status_effect/plasma_stuck
	dupe_mode = COMPONENT_DUPE_ALLOWED
	var/obj/item/explosive/grenade/high_explosive/plasma/origin_nade
	var/zone
	var/stage = 0
	var/time_running = 0
	var/y_offset
	var/x_offset
	var/mutable_appearance/attached_icon_em
	var/image/attached_icon
	var/time_triggered

/datum/component/status_effect/plasma_stuck/Initialize(origin_nade, zone)
	. = ..()
	src.origin_nade = origin_nade
	src.zone = zone
	if(src.origin_nade.attached)
		qdel(src)
		return
	//to_chat(parent, SPAN_HIGHDANGER("holy shit!"))
	var/atom/movable/parent_atom = parent

	if(ismob(parent_atom))
		update_human_icon()
	else
		if(isVehicle(parent_atom))
			update_vehicle_icon()
			src.origin_nade.alpha = 0
			src.origin_nade.mouse_opacity = 0 //lol

	attached_icon.pixel_x = x_offset
	attached_icon.pixel_y = y_offset
	attached_icon_em.pixel_x = x_offset
	attached_icon_em.pixel_y = y_offset
	attached_icon.layer = ABOVE_MOB_LAYER+0.1
	attached_icon_em.layer = ABOVE_MOB_LAYER+0.1
	parent_atom.overlays += attached_icon
	attached_icon_em.appearance_flags  &= ~RESET_TRANSFORM
	parent_atom.overlays += attached_icon_em
	src.origin_nade.attached = TRUE
	src.origin_nade.forceMove(parent_atom)
	src.origin_nade.set_light_on(TRUE)
	time_running = (world.time - src.origin_nade.time_triggered) //fuse time minus cook time
	RegisterSignal(parent_atom, list(
	COMSIG_LIVING_REJUVENATED,
	), PROC_REF(unstuck))
	START_PROCESSING(SSdcs, src)

/datum/component/status_effect/plasma_stuck/proc/unstuck(delete_nade = TRUE)
	var/atom/movable/parent_atom = parent
	if(delete_nade)
		qdel(src.origin_nade)
	else
		src.origin_nade.forceMove(parent_atom.loc)
		src.origin_nade.attached = FALSE
		addtimer(CALLBACK(src.origin_nade, TYPE_PROC_REF(/obj/item/explosive/grenade/high_explosive/plasma, prime)), src.origin_nade.det_time-time_running)
		INVOKE_ASYNC(src.origin_nade, TYPE_PROC_REF(/atom/movable, throw_atom), get_random_turf_in_range_unblocked(parent_atom, 3, 1), src.origin_nade.throw_range, SPEED_SLOW, parent_atom,  HIGH_LAUNCH)
	parent_atom.overlays -= attached_icon
	parent_atom.overlays -= attached_icon_em
	qdel(src)

/datum/component/status_effect/plasma_stuck/proc/update_vehicle_icon()
	var/atom/movable/parent_atom = parent
	x_offset = parent_atom.bound_width/4
	y_offset = parent_atom.bound_height/4
	x_offset += rand(-3, 3)
	y_offset += rand(-3, 3)
	switch(src.origin_nade.dir)
		if(NORTH)
			y_offset -= 8
		if(SOUTH)
			y_offset += 8
		if(EAST)
			x_offset -= 8
		if(WEST)
			x_offset += 8
		if(NORTHEAST)
			x_offset -= 6
			y_offset -= 6
		if(NORTHWEST)
			x_offset += 6
			y_offset -= 6
		if(SOUTHEAST)
			x_offset -= 6
			y_offset += 6
		if(SOUTHWEST)
			x_offset += 6
			y_offset += 6
	attached_icon = image(icon = 'icons/halo/obj/items/weapons/grenades.dmi', icon_state = "stuck_plasma")
	attached_icon_em = emissive_appearance(icon = 'icons/halo/obj/items/weapons/grenades.dmi', icon_state = "stuck_plasma")


/datum/component/status_effect/plasma_stuck/proc/update_human_icon()
	x_offset = rand(-3, 3)
	if(zone in list("chest", "head", "groin"))
		attached_icon = image(icon = 'icons/halo/obj/items/weapons/grenades.dmi', icon_state = "stuck_plasma_centerbody")
		attached_icon_em = emissive_appearance(icon = 'icons/halo/obj/items/weapons/grenades.dmi', icon_state = "stuck_plasma_centerbody")
		if(zone == "head")
			y_offset = rand(4, 7)
		else
			if(zone == "chest")
				y_offset = rand(2,5)
			else
				y_offset = rand(1, -2)
	else
		attached_icon = image(icon = 'icons/halo/obj/items/weapons/grenades.dmi', icon_state = "stuck_plasma")
		attached_icon_em = emissive_appearance(icon = 'icons/halo/obj/items/weapons/grenades.dmi', icon_state = "stuck_plasma")
		if(zone in list("r_arm", "r_leg", "r_hand", "r_foot", "l_foot"))
			attached_icon.transform = matrix(-1, 0, 0, 0, 1, 0)
			attached_icon.transform.Translate(32, 0) // moves it back to where it was
			attached_icon_em.transform = matrix(-1, 0, 0, 0, 1, 0)
			attached_icon_em.transform.Translate(32, 0) // moves it back to where it was
		if(zone in list("l_arm", "r_arm", "l_hand", "r_hand"))
			y_offset = rand(-1,2)
		else
			if(zone in list("r_leg", "l_leg"))
				y_offset = rand(-2, -5)
			else
				y_offset = rand(-7, -9)

/datum/component/status_effect/plasma_stuck/process(delta_time)
	var/atom/parent_atom = parent
	time_running += delta_time

	if(ishuman(parent_atom))
		var/mob/living/carbon/human/stuck_human = parent_atom
		stuck_human.apply_damage(10*(delta_time/5), BURN, zone)
	else
		if(isVehicle(parent_atom))
			var/obj/vehicle/multitile/mob = parent_atom
			update_vehicle_icon()
			mob.take_damage_type(100*(delta_time/5), "plasma flame", src)
			update_vehicle_icon()
	light_tune(max(time_running/5, 1))
	if(time_running >= 0.5 SECONDS && stage == 0)
		animation_flash_color(parent_atom, COLOR_CYAN)
		if(ishuman(parent_atom))
			var/mob/living/carbon/human/stuck_human = parent_atom
			stuck_human.apply_damage(10, BURN, zone)
			INVOKE_ASYNC(stuck_human, TYPE_PROC_REF(/mob, emote), "pain")
			to_chat(parent, SPAN_HIGHDANGER("An agonizingly bright light burns into your [parse_zone(zone)]!"))
		else
			if(isVehicleMultitile(parent_atom))
				var/obj/vehicle/multitile/mob = parent_atom
				var/turf/centre = mob.interior.get_middle_turf()
				var/turf/target = get_random_turf_in_range(centre, 2, 0)
				var/datum/reagent/napalm/blue/reagent = new()
				new /obj/flamer_fire(target, create_cause_data("Plasma Nade Cookoff"), reagent, 1)
				mob.interior_crash_effect()
		stage = 1

	if(time_running >= 1.5 SECONDS && stage == 1)
		animation_flash_color(parent_atom, COLOR_BLUE)
		if(ishuman(parent_atom))
			var/mob/living/carbon/human/stuck_human = parent_atom
			stuck_human.apply_damage(15, BURN, zone)
			var/obj/limb/stuck_limb = stuck_human.get_limb(zone)
			to_chat(parent, SPAN_HIGHDANGER("Your bones start to melt!"))
			stuck_limb.fracture(100)
		else
			if(isVehicleMultitile(parent_atom))
				var/obj/vehicle/multitile/mob = parent_atom
				var/turf/centre = mob.interior.get_middle_turf()
				var/turf/target = get_random_turf_in_range(centre, 2, 0)
				var/datum/reagent/napalm/blue/reagent = new()
				new /obj/flamer_fire(target, create_cause_data("Plasma Nade Cookoff"), reagent, 1)
				mob.interior_crash_effect()
		stage = 2
	if(time_running >= 3 SECONDS && stage == 2)
		animation_flash_color(parent_atom, COLOR_STRONG_VIOLET)
		if(ishuman(parent_atom))
			to_chat(parent, SPAN_HIGHDANGER("holy shit!"))
			var/mob/living/carbon/human/stuck_human = parent_atom
			stuck_human.apply_damage(15, BURN, zone)
			var/obj/limb/stuck_limb = stuck_human.get_limb(zone)
			stuck_limb.droplimb()
			origin_nade.attached = FALSE
			origin_nade.prime()
			stuck_human.gib()
		else
			if(isVehicleMultitile(parent_atom))
				var/obj/vehicle/multitile/mob = parent_atom
				var/turf/centre = mob.interior.get_middle_turf()
				var/turf/target = get_random_turf_in_range(centre, 2, 0)
				var/datum/reagent/napalm/blue/reagent = new()
				new /obj/flamer_fire(target,create_cause_data("Plasma Nade Cookoff"),reagent, 1)
				mob.at_munition_interior_explosion_effect(cause_data = create_cause_data("Plasma Nade Cookoff"))
				mob.interior_crash_effect()
				mob.ex_act(300)
			else
		stage = 3
		origin_nade.hiss_loop.stop()
		qdel(origin_nade)
		qdel(src)

/datum/component/status_effect/plasma_stuck/proc/light_tune(intensity) // Might as well keep this too.
	origin_nade.set_light_range(intensity)

/proc/check_for_obstacles_projectile(atom/source, atom/target, obj/projectile/P)
	var/list/turf/path = get_line(source, target, include_start_atom = FALSE)
	if(!length(path) || get_dist(source, target) > P.ammo.max_range)
		return TRUE

	var/blocked = FALSE
	for(var/turf/T in path)
		if(T.density)
			blocked = TRUE
			break

		for(var/obj/O in T)
			if(O.get_projectile_hit_boolean(P))
				blocked = TRUE
				break

	return blocked
