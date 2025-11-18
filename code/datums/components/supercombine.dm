/datum/component/supercombine
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS
	var/needles_to_supercombine = 14
	var/supercombine_dissipation = 1
	var/needles
	var/shooter_name
	var/direction
	var/mob/living/carbon/human/parent_carbon
	var/atom/movable/overlay/needler_overlay

/datum/component/supercombine/Initialize(needles, shooter, direction, needles_to_supercombine = 14, supercombine_dissipation = 2)
	. = ..()
	if(!iscarbon(parent))
		return
	src.needles = needles
	src.needles_to_supercombine = needles_to_supercombine
	src.supercombine_dissipation = supercombine_dissipation
	src.shooter_name = shooter
	src.direction = direction
	needler_overlay

/datum/component/supercombine/InheritComponent(datum/component/supercombine/supercombine_new, i_am_original, amount = 1)
	. = ..()
	parent_carbon = parent
	for(var/obj/item/shard/shrapnel/needler/needle in parent_carbon.embedded_items)
		if(!supercombine_new)
			needles = needle.count
		else
			needles = supercombine_new.needles
	if(needler_overlay in parent_carbon.vis_contents)
		needler_overlay.icon_state = needle_overlay(needles)
	else
		needler_overlay = new()
		needler_overlay.icon = 'icons/halo/effects/supercombine.dmi'
		needler_overlay.icon_state = needle_overlay(needles)
		needler_overlay.layer = ABOVE_MOB_LAYER
		needler_overlay.vis_flags = VIS_INHERIT_ID|VIS_INHERIT_DIR
		parent_carbon.vis_contents += needler_overlay
	if(needles >= needles_to_supercombine)
		var/turf/turf = get_turf(parent_carbon)
		var/cause_data = create_cause_data("supercombine explosion", shooter_name)
		cell_explosion(turf, 50, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, direction, cause_data)
		flick_overlay(parent_carbon, image('icons/halo/effects/supercombine.dmi', null, "supercombine"), 3)
		playsound(parent_carbon, 'sound/effects/halo/supercombine.ogg')
		src.needles = 0

/datum/component/supercombine/proc/needle_overlay(needles)
	var/return_icon
	if(needles >= 14)
		return_icon = "needles_7"
	else
		var/return_number = needles/2
		return_icon = "needles_[return_number]"
	return return_icon
/datum/component/supercombine/RegisterWithParent()


/datum/component/supercombine/UnregisterFromParent()
