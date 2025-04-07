/mob/living/carbon/human/proc/handle_dodgepool()
	if(time_to_dodge_pool_regen)
		time_to_dodge_pool_regen = max(time_to_dodge_pool_regen - 1, 0)
		dodge_pool_regen_enabled = FALSE
	if(!time_to_dodge_pool_regen)
		dodge_pool_regen_enabled = TRUE
	if(dodge_pool_regen_enabled)
		dodge_pool = min(dodge_pool + dodge_pool_regen, dodge_pool_max)
		if(dodge_pool_regen < dodge_pool_regen_max)
			dodge_pool_regen = min(dodge_pool_regen + dodge_pool_regen_restoration, dodge_pool_regen_max)
