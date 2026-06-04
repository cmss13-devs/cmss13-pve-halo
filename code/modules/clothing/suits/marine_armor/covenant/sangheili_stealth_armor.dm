#define FULL_CAMO_ALPHA 15
#define VISIBLE_CAMO_ALPHA 60

#define FULL_PVE_CAMO_ALPHA 30
#define VISIBLE_PVE_CAMO_ALPHA 75

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking
	var/camo_active = FALSE
	var/full_camo_alpha = FULL_PVE_CAMO_ALPHA
	var/incremental_shooting_camo_penalty = 6
	var/current_camo = FULL_PVE_CAMO_ALPHA
	var/visible_camo_alpha = VISIBLE_PVE_CAMO_ALPHA
	var/camouflage_break = null
	var/cloak_cooldown
	var/camo_message_delay = 2 SECONDS

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/dropped(mob/user)
	if(ishuman(user) && !issynth(user))
		deactivate_camouflage(user, FALSE)

	. = ..()

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/attack_self(mob/user)
	..()
	camouflage(user)

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/proc/camouflage(mob/user)
	if(!user || user.is_mob_incapacitated(TRUE))
		return

	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user

	if(camo_active)
		deactivate_camouflage(H)
		return

	if(cloak_cooldown && cloak_cooldown > world.time)
		to_chat(H, SPAN_WARNING("Your cloak is malfunctioning and can't be enabled right now!"))
		return

	RegisterSignal(H,  list(
		COMSIG_MOB_FIRED_GUN,
		COMSIG_MOB_FIRED_GUN_ATTACHMENT)
		, PROC_REF(fade_in))
	RegisterSignal(H, COMSIG_HUMAN_EXTINGUISH, PROC_REF(wrapper_fizzle_camouflage))
	RegisterSignal(H, list(
		COMSIG_MOB_DEATH,
		COMSIG_MOB_EFFECT_CLOAK_CANCEL
	), PROC_REF(deactivate_camouflage))

	camo_active = TRUE
	ADD_TRAIT(H, TRAIT_CLOAKED, TRAIT_SOURCE_EQUIPMENT(WEAR_BACK))
	H.visible_message(SPAN_DANGER("[H] vanishes into thin air!"), SPAN_NOTICE("You activate your cloak's camouflage."), max_distance = 4)
	playsound(H.loc, 'sound/effects/cloak_scout_on.ogg', 15, TRUE)
	H.unset_interaction()

	H.alpha = full_camo_alpha
	H.FF_hit_evade = 1000

	var/datum/mob_hud/security/advanced/SA = GLOB.huds[MOB_HUD_SECURITY_ADVANCED]
	SA.remove_from_hud(H)
	var/datum/mob_hud/xeno_infection/XI = GLOB.huds[MOB_HUD_XENO_INFECTION]
	XI.remove_from_hud(H)

	anim(H.loc, H, 'icons/mob/mob.dmi', null, "cloak", null, H.dir)
	return TRUE

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/proc/fade_in(mob/user)
	SIGNAL_HANDLER
	var/mob/living/carbon/human/H = user
	if(camo_active)
		if(current_camo < full_camo_alpha)
			current_camo = full_camo_alpha
		current_camo = clamp(current_camo + incremental_shooting_camo_penalty, full_camo_alpha, 255)
		H.alpha = current_camo
		if(current_camo > visible_camo_alpha)
			REMOVE_TRAIT(H, TRAIT_CLOAKED, TRAIT_SOURCE_EQUIPMENT(WEAR_BACK))
			to_chat(H, SPAN_BOLDNOTICE("Your cloak can't keep you perfectly hidden anymore!"))
		addtimer(CALLBACK(src, PROC_REF(fade_out_finish), H), camouflage_break, TIMER_OVERRIDE|TIMER_UNIQUE)
		animate(H, alpha = full_camo_alpha + 5, time = camouflage_break, easing = LINEAR_EASING, flags = ANIMATION_END_NOW)

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/proc/fade_out_finish(mob/living/carbon/human/H)
	if(camo_active && H.back == src)
		ADD_TRAIT(H, TRAIT_CLOAKED, TRAIT_SOURCE_EQUIPMENT(WEAR_BACK))
		to_chat(H, SPAN_BOLDNOTICE("Your cloak shimmers, returning to it's perfectly camouflaged state!"))
		animate(H, alpha = full_camo_alpha)
		current_camo = full_camo_alpha

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/proc/wrapper_fizzle_camouflage()
	SIGNAL_HANDLER
	var/mob/wearer = src.loc
	wearer.visible_message(SPAN_DANGER("[wearer]'s cloak fizzles out!"), SPAN_DANGER("Your cloak fizzles out!"))
	var/datum/effect_system/spark_spread/sparks = new /datum/effect_system/spark_spread
	sparks.set_up(5, 4, src)
	sparks.start()
	deactivate_camouflage(wearer, TRUE, TRUE)

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/proc/deactivate_camouflage(mob/living/carbon/human/H, anim = TRUE, forced)
	SIGNAL_HANDLER
	if(!istype(H))
		return FALSE

	UnregisterSignal(H, list(
	COMSIG_MOB_FIRED_GUN,
	COMSIG_MOB_FIRED_GUN_ATTACHMENT,
	COMSIG_HUMAN_EXTINGUISH,
	COMSIG_MOB_DEATH,
	COMSIG_MOB_EFFECT_CLOAK_CANCEL,
	))

	if(forced)
		cloak_cooldown = world.time + 10 SECONDS

	camo_active = FALSE
	REMOVE_TRAIT(H, TRAIT_CLOAKED, TRAIT_SOURCE_EQUIPMENT(WEAR_BACK))
	H.visible_message(SPAN_DANGER("[H] shimmers into existence!"), SPAN_WARNING("Your cloak's camouflage has deactivated!"), max_distance = 4)
	playsound(H.loc, 'sound/effects/cloak_scout_off.ogg', 15, TRUE)

	H.alpha = initial(H.alpha)
	H.FF_hit_evade = initial(H.FF_hit_evade)

	var/datum/mob_hud/security/advanced/SA = GLOB.huds[MOB_HUD_SECURITY_ADVANCED]
	SA.add_to_hud(H)
	var/datum/mob_hud/xeno_infection/XI = GLOB.huds[MOB_HUD_XENO_INFECTION]
	XI.add_to_hud(H)

	if(anim)
		anim(H.loc, H,'icons/mob/mob.dmi', null, "uncloak", null, H.dir)

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/zealot

	name = "\improper Sangheili Zealot combat harness"
	desc = " A gold coloured Elite 'combat harness' worn by the horrifying Zealot rank. Rarely seen outside of recovered footage, these brightly coloured harnesses are known to to easily shrug point blank bursts of .50 calibre rounds and have shields rated for light anti-tank weapons and direct impact high explosives. Confirmed kills on this leadership class are few and far between."
	desc_lore = "If you do run into one of these guys, Intels only real suggestion is to 'shoot them with everything you got, and everything you don't got'. That's a quote, that's what the ONI spook told me. Good sign."

	icon_state = "sang_zealot"

	shield = SANG_SHIELD_ZEALOT
	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/specops

	name = "\improper Sangheili Special Operations combat harness"

	icon_state = "sang_specops"

	shield = SANG_SHIELD_MAJOR
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/specops/ultra

	name = "\improper Sangheili Special Operations Ultra combat harness"

	icon_state = "sang_specultra"

	shield = SANG_SHIELD_ULTRA
	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/suit/marine/shielded/sangheili/cloaking/stealth

	name = "\improper Sangheili Stealth combat harness"
	desc = "A light blue Elite 'combat harness', worn by stealth operatives, who are believed to be one of the Covenant's lesser special forces. Armour rating is thought to be equal of a standard Major class Elite, but its shields are much weaker, cycling faster as a trade off. The real problem is their active camouflage module, allowing them to slink around the battlefield or rearline totally unseen."
	desc_lore = "First hand accounts say that you only ever see them when they're about to strike, a vague shimmer in the air your mind can easily disregards as hallucinatory. By then it's far too late to act anyway."

	icon_state = "sang_stealth"

	shield = SANG_SHIELD_STEALTH
	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH
