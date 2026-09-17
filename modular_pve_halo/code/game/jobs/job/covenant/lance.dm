// Elite Major
#define ELITE_MAJOR_VARIANT_LESSER "Major Novice"
#define ELITE_MAJOR_VARIANT "Major"

// Elite Minor
#define ELITE_MINOR_VARIANT "Minor"
#define ELITE_MINOR_VARIANT_GREATER "Minor Adept"

// Major Ranks
#define MAJOR_VARIANT_LESSER "Major Auxiliary"
#define MAJOR_VARIANT "Major"
#define MAJOR_VARIANT_GREATER "Major Superior"

// Minor Ranks
#define MINOR_VARIANT_LESSER "Minor Auxiliary"
#define MINOR_VARIANT "Minor"
#define MINOR_VARIANT_GREATER "Minor Superior"

/datum/job/covenant
	allowed_species = list(SPECIES_UNGGOY, SPECIES_RUUHTIAN)
	allowed_genders = list(MALE)

/datum/job/covenant/lance_standard
	title = JOB_COV_LANCE_STANDARD
	total_positions = 6
	spawn_positions = 6
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/covenant/lance/lance_standard
	gear_preset_secondary = /datum/equipment_preset/covenant/lance/lance_standard/lesser
	gear_preset_tertiary = /datum/equipment_preset/covenant/lance/lance_standard/greater
	job_options = list(MINOR_VARIANT_LESSER = "Minor-", MINOR_VARIANT = "Minor", MINOR_VARIANT_GREATER = "Minor+")
	use_species_spawn = list(SPECIES_UNGGOY, SPECIES_RUUHTIAN)

/datum/job/covenant/lance_standard/handle_job_options(option)
	if(option == MINOR_VARIANT_LESSER)
		gear_preset = gear_preset_secondary
	if(option == MINOR_VARIANT_GREATER)
		gear_preset = gear_preset_tertiary
	else
		gear_preset = initial(gear_preset)

/datum/job/covenant/lance_specialist
	title = JOB_COV_LANCE_SPECIALIST
	total_positions = 2
	spawn_positions = 2
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/covenant/lance/lance_specialist
	gear_preset_secondary = /datum/equipment_preset/covenant/lance/lance_specialist/lesser
	gear_preset_tertiary = /datum/equipment_preset/covenant/lance/lance_specialist/greater
	job_options = list(MINOR_VARIANT_LESSER = "Minor-", MINOR_VARIANT = "Minor", MINOR_VARIANT_GREATER = "Minor+")

/datum/job/covenant/lance_specialist/handle_job_options(option)
	if(option == MINOR_VARIANT_LESSER)
		gear_preset = gear_preset_secondary
	if(option == MINOR_VARIANT_GREATER)
		gear_preset = gear_preset_tertiary
	else
		gear_preset = initial(gear_preset)

/datum/job/covenant/lance_obedientary
	title = JOB_COV_LANCE_OBEDIENTARY
	total_positions = 2
	spawn_positions = 2
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/covenant/lance/lance_obedientary
	gear_preset_secondary = /datum/equipment_preset/covenant/lance/lance_obedientary/lesser
	gear_preset_tertiary = /datum/equipment_preset/covenant/lance/lance_obedientary/greater
	job_options = list(MAJOR_VARIANT_LESSER = "Major-", MAJOR_VARIANT = "Major", MAJOR_VARIANT_GREATER = "Major+")

/datum/job/covenant/lance_obedientary/handle_job_options(option)
	if(option == MAJOR_VARIANT_LESSER)
		gear_preset = gear_preset_secondary
	if(option == MAJOR_VARIANT_GREATER)
		gear_preset = gear_preset_tertiary
	else
		gear_preset = initial(gear_preset)

/datum/job/covenant/lance_ultra
	title = JOB_COV_LANCE_ULTRA
	total_positions = 1
	spawn_positions = 1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/covenant/lance/lance_standard
	allowed_genders = list(FEMALE, MALE)

/datum/job/covenant/lance_leader
	title = JOB_COV_LANCE_LEADER
	total_positions = 1
	spawn_positions = 1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/covenant/lance/lance_leader
	gear_preset_secondary = /datum/equipment_preset/covenant/lance/lance_leader/minor_greater
	gear_preset_tertiary = /datum/equipment_preset/covenant/lance/lance_leader/major_lesser
	gear_preset_quaternary = /datum/equipment_preset/covenant/lance/lance_leader/major
	job_options = list(ELITE_MINOR_VARIANT = "Minor", ELITE_MINOR_VARIANT_GREATER = "Minor+", ELITE_MAJOR_VARIANT_LESSER = "Major-", ELITE_MAJOR_VARIANT = "Major")
	allowed_species = list(SPECIES_SANGHEILI)

/datum/job/covenant/lance_leader/handle_job_options(option)
	if(option == ELITE_MINOR_VARIANT_GREATER)
		gear_preset = gear_preset_secondary
	if(option == ELITE_MAJOR_VARIANT_LESSER)
		gear_preset = gear_preset_tertiary
	if(option == ELITE_MAJOR_VARIANT)
		gear_preset = gear_preset_quaternary
	else
		gear_preset = initial(gear_preset)

// ================= LANDMARKS =================

/obj/effect/landmark/start/marine/covenant
	name = "covenant start landmark"
	icon = 'icons/halo/landmarks.dmi'
	icon_state = "cov"

/obj/effect/landmark/start/marine/covenant/lance_standard
	name = JOB_COV_LANCE_STANDARD
	squad = SQUAD_COVENANT
	icon_state = "warrior"
	job = /datum/job/covenant/lance_standard

/obj/effect/landmark/start/marine/covenant/lance_specialist
	name = JOB_COV_LANCE_SPECIALIST
	squad = SQUAD_COVENANT
	icon_state = "specialist"
	job = /datum/job/covenant/lance_specialist

/obj/effect/landmark/start/marine/covenant/lance_obedientary
	name = JOB_COV_LANCE_OBEDIENTARY
	squad = SQUAD_COVENANT
	icon_state = "obedientary"
	job = /datum/job/covenant/lance_obedientary

/obj/effect/landmark/start/marine/covenant/lance_ultra
	name = JOB_COV_LANCE_ULTRA
	squad = SQUAD_COVENANT
	icon_state = "evocati"
	job = /datum/job/covenant/lance_ultra

/obj/effect/landmark/start/marine/covenant/lance_leader
	name = JOB_COV_LANCE_LEADER
	squad = SQUAD_COVENANT
	icon_state = "leader"
	job = /datum/job/covenant/lance_leader

// latejoin

/obj/effect/landmark/late_join/covenant
	name = "covenant late join"
	icon = 'icons/halo/landmarks.dmi'
	icon_state = "cov"
	squad = SQUAD_COVENANT

// species spawns

/obj/effect/landmark/species_start/unggoy
	name = "unggoy start"
	icon = 'icons/halo/landmarks.dmi'
	icon_state = "unggoy_spawn"
	species = SPECIES_UNGGOY

/obj/effect/landmark/species_start/ruuhtian
	name = "ruuhtian start"
	icon = 'icons/halo/landmarks.dmi'
	icon_state = "ruuhtian_spawn"
	species = SPECIES_RUUHTIAN

/obj/effect/landmark/species_start/sangheili
	name = "sangheili start"
	icon = 'icons/halo/landmarks.dmi'
	icon_state = "sangheili_spawn"
	species = SPECIES_SANGHEILI
