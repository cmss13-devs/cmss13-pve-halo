// VISR STUFF

/obj/item/device/helmet_visor/visr
	name = "VISR v1.8.2b"
	desc = "An insertable program chip to enable the use of the VISR system with compatible HUDs."
	icon_state = "nvg_sight"
	hud_type = null
	action_icon_string = "nvg_sight_down"
	helmet_overlay = "nvg_sight_right"
	toggle_on_sound = 'sound/handling/visr_on.ogg'
	toggle_off_sound = 'sound/handling/visr_off.ogg'
	var/datum/visr_datum = VISR_STANDARD

	/// The alpha of darkness we set to for the mob while the visor is on, not completely fullbright but see-able
	var/lighting_alpha = 0

/obj/item/device/helmet_visor/visr/deactivate_visor(obj/item/clothing/head/helmet/marine/attached_helmet, mob/living/carbon/human/user)
	user.clear_fullscreen("visr_blur", 1 SECONDS)

	UnregisterSignal(user, COMSIG_HUMAN_POST_UPDATE_SIGHT)

	user.update_sight()

/obj/item/device/helmet_visor/visr/proc/on_update_sight(mob/user)
	SIGNAL_HANDLER

	if(lighting_alpha < 255)
		user.see_in_dark = 4
	user.lighting_alpha = lighting_alpha
	user.sync_lighting_plane_alpha()

///obj/item/device/helmet_visor/visr/activate_visor(obj/item/clothing/head/helmet/marine/attached_helmet, mob/living/carbon/human/user)
//	. = ..()
//	RegisterSignal(user, COMSIG_HUMAN_POST_UPDATE_SIGHT, PROC_REF(on_update_sight))
//
//	user.overlay_fullscreen("visr_blur", /atom/movable/screen/fullscreen/brute/visr, 3)
//	user.update_sight()
//
//	if(user.client)
//		var/mob/mobs
//
//		//Create the appearance so we have something to apply the filter to.
//		var/mutable_appearance/mob_appearance = new(mobs)
//		apc_appearance.filters += list("type" = "outline", "size" = 1, "color" = COLOR_GREEN)
//		//Make it an image we can give to the client
//		var/image/final_image = image(apc_appearance)
//
//		final_image.layer = WALL_OBJ_LAYER
//		final_image.plane = GAME_PLANE
//		final_image.loc = get_turf(APC)
//		final_image.dir = apc_appearance.dir
//		final_image.alpha = 225
//		user.client.images += final_image
//
///obj/item/device/multitool/proc/remove_apc_highlight(client/user_client, image/highlight_image)
//	if(!user_client)
//		return
//	user_client.images -= highlight_image
