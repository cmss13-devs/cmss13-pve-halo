#define FIRE_SUPPORT_CLICK_INTERCEPT_ACTION "fire_support_click_intercept_action"

//Various ordnance selections
#define ORDNANCE_OPTIONS list("Banshee Missile", "CN-20 Missile", "Harpoon Missile", "Keeper Missile", "Napalm Missile", "Thermobaric Missile", "Widowmaker Missile", "Laser", "Minirocket", "Incendiary Minirocket",  "Sentry Drop", "25mm Multipurpose Strike", "25mm Armorpiercing Strike", "High Explosive", "Incendiary", "Cluster", "High Explosive","Nerve Gas OB", "Incendiary", "Fragmentation", "Flare",  "Nerve Gas Mortar", "Willy-Pete Mortar", "Smoke Mortar", "Wraith Plasma", "Banshee Fuel Rod", "Banshee Strafe", "Glassing Beam")
#define COVENANT_ORDNANCE list("Wraith Plasma", "Banshee Fuel Rod", "Banshee Strafe", "Glassing Beam")
#define MISSILE_ORDNANCE list("Banshee Missile", "Harpoon Missile", "Keeper Missile", "Napalm Missile", "Thermobaric Missile", "Widowmaker Missile")
#define ORBITAL_ORDNANCE list("High Explosive OB", "Incendiary OB", "Cluster OB")
#define MORTAR_ORDNANCE list("High Explosive Shell", "Incendiary Shell", "Fragmentation Shell", "Flare Shell", "Willy-Pete Shell", "Smoke Shell")
#define CHEMICAL_ORDNANCE list("CN-20 Missile", "Nerve Gas OB", "Nerve Gas Shell")
#define MISC_ORDNANCE list("Laser", "Minirocket", "Incendiary Minirocket",  "Sentry Drop", "25mm Multipurpose Strike", "25mm Armorpiercing Strike")

//seperate fire support types
#define FIRESUPPORT_TYPE_WRAITH_PLASMA "wraith_plasma"
#define FIRESUPPORT_TYPE_BANSHEE_FUEL_ROD "banshee_fuel_rod"
#define FIRESUPPORT_TYPE_BANSHEE_STRAFE "banshee_strafe"
#define FIRESUPPORT_TYPE_GLASSING_BEAM "glassing_beam"

///Assoc list of firesupport types for datum based fire support
GLOBAL_LIST_INIT(fire_support_types, list(
	FIRESUPPORT_TYPE_WRAITH_PLASMA = new /datum/fire_support_custom/wraith_plasma,
	FIRESUPPORT_TYPE_BANSHEE_FUEL_ROD = new /datum/fire_support_custom/banshee_fuel_rod,
	FIRESUPPORT_TYPE_BANSHEE_STRAFE = new /datum/fire_support_custom/banshee_strafe,
	FIRESUPPORT_TYPE_GLASSING_BEAM = new /datum/fire_support_custom/glassing_beam
	))

/client/proc/toggle_fire_support_menu()
	set name = "Fire Support Menu"
	set category = "Game Master.Extras"
	if(!check_rights(R_ADMIN))
		return
	new /datum/fire_support_menu(mob)

///The actual menu datum
/datum/fire_support_menu
	var/fire_support_click_intercept = FALSE
	var/selected_ordnance = "Banshee Missile"
	var/sound_cooldown = FALSE
	///Mortar to fire the abstract shells.
	var/obj/structure/mortar/abstract_mortar = new()
	var/client/holder

/datum/fire_support_menu/New(user)
	if(isclient(user))
		holder = user
	else
		var/mob/mob = user
		holder = mob.client

	holder.click_intercept = src
	tgui_interact(holder.mob)

///Deletes the mortar when the menu is closed so we dont make a thousand of them.
/datum/fire_support_menu/Destroy(force, ...)
	QDEL_NULL(abstract_mortar)
	holder = null
	return ..()

/datum/fire_support_menu/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GameMasterFireSupportMenu", "Fire Support Menu")
		ui.open()

