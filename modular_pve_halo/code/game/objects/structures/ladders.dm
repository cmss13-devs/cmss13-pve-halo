/obj/structure/ladder/gravity_lift
	name = "gravity projector"
	desc = "A vertical gravity projector, capable of changing the direction of its gravitic beam."
	icon = 'icons/halo/obj/structures/grav_lift.dmi'
	icon_state = "generator"

/obj/structure/ladder/gravity_lift/attack_hand(mob/living/user)
	return

/obj/structure/ladder/gravity_lift/Crossed(atom/movable/user)
	if(busy)
		return
	var/ladder_dir_name
	var/obj/structure/ladder/ladder_dest
	if(up && down)
		busy = TRUE
		if(ishuman(user))
			var/mob/living/carbon/human/human = user
			if(human.client.prefs && human.client.prefs.no_radials_preference)
				var/choice = tgui_input_list(src, "Choose a direction", "Ladder", list("Up", "Down"))
				if(choice == "Up")
					ladder_dir_name = "up"
					ladder_dest = up
				if(choice == "Down")
					ladder_dir_name = "down"
					ladder_dest = down
				else
					return
				busy = FALSE
			else
				var/static/list/ladder_direction = list("Up" = image(icon = 'icons/mob/radial_taperecorder.dmi', icon_state = "input"), "Down" = image(icon = 'icons/mob/radial_taperecorder.dmi', icon_state = "input"))
				var/choice = show_radial_menu(user, src, ladder_direction, require_near = TRUE)
				if(choice == "Up")
					ladder_dir_name = "up"
					ladder_dest = up
				if(choice == "Down")
					ladder_dir_name = "down"
					ladder_dest = down
				else
					return
				busy = FALSE
		else
			ladder_dest = up
	else if(up)
		ladder_dir_name = "up"
		ladder_dest = up
	else if(down)
		ladder_dir_name = "down"
		ladder_dest = down
	else return //just in case

	visible_message(SPAN_NOTICE("[user] floats [ladder_dir_name] [src]."))
	if(down)
		flick("hatch_loop", src)
	else if(ladder_dest.down)
		flick("hatch_loop", ladder_dest)
	playsound(src, 'modular_pve_halo/sound/machines/gravity_lift.ogg')
	playsound(ladder_dest, 'modular_pve_halo/sound/machines/gravity_lift.ogg')
	if(ishuman(user))
		var/mob/living/carbon/human/human = user
		if(human.client)
			playsound_client(human.client, 'modular_pve_halo/sound/machines/gravity_lift.ogg')
	user.loc = ladder_dest.loc
	add_fingerprint(user)

/obj/structure/ladder/gravity_lift/update_icon()
	overlays.Cut()
	if(up && down)
		icon_state = "hatch"
	else if(down)
		icon_state = "hatch"
	else if(up)
		icon_state = "generator"
		var/image/img = image(icon = 'icons/halo/obj/structures/grav_lift.dmi', icon_state = "generator_beam", layer = ABOVE_MOB_LAYER)
		img.blend_mode = BLEND_ADD
		img.mouse_opacity = FALSE
		overlays += img
	else
		icon_state = "generator_off"

/obj/structure/ladder/gravity_lift/MouseDrop()
	return

/obj/structure/ladder/gravity_lift/attackby()
	return // You can do this by throwing it on the lift itself

/obj/structure/ladder/gravity_lift/test_1
	id = 1
	height = 1

/obj/structure/ladder/gravity_lift/test_2
	id = 1
