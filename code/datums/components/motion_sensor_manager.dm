// This could probably be an element but im lazy
// This is a component that can be applied to any equippable item
// It will automatically give and remove the motion tracker when clothing is equipped/unequipped
// It will also automatically provide an action button to toggle the motion tracker
/datum/component/motion_tracker_manager
	dupe_mode = COMPONENT_DUPE_HIGHLANDER
	var/datum/action/item_action/motion_tracker/tracker_action
	var/motion_tracker_color = "#0080ae"

/datum/component/motion_tracker_manager/Initialize()
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	. = ..()

/datum/component/motion_tracker_manager/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(equipped))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(dropped))
	tracker_action = new /datum/action/item_action/motion_tracker(parent, null, motion_tracker_color)
	RegisterSignal(tracker_action, COMSIG_ACTION_ACTIVATED, PROC_REF(toggle))

/datum/component/motion_tracker_manager/UnregisterFromParent()
	UnregisterSignal(parent, list(
		COMSIG_ITEM_EQUIPPED,
		COMSIG_ITEM_UNEQUIPPED,
	))
	UnregisterSignal(tracker_action, COMSIG_ACTION_ACTIVATED)
	qdel(tracker_action)

/datum/component/motion_tracker_manager/proc/equipped(obj/item/source, mob/living/carbon/human/mob, slot)
	SIGNAL_HANDLER
	mob.hud_used.motion_tracker.configure(background_color = motion_tracker_color)
	if(is_equipped(mob))
		mob.hud_used.motion_tracker.give(mob)
	else
		mob.hud_used.motion_tracker.remove()

/datum/component/motion_tracker_manager/proc/dropped(obj/item/source, mob/living/carbon/human/mob, slot)
	SIGNAL_HANDLER
	if(!is_equipped(mob))
		mob.hud_used.motion_tracker.remove()

/datum/component/motion_tracker_manager/proc/toggle(datum/action/item_action/motion_tracker/source)
	SIGNAL_HANDLER
	var/obj/item/parent_item = parent
	if(!ishuman(parent_item.loc))
		return
	var/mob/living/carbon/human/mob = parent_item.loc
	if(!is_equipped(mob))
		mob.hud_used.motion_tracker.remove()
		return

	if(mob.hud_used.motion_tracker.alpha == 0) // currently disabled
		mob.hud_used.motion_tracker.give(mob)
	else
		mob.hud_used.motion_tracker.remove()

/datum/component/motion_tracker_manager/proc/is_equipped(mob/living/carbon/human/mob)
	var/obj/item/parent_item = parent
	return parent_item.is_valid_slot(mob.get_slot_by_item(parent_item), TRUE)

/datum/action/item_action/motion_tracker
	var/overlay_color

/datum/action/item_action/motion_tracker/New(Target, obj/item/holder, _overlay_color)
	. = ..()
	name = "Toggle Motion Tracker"
	button.name = name
	overlay_color = _overlay_color
	update_button_icon()

/datum/action/item_action/motion_tracker/update_button_icon()
	var/image/image = image('icons/halo/mob/hud/actions.dmi', button, "motion_tracker")
	image.color = overlay_color
	button.overlays += image

/datum/action/item_action/motion_tracker/action_activate()
	if(!ismob(holder_item.loc))
		return
	. = ..()