///Input all the options for the ordnance panel. Only fires once, as the available ammo types shouldnt change. And if they do, something's very wrong
/datum/fire_support_menu/ui_static_data(mob/user)
	. = ..()
	var/list/data = list()

	data["ordnance_options"] = ORDNANCE_OPTIONS

	data["covenant_ordnance_options"] = COVENANT_ORDNANCE
	data["missile_ordnance_options"] = MISSILE_ORDNANCE
	data["orbital_ordnance_options"] = ORBITAL_ORDNANCE
	data["mortar_ordnance_options"] = MORTAR_ORDNANCE
	data["chemical_ordnance_options"] = CHEMICAL_ORDNANCE
	data["misc_ordnance_options"] = MISC_ORDNANCE

	return data

//Input all the dynamic data, the selected ordnance, and whether it's armed or not.
/datum/fire_support_menu/ui_data(mob/user)
	. = ..()
	var/list/data = list()

	data["selected_ordnance"] = selected_ordnance
	data["fire_support_click_intercept"] = fire_support_click_intercept

	return data

/datum/fire_support_menu/ui_act(action, params)
	. = ..()
	switch(action)
		if("toggle_click_fire_support")
			fire_support_click_intercept = !fire_support_click_intercept
			return
		if("set_selected_ordnance")
			selected_ordnance = params["ordnance"]
			return

/datum/fire_support_menu/ui_status(mob/user, datum/ui_state/state)
	return UI_INTERACTIVE

/datum/fire_support_menu/ui_close(mob/user)
	var/client/user_client = user.client
	if(user_client?.click_intercept == src)
		user_client.click_intercept = null

	fire_support_click_intercept = FALSE
	qdel(src)

///Handles firing logic whenever the mouse is clicked, and the fire_support_click_intercept var is TRUE
/datum/fire_support_menu/proc/InterceptClickOn(mob/user, params, atom/object)

	var/turf/target_turf = get_turf(object)
	var/datum/fire_support_custom/selected_mode
	if(fire_support_click_intercept)
		switch(selected_ordnance)
			//PREMADE ORDNANCE

			//DS missiles
			if("Banshee Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/banshee/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("CN-20 Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/banshee/nerve/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE


			if("Harpoon Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/harpoon/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Keeper Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/keeper/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Napalm Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/napalm/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Thermobaric Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/thermobaric/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Widowmaker Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/widowmaker/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			//Misc DS ammo
			if("Laser")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/laser_battery/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Minirocket")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/minirocket/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Incendiary Minirocket")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/minirocket/incendiary/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Sentry Drop")
				if(istype(target_turf, /turf/closed))
					to_chat(user, SPAN_WARNING("The selected drop site is a sheer wall!"))
					return FALSE
				else
					var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
					var/obj/structure/ship_ammo/sentry/ammo = new()

					handle_dropship_ordnance(target_turf, ammo)

					QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
					return TRUE

			if("25mm Multipurpose Strike")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/heavygun/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("25mm Armorpiercing Strike")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/heavygun/antitank/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			//Orbital Bombardments
			if("High Explosive OB")
				var/obj/structure/ob_ammo/warhead/explosive/ammo = new()

				handle_orbital_ordnance(target_turf, ammo)
				return TRUE

			if("Incendiary OB")
				var/obj/structure/ob_ammo/warhead/incendiary/ammo = new()

				handle_orbital_ordnance(target_turf, ammo)
				return TRUE

			if("Cluster OB")
				var/obj/structure/ob_ammo/warhead/cluster/ammo = new()

				handle_orbital_ordnance(target_turf, ammo)
				return TRUE

			if("Nerve Gas OB")
				var/obj/structure/ob_ammo/warhead/nerve/ammo  = new()
				handle_orbital_ordnance(target_turf, ammo)

				return TRUE

			//Mortar Shelling
			if("High Explosive Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/he/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings

			if("Incendiary Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/incendiary/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings

			if("Fragmentation Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/frag/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Nerve Gas Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/nerve/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Flare Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/flare/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Willy-Pete Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/phosphorus/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Smoke Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/smoke/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			//Covenant Ordnance
			if("Wraith Plasma")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_WRAITH_PLASMA]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Banshee Fuel Rod")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_BANSHEE_FUEL_ROD]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Banshee Strafe")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_BANSHEE_STRAFE]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Glassing Beam")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_GLASSING_BEAM]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			else
				to_chat(user, SPAN_ANNOUNCEMENT_HEADER_ADMIN("Invalid ordnance selection! If this appears, yell at a coder!"))
				return TRUE

///Handles the dropship swooping sound effect, and makes sure it doesnt play 20 times a second.
/datum/fire_support_menu/proc/handle_dropship_sound(target_turf)
	if(!sound_cooldown)
		playsound(target_turf, 'sound/weapons/dropship_sonic_boom.ogg', 100, 1, 60)
		sound_cooldown = TRUE
		addtimer(VARSET_CALLBACK(src, sound_cooldown, FALSE), 10 SECONDS)

///Handles the noises and actual detonation of dropship ammo. Mainly it doesnt play the warning sound for ammo of the ship_ammo/heavygun/ type.
/datum/fire_support_menu/proc/handle_dropship_ordnance(turf/target_turf, obj/structure/ship_ammo/ammo)
	addtimer(CALLBACK(src, PROC_REF(handle_dropship_sound), target_turf), 0.5 SECONDS)
	if(!istype(ammo, /obj/structure/ship_ammo/heavygun/))
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(playsound), target_turf, ammo.warning_sound, ammo.warning_sound_volume, 1, 15), 1.5 SECONDS)
	addtimer(CALLBACK(ammo, TYPE_PROC_REF(/obj/structure/ship_ammo, detonate_on), target_turf), 2.5 SECONDS)
	QDEL_IN(ammo, 5 SECONDS)

