/datum/game_mode

	var/halo_human_ai_to_spawn

/datum/game_mode/proc/pre_setup()
	SHOULD_CALL_PARENT(TRUE)
	setup_structures()
	if(static_comms_amount)
		spawn_static_comms()
	if(corpses_to_spawn)
		generate_corpses()
	if(halo_human_ai_to_spawn)
		generate_halo_human_ai()
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_MODE_PRESETUP)
	return 1

/datum/game_mode/proc/generate_halo_human_ai()
	var/list/obj/effect/landmark/halo_human_ai_spawner/gamemode_spawn_human_ai = GLOB.halo_human_ai_spawns.Copy()
	while(halo_human_ai_to_spawn--)
		if(!length(gamemode_spawn_human_ai))
			break
		var/obj/effect/landmark/halo_human_ai_spawner/spawner = pick(gamemode_spawn_human_ai)
		var/turf/spawnpoint = get_turf(spawner)
		if(spawnpoint)
			var/mob/living/carbon/human/H = new /mob/living/carbon/human(spawnpoint)
			H.create_hud()
			arm_equipment(H, spawner.equip_path, TRUE, FALSE)
			H.AddComponent(/datum/component/human_ai)
			H.get_ai_brain().appraise_inventory()
		gamemode_spawn_human_ai.Remove(spawner)
