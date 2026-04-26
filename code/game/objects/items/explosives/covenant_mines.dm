//[Parent]\\

/obj/item/explosive/mine/covenant
	icon = 'icons/obj/items/weapons/covenant_mines.dmi'
	icon_state = "plasmamine"

//[Plasma Mine]\\

/obj/item/explosive/mine/covenant/plasma
	name = "\improper Plasma Mine"
	desc = null
	angle = 360
	var/disarmed = FALSE
	icon_state = "plasmamine"
	explosive_power = 70
	explosive_falloff = 40
	base_disarm_fail_chance = 70
	base_disarm_time = 40
	has_tripwire = FALSE
	blast_tolerance = 85 //A C4 directly next to it will disarm the mine. Mostly for giving an option for disarming it.
	detonation_flavor = "step on it!"
	var/radius = 1
	var/flame_level = BURN_TIME_INSTANT
	var/burn_level = BURN_LEVEL_TIER_7
	var/flameshape = FLAMESHAPE_IRREGULAR
	var/fire_type = FIRE_VARIANT_TYPE_X
	detonation_flavor = "moves near it!"

/obj/item/explosive/mine/covenant/plasma/get_examine_text(mob/living/carbon/human/user)
	. = ..()
	var/list/origin = .
	var/insert_line
	if(isunggoy(user) || issangheili(user))
		origin[1] = "[icon2html(src, user)] This is a Vastem Pattern Firecharge"
		insert_line = "A standard modular-purpose explosive in use by the legions of the Covenant. When activated as a mine the device will detonate whenever a hostile or unknown entity crosses over it, exploding violently. The firecharge produces ample plasma accelerated high velocity shrapnel commonly thrown far around it by the sudden blast. This capability may also be used offensively, as a placed charge against portals or walls. The Vastem Pattern Firecharge has a long history in the Covenant, having served for over a thousand years as an adaptable explosive. Though used sparingly as a landmine by most forces, who prefer mobility and violence of action over static defence, the Vastem Pattern Firecharge has nonetheless earned a grim respect for its unassuming ability to blunt even dedicated assaults. It is a veteran's wisdom to always watch where one steps."
	else
		origin[1] = "[icon2html(src, user)] This is a Type-4 Multipurpose Charge"
		insert_line = "A Covenant antipersonnel mine and demolition charge rolled into one, employs technology similar to the more common Type-1 Antipersonnel Grenade. A devastating device used to prepare ambushes, sabotage patrol routes and defend fortifications, or for making new doorways, depending on deployment. The Type-4 has become the bane of many a marine or Army soldier, being difficult to detect with most conventional minesweeping or sapping equipment when used as a mine, paired with a viciously short arming period means entire units have seen mass-casualty events incurred from just a few of these carefully planted devices, in defensive or offensive deployments."
	origin.Insert(2, insert_line)


/obj/item/explosive/mine/covenant/plasma/check_for_obstacles(mob/living/user)
	return FALSE

/obj/item/explosive/mine/covenant/plasma/prime(mob/user)
	set waitfor = 0
	if(!cause_data)
		cause_data = create_cause_data(initial(name), user)
	new /obj/effect/temp_visual/plasma_explosion(loc)
	cell_explosion(loc, explosive_power, explosive_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, explosion_cause_data = cause_data)
	flame_radius(cause_data, radius, loc, flame_level, burn_level, flameshape, null, fire_type)
	playsound(loc, 'sound/weapons/mine_tripped.ogg', 45)
	qdel(src)