/datum/fire_support_menu/proc/handle_orbital_ordnance(turf/target_turf, obj/structure/ob_ammo/warhead/ammo)
	ammo.warhead_impact(target_turf)

//datum based fire support options
/datum/fire_support_custom
	///How far the fire support can land from the target turf
	var/scatter_range = 1
	///How many impacts per use
	var/impact_quantity = 1
	///How much delay between impacts
	var/impact_delay = 0.15 SECONDS
	///How much delay between visual effect of impacts
	var/visual_impact_delay = 0.15 SECONDS
	///Chat message when initiating fire support
	var/warning_chat_message = "SHELL"
	///Initiating sound effect
	var/initiate_sound = null
	///Delay between initiation and impact
	var/delay_to_impact = 4 SECONDS
	///visual when initiated
	var/initiate_visual = null
	///visual when impact starts
	var/start_visual = null
	///visual for every impact
	var/impact_start_visual = null
	///sound when impact starts
	var/start_sound = null
	///sound per impact
	var/impact_sound = null
	var/datum/cause_data/cause_data

///Initiates fire support proc chain
/datum/fire_support_custom/proc/initiate_fire_support(turf/target_turf)
	addtimer(CALLBACK(src, PROC_REF(start_fire_support), target_turf), delay_to_impact)

	if(initiate_visual)
		new initiate_visual(target_turf)
	if(initiate_sound)
		playsound(target_turf, initiate_sound, 100)

	addtimer(CALLBACK(src, PROC_REF(early_warning), target_turf), delay_to_impact/4)
	addtimer(CALLBACK(src, PROC_REF(late_warning), target_turf), delay_to_impact/2)

/datum/fire_support_custom/proc/early_warning(turf/target_turf)
	var/relative_dir
	for(var/mob/mob in range(15, target_turf))
		if(get_turf(mob) == target_turf)
			relative_dir = 0
		else
			relative_dir = Get_Compass_Dir(mob, target_turf)
		mob.show_message( \
			SPAN_DANGER("A [warning_chat_message] IS COMING DOWN [SPAN_UNDERLINE(relative_dir ? uppertext(("TO YOUR " + dir2text(relative_dir))) : uppertext("right above you"))]!"), SHOW_MESSAGE_VISIBLE, \
			SPAN_DANGER("YOU HEAR SOMETHING COMING DOWN [SPAN_UNDERLINE(relative_dir ? uppertext(("TO YOUR " + dir2text(relative_dir))) : uppertext("right above you"))]!"), SHOW_MESSAGE_AUDIBLE \
		)

