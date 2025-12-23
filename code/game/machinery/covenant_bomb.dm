GLOBAL_VAR_INIT(bomb_set, FALSE)
/obj/structure/machinery/covenant_bomb
	name = "\improper Antimatter Charge"
	desc = "A frightening-looking explosive device of alien origin, you should get very far away from it, or get it very far away from you."
	icon = 'icons/halo/obj/structures/machinery/covenant_bomb.dmi'
	icon_state = "bomb"
	density = TRUE
	unslashable = TRUE
	unacidable = TRUE
	anchored = FALSE
	var/timing = FALSE
	var/deployable = FALSE
	var/explosion_time = null
	var/timeleft = 10 MINUTES
	var/safety = TRUE
	var/being_used = FALSE
	var/end_round = TRUE
	var/timer_announcements_flags = NUKE_SHOW_TIMER_ALL
	pixel_x = -16
	use_power = USE_POWER_NONE
	req_access = list()
	flags_atom = FPRINT
	var/command_lockout = FALSE //If set to TRUE, only command staff would be able to disable the nuke

/obj/structure/machinery/covenant_bomb/update_icon()
	overlays.Cut()
	if(anchored)
		var/image/I = image(icon, "+deployed")
		overlays += I
	if(!safety)
		var/image/I = image(icon, "+unsafe")
		overlays += I
	if(timing)
		var/image/I = image(icon, "+timing")
		overlays += I
	if(timing == -1)
		var/image/I = image(icon, "+activation")
		overlays += I

/obj/structure/machinery/covenant_bomb/power_change()
	return

/obj/structure/machinery/covenant_bomb/process()
	. = ..()
	GLOB.bomb_set = TRUE //So long as there is one nuke timing, it means one nuke is armed.
	timeleft = explosion_time - world.time
	if(world.time >= explosion_time)
		explode()
		return
	//3 warnings: 1. Halfway through, 2. 1 minute left, 3. 10 seconds left.
	//this structure allows varedits to var/timeleft without losing or spamming warnings.
	if(!timer_announcements_flags)
		return

	if(timer_announcements_flags & NUKE_SHOW_TIMER_HALF)
		if(timeleft <= initial(timeleft) / 2 && timeleft >= initial(timeleft) / 2 - 30)
			message_admins("\The [src] has [NUKE_SHOW_TIMER_HALF] remaining.")
			timer_announcements_flags &= ~NUKE_SHOW_TIMER_HALF
			return
	if(timer_announcements_flags & NUKE_SHOW_TIMER_MINUTE)
		if(timeleft <= 600 && timeleft >= 570)
			message_admins("\The [src] has [NUKE_SHOW_TIMER_MINUTE] remaining.")
			timer_announcements_flags = NUKE_SHOW_TIMER_TEN_SEC
			return
	if(timer_announcements_flags & NUKE_SHOW_TIMER_TEN_SEC)
		if(timeleft <= 100 && timeleft >= 70)
			message_admins("\The [src] has [NUKE_SHOW_TIMER_TEN_SEC] remaining.")
			timer_announcements_flags = 0
			return

/obj/structure/machinery/covenant_bomb/attackby(obj/item/O as obj, mob/user as mob)
	if(anchored && timing && GLOB.bomb_set && HAS_TRAIT(O, TRAIT_TOOL_WIRECUTTERS))
		user.visible_message(SPAN_INFO("[user] begins to defuse \the [src]."), SPAN_INFO("You begin to defuse \the [src]. This will take some time..."))
		if(do_after(user, 150 * user.get_skill_duration_multiplier(SKILL_ENGINEER), INTERRUPT_NO_NEEDHAND, BUSY_ICON_HOSTILE))
			disable()
			playsound(loc, 'sound/items/Wirecutter.ogg', 100, 1)
		return
	..()

/obj/structure/machinery/covenant_bomb/attack_hand(mob/user as mob)
	if(user.is_mob_incapacitated() || get_dist(src, user) > 1 || isRemoteControlling(user))
		return

	if(deployable)
		if(!ishuman(user) && !isqueen(user))
			to_chat(usr, SPAN_INFO("You don't have the dexterity to do this!"))
			return

	else
		make_deployable()


// TGUI \\

/obj/structure/machinery/covenant_bomb/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AntimatterCharge", "[src.name]")
		ui.open()

/obj/structure/machinery/covenant_bomb/ui_state(mob/user)
	if(being_used)
		return UI_CLOSE
	return GLOB.not_incapacitated_and_adjacent_state

/obj/structure/machinery/covenant_bomb/ui_status(mob/user)
	. = ..()
	if(inoperable())
		return UI_CLOSE

