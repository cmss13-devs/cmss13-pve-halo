/datum/species/ruuhtian
	group = SPECIES_RUUHTIAN
	name = "Ruuhtian"
	name_plural = "Ruuhtian"
	mob_flags = KNOWS_TECHNOLOGY
	uses_skin_color = TRUE
	flags = HAS_HARDCRIT|HAS_SKIN_COLOR|SPECIAL_BONEBREAK
	mob_inherent_traits = list(
		TRAIT_COV_TECH,
		TRAIT_SUPER_STRONG,
		TRAIT_FOREIGN_BIO,
		TRAIT_DEXTROUS,
		TRAIT_IRON_TEETH,
	)
	unarmed_type = /datum/unarmed_attack/punch/kigyar
	pain_type = /datum/pain/ruuhtian
	blood_color = BLOOD_COLOR_JACKAL
	flesh_color = BLOOD_COLOR_JACKAL

	total_health = 125
	burn_mod = 1
	brute_mod = 1
	slowdown = 0

	dodge_pool = 12
	dodge_pool_max = 10
	dodge_pool_regen = 1
	dodge_pool_regen_max = 1
	dodge_pool_regen_restoration = 0.2
	dp_regen_base_reactivation_time = 30

	icobase = 'icons/halo/mob/humans/species/ruuhtian/r_ruuhtian.dmi'
	deform = 'icons/halo/mob/humans/species/unggoy/r_unggoy.dmi'
	eye_icon = 'icons/halo/mob/humans/species/ruuhtian/eyes.dmi'
	dam_icon = 'icons/halo/mob/humans/species/ruuhtian/dam_ruuhtian.dmi'
	blood_mask = 'icons/halo/mob/humans/species/ruuhtian/blood_mask.dmi'

	has_organ = list(
		"heart" = /datum/internal_organ/heart/kigyar,
		"lungs" = /datum/internal_organ/lungs/kigyar,
		"liver" = /datum/internal_organ/liver/kigyar,
		"kidneys" =  /datum/internal_organ/kidneys/kigyar,
		"brain" = /datum/internal_organ/brain/kigyar,
		"eyes" =  /datum/internal_organ/eyes
		)

/datum/species/unggoy/post_species_loss(mob/living/carbon/human/H)
	..()
	var/datum/mob_hud/medical/advanced/A = GLOB.huds[MOB_HUD_MEDICAL_ADVANCED]
	A.add_to_hud(H)
	H.blood_type = pick("A+","A-","B+","B-","O-","O+","AB+","AB-")
	H.h_style = "Bald"
	GLOB.yautja_mob_list -= H
	for(var/obj/limb/limb in H.limbs)
		switch(limb.name)
			if("groin","chest")
				limb.min_broken_damage = 40
				limb.max_damage = 200
			if("head")
				limb.min_broken_damage = 40
				limb.max_damage = 60
			if("l_hand","r_hand","r_foot","l_foot")
				limb.min_broken_damage = 25
				limb.max_damage = 30
			if("r_leg","r_arm","l_leg","l_arm")
				limb.min_broken_damage = 30
				limb.max_damage = 35
		limb.time_to_knit = -1

/datum/species/ruuhtian/handle_post_spawn(mob/living/carbon/human/ruuhtian)
	GLOB.alive_human_list -= ruuhtian

	ruuhtian.blood_type = "K*"
	ruuhtian.h_style = "Bald"
	#ifndef UNIT_TESTS // Since this is a hard ref, we shouldn't confuse create_and_destroy
	GLOB.kigyar_mob_list += ruuhtian
	#endif
	for(var/obj/limb/limb in ruuhtian.limbs)
		switch(limb.name)
			if("groin","chest")
				limb.min_broken_damage = 100
				limb.max_damage = 150 // 2 minutes to self heal bone break, time is in tenths of a second to auto heal this
			if("head")
				limb.min_broken_damage = 100
				limb.max_damage = 150 // 1 minute to self heal bone break, time is in tenths of a second
			if("l_hand","r_hand","r_foot","l_foot")
				limb.min_broken_damage = 150
				limb.max_damage = 150 // 1 minute to self heal bone break, time is in tenths of a second
			if("r_leg","r_arm","l_leg","l_arm")
				limb.min_broken_damage = 150
				limb.max_damage = 150 // 1 minute to self heal bone break, time is in tenths of a second

	ruuhtian.set_languages(list(LANGUAGE_SANGHEILI, LANGUAGE_RUUHTIAN))
	return ..()

/datum/species/ruuhtian/get_hairstyle(style)
	return GLOB.ruuhtian_hair_styles_list[style]
