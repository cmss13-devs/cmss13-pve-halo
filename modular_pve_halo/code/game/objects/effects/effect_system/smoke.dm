/obj/effect/particle_effect/smoke/methane
	time_to_live = INFINITY // lets hope this has no ramifications!
	amount = 0
	spread_speed = 0
	smokeranking = SMOKE_RANK_LOW
	color = "#25bd95"
	alpha = 75

/obj/effect/particle_effect/smoke/methane/Move()
	. = ..()
	for(var/mob/living/carbon/human/affected_mob in get_turf(src))
		if(!isspeciesunggoy(affected_mob))
			affect(affected_mob)

/obj/effect/particle_effect/smoke/methane/inhalation(mob/living/carbon/human/creature)
	if (..())
		return
	if(isspeciesunggoy(creature))
		return
	else
		if(prob(5))
			creature.drop_held_item()
		creature.apply_damage(10, OXY)
		if(creature.coughedtime != 1)
			creature.coughedtime = 1
			if(ishuman(creature)) //Humans only to avoid issues
				creature.emote("cough")
			addtimer(VARSET_CALLBACK(creature, coughedtime, 0), 2 SECONDS)
