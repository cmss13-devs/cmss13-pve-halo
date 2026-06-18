
#define POSSIBLE_DREAM_TOPICS list( \
"a military vessel","a wound","a familiar face","a friend","a flare","a military officer","a politician", \
"whispering","deep space","a medic","a slipspace drive","alarm","an ally","darkness", "evacuation", \
"dim light","a scientist","a great leader","a catastrophe","desertion","a mistake","ice","freezing","warning lights", \
"a helmet","mandibles","an abandoned station","a colony","monsters","air","a morgue","a military bridge","blinking lights", \
"a blue light","an abandoned colony","the UNSC","blood","a bandage","fear","a stiff corpse","a military fleet", \
"loyalty","space","a crash","loneliness","suffocation","a fall","heat","flames","ice","cigarettes","falling","a buzzer", \
"snow","searing heat","calamity","the dead","a rifle", "slipspace rupture", "brutes", "grunts", "jackals", "an elite", "drones", \
"a knife","a distress beacon","a pistol","a spider","empty space","claws", "artifical intelligence", "Waypoint", "ChatterNet", \
"acid","a meeting","welding","the vents","being trapped","a survivor", "a woman", "a man", "a person", \
"a powered exoskeleton","cryosleep","a meeting room","an engineer","a severed head","a motion tracker","a pelican","a uniform", \
"a ruined station","fire","a smokey room","a voice","the cold","dimness","an operating table","teeth","flowers","graves", \
"a synthetic man","meat","a planet","the UEG","the CMA","tools", "the Insurrection", "ONI", "the Covenant", "ODSTs", "marines", \
"cyborgs", "a supersoldier", "biofoam", "moa", "Earth", "Reach", "hope", "melancholy", "safety", "static", "a stranger", "laughter", \
"crying", "glassing", "a ruined city", "plasma burn", "screaming", "a black void", "flickering light", "believe", "dust and echoes", \
"dirt", "the outer colonies", "the inner colonies", "regret", "determination", "dread", "mourning", "an ocean", "survival", "life", \
"holo-film", "flip music", "credits", "food" \
)

/mob/living/carbon/proc/dream()
	dreaming = 1

	spawn(0)
		for(var/i = rand(1,4),i > 0, i--)
			to_chat(src, SPAN_NOTICE("<i>... [pick(POSSIBLE_DREAM_TOPICS)] ...</i>"))
			sleep(rand(40,70))
			if(!stat)
				dreaming = 0
				return
		dreaming = 0
		return

/mob/living/carbon/proc/handle_dreams()
	if(client && !dreaming && prob(5))
		dream()

/mob/living/carbon/var/dreaming = 0
