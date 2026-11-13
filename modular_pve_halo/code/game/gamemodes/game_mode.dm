/datum/game_mode

	var/halo_human_ai_to_spawn

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
			qdel(spawner)
		gamemode_spawn_human_ai.Remove(spawner)
