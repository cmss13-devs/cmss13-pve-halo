// Warrior Lunge
/datum/action/human_action/activable/lunge
	name = "Lunge"
	icon_file = 'icons/mob/hud/actions_xeno.dmi'
	action_icon_state = "lunge"
	cooldown = 10 SECONDS

	// Configurables
	var/grab_range = 4
	var/twitch_message_cooldown = 0 //apparently this is necessary for a tiny code that makes the lunge message on cooldown not be spammable, doesn't need to be big so 5 will do.

/datum/action/human_action/activable/lunge/use_ability(atom/affected_atom, mob/living/carbon/owner)
	owner = usr

	if(!action_cooldown_check())
		to_chat(owner, SPAN_WARNING("You can't do that yet..."))
		return

	if (!affected_atom)
		return

	if (!isturf(owner.loc))
		to_chat(owner, SPAN_WARNING("We can't lunge from here!"))
		return

	var/mob/living/carbon/carbon = affected_atom
	if(carbon.stat == DEAD)
		return

	enter_cooldown(cooldown)
	..()

	owner.visible_message(SPAN_WARNING("[owner] lunges towards [carbon]!"), SPAN_WARNING("We lunge at [carbon]!"))

	owner.throw_atom(get_step_towards(affected_atom, owner), grab_range, SPEED_FAST, owner)

	if (owner.Adjacent(carbon))
		owner.start_pulling(carbon)
		carbon.KnockDown(1)
		carbon.Stun(1)
		if(ishuman(carbon))
			INVOKE_ASYNC(carbon, TYPE_PROC_REF(/mob, emote), "scream")
	return TRUE

// Warrior Fling
/datum/action/human_action/activable/fling
	name = "Fling"
	icon_file = 'icons/mob/hud/actions_xeno.dmi'
	action_icon_state = "fling"
	cooldown = 6 SECONDS

	// Configurables
	var/fling_distance = 4
	var/stun_power = 0.5
	var/weaken_power = 0.5
	var/slowdown = 2

/datum/action/human_action/activable/fling/use_ability(atom/affected_atom)
	owner = usr
	var/mob/living/carbon/human/human_owner = owner

	if (!action_cooldown_check())
		return

	if (!ishuman(affected_atom))
		return

	if (!owner.Adjacent(affected_atom))
		return

	var/mob/living/carbon/carbon = affected_atom
	if(carbon.stat == DEAD)
		return

	if(HAS_TRAIT(carbon, TRAIT_NESTED))
		return

	if(carbon == owner.pulling)
		owner.stop_pulling()

	if(carbon.mob_size >= MOB_SIZE_BIG)
		to_chat(owner, SPAN_WARNING("[carbon] is too big for us to fling!"))
		return

	owner.visible_message(SPAN_WARNING("[owner] effortlessly flings [carbon] to the side!"), SPAN_WARNING("We effortlessly fling [carbon] to the side!"))
	playsound(carbon,'sound/weapons/alien_claw_block.ogg', 75, 1)
	if(stun_power)
		carbon.Stun(stun_power)
	if(weaken_power)
		carbon.KnockDown(weaken_power)
	if(slowdown)
		if(carbon.slowed < slowdown)
			carbon.apply_effect(slowdown, SLOW)

	var/facing = get_dir(owner, carbon)

	// Hmm today I will kill a marine while looking away from them
	owner.face_atom(carbon)
	human_owner.animation_attack_on(carbon)
	human_owner.flick_attack_overlay(carbon, "disarm")
	human_owner.throw_carbon(carbon, facing, fling_distance, SPEED_VERY_FAST, shake_camera = TRUE, immobilize = TRUE)

	enter_cooldown(cooldown)
	return ..()

/datum/action/human_action/activable/punch
	name = "Punch"
	icon_file = 'icons/mob/hud/actions_xeno.dmi'
	action_icon_state = "punch"
	cooldown = 4.5 SECONDS

	// Configurables
	var/base_damage = 150
	var/damage_variance = 5

/datum/action/human_action/activable/punch/use_ability(atom/affected_atom)
	owner = usr

	if (!action_cooldown_check())
		return

	if (!ishuman(affected_atom))
		return

	var/distance = get_dist(owner, affected_atom)

	if (distance > 2)
		return

	var/mob/living/carbon/carbon = affected_atom

	if (!owner.Adjacent(carbon))
		return

	if(carbon.stat == DEAD)
		return
	if(HAS_TRAIT(carbon, TRAIT_NESTED))
		return

	var/obj/limb/target_limb = carbon.get_limb(check_zone(owner.zone_selected))

	if (ishuman(carbon) && (!target_limb || (target_limb.status & LIMB_DESTROYED)))
		target_limb = carbon.get_limb("chest")


	owner.visible_message(SPAN_WARNING("[owner] hits [carbon] in the [target_limb ? target_limb.display_name : "chest"] with a devastatingly powerful punch!"), \
	SPAN_WARNING("We hit [carbon] in the [target_limb ? target_limb.display_name : "chest"] with a devastatingly powerful punch!"))
	var/sound = pick('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg')
	playsound(carbon, sound, 50, 1)
	do_base_warrior_punch(carbon, target_limb)
	enter_cooldown(cooldown)
	return ..()

