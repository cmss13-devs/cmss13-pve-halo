/datum/species/unggoy
	group = SPECIES_UNGGOY
	name = "Unggoy"
	name_plural = "Unggoy"
	mob_flags = KNOWS_TECHNOLOGY
	uses_skin_color = TRUE
	flags = HAS_HARDCRIT|HAS_SKIN_COLOR|SPECIAL_BONEBREAK|NO_SHRAPNEL
	mob_inherent_traits = list(
		TRAIT_COV_TECH,
		TRAIT_SUPER_STRONG,
		TRAIT_FOREIGN_BIO,
		TRAIT_DEXTROUS,
		TRAIT_IRON_TEETH,
	)
	unarmed_type = /datum/unarmed_attack/punch/unggoy
	pain_type = /datum/pain/unggoy
	blood_color = BLOOD_COLOR_UNGGOY
	flesh_color = "#317986"

	total_health = 150
	burn_mod = 1
	brute_mod = 0.8
	slowdown = 0.1

	dodge_pool = 10
	dodge_pool_max = 10
	dodge_pool_regen = 1
	dodge_pool_regen_max = 1
	dodge_pool_regen_restoration = 0.2
	dp_regen_base_reactivation_time = 35

	icobase = 'icons/halo/mob/humans/species/unggoy/r_unggoy.dmi'
	deform = 'icons/halo/mob/humans/species/unggoy/r_unggoy.dmi'
	eye_icon = 'icons/halo/mob/humans/species/unggoy/eyes.dmi'
	dam_icon = 'icons/halo/mob/humans/species/unggoy/dam_unggoy.dmi'
	blood_mask = 'icons/halo/mob/humans/species/unggoy/blood_mask.dmi'

	has_organ = list(
		"heart" = /datum/internal_organ/heart/unggoy,
		"lungs" = /datum/internal_organ/lungs/unggoy,
		"liver" = /datum/internal_organ/liver/unggoy,
		"kidneys" =  /datum/internal_organ/kidneys/unggoy,
		"brain" = /datum/internal_organ/brain/unggoy,
		"eyes" =  /datum/internal_organ/eyes
		)
