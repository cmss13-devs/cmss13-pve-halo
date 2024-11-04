#define AREASELECT_CORNERA "corner A"
#define AREASELECT_CORNERB "corner B"

/datum/human_ai_quick_order
	var/client/holder
	var/list/preview = list()
	var/turf/cornerA
	var/turf/cornerB
	var/list/ai_humans_selected = list()

/datum/human_ai_quick_order/Destroy(force, ...)
	deselect_region()
	holder.click_intercept = src
	holder = null
	cornerA = null
	cornerB = null
	return ..()

/datum/human_ai_quick_order/proc/deselect_region()
	holder.images -= preview
	preview.Cut()
	cornerA = null
	cornerB = null

/datum/human_ai_quick_order/proc/InterceptClickOn(mob/user, params, atom/object)
	var/list/modifiers = params2list(params)
	if(LAZYACCESS(modifiers, ALT_CLICK))
		if(!length(ai_humans_selected))
			to_chat(holder, SPAN_BOLDNOTICE("You need to have an area selected first."))
			return

		var/path_to_use = /datum/ongoing_action/approach_target
		if(tgui_alert(holder.mob, "Should the AI stop approaching when they find a target?", "Approach Carefully?", list("Yes", "No")) == "Yes")
			path_to_use = /datum/ongoing_action/approach_target/carefully

		for(var/datum/human_ai_brain/brain as anything in ai_humans_selected)
			ADD_ONGOING_ACTION(brain, path_to_use, get_turf(object), 1)

		to_chat(holder, SPAN_BOLDNOTICE("Order sent."))
		deselect_region()
		ai_humans_selected.Cut()

	else if(LAZYACCESS(modifiers, LEFT_CLICK))
		if(!cornerA)
			cornerA = select_tile(get_turf(object), AREASELECT_CORNERA)
			return
		if(cornerA && !cornerB)
			cornerB = select_tile(get_turf(object), AREASELECT_CORNERB)
			handle_selected_area(params)
			deselect_region()
			return
	else
		to_chat(holder, SPAN_NOTICE("Region selection canceled!"))
		deselect_region()
		ai_humans_selected.Cut()

/datum/human_ai_quick_order/proc/select_tile(turf/T, corner_to_select)
	var/overlaystate
	holder.images -= preview
	switch(corner_to_select)
		if(AREASELECT_CORNERA)
			overlaystate = "greenOverlay"
		if(AREASELECT_CORNERB)
			overlaystate = "blueOverlay"

	var/image/I = image('icons/turf/overlays.dmi', T, overlaystate)
	I.plane = ABOVE_LIGHTING_PLANE
	preview += I
	holder.images += preview
	return T

/datum/human_ai_quick_order/proc/handle_selected_area(params)
	if(!cornerA || !cornerB)
		return

	ai_humans_selected.Cut()
	for(var/turf/block_turf as anything in block(cornerA.x, cornerA.y, cornerA.z, cornerB.x, cornerB.y, cornerB.z))
		for(var/mob/living/carbon/human/maybe_ai in block_turf.contents)
			var/datum/human_ai_brain/brain = maybe_ai.get_ai_brain()
			if(brain)
				ai_humans_selected += brain

	to_chat(holder, SPAN_BOLDNOTICE("[length(ai_humans_selected)] AI selected in region."))

/client/proc/quick_order_human_ai()
	set name = "Quick Order: Approach"
	set category = "Game Master.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	if(istype(click_intercept, /datum/human_ai_quick_order))
		QDEL_NULL(click_intercept)
		to_chat(src, SPAN_BOLDNOTICE("Quick ordering stopped."))
		return

	var/datum/human_ai_quick_order/order_datum = new
	order_datum.holder = src
	click_intercept = order_datum
	to_chat(src, SPAN_BOLDNOTICE("Left click two corners to select all AI in the area. Then, alt-click on where you would like them to go. To stop quick ordering, press the verb again."))

#undef AREASELECT_CORNERA
#undef AREASELECT_CORNERB
