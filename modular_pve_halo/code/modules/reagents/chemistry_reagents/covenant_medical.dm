/datum/reagent/medical/covenant/organfixer
	name = "Organ Regeneration Stimulant"
	id = "organfixer"
	description = "Synthetically engineered chemical designed to stimulate the regeneration of organs. Causes a significant amount of pain."
	reagent_state = LIQUID
	color = COLOR_PURPLE
	custom_metabolism = AMOUNT_PER_TIME(1, 10 SECONDS)
	overdose = MED_REAGENTS_OVERDOSE
	overdose_critical = MED_REAGENTS_OVERDOSE_CRITICAL
	chemclass = CHEM_CLASS_UNCOMMON
	properties = list(PROPERTY_ORGAN_HEALING = 2, PROPERTY_OCULOPEUTIC = 2, PROPERTY_NEUROPEUTIC = 2, PROPERTY_PAINING = 4)

/datum/reagent/medical/covenant/ib_fixer
	name = "Vein Regeneration Stimulant"
	id = "veinfixer"
	description = "Synthetically engineered chemical designed to stimulate the regeneration of veins. Causes pain."
	reagent_state = LIQUID
	color = COLOR_PURPLE
	custom_metabolism = AMOUNT_PER_TIME(2, 1 SECONDS)
	overdose = MED_REAGENTS_OVERDOSE
	overdose_critical = MED_REAGENTS_OVERDOSE_CRITICAL
	chemclass = CHEM_CLASS_UNCOMMON
	properties = list(PROPERTY_HEMOSTATIC = 1, PROPERTY_PAINING = 8)

/datum/reagent/medical/covenant/ib_fixer/on_mob_life(mob/living/living_mob)
	. = ..()
	if(ishuman(living_mob))
		var/mob/living/carbon/human/human = living_mob
		for(var/obj/limb/limbs in human.limbs)
			limbs.remove_all_bleeding(FALSE, TRUE)

/datum/reagent/medical/covenant/blood_regen
	name = "Blood Regenerator"
	id = "bloodregen"
	description = "Synthetically engineered chemical designed to increase the speed at which the body regenerates its own blood. Also helps somewhat with nutrition levels."
	reagent_state = LIQUID
	color = COLOR_PURPLE
	custom_metabolism = AMOUNT_PER_TIME(15, 10 MINUTES)
	overdose = HIGH_REAGENTS_OVERDOSE
	overdose_critical = HIGH_REAGENTS_OVERDOSE_CRITICAL
	chemclass = CHEM_CLASS_UNCOMMON
	properties = list(PROPERTY_HEMOGENIC = 3, PROPERTY_NUTRITIOUS = 2)