/datum/action/human_action/activable/punch/proc/do_base_warrior_punch(mob/living/carbon/carbon, obj/limb/target_limb)
	var/mob/living/carbon/human/human_owner = owner
	var/damage = rand(base_damage, base_damage + damage_variance)

	if(ishuman(carbon))
		if((target_limb.status & LIMB_SPLINTED) && !(target_limb.status & LIMB_SPLINTED_INDESTRUCTIBLE)) //If they have it splinted, the splint won't hold.
			target_limb.status &= ~LIMB_SPLINTED
			playsound(get_turf(carbon), 'sound/items/splintbreaks.ogg', 20)
			to_chat(carbon, SPAN_DANGER("The splint on your [target_limb.display_name] comes apart!"))
			carbon.pain.apply_pain(PAIN_BONE_BREAK_SPLINTED)

		if(ishuman_strict(carbon))
			carbon.apply_effect(3, SLOW)

	if(carbon == owner.pulling)
		damage *= 1.5

	carbon.apply_armoured_damage(damage, ARMOR_MELEE, BRUTE, target_limb ? target_limb.name : "chest")

	// Hmm today I will kill a marine while looking away from them
	owner.face_atom(carbon)
	human_owner.animation_attack_on(carbon)
	human_owner.flick_attack_overlay(carbon, "punch")
	shake_camera(carbon, 2, 1)
	step_away(carbon, owner, 2)

/datum/action/human_action/activable/strength
	name = "Super Strength"
	icon_file = 'icons/mob/hud/actions_xeno.dmi'
	action_icon_state = "empower"
	cooldown = 4.5 SECONDS

/datum/action/human_action/activable/strength/use_ability(atom/affected_atom)
	owner = usr

	if (!action_cooldown_check())
		return

	if (!owner.Adjacent(affected_atom))
		return

	if(affected_atom.superstrength_interaction(owner))
		affected_atom.superstrength_interaction(owner)
		enter_cooldown(cooldown)
	return ..()

/mob/living/carbon/human/superstrength_interaction(mob/living/carbon/human/M)
	if(mob_size >= MOB_SIZE_BIG)
		to_chat(M, SPAN_WARNING("[src] is too big for us to grab!"))
		return
	M.start_pulling(src)
	KnockDown(0.5)
	Stun(0.5)
	pulledby = M
	M.grab_level = GRAB_CHOKE
	return TRUE

//Prying open doors
/obj/structure/machinery/door/airlock/superstrength_interaction(mob/living/carbon/human/M)
	var/turf/cur_loc = M.loc

	if(M.action_busy)
		to_chat(M, SPAN_WARNING("You are already doing something!"))
		return

	if(isElectrified() && shock(M, 100))
		return

	if(!density)
		to_chat(M, SPAN_WARNING("[src] is already open!"))
		return

	if(heavy)
		to_chat(M, SPAN_WARNING("[src] is too heavy to open."))
		return

	if(welded)
		to_chat(M, SPAN_WARNING("[src] is welded shut."))
		return

	if(locked)
		to_chat(M, SPAN_WARNING("[src] is bolted down tight."))
		return

	if(!istype(cur_loc))
		return //Some basic logic here

	if(M.action_busy)
		return

	if(M.is_mob_incapacitated() || M.body_position != STANDING_UP)
		return

	var/delay

	if(!arePowerSystemsOn())
		delay = 1 SECONDS
		playsound(loc, "alien_doorpry", 25, TRUE)
	else
		delay = 2 SECONDS
		playsound(loc, "alien_doorpry", 25, TRUE)

	M.visible_message(SPAN_WARNING("[M] digs into [src] and begins to pry it open."), \
	SPAN_WARNING("We dig into [src] and begin to pry it open."), null, 5, CHAT_TYPE_COMBAT_ACTION)

	if(do_after(M, delay, INTERRUPT_ALL, BUSY_ICON_HOSTILE))
		if(M.loc != cur_loc)
			return  //Make sure we're still there
		if(M.is_mob_incapacitated() || M.body_position != STANDING_UP)
			return
		if(locked)
			to_chat(M, SPAN_WARNING("[src] is bolted down tight."))
			return
		if(welded)
			to_chat(M, SPAN_WARNING("[src] is welded shut."))
			return
		if(density) //Make sure it's still closed
			spawn(0)
				open(1)
				M.visible_message(SPAN_DANGER("[M] pries [src] open."), \
				SPAN_DANGER("We pry [src] open."), null, 5, CHAT_TYPE_COMBAT_ACTION)
	return TRUE