/obj/structure/machinery/covenant_bomb/ui_data(mob/user)
	var/list/data = list()

	var/allowed = allowed(user)

	data["anchor"] = anchored
	data["safety"] = safety
	data["timing"] = timing
	data["timeleft"] = duration2text_sec(timeleft)
	data["command_lockout"] = command_lockout
	data["allowed"] = allowed
	data["being_used"] = being_used
	data["decryption_complete"] = TRUE //this is overridden by techweb nuke UI_data later, this just makes it default to true

	return data

/obj/structure/machinery/covenant_bomb/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	var/area/A = get_area(src)
	switch(action)
		if("toggleNuke")
			if(timing == -1)
				return

			if(!ishuman(ui.user))
				return

			if(!allowed(ui.user))
				to_chat(ui.user, SPAN_INFO("Access denied!"))
				return

			if(!anchored)
				to_chat(ui.user, SPAN_INFO("Engage anchors first!"))
				return

			if(safety)
				to_chat(ui.user, SPAN_INFO("The safety is still on."))
				return

			if(!A.can_build_special)
				to_chat(ui.user, SPAN_INFO("You cannot deploy [src] here!"))
				return

			if(ui.user.action_busy)
				return

			ui.user.visible_message(SPAN_WARNING("[ui.user] begins to [timing ? "disengage" : "engage"] [src]!"), SPAN_WARNING("You begin to [timing ? "disengage" : "engage"] [src]."))
			being_used = TRUE
			ui = SStgui.try_update_ui(ui.user, src, ui)
			if(do_after(ui.user, 50, INTERRUPT_NO_NEEDHAND, BUSY_ICON_HOSTILE))
				timing = !timing
				if(timing)
					if(!safety)
						GLOB.bomb_set = TRUE
						explosion_time = world.time + timeleft
						start_processing()
						message_admins("\The [src] has been activated by [key_name(ui.user, 1)] [ADMIN_JMP_USER(ui.user)]")
					else
						GLOB.bomb_set = FALSE
				else
					disable()
					message_admins("\The [src] has been deactivated by [key_name(ui.user, 1)] [ADMIN_JMP_USER(ui.user)]")
				playsound(loc, 'sound/effects/thud.ogg', 100, 1)
			being_used = FALSE
			. = TRUE

		if("toggleSafety")
			if(!allowed(ui.user))
				to_chat(ui.user, SPAN_INFO("Access denied!"))
				return
			if(timing)
				to_chat(ui.user, SPAN_INFO("Disengage first!"))
				return
			if(!A.can_build_special)
				to_chat(ui.user, SPAN_INFO("You cannot deploy [src] here!"))
				return
			if(ui.user.action_busy)
				return
			ui.user.visible_message(SPAN_WARNING("[ui.user] begins to [safety ? "disable" : "enable"] the safety on [src]!"), SPAN_WARNING("You begin to [safety ? "disable" : "enable"] the safety on [src]."))
			being_used = TRUE
			ui = SStgui.try_update_ui(ui.user, src, ui)
			if(do_after(ui.user, 50, INTERRUPT_NO_NEEDHAND, BUSY_ICON_HOSTILE))
				safety = !safety
				playsound(loc, 'sound/items/poster_being_created.ogg', 100, 1)
			being_used = FALSE
			if(safety)
				timing = FALSE
				GLOB.bomb_set = FALSE
			. = TRUE

		if("toggleCommandLockout")
			if(!ishuman(ui.user))
				return
			if(!allowed(ui.user))
				to_chat(ui.user, SPAN_INFO("Access denied!"))
				return
			if(command_lockout)
				command_lockout = FALSE
				req_one_access = list()
				to_chat(ui.user, SPAN_INFO("Command lockout disengaged."))
			else
				//Check if they have command access
				var/list/acc = list()
				var/mob/living/carbon/human/H = ui.user
				if(H.wear_id)
					acc += H.wear_id.GetAccess()
				if(H.get_active_hand())
					acc += H.get_active_hand().GetAccess()
				if(!(ACCESS_MARINE_COMMAND in acc))
					to_chat(ui.user, SPAN_INFO("Access denied!"))
					return

				command_lockout = TRUE
				req_one_access = list(ACCESS_MARINE_COMMAND)
				to_chat(ui.user, SPAN_INFO("Command lockout engaged."))
			. = TRUE

		if("toggleAnchor")
			if(timing)
				to_chat(ui.user, SPAN_INFO("Disengage first!"))
				return
			if(!A.can_build_special)
				to_chat(ui.user, SPAN_INFO("You cannot deploy [src] here!"))
				return
			if(ui.user.action_busy)
				return
			being_used = TRUE
			ui = SStgui.try_update_ui(ui.user, src, ui)
			if(do_after(ui.user, 50, INTERRUPT_NO_NEEDHAND, BUSY_ICON_HOSTILE))
				if(!anchored)
					visible_message(SPAN_INFO("With a steely snap, spikes slide out of [src] and anchor it to the flooring."))
				else
					visible_message(SPAN_INFO("The anchoring spikes slide back into the depths of [src]."))
				playsound(loc, 'sound/items/Deconstruct.ogg', 100, 1)
				anchored = !anchored
			being_used = FALSE
			. = TRUE

	update_icon()
	add_fingerprint(ui.user)

