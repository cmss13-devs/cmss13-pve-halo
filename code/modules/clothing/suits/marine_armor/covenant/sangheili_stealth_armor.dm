#define FULL_CAMO_ALPHA 15
#define VISIBLE_CAMO_ALPHA 60

#define FULL_PVE_CAMO_ALPHA 30
#define VISIBLE_PVE_CAMO_ALPHA 75

/obj/item/clothing/suit/marine/shielded/sangheili/stealth
	var/camo_active = FALSE
	var/full_camo_alpha = FULL_PVE_CAMO_ALPHA
	var/incremental_shooting_camo_penalty = 6
	var/current_camo = FULL_PVE_CAMO_ALPHA
	var/visible_camo_alpha = VISIBLE_PVE_CAMO_ALPHA
	var/camouflage_break = null
	var/cloak_cooldown
	var/camo_message_delay = 2 SECONDS

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/dropped(mob/user)
	if(ishuman(user) && !issynth(user))
		deactivate_camouflage(user, FALSE)

	. = ..()

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/attack_self(mob/user)
	..()
	camouflage(user)

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/proc/camouflage(mob/user)
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

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/proc/fade_in(mob/user)
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

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/proc/fade_out_finish(mob/living/carbon/human/H)
	if(camo_active && H.back == src)
		ADD_TRAIT(H, TRAIT_CLOAKED, TRAIT_SOURCE_EQUIPMENT(WEAR_BACK))
		to_chat(H, SPAN_BOLDNOTICE("Your cloak shimmers, returning to it's perfectly camouflaged state!"))
		animate(H, alpha = full_camo_alpha)
		current_camo = full_camo_alpha

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/proc/wrapper_fizzle_camouflage()
	SIGNAL_HANDLER
	var/mob/wearer = src.loc
	wearer.visible_message(SPAN_DANGER("[wearer]'s cloak fizzles out!"), SPAN_DANGER("Your cloak fizzles out!"))
	var/datum/effect_system/spark_spread/sparks = new /datum/effect_system/spark_spread
	sparks.set_up(5, 4, src)
	sparks.start()
	deactivate_camouflage(wearer, TRUE, TRUE)

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/proc/deactivate_camouflage(mob/living/carbon/human/H, anim = TRUE, forced)
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

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/Initialize(mapload)
	. = ..()
	var/obj/item/clothing/accessory/pads/sangheili/minor/pads = new()
	src.attach_accessory(null, pads, TRUE)

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/minor
	name = "\improper Sangheili Stealth combat harness"
	desc = "A blue coloured harness worn by Stealth units. Worn over a 'tech-suit' the armour consists of a thoracic-cage over the torso, with pauldrons, vambraces, cuisses, and greaves attached, providing a high level of protection, though the most important defensive feature of the harness is its energy-shielding."
	shield = SANG_SHIELD_STEALTH
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/minor/Initialize(mapload)
	. = ..()
	var/obj/item/clothing/accessory/pads/sangheili/minor/pads = new()
	src.attach_accessory(null, pads, TRUE)

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/zealot

	name = "\improper Sangheili Zealot combat harness"
	desc = "The golden sheen of this harness marks the proud Sangheili out as one of the vaunted Zealots, warriors belonging to honourable Orders. Vastly superior to any lesser harness, the nanolaminate alloys used in it are said to be imbued with holy-metals directly, allowing it to be not only exceptionally light, but absurdly sturdy as well. This conventional strength is paired with powerful energy-shields, turning the warrior into an unstoppable object as they pursue their goals."
	desc_lore = "Be it leading troops directly in glorious combat, or securing Holy Relics in daring and softly spoken of operations, the bearer of this harness is not to be trifled with, let alone crossed."

	icon_state = "sang_zealot"

	shield = SANG_SHIELD_ZEALOT
	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/suit/marine/shielded/sangheili/stealth/zealot/Initialize(mapload)
	. = ..()
	var/obj/item/clothing/accessory/pads/sangheili/zealot/pads = new()
	src.attach_accessory(null, pads, TRUE)
