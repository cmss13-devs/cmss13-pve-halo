/datum/reagent/nutriment/covenant
	name = "Covenant Nutriment"
	id = "covnutriment"
	flags = REAGENT_NO_GENERATION
	var/list/designated_species

/datum/reagent/nutriment/covenant/reaction_mob(mob/target_mob, method = INGEST, volume, permeable)
	if(ishuman(target_mob))
		var/mob/living/carbon/human/target_human = target_mob
		if(designated_species && !(target_human.species in designated_species))
			to_chat(target_human, SPAN_ALERTWARNING("You feel uneasy...that food didn't quite taste right."))

/datum/reagent/nutriment/covenant/sangheili
	name = "Sangheili Nutriment"
	id = "sangheilinutriment"
	designated_species = list(SPECIES_LIST_SANGHEILI)

/datum/reagent/nutriment/covenant/kigyar
	name = "Kig-Yar Nutriment"
	id = "kigyarnutriment"
	designated_species = list(SPECIES_LIST_RUUHTIAN)

/datum/reagent/nutriment/covenant/unggoy
	name = "Unggoy Nutriment"
	id = "unggoynutriment"
	designated_species = list(SPECIES_LIST_UNGGOY)
