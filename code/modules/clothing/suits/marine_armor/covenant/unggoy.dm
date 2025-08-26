/obj/item/clothing/suit/marine/unggoy
	name = "placeholder Unggoy combat harness"
	desc = "A combat harness made to fit an Unggoy. Placeholder."
	slowdown = SLOWDOWN_ARMOR_LIGHT

	icon = 'icons/halo/obj/items/clothing/covenant/armor.dmi'
	icon_state = "unggoy_minor"
	item_state = "unggoy_minor"

	item_icons = list(
		WEAR_JACKET = 'icons/halo/mob/humans/onmob/unggoy/armor.dmi'
	)
	allowed_species_list = list(SPECIES_UNGGOY)

	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/suit/marine/unggoy/minor
	name = "Unggoy Minor combat harness"
	desc = "A combat harness designed for use by Unggoy warriors, made of a sturdy nanolaminate composite and coloured to denote the warriors rank. Thanks to the weight of the methane tank usually mounted to the harness, the actual coverage of the plating is relatively limited, only covering the chest, waist and shoulders. <b>This one indicates the wearer is an Unggoy Minor.</b>"

/obj/item/clothing/suit/marine/unggoy/major
	name = "Unggoy Major combat harness"
	desc = "A red coloured harness is the sign of an Unggoy Major, a more veteran warrior usually given charge of files of Minors. While featuring no superior protective qualities to the standard orange harness of its lessers, the Major's harness is noted to fit just a bit more comfortably and provide higher-quality methane to its user."
	desc_lore = "Minor adjustments include a more robust communications system, allowing for more efficient comms with their superiors, a noted negative by anyone who isn't an Unggoy."
	icon_state = "unggoy_major"
	item_state = "unggoy_major"

/obj/item/clothing/suit/marine/unggoy/heavy
	name = "Unggoy Heavy combat harness"
	desc = "This green combat harness denotes the wearer as a special weapons operator, from plasma cannons and shade turrets to fuel rod cannons and explosive ordinance. Features additional padding and a specific nanolaminate composition to more easily resist explosive damage in the case of enemy counter fire, or semi-common accidents."
	icon_state = "unggoy_heavy"
	item_state = "unggoy_heavy"

	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/suit/marine/unggoy/ultra
	name = "Unggoy Ultra combat harness"
	desc = "A white coloured combat harness marking its user as a Ultra, a combat veteran of many campaigns. The armour not only features vastly superior material composition in its protective qualities, but is fitted to its owner exactly, providing a comfortable fit that allows for more natural movement."
	icon_state = "unggoy_ultra"
	item_state = "unggoy_ultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/suit/marine/unggoy/deacon
	name = "Unggoy Deacon harness"
	desc = "This harness is of the highest quality, reserved for ministry personnel who serve as Deacons to their San'shyuum betters. Its many features include custom fitting and more robust mounting brackets, alongside a superior nanolaminate composite that is not only both light without sacrificing protective quality, but also may include small holographic projectors to provide reinforcement to ones sermons and duties."
	icon_state = "unggoy_deacon"
	item_state = "unggoy_deacon"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/suit/marine/stealth/unggoy_specops
	name = "Unggoy SpecOps combat harness"
	desc = "A dark purple harness reserved for those few Unggoy who meet the requirements to join the Special-Warfare-Group's ranks. While benefiting from numerous fitting and material developments over the more common combat harnesses of their brothers, the Spec-Ops variant also features obvious advancements in the areas of stealth."
	desc_lore = "From passive thermal and sensor stealth built into its matrices, to the capability to become totally invisible on all spectrum given an active camouflage module, this harness is well worth the countless nights of training."
	icon_state = "unggoy_specops"
	item_state = "unggoy_specops"

	icon = 'icons/halo/obj/items/clothing/covenant/armor.dmi'
	item_icons = list(
		WEAR_JACKET = 'icons/halo/mob/humans/onmob/unggoy/armor.dmi'
	)
	allowed_species_list = list(SPECIES_UNGGOY)

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/suit/marine/stealth/unggoy_specops/ultra
	name = "Unggoy SpecOps Ultra combat harness"
	desc = "A modification of the Spec-Ops harness used by Unggoy of the Special-Warfare-Group, worn by veterans and specialists. A notable improvement over the common Spec-Ops harness, featuring reinforced composites designed for direct combat. While many may regard Unggoy as cowardly and weak, few who've seen this black harness live to tell about it, and those who do have far different opinions."
	icon_state = "unggoy_specops_ultra"
	item_state = "unggoy_specops_ultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/suit/marine/stealth
	var/camo_active = FALSE
	var/camo_alpha = 10
	var/allow_gun_usage = FALSE
	var/cloak_cooldown

	actions_types = list(/datum/action/item_action/specialist/toggle_cloak)

