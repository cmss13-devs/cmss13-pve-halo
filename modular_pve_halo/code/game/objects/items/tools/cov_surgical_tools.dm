/obj/item/tool/covenant_tweezers
	name = "nanolaminate tweezers"
	desc = "A more primitive method of extracting shrapnel in a battlefield. Made of nanolaminate."
	icon = 'icons/halo/obj/items/cov_medical.dmi'
	icon_state = "tweezers"
	attack_verb = list("pinched", "tweezed")
	w_class = SIZE_SMALL
	flags_item = CAN_DIG_SHRAPNEL

/obj/item/tool/covenant_tweezers/advanced
	name = "low-level gravity manipulators"
	desc = "A rather fancy nanolaminate-forged tool. Three manipulating pincers focus micro gravity adjustments, while an onboard computer and lens detect foreign material in the body. Combining all of these makes for as bloodless of an extraction process as possible."
	icon_state = "sang_tweezers"
	attack_verb = list("gravitated", "manipulated")
	flags_item = CAN_DIG_SHRAPNEL

/obj/item/tool/covenant_tweezers/advanced/dig_out_shrapnel(mob/living/carbon/human/embedded_human, mob/living/carbon/human/user = null)
	if(!user)
		user = embedded_human

	if(user.action_busy)
		return

	var/address_mode

	if(user != embedded_human)
		user.affected_message(embedded_human,
			SPAN_NOTICE("You begin examining [embedded_human]'s body for shrapnel."),
			SPAN_NOTICE("[user] begins to examine your body for shrapnel to extract. Hold still."),
			SPAN_NOTICE("[user] begins to examine [embedded_human]'s body for shrapnel."))
		address_mode = "out of [embedded_human]'s" //includes "out of " to prevent capital-T 'The unknown'.
		if(!do_after(user, 10, INTERRUPT_ALL, BUSY_ICON_FRIENDLY, embedded_human, INTERRUPT_MOVED, BUSY_ICON_MEDICAL))
			to_chat(user, SPAN_NOTICE("You were interrupted!"))
			return
	else
		user.visible_message(SPAN_NOTICE("[user] starts checking \his body for shrapnel."), \
			SPAN_NOTICE("You begin searching your body for shrapnel."))
		address_mode = "out of your"
		if(!do_after(embedded_human, 10, INTERRUPT_ALL, BUSY_ICON_FRIENDLY))
			to_chat(user, SPAN_NOTICE("You were interrupted!"))
			return

	var/list/removed_limbs = list()
	for(var/obj/item/shard/S in embedded_human.embedded_items)
		var/obj/limb/organ = S.embedded_organ

		if(!(organ.display_name in removed_limbs))
			removed_limbs += organ.display_name

		S.forceMove(embedded_human.loc)
		organ.implants -= S
		embedded_human.embedded_items -= S
		organ = null
		for(var/i in 1 to S.count-1)
			user.count_niche_stat(STATISTICS_NICHE_SURGERY_SHRAPNEL)
			var/shrapnel = new S.type(S.loc)
			QDEL_IN(shrapnel, 300)
		user.count_niche_stat(STATISTICS_NICHE_SURGERY_SHRAPNEL)
		QDEL_IN(S, 300)

	if(length(removed_limbs))
		var/duglimbs = english_list(removed_limbs, final_comma_text = ",")
		user.affected_message(embedded_human,
			SPAN_NOTICE("You carefully remove the shrapnel [address_mode] [duglimbs] with your [src.name]."),
			SPAN_NOTICE("[user] carefully removes the shrapnel from your [duglimbs] with \his [src.name]."),
			SPAN_NOTICE(user != embedded_human ? "[user] uses \his [src.name] to carefully remove the shrapnel from [embedded_human]'s [duglimbs]." : "[user] digs the shrapnel out of \his [duglimbs] with \his [src.name]."))

		SEND_SIGNAL(embedded_human, COMSIG_HUMAN_SHRAPNEL_REMOVED)

	else
		to_chat(user, SPAN_NOTICE("You couldn't find any shrapnel."))
