/*
The contents of this file were originally licensed under CC-BY-NC-SA 3.0 as part of Goonstation(https://ss13.co).
However, /tg/station and derivative codebases have been granted the right to use this code under the terms of the AGPL.
The original authors are: cogwerks, pistoleer, spyguy, angriestibm, marquesas, and stuntwaffle.
If you make a derivative work from this code, you must include this notification header alongside it.
*/

/datum/action/human_action/activable/throw_wrestle
	name = "spin throw"
	icon_file = 'icons/halo/mob/hud/actions.dmi'
	action_icon_state = "throw"
	var/cooldown_throw = 15 SECONDS
	var/fling_distance = 2

/datum/action/human_action/activable/throw_wrestle/New(mob/living/user, obj/item/holder)
	..()
	name = "spin throw"
	button.icon = icon_file
	button.name = name
	button.overlays.Cut()
	var/image/IMG = image('icons/halo/mob/hud/actions.dmi', button, "throw")
	button.overlays += IMG
	update_button_icon()

/datum/action/human_action/activable/throw_wrestle/use_ability(atom/target, mob/living/carbon/owner)
	owner = usr

	if(!owner.Adjacent(target))
		return

	if(owner.body_position == LYING_DOWN)
		return

	if(target == owner)
		return

	var/mob/living/carbon/human/human_target = target

	if(!action_cooldown_check())
		to_chat(owner, SPAN_WARNING("You can't do that yet..."))
		return

	if(!owner.pulling || owner.pulling != human_target)
		to_chat(owner, SPAN_WARNING("You need to have [human_target] in a cinch!"))
		return

	var/block_probability
	var/target_skill = human_target?.skills?.get_skill_level(SKILL_CQC)

	switch(target_skill)
		if(SKILL_CQC_SKILLED)
			block_probability = 35
		if(SKILL_CQC_EXPERT)
			block_probability = 65
	if(owner.grab_level < GRAB_AGGRESSIVE)
		block_probability = block_probability/2

	if(target_skill >= SKILL_CQC_SKILLED && prob(block_probability))
		to_chat(owner, SPAN_WARNING("[human_target] blocks your move!"))
		return

	human_target.forceMove(owner.loc)
	human_target.setDir(get_dir(human_target, owner))
	human_target.apply_effects(weaken = 5)
	human_target.visible_message(SPAN_DANGER("[owner] starts spinning around with [human_target]!"), \
					SPAN_USERDANGER("You're spun around by [owner]!"), SPAN_COMBAT("You hear aggressive shuffling!"), null, owner)
	to_chat(owner, SPAN_DANGER("You start spinning around with [human_target]!"))
	owner.emote("scream")
	human_target.emote("scream")

	for (var/i in 1 to 20)
		var/delay = 5
		switch (i)
			if (18 to INFINITY)
				delay = 0.25
			if (15 to 17)
				delay = 0.5
			if (10 to 14)
				delay = 1
			if (6 to 9)
				delay = 2
			if (1 to 5)
				delay = 3

		if(owner && human_target)

			if (get_dist(owner, human_target) > 1)
				to_chat(owner, SPAN_WARNING("[human_target] is too far away!"))
				return
			if(owner.body_position == LYING_DOWN)
				human_target.pixel_x = 0
				human_target.pixel_y = 0
				return
			if (!isturf(owner.loc) || !isturf(human_target.loc))
				to_chat(owner, SPAN_WARNING("You can't throw [human_target] from here!"))
				return

			owner.setDir(turn(owner.dir, 90))
			var/turf/T = get_step(owner, owner.dir)
			var/direction = get_dir(T, owner)
			var/target_x
			var/target_y
			human_target.forceMove(owner.loc)
			switch(owner.dir)
				if (NORTH)
					target_x = 0
					target_y = 22
				if (SOUTH)
					target_x = 0
					target_y = -22
				if (EAST)
					target_x = 22
					target_y = 0
				if (WEST)
					target_x = -22
					target_y = 0
			human_target.setDir(direction)
			playsound(owner.loc, 'sound/effects/throwing/swoosh1.ogg', 50, TRUE)
			for(var/mob/living/collateral in T)
				if(collateral.body_position == STANDING_UP)
					playsound(owner.loc, "swing_hit", 50, TRUE)
					collateral.emote("scream")
					collateral.apply_effects(weaken = 3)
					collateral.apply_armoured_damage(75, ARMOR_MELEE, BRUTE)
			animate(human_target, pixel_x = target_x, pixel_y = target_y, time = 5, easing = LINEAR_EASING, flags = ANIMATION_END_NOW|ANIMATION_PARALLEL)
		else
			return

		sleep(delay)

	if(owner && human_target)
		// These are necessary because of the sleep call.

		if (get_dist(owner, human_target) > 1)
			to_chat(owner, SPAN_WARNING("[human_target] is too far away!"))
			return

		if (!isturf(owner.loc) || !isturf(human_target.loc))
			to_chat(owner, SPAN_WARNING("You can't throw [human_target] from here!"))
			return

		human_target.forceMove(owner.loc) // Maybe this will help with the wallthrowing bug.

		human_target.visible_message(SPAN_DANGER("[owner] throws [human_target]!"), \
						SPAN_USERDANGER("You're thrown by [owner]!"), SPAN_COMBAT("You hear aggressive shuffling and a loud thud!"), null, owner)
		to_chat(owner, SPAN_DANGER("You throw [human_target]!"))
		playsound(owner.loc, "swing_hit", 50, TRUE)
		var/turf/T = get_edge_target_turf(owner, owner.dir)
		if (T && isturf(T))
			if (!human_target.stat)
				human_target.emote("scream")
			human_target.pixel_x = 0
			human_target.pixel_y = 0
			owner.throw_carbon(human_target, owner.dir, 10)
			human_target.apply_effects(weaken = 8, weaken = 10)
			human_target.apply_armoured_damage(100, ARMOR_MELEE, BRUTE)
	enter_cooldown(cooldown_throw)
	return