/datum/fire_support_custom/proc/late_warning(turf/target_turf)
	var/relative_dir
	for(var/mob/mob in range(10, target_turf))
		if(get_turf(mob) == target_turf)
			relative_dir = 0
		else
			relative_dir = Get_Compass_Dir(mob, target_turf)
		mob.show_message( \
			SPAN_HIGHDANGER("A [warning_chat_message] IS ABOUT TO HIT [SPAN_UNDERLINE(relative_dir ? uppertext(("TO YOUR " + dir2text(relative_dir))) : uppertext("right above you"))]!"), SHOW_MESSAGE_VISIBLE, \
			SPAN_HIGHDANGER("YOU HEAR SOMETHING VERY CLOSE COMING DOWN [SPAN_UNDERLINE(relative_dir ? uppertext(("TO YOUR " + dir2text(relative_dir))) : uppertext("right above you"))]!"), SHOW_MESSAGE_AUDIBLE \
		)

///Actually begins the fire support attack
/datum/fire_support_custom/proc/start_fire_support(turf/target_turf)
	select_target(target_turf)

	if(start_visual)
		new start_visual(target_turf)
	if(start_sound)
		playsound(target_turf, start_sound, 100)

///Selects the final target turf(s) and calls impact procs
/datum/fire_support_custom/proc/select_target(turf/target_turf)
	var/list/turf_list = RANGE_TURFS(scatter_range, target_turf)
	for(var/i = 1 to impact_quantity)
		var/turf/impact_turf = pick(turf_list)
		addtimer(CALLBACK(src, PROC_REF(do_impact), impact_turf), impact_delay * i)
		addtimer(CALLBACK(src, PROC_REF(do_impact_effect), impact_turf), visual_impact_delay * i)

///The actual impact of the fire support
/datum/fire_support_custom/proc/do_impact(turf/target_turf)
	return

/datum/fire_support_custom/proc/do_impact_effect(turf/target_turf)
	if(impact_sound)
		playsound(target_turf, impact_sound, 100, 1)
	if(impact_start_visual)
		new impact_start_visual(target_turf)
	return

/datum/fire_support_custom/wraith_plasma
	scatter_range = 0
	initiate_sound = 'sound/weapons/halo/fire_support/wraith_plasma_whistle.ogg'
	delay_to_impact = 1.5 SECONDS
	impact_delay = 0.9 SECONDS
	start_sound = null
	start_visual = /obj/effect/temp_visual/plasma_incoming
	warning_chat_message = "PLASMA BLAST"
	var/radius = 3
	var/flame_level = BURN_TIME_INSTANT
	var/burn_level = BURN_LEVEL_TIER_7
	var/flameshape = FLAMESHAPE_IRREGULAR
	var/fire_type = FIRE_VARIANT_TYPE_X

/datum/fire_support_custom/wraith_plasma/do_impact(turf/target_turf)
	new /obj/effect/temp_visual/plasma_explosion(target_turf)
	cell_explosion(target_turf, 180, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, explosion_cause_data = cause_data)
	flame_radius(cause_data, radius, target_turf, flame_level, burn_level, flameshape, null, fire_type)
	return

/datum/fire_support_custom/banshee_fuel_rod
	scatter_range = 0
	start_visual = /obj/effect/temp_visual/banshee_flyby
	start_sound = 'sound/weapons/halo/fire_support/banshee_flyby.ogg'
	warning_chat_message = "BANSHEE"
	delay_to_impact = 2 SECONDS
	var/radius = 1
	var/flame_level = BURN_TIME_INSTANT
	var/burn_level = BURN_LEVEL_TIER_2
	var/flameshape = FLAMESHAPE_IRREGULAR
	var/fire_type = FIRE_VARIANT_TYPE_B

/datum/fire_support_custom/banshee_fuel_rod/do_impact(turf/target_turf)
	new /obj/effect/temp_visual/plasma_explosion/green(target_turf)
	cell_explosion(target_turf, 180, 80, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, explosion_cause_data = cause_data)
	flame_radius(cause_data, radius, target_turf, flame_level, burn_level, flameshape, null, fire_type)

