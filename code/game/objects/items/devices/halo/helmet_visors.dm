/obj/item/device/helmet_visor/medical/odst
	name = "VSIR Field Medic Module"
	desc = "A support utility module for the VISR system. Links to the biomonitors of allied personnel and provides detailed information for those able to comprehend it."
	helmet_overlay = "med_sight_right"
	hud_type = list(MOB_HUD_FACTION_UNSC, MOB_HUD_MEDICAL_BASIC)

/obj/item/device/helmet_visor/night_vision/unsc/
	hud_type = list(MOB_HUD_FACTION_UNSC, MOB_HUD_MEDICAL_BASIC)
	helmet_overlay = "hud_sight_full"
	power_use = 0
	visor_glows = FALSE
// separating out in case there are visr variants created between odst and spartans down the line

#define VISR_LOWLIGHT_USAGE(delta_time) (power_cell.use(power_use * (delta_time ? delta_time : 1)))

/obj/item/device/helmet_visor/night_vision/unsc/activate_visor(obj/item/clothing/head/helmet/marine/attached_helmet, mob/living/carbon/human/user)
	RegisterSignal(user, COMSIG_HUMAN_POST_UPDATE_SIGHT, PROC_REF(on_update_sight))

	user.add_client_color_matrix("visr_low_light", 90, color_matrix_multiply(color_matrix_saturation(1.25), color_matrix_from_string("#fdfacf")))
	user.overlay_fullscreen("visr_low_light", /atom/movable/screen/fullscreen/flash/noise/nvg)
	user.overlay_fullscreen("visr_low_light_blur", /atom/movable/screen/fullscreen/brute/nvg, 5)
	user.update_sight()

	for(var/type in hud_type)
		var/datum/mob_hud/current_mob_hud = GLOB.huds[type]
		current_mob_hud.add_hud_to(user, attached_helmet)

	if(visor_glows)
		on_light = new(attached_helmet)
		on_light.set_light_on(TRUE)
	START_PROCESSING(SSobj, src)
	RegisterSignal(user, COMSIG_MOB_CHANGE_VIEW, PROC_REF(change_view))

/obj/item/device/helmet_visor/night_vision/unsc/deactivate_visor(obj/item/clothing/head/helmet/marine/attached_helmet, mob/living/carbon/human/user)
	user.remove_client_color_matrix("visr_low_light", 1 SECONDS)
	user.clear_fullscreen("visr_low_light", 0.5 SECONDS)
	user.clear_fullscreen("visr_low_light_blur", 0.5 SECONDS)

	for(var/type in hud_type)
		var/datum/mob_hud/current_mob_hud = GLOB.huds[type]
		current_mob_hud.remove_hud_from(user, attached_helmet)

	if(visor_glows)
		qdel(on_light)
	UnregisterSignal(user, COMSIG_HUMAN_POST_UPDATE_SIGHT)
	UnregisterSignal(user, COMSIG_MOB_CHANGE_VIEW)

	user.update_sight()
	STOP_PROCESSING(SSobj, src)

/obj/item/device/helmet_visor/night_vision/unsc/process(delta_time)
	if(!VISR_LOWLIGHT_USAGE(delta_time))

		if(!istype(loc, /obj/item/clothing/head/helmet/marine))
			return PROCESS_KILL

		if(!istype(loc?.loc, /mob/living/carbon/human))
			return PROCESS_KILL

		var/obj/item/clothing/head/helmet/marine/attached_helmet = loc
		var/mob/living/carbon/human/user = loc.loc
		to_chat(user, SPAN_NOTICE("[src] deactivates as the battery goes out."))
		deactivate_visor(attached_helmet, user)
		return PROCESS_KILL

/obj/item/device/helmet_visor/night_vision/unsc/can_toggle(mob/living/carbon/human/user)
	. = ..()
	if(!.)
		return

	if(user.client?.view > 13)
		to_chat(user, SPAN_WARNING("You cannot use [src] while using optics."))
		return FALSE

	if(!VISR_LOWLIGHT_USAGE(FALSE))
		to_chat(user, SPAN_NOTICE("Your [src] is out of power! You'll need to recharge it."))
		return FALSE

	return TRUE

/obj/item/device/helmet_visor/night_vision/unsc/on_update_sight(mob/user)

	if(lighting_alpha < 255)
		user.see_in_dark = 7
	user.lighting_alpha = lighting_alpha
	user.sync_lighting_plane_alpha()

/obj/item/device/helmet_visor/night_vision/unsc/change_view(mob/user, new_size)
	if(new_size > 13) // cannot use binos with NVO
		var/obj/item/clothing/head/helmet/marine/attached_helmet = loc
		if(!istype(attached_helmet))
			return
		deactivate_visor(attached_helmet, user)
		to_chat(user, SPAN_NOTICE("You deactivate [src] on [attached_helmet]."))
		playsound_client(user.client, toggle_off_sound, null, 75)
		attached_helmet.active_visor = null
		attached_helmet.update_icon()
		var/datum/action/item_action/cycle_helmet_huds/cycle_action = locate() in attached_helmet.actions
		if(cycle_action)
			cycle_action.set_default_overlay()

#undef VISR_LOWLIGHT_USAGE

// no changes to activate_visor
// no changes to deactivate_visor
// no changes to process

/obj/item/device/helmet_visor/night_vision/unsc/odst
	name = "VSIR Low-Light Vision Module"
	desc = "The integrated VISR system features light enhancement systems, raising the brightness of the surrounding area on the user's heads-up display during low-light operations."