/datum/action/human_action/activable/slam
	name = "slam"
	icon_file = 'icons/halo/mob/hud/actions.dmi'
	action_icon_state = "slam"
	var/cooldown_slam = 15 SECONDS

/datum/action/human_action/activable/slam/New(mob/living/user, obj/item/holder)
	..()
	name = "slam"
	button.icon = icon_file
	button.name = name
	button.overlays.Cut()
	var/image/IMG = image('icons/halo/mob/hud/actions.dmi', button, "slam")
	button.overlays += IMG
	update_button_icon()

/datum/action/human_action/activable/slam/use_ability(atom/target, mob/living/carbon/owner)
	owner = usr

	if (!owner.Adjacent(target))
		return

	if(owner.body_position == LYING_DOWN)
		return

	if(target == owner)
		return

	var/mob/living/carbon/human/human_target = target

	if(!action_cooldown_check())
		to_chat(owner, SPAN_WARNING("You can't do that yet..."))
		return

	if(!owner.pulling || owner.pulling != human_target)
		to_chat(owner, SPAN_WARNING("You need to have [human_target] in a cinch!"))
		return

	var/block_probability
	var/target_skill = human_target?.skills?.get_skill_level(SKILL_CQC)

	switch(target_skill)
		if(SKILL_CQC_SKILLED)
			block_probability = 35
		if(SKILL_CQC_EXPERT)
			block_probability = 65
	if(owner.grab_level < GRAB_AGGRESSIVE)
		block_probability = block_probability/2

	if(target_skill >= SKILL_CQC_SKILLED && prob(block_probability))
		to_chat(owner, SPAN_WARNING("[human_target] blocks your move!"))
		return

	human_target.forceMove(owner.loc)
	owner.setDir(get_dir(owner, human_target))
	human_target.setDir(get_dir(human_target, owner))

	human_target.visible_message(SPAN_DANGER("[owner] lifts [human_target] up!"), \
					SPAN_USERDANGER("You're lifted up by [owner]!"), SPAN_COMBAT("You hear aggressive shuffling!"), null, owner)
	to_chat(owner, SPAN_WARNING("You lift [human_target] up!"))

	FlipAnimation(human_target)

	for (var/i in 1 to 3)
		if (owner && human_target)
			owner.pixel_y += 3
			human_target.pixel_y += 3
			owner.setDir(turn(owner.dir, 90))
			human_target.setDir(turn(human_target.dir, 90))

			switch (owner.dir)
				if (NORTH)
					human_target.pixel_x = owner.pixel_x
				if (SOUTH)
					human_target.pixel_x = owner.pixel_x
				if (EAST)
					human_target.pixel_x = owner.pixel_x - 8
				if (WEST)
					human_target.pixel_x = owner.pixel_x + 8

			if (get_dist(owner, human_target) > 1)
				to_chat(owner, SPAN_WARNING("[human_target] is too far away!"))
				owner.pixel_x = owner.base_pixel_x
				owner.pixel_y = owner.base_pixel_y
				human_target.pixel_x = human_target.base_pixel_x
				human_target.pixel_y = human_target.base_pixel_y
				return

			if (!isturf(owner.loc) || !isturf(human_target.loc))
				to_chat(owner, SPAN_WARNING("You can't slam [human_target] here!"))
				owner.pixel_x = owner.base_pixel_x
				owner.pixel_y = owner.base_pixel_y
				human_target.pixel_x = human_target.base_pixel_x
				human_target.pixel_y = human_target.base_pixel_y
				return
		else
			if (owner)
				owner.pixel_x = owner.base_pixel_x
				owner.pixel_y = owner.base_pixel_y
			if (human_target)
				human_target.pixel_x = human_target.base_pixel_x
				human_target.pixel_y = human_target.base_pixel_y
			return

		sleep(0.1 SECONDS)

	if (owner && human_target)
		owner.pixel_x = owner.base_pixel_x
		owner.pixel_y = owner.base_pixel_y
		human_target.pixel_x = human_target.base_pixel_x
		human_target.pixel_y = human_target.base_pixel_y

		if (get_dist(owner, human_target) > 1)
			to_chat(owner, SPAN_WARNING("[human_target] is too far away!"))
			return

		if (!isturf(owner.loc) || !isturf(human_target.loc))
			to_chat(owner, SPAN_WARNING("You can't slam [human_target] here!"))
			return

		human_target.forceMove(owner.loc)

		human_target.visible_message(SPAN_DANGER("[owner] body-slam [human_target]!"), \
						SPAN_USERDANGER("You're body-slammed by [owner]!"), SPAN_COMBAT("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, owner)
		to_chat(owner, SPAN_DANGER("You body-slam [human_target]!"))
		playsound(owner.loc, "swing_hit", 50, TRUE)
		if(!human_target.stat)
			human_target.emote("scream")
		human_target.apply_effects(weaken = 10)
		human_target.apply_armoured_damage(175, ARMOR_MELEE, BRUTE)
	else
		if (owner)
			owner.pixel_x = owner.base_pixel_x
			owner.pixel_y = owner.base_pixel_y
		if (human_target)
			human_target.pixel_x = human_target.base_pixel_x
			human_target.pixel_y = human_target.base_pixel_y
	enter_cooldown(cooldown_slam)
	return

/datum/action/human_action/activable/slam/proc/FlipAnimation(mob/living/defender)
	set waitfor = FALSE
	if (defender)
		animate(defender, transform = matrix(180, MATRIX_ROTATE), time = 1, loop = 0)
	sleep(1.5 SECONDS)
	if (defender)
		animate(defender, transform = matrix(defender.lying_angle, MATRIX_ROTATE), time = 1, loop = 0)
