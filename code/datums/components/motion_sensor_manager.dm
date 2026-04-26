// This could probably be an element but im lazy
// This is a component that can be applied to any equippable item
// It will automatically give and remove the motion sensor when clothing is equipped/unequipped
// It will also automatically provide an action button to toggle the motion sensor
/datum/component/motion_sensor_manager
	dupe_mode = COMPONENT_DUPE_HIGHLANDER
	var/datum/action/item_action/motion_sensor/sensor_action

/datum/component/motion_sensor_manager/Initialize()
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	. = ..()

/datum/component/motion_sensor_manager/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(equipped))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(dropped))
	sensor_action = new /datum/action/item_action/motion_sensor(parent)
	RegisterSignal(sensor_action, COMSIG_ACTION_ACTIVATED, PROC_REF(toggle))

/datum/component/motion_sensor_manager/UnregisterFromParent()
	UnregisterSignal(parent, list(
		COMSIG_ITEM_EQUIPPED,
		COMSIG_ITEM_UNEQUIPPED,
	))
	UnregisterSignal(sensor_action, COMSIG_ACTION_ACTIVATED)
	qdel(sensor_action)

/datum/component/motion_sensor_manager/proc/equipped(obj/item/source, mob/living/carbon/human/mob, slot)
	SIGNAL_HANDLER
	if(is_equipped(mob))
		mob.hud_used.motion_sensor.give(mob)
	else
		mob.hud_used.motion_sensor.remove()

/datum/component/motion_sensor_manager/proc/dropped(obj/item/source, mob/living/carbon/human/mob, slot)
	SIGNAL_HANDLER
	if(!is_equipped(mob))
		mob.hud_used.motion_sensor.remove()

/datum/component/motion_sensor_manager/proc/toggle(datum/action/item_action/motion_sensor/source)
	SIGNAL_HANDLER
	var/obj/item/parent_item = parent
	if(!ishuman(parent_item.loc))
		return
	var/mob/living/carbon/human/mob = parent_item.loc
	if(!is_equipped(mob))
		mob.hud_used.motion_sensor.remove()
		return

	if(mob.hud_used.motion_sensor.alpha == 0) // currently disabled
		mob.hud_used.motion_sensor.give(mob)
	else
		mob.hud_used.motion_sensor.remove()

/datum/component/motion_sensor_manager/proc/is_equipped(mob/living/carbon/human/mob)
	var/obj/item/parent_item = parent
	return parent_item.is_valid_slot(mob.get_slot_by_item(parent_item), TRUE)

/datum/action/item_action/motion_sensor/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Motion Sensor"
	button.name = name
	// Maybe this would look better with a custom sprite? Right now it just shows the helmet

/datum/action/item_action/motion_sensor/action_activate()
	if(!ismob(holder_item.loc))
		return
	. = ..()