/datum/fire_support_custom/banshee_strafe
	scatter_range = 2
	impact_quantity = 15
	delay_to_impact = 0.4 SECONDS
	impact_delay = 0.05 SECONDS
	start_visual = /obj/effect/temp_visual/banshee_flyby
	initiate_sound = 'sound/weapons/halo/fire_support/banshee_strafe.ogg'
	start_sound = 'sound/weapons/halo/fire_support/banshee_flyby.ogg'
	warning_chat_message = "BANSHEE"

/datum/fire_support_custom/banshee_strafe/do_impact(turf/target_turf)
	new /obj/effect/temp_visual/plasma_explosion/small(target_turf)
	for(var/target in target_turf)
		if(isliving(target))
			var/mob/living/living_target = target
			living_target.adjustFireLoss(60)
			living_target.adjust_fire_stacks(10)
			living_target.IgniteMob()
		else if(isVehicleMultitile(target))
			var/obj/vehicle/multitile/vic = target
			vic.take_damage_type(50, "plasma strafe")
			playsound(vic, 'sound/effects/meteorimpact.ogg', 50)
			vic.at_munition_interior_explosion_effect(shrapnel = FALSE, cause_data = create_cause_data("plasma strafe"))
			vic.interior_crash_effect()
		else if(isobj(target))
			var/obj/obj_target = target
			if(!(obj_target.indestructible))
				obj_target.update_health(50)
	target_turf.ex_act(EXPLOSION_THRESHOLD_VLOW)

/datum/fire_support_custom/glassing_beam
	scatter_range = 0
	initiate_sound = 'sound/weapons/halo/fire_support/cruiser_overhead.ogg'
	start_sound = 'sound/weapons/halo/fire_support/glassing_beam.ogg'
	delay_to_impact = 30 SECONDS
	impact_delay = 1.7 SECONDS
	warning_chat_message = "COVENANT CRUISER"
	var/clear_power = 1200
	var/clear_falloff = 400
	var/standard_power = 600
	var/standard_falloff = 30
	var/distance = 18
	var/fire_level = 70
	var/burn_level = 80
	var/fire_color = LIGHT_COLOR_RED
	var/fire_type = "white"

/datum/fire_support_custom/glassing_beam/do_impact(turf/target_turf)
	new /obj/effect/temp_visual/glassing_beam(target_turf)
	var/datum/cause_data/cause_data = create_cause_data("Glassing Beam")
	cell_explosion(target_turf, clear_power, clear_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data) //break shit around
	cell_explosion(target_turf, standard_power, standard_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data)
	handle_shake(target_turf, 15, 3, 3)
	fire_spread(target_turf, cause_data, distance, fire_level, burn_level, fire_color, fire_type, TURF_PROTECTION_OB)
	return

/datum/fire_support_custom/proc/handle_shake(turf/epicenter, max_shake_factor, shake_frequency, max_knockdown_time)
	var/radius_size = 30

	for(var/mob/living/user in urange(radius_size, epicenter))

		var/distance = get_accurate_dist(get_turf(user), epicenter)
		var/distance_percent = ((radius_size - distance) / radius_size)
		var/total_shake_factor = abs(max_shake_factor * distance_percent)

		// it's of type cluster.
		if(!max_knockdown_time)
			shake_camera(user, 0.5, total_shake_factor, shake_frequency)
			continue

		shake_camera(user, 3, total_shake_factor, shake_frequency)
		user.KnockDown(rand(max_knockdown_time * distance_percent, (max_knockdown_time * distance_percent + 1)))

		if(HAS_TRAIT(user, TRAIT_FLOORED))
			continue
		to_chat(user, SPAN_WARNING("You are thrown off balance and fall to the ground!"))

#undef ORDNANCE_OPTIONS
#undef COVENANT_ORDNANCE
#undef ORBITAL_ORDNANCE
#undef MORTAR_ORDNANCE
#undef MISC_ORDNANCE
#undef CHEMICAL_ORDNANCE
#undef FIRE_SUPPORT_CLICK_INTERCEPT_ACTION