/obj/item/clothing/suit/marine/stealth/dropped(mob/user)
	if(ishuman(user) && !issynth(user))
		deactivate_camouflage(user, FALSE)

	. = ..()

/obj/item/clothing/suit/marine/stealth/attack_self(mob/user)
	..()
	camouflage()

/obj/item/clothing/suit/marine/stealth/verb/camouflage()
	set name = "Activate Cloak"
	set desc = "Activate your cloak's camouflage."
	set category = "Scout"
	set src in usr
	if(!usr || usr.is_mob_incapacitated(TRUE))
		return

	if(!ishuman(usr))
		return
	var/mob/living/carbon/human/H = usr

	if(H.wear_suit != src)
		to_chat(H, SPAN_WARNING("You must be wearing the cloak to activate it!"))
		return

	if(camo_active)
		deactivate_camouflage(H)
		return

	if(cloak_cooldown && cloak_cooldown > world.time)
		to_chat(H, SPAN_WARNING("Your cloak is malfunctioning and can't be enabled right now!"))
		return

	RegisterSignal(H, COMSIG_HUMAN_EXTINGUISH, PROC_REF(wrapper_fizzle_camouflage))
	RegisterSignal(H, COMSIG_MOB_EFFECT_CLOAK_CANCEL, PROC_REF(deactivate_camouflage))

	camo_active = TRUE
	ADD_TRAIT(H, TRAIT_CLOAKED, TRAIT_SOURCE_EQUIPMENT(WEAR_JACKET))
	H.visible_message(SPAN_DANGER("[H] vanishes into thin air!"), SPAN_NOTICE("You activate your cloak's camouflage."), max_distance = 4)
	playsound(H.loc, 'sound/effects/cloak_scout_on.ogg', 15, TRUE)
	H.unset_interaction()

	H.alpha = camo_alpha
	H.FF_hit_evade = 1000
	H.allow_gun_usage = allow_gun_usage

	var/datum/mob_hud/security/advanced/SA = GLOB.huds[MOB_HUD_SECURITY_ADVANCED]
	SA.remove_from_hud(H)
	var/datum/mob_hud/xeno_infection/XI = GLOB.huds[MOB_HUD_XENO_INFECTION]
	XI.remove_from_hud(H)

	anim(H.loc, H, 'icons/mob/mob.dmi', null, "cloak", null, H.dir)
	return TRUE

/obj/item/clothing/suit/marine/stealth/proc/wrapper_fizzle_camouflage()
	SIGNAL_HANDLER
	var/mob/wearer = src.loc
	wearer.visible_message(SPAN_DANGER("[wearer]'s cloak fizzles out!"), SPAN_DANGER("Your cloak fizzles out!"))
	var/datum/effect_system/spark_spread/sparks = new /datum/effect_system/spark_spread
	sparks.set_up(5, 4, src)
	sparks.start()
	deactivate_camouflage(wearer, TRUE, TRUE)

/obj/item/clothing/suit/marine/stealth/proc/deactivate_camouflage(mob/living/carbon/human/H, anim = TRUE, forced)
	SIGNAL_HANDLER
	if(!istype(H))
		return FALSE

	UnregisterSignal(H, list(
	COMSIG_GRENADE_PRE_PRIME,
	COMSIG_HUMAN_EXTINGUISH,
	COMSIG_MOB_EFFECT_CLOAK_CANCEL,
	))

	if(forced)
		cloak_cooldown = world.time + 10 SECONDS

	camo_active = FALSE
	REMOVE_TRAIT(H, TRAIT_CLOAKED, TRAIT_SOURCE_EQUIPMENT(WEAR_JACKET))
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

	addtimer(CALLBACK(src, PROC_REF(allow_shooting), H), 1.5 SECONDS)

/obj/item/clothing/suit/marine/stealth/proc/allow_shooting(mob/living/carbon/human/H)
	if(camo_active && !allow_gun_usage)
		return
	H.allow_gun_usage = TRUE

/datum/action/item_action/specialist/toggle_cloak
	ability_primacy = SPEC_PRIMARY_ACTION_1

/datum/action/item_action/specialist/toggle_cloak/New(mob/living/user, obj/item/holder)
	..()
	name = "Toggle Cloak"
	button.name = name
	button.overlays.Cut()
	var/image/IMG = image('icons/obj/items/clothing/backpacks.dmi', button, "scout_cloak")
	button.overlays += IMG

/datum/action/item_action/specialist/toggle_cloak/can_use_action()
	var/mob/living/carbon/human/H = owner
	if(istype(H) && !H.is_mob_incapacitated() && holder_item == H.wear_suit)
		return TRUE

/datum/action/item_action/specialist/toggle_cloak/action_activate()
	. = ..()
	var/obj/item/clothing/suit/marine/stealth/SC = holder_item
	SC.camouflage()