/obj/item/explosive/mine/covenant/plasma/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_MULTITOOL))
		if(active)
			if(user.action_busy)
				return
			if(user.faction == iff_signal)
				user.visible_message(SPAN_NOTICE("[user] starts unearthing and deactivating [src]."), \
				SPAN_NOTICE("You start unearthing and deactivating [src]."))
			else
				user.visible_message(SPAN_NOTICE("[user] starts attempting to disarm \the [src], while being careful to not set it off."), \
				SPAN_NOTICE("You start disarming [src], handling it with care."))
			//handles custom skill dependent disarm chances.
			var/disarm_time = base_disarm_time
			var/disarm_fail_chance = base_disarm_fail_chance
			if(user.skills)
				if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_MASTER))
					to_chat(user, SPAN_WARNING("It's tough but it aint invincible, with some elbow grease and a bit of luck you might not become a ball of plasma."))
					disarm_time = 5
					disarm_fail_chance = 15
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_ENGI))
					to_chat(user, SPAN_WARNING("Could be worse. But it's still not really great. You begin trying to mess with the mines internals."))
					disarm_time = 15
					disarm_fail_chance = 30
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_TRAINED))
					to_chat(user, SPAN_WARNING("You examine the [src] for a moment. With the panel open you can see alien wiring, maybe try the red-ish one?."))
					disarm_time = 20
					disarm_fail_chance = 60
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_NOVICE))
					to_chat(user, SPAN_WARNING("You examine the mine. It's..uh well, you can see a panel? With some caution, you begin disarming the [src]."))
					disarm_time = 30
					disarm_fail_chance = 90
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_UNTRAINED))
					to_chat(user, SPAN_WARNING("It just looks like some giant purple box thing, I don't know about this..."))

			if(!do_after(user, disarm_time, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops disarming the [src]."), \
					SPAN_WARNING("You stop disarming the [src]."))
				return
			if(user.faction != iff_signal) //ow!
				if(prob(disarm_fail_chance))
					triggered = TRUE
					if(tripwire)
						var/direction = GLOB.reverse_dir[src.dir]
						var/step_direction = get_step(src, direction)
						tripwire.forceMove(step_direction)
					prime()
			if(!active)//someone beat us to it
				return
			user.visible_message(SPAN_NOTICE("[user] finishes disarming the [src]."), \
			SPAN_NOTICE("You finish disarming the [src]."))
			disarm()

	else
		return ..()

/obj/item/explosive/mine/covenant/plasma/disarm()
	anchored = FALSE
	active = FALSE
	triggered = FALSE
	QDEL_NULL(tripwire)
	disarmed = TRUE
	add_to_garbage(src)

/obj/item/explosive/mine/covenant/plasma/attack_self(mob/living/user)
	if(disarmed)
		return
	. = ..()

/obj/item/explosive/mine/covenant/plasma/deploy_mine(mob/user)
	if(disarmed)
		return
	if(!hard_iff_lock && user)
		iff_signal = user.faction

	cause_data = create_cause_data(initial(name), user)
	anchored = TRUE
	if(user)
		user.drop_inv_item_on_ground(src)
	setDir(user ? user.dir : dir) //The direction it is planted in is the direction the user faces at that time
	activate_sensors()
	update_icon()
	for(var/mob/living/carbon/mob in range(1, src))
		src.try_to_prime(mob)

/obj/item/explosive/mine/covenant/plasma/attack_alien()
	if(disarmed)
		..()
	else
		return

//Active
/obj/item/explosive/mine/covenant/plasma/active
	icon_state = "plasmamine_active"
	base_icon_state = "plasmamine"
	map_deployed = TRUE

//[NEEDLE MINE]\\

/obj/item/explosive/mine/covenant/needle_mine
	name = "\improper needle landmine"
	desc = null
	icon_state = "needlemine"
	angle = 360
	var/disarmed = FALSE
	explosive_power = 25
	explosive_falloff = 25
	base_disarm_time = 45
	base_disarm_fail_chance = 50
	blast_tolerance = 95 //Will require a C4 directly on top of it...!
	has_tripwire = FALSE
	detonation_flavor = "moves near it!"

/obj/item/explosive/mine/covenant/needle_mine/get_examine_text(mob/living/carbon/human/user)
	. = ..()
	var/list/origin = .
	var/insert_line
	if(isunggoy(user) || issangheili(user))
		origin[1] = "[icon2html(src, user)] This is a Var'zes Pattern Blastcharge"
		insert_line = "A landmine of ancient design, still in use by the Covenant's legions. Employing older design philosophy and materials, it nonetheless remains both popular and lethal. Once stepped upon the weapon will deploy a withering blast of the violent shards into any surrounding targets, known to commonly disable many thanks to its abundant micro-shrapnel. A design hearkening back to the ages before the Covenant, the Var'zes has seen consistent employment by the Sangheili who first designed it for over three millennia. While landmines and stationary weapons are less common in Covenant use, they remain popular among troops who hope to damage enemy morale as much as their bodies."
	else
		origin[1] = "[icon2html(src, user)] This is a Type-5 Antipersonnel Fragmentation Mine"
		insert_line = "The Type-5 is a vicious Covenant antipersonnel mine, deployed defensively and aggressively. Unlike the Type-4, the Type-5 employs a 'blamite' crystal munition over a more complex plasma charge, when its arming plate is depressed the weapon detonates with a shrill scream as high-velocity crystals fire out in all directions. Killing power is extreme, augmented by a significant wound radius. UNSC personnel have reported the use of the Type-5 as much higher in areas with greater presence of Jackal snipers and marksmen teams, suggesting a correlation between the weapons innate cruelty and the Jackals propensity for brutal tactics. If you see one, potentially expect the other."
	origin.Insert(2, insert_line)

/obj/item/explosive/mine/covenant/needle_mine/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_MULTITOOL))
		if(active)
			if(user.action_busy)
				return
			if(user.faction == iff_signal)
				user.visible_message(SPAN_NOTICE("[user] starts unearthing and deactivating [src]."), \
				SPAN_NOTICE("You start unearthing and deactivating [src]."))
			else
				user.visible_message(SPAN_NOTICE("[user] starts attempting to disarm \the [src], while being careful to not set it off."), \
				SPAN_NOTICE("You start disarming [src], handling it with care."))
			//handles custom skill dependent disarm chances.
			var/disarm_time = base_disarm_time
			var/disarm_fail_chance = base_disarm_fail_chance
			if(user.skills)
				if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_MASTER))
					to_chat(user, SPAN_WARNING("It's tough but it aint invincible, with some elbow grease and a bit of luck you might not become a ball of plasma."))
					disarm_time = 5
					disarm_fail_chance = 15
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_ENGI))
					to_chat(user, SPAN_WARNING("Could be worse. But it's still not really great. You begin trying to mess with the mines internals."))
					disarm_time = 15
					disarm_fail_chance = 30
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_TRAINED))
					to_chat(user, SPAN_WARNING("You examine the [src] for a moment. With the panel open you can see alien wiring, maybe try the red-ish one?."))
					disarm_time = 20
					disarm_fail_chance = 60
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_NOVICE))
					to_chat(user, SPAN_WARNING("You examine the mine. It's..uh well, you can see a panel? With some caution, you begin disarming the [src]."))
					disarm_time = 30
					disarm_fail_chance = 90
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_UNTRAINED))
					to_chat(user, SPAN_WARNING("It just looks like some giant purple box thing, I don't know about this..."))

			if(!do_after(user, disarm_time, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops disarming [src]."), \
					SPAN_WARNING("You stop disarming [src]."))
				return
			if(user.faction != iff_signal) //ow!
				if(prob(disarm_fail_chance))
					triggered = TRUE
					if(tripwire)
						var/direction = GLOB.reverse_dir[src.dir]
						var/step_direction = get_step(src, direction)
						tripwire.forceMove(step_direction)
					prime()
			if(!active)//someone beat us to it
				return
			user.visible_message(SPAN_NOTICE("[user] finishes disarming [src]."), \
			SPAN_NOTICE("You finish disarming [src]."))
			disarm()

/obj/item/explosive/mine/covenant/needle_mine/disarm()
	anchored = FALSE
	active = FALSE
	triggered = FALSE
	QDEL_NULL(tripwire)
	disarmed = TRUE
	add_to_garbage(src)

/obj/item/explosive/mine/covenant/needle_mine/attack_self(mob/living/user)
	if(disarmed)
		return
	. = ..()

/obj/item/explosive/mine/covenant/needle_mine/deploy_mine(mob/user)
	if(disarmed)
		return
	if(!hard_iff_lock && user)
		iff_signal = user.faction

	cause_data = create_cause_data(initial(name), user)
	anchored = TRUE
	if(user)
		user.drop_inv_item_on_ground(src)
	setDir(user ? user.dir : dir) //The direction it is planted in is the direction the user faces at that time
	activate_sensors()
	update_icon()
	for(var/mob/living/carbon/mob in range(1, src))
		src.try_to_prime(mob)

/obj/item/explosive/mine/covenant/needle_mine/attack_alien()
	if(disarmed)
		..()
	else
		return

/obj/item/explosive/mine/covenant/needle_mine/check_for_obstacles(mob/living/user)
	return FALSE

/obj/item/explosive/mine/covenant/needle_mine/prime(mob/user)
	set waitfor = 0
	if(!cause_data)
		cause_data = create_cause_data(initial(name), user)
	create_shrapnel(loc, 32, dir, 360, /datum/ammo/needler, cause_data)
	cell_explosion(loc, explosive_power, explosive_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, CARDINAL_ALL_DIRS, cause_data)
	playsound(loc, 'sound/effects/halo/supercombine.ogg', 45)
	qdel(src)

/obj/item/explosive/mine/covenant/needle_mine/active
	icon_state = "needlemine_active"
	base_icon_state = "needlemine"
	map_deployed = TRUE

/obj/item/explosive/plastic/breaching_charge/plasma/halo
	name = "covenant plasma charge"
	desc = "An alien explosive device. Who knows what it might do."
	icon = 'icons/obj/items/weapons/covenant_mines.dmi'
	icon_state = "plasmacharge"
	overlay_image = "plasmacharge_active"
	w_class = SIZE_SMALL
	angle = 55
	timer = 5
	min_timer = 5
	penetration = 0.60
	deploying_time = 10
	flags_item = NOBLUDGEON
	shrapnel_volume = 10
	shrapnel_type = /datum/ammo/bullet/shrapnel/plasma
	explosion_strength = 90

/obj/item/explosive/plastic/breaching_charge/plasma/halo/get_examine_text(mob/living/carbon/human/user)
	. = ..()
	var/list/origin = .
	var/insert_line
	if(isunggoy(user) || issangheili(user))
		origin[1] = "[icon2html(src, user)] This is a Vastem Pattern Firecharge"
		insert_line = "A standard modular-purpose explosive in use by the legions of the Covenant. When activated as a mine the device will detonate whenever a hostile or unknown entity crosses over it, exploding violently. The firecharge produces ample plasma accelerated high velocity shrapnel commonly thrown far around it by the sudden blast. This capability may also be used offensively, as a placed charge against portals or walls. The Vastem Pattern Firecharge has a long history in the Covenant, having served for over a thousand years as an adaptable explosive. Though used sparingly as a landmine by most forces, who prefer mobility and violence of action over static defence, the Vastem Pattern Firecharge has nonetheless earned a grim respect for its unassuming ability to blunt even dedicated assaults. It is a veteran's wisdom to always watch where one steps."
	else
		origin[1] = "[icon2html(src, user)] This is a Type-4 Multipurpose Charge"
		insert_line = "A Covenant antipersonnel mine and demolition charge rolled into one, employs technology similar to the more common Type-1 Antipersonnel Grenade. A devastating device used to prepare ambushes, sabotage patrol routes and defend fortifications, or for making new doorways, depending on deployment. The Type-4 has become the bane of many a marine or Army soldier, being difficult to detect with most conventional minesweeping or sapping equipment when used as a mine, paired with a viciously short arming period means entire units have seen mass-casualty events incurred from just a few of these carefully planted devices, in defensive or offensive deployments."
	origin.Insert(2, insert_line)