/obj/structure/machinery/covenant_bomb/verb/make_deployable()
	set category = "Object"
	set name = "Make Deployable"
	set src in oview(1)

	if(usr.is_mob_incapacitated() || being_used || timing)
		return

	if(!ishuman(usr))
		to_chat(usr, SPAN_INFO("You don't have the dexterity to do this!"))
		return

	var/area/A = get_area(src)
	if(!A.can_build_special)
		to_chat(usr, SPAN_INFO("You don't want to deploy this here!"))
		return

	usr.visible_message(SPAN_WARNING("[usr] begins to [deployable ? "press" : "press"] several buttons to make [src] [deployable ? "undeployable" : "deployable"]."), SPAN_WARNING("You begin to [deployable ? "press" : "press"] several buttons to make [src] [deployable ? "undeployable" : "deployable"]."))
	being_used = TRUE
	if(do_after(usr, 50, INTERRUPT_NO_NEEDHAND, BUSY_ICON_HOSTILE))
		if(deployable)
			deployable = FALSE
			anchored = FALSE
		else
			deployable = TRUE
			anchored = TRUE
		playsound(loc, 'sound/items/Deconstruct.ogg', 100, 1)
	being_used = FALSE
	update_icon()

/obj/structure/machinery/covenant_bomb/ex_act(severity)
	return

/obj/structure/machinery/covenant_bomb/proc/disable()
	timing = FALSE
	GLOB.bomb_set = FALSE
	timeleft = initial(timeleft)
	explosion_time = null

/obj/structure/machinery/covenant_bomb/proc/explode()
	if(safety)
		timing = FALSE
		update_minimap_icon()
		stop_processing()
		update_icon()
		return FALSE
	timing = -1
	update_icon()
	safety = TRUE

	playsound(src, 'sound/machines/Alarm.ogg', 75, 0, 30)
	world << pick('sound/theme/nuclear_klaxon.ogg')

	var/list/humans_other = GLOB.human_mob_list + GLOB.dead_mob_list
	var/list/humans_uscm = list()
	for(var/mob/current_mob as anything in humans_other)
		if(current_mob.stat != CONSCIOUS || isyautja(current_mob))
			humans_other -= current_mob
			continue
		if(current_mob.faction == FACTION_MARINE || current_mob.faction == FACTION_SURVIVOR) //separating marines from other factions. Survs go here too
			humans_uscm += current_mob
			humans_other -= current_mob

	sleep(10 SECONDS)

	var/list/mob/alive_mobs = list() //Everyone who will be destroyed on the zlevel(s).
	var/list/mob/dead_mobs = list() //Everyone that needs embryos cleared
	for(var/mob/current_mob as anything in GLOB.mob_list)
		var/turf/current_turf = get_turf(current_mob)
		if(current_turf?.z == z)
			if(current_mob.stat == DEAD)
				dead_mobs |= current_mob
				continue
			alive_mobs |= current_mob

	for(var/datum/interior/interior in SSinterior.interiors)
		if(!interior.exterior || interior.exterior.z != z)
			continue

		for(var/mob/living/passenger in interior.get_passengers())
			if(!(passenger in (alive_mobs + dead_mobs)))
				if(passenger.stat != DEAD)
					passenger.death(create_cause_data("nuclear explosion"))
				for(var/obj/item/alien_embryo/embryo in passenger)
					qdel(embryo)

	for(var/mob/current_mob in alive_mobs)
		if(istype(current_mob.loc, /obj/structure/closet/secure_closet/freezer/fridge))
			continue
		current_mob.death(create_cause_data("nuclear explosion"))

	for(var/mob/living/current_mob in (alive_mobs + dead_mobs))
		if(istype(current_mob.loc, /obj/structure/closet/secure_closet/freezer/fridge))
			continue
		for(var/obj/item/alien_embryo/embryo in current_mob)
			qdel(embryo)

	cell_explosion(loc, 500, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data(initial(name)))
	announcement_helper("NUCLEAR DETONATION DETECTED.", "[MAIN_AI_SYSTEM] Nuclear Tracker", humans_uscm, 'sound/misc/notice1.ogg')
	announcement_helper("NUCLEAR DETONATION DETECTED.", "Colony Alert System", humans_other, 'sound/misc/notice1.ogg')
	qdel(src)
	return TRUE

/obj/structure/machinery/covenant_bomb/Destroy()
	GLOB.bomb_set = FALSE
	return ..()
