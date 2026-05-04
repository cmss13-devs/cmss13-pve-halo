#define FIRE_SUPPORT_CLICK_INTERCEPT_ACTION "fire_support_click_intercept_action"

//Various ordnance selections
#define ORDNANCE_OPTIONS list("Banshee Missile", "CN-20 Missile", "Harpoon Missile", "Keeper Missile", "Napalm Missile", "Thermobaric Missile", "Widowmaker Missile", "Laser", "Minirocket", "Incendiary Minirocket",  "Sentry Drop", "25mm Multipurpose Strike", "25mm Armorpiercing Strike", "High Explosive", "Incendiary", "Cluster", "High Explosive", "Nerve Gas OB", "Incendiary", "Fragmentation", "Flare",  "Nerve Gas Mortar", "Willy-Pete Mortar", "Smoke Mortar", "Wraith Plasma", "Banshee Fuel Rod", "Banshee Strafe", "Glassing Beam", "Glassing Fast", "Glassing Weak Fast", "Glassing Weak Instant", "HE", "HE - UPP", "HE - RMC", "Frag", "Incendiary", "Molotov", "Incendiary - RMC", "Smoke - White", "Smoke - Green", "Smoke - Red", "Smoke - UPP", "WP", "WP - UPP", "Ball-Breakers", "Nerve Gas", "LSD", "Tear Gas", "Metal Foam", "Flare", "Flare - UPP", "Flare - Signal")
#define COVENANT_ORDNANCE list("Wraith Plasma", "Banshee Fuel Rod", "Banshee Strafe", "Banshee Flyby", "Seraph Strafe", "Seraph Fuel Rod", "Seraph Flyby")
#define UNSC_ORDNANCE list("Wombat Flyby", "Wombat GAU", "Wombat Missile", "Wombat Inc. Missile","C712 Flyby", "C712 Coilgun", "C712 Missile", "C712 Cluster", "C709 Flyby", "C709 Cluster Bomb", "C709 Heavy Missile", "C709 Inc. Bomb")
#define DROPSHIP_HOVERING list("Phantom", "Phantom (Unarmed)", "Spirit", "Spirit (Unarmed)", "Pelican", "Pelican (Unarmed)", "Pelican - Rocket Pods",)
#define NAVAL_ORDNANCE list("MAC", "MAC - Atmospheric", "Coilguns")
#define GLASSING_BEAMS list("Glassing Beam", "Glassing Fast", "Glassing Weak Fast", "Glassing Weak Instant")
#define MISSILE_ORDNANCE list("Banshee Missile", "Harpoon Missile", "Keeper Missile", "Napalm Missile", "Thermobaric Missile", "Widowmaker Missile")
#define ORBITAL_ORDNANCE list("High Explosive OB", "Incendiary OB", "Cluster OB")
#define MORTAR_ORDNANCE list("High Explosive Shell", "Incendiary Shell", "Fragmentation Shell", "Flare Shell", "Willy-Pete Shell", "Smoke Shell")
#define CHEMICAL_ORDNANCE list("CN-20 Missile", "Nerve Gas OB", "Nerve Gas Shell")
#define MISC_ORDNANCE list("Laser", "Minirocket", "Incendiary Minirocket",  "Sentry Drop", "25mm Multipurpose Strike", "25mm Armorpiercing Strike")
#define THROWABLES_ORDNANCE list("HE", "HE - UPP", "HE - RMC", "Frag", "Incendiary", "Molotov", "Incendiary - RMC", "Smoke - White", "Smoke - Green", "Smoke - Red", "Smoke - UPP", "WP", "WP - UPP", "Ball-Breakers", "Nerve Gas", "LSD", "Tear Gas", "Metal Foam", "Flare", "Flare - UPP", "Flare - Signal")
#define WEAPON_RESUPPLY list("MA5C", "MA5B", "BR55", "M7", "M7/S", "M90 CAWS", "SRS99-AM", "M41 SPNKr")
#define AMMO_RESUPPLY list("MA5C (Ammo)", "MA5B (Ammo)", "BR55 (Ammo)", "MA5C Shredder (Ammo)", "MA5B Shredder (Ammo)", "BR55 (Ammo)", "BR55 Extended (Ammo)", "M7 (Ammo)", "M6C (Ammo)", "M6C SOCOM (Ammo)", "M6G (Ammo)", "M6D (Ammo)", "Buckshot 8G (Ammo)", "M41 SPNKr (Ammo)", "SRS99-AM (Ammo)", "M9 (Grenades)", "40mm (Grenades)", "Medical Supplies")

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
	data["unsc_ordnance_options"] = UNSC_ORDNANCE
	data["naval_ordnance_options"] = NAVAL_ORDNANCE
	data["dropship_options"] = DROPSHIP_HOVERING
	data["glassing_beam_options"] = GLASSING_BEAMS
	/* dont need this, its replaced with halo versions
	data["missile_ordnance_options"] = MISSILE_ORDNANCE
	data["orbital_ordnance_options"] = ORBITAL_ORDNANCE
	*/
	data["mortar_ordnance_options"] = MORTAR_ORDNANCE
	data["chemical_ordnance_options"] = CHEMICAL_ORDNANCE
	data["misc_ordnance_options"] = MISC_ORDNANCE
	data["throwables_ordnance_options"] = THROWABLES_ORDNANCE
	data["weapon_resupply_options"] = WEAPON_RESUPPLY
	data["ammo_resupply_options"] = AMMO_RESUPPLY

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
	var/datum/fire_support/custom/selected_mode
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

			//Throwables
			if("HE")
				var/obj/item/explosive/grenade/high_explosive/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("HE - UPP")
				var/obj/item/explosive/grenade/high_explosive/upp/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("HE - RMC")
				var/obj/item/explosive/grenade/high_explosive/rmc/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Frag")
				var/obj/item/explosive/grenade/high_explosive/frag/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Incendiary")
				var/obj/item/explosive/grenade/incendiary/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Molotov")
				var/obj/item/explosive/grenade/incendiary/molotov/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Incendiary - RMC")
				var/obj/item/explosive/grenade/incendiary/rmc/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Smoke - White")
				var/obj/item/explosive/grenade/smokebomb/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Smoke - Green")
				var/obj/item/explosive/grenade/smokebomb/green/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Smoke - Red")
				var/obj/item/explosive/grenade/smokebomb/red/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Smoke - UPP")
				var/obj/item/explosive/grenade/smokebomb/upp/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("WP")
				var/obj/item/explosive/grenade/phosphorus/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("WP - UPP")
				var/obj/item/explosive/grenade/phosphorus/upp/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Ball-Breakers")
				var/obj/item/explosive/grenade/sebb/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Nerve Gas")
				var/obj/item/explosive/grenade/nerve_gas/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("LSD")
				var/obj/item/explosive/grenade/LSD/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Tear Gas")
				var/obj/item/explosive/grenade/tear/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Metal Foam")
				var/obj/item/explosive/grenade/metal_foam/ammo = new (target_turf)
				ammo.activate()

				return TRUE

			if("Flare")
				var/obj/item/device/flashlight/flare/ammo = new (target_turf)
				ammo.turn_on()

				return TRUE

			if("Flare - UPP")
				var/obj/item/device/flashlight/flare/upp/ammo = new (target_turf)
				ammo.turn_on()

				return TRUE

			if("Flare - Signal")
				var/obj/item/device/flashlight/flare/signal/ammo = new (target_turf)
				ammo.turn_on()

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

			if("Banshee Flyby")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_BANSHEE_FLYBY]
				selected_mode.initiate_fire_support(target_turf)

				return TRUE

			if("Seraph Fuel Rod")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_SERAPH_FUEL_ROD]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Seraph Strafe")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_SERAPH_STRAFE]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Seraph Flyby")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_SERAPH_FLYBY]
				selected_mode.initiate_fire_support(target_turf)

				return TRUE

			if("Glassing Beam")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_GLASSING_BEAM]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE
			if("Glassing Fast")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_GLASSING_BEAM_FAST]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Glassing Weak Fast")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_GLASSING_BEAM_WEAK]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Glassing Weak Instant")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_GLASSING_BEAM_WEAK_INSTANT]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			// Wombat
			if("Wombat GAU")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_WOMBAT_GAU]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Wombat Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_WOMBAT_MISSILE]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Wombat Inc. Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_WOMBAT_INCENDIARY]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Wombat Flyby")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_WOMBAT_FLYBY]
				selected_mode.initiate_fire_support(target_turf)

				return TRUE


			//C712
			if("C712 Coilgun")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_C712_COILGUN]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("C712 Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_C712_MISSILE]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("C712 Cluster")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_C712_CLUSTER]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("C712 Flyby")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_C712_FLYBY]
				selected_mode.initiate_fire_support(target_turf)

				return TRUE

			//C709

			if("C709 Cluster Bomb")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_C709_CLUSTER]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("C709 Heavy Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_C709_MISSILE]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("C709 Inc. Bomb")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_C709_INCENDIARY]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("C709 Flyby")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_C709_FLYBY]
				selected_mode.initiate_fire_support(target_turf)

				return TRUE

			// Naval Ordnance

			if("MAC")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_MAC]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("MAC - Atmospheric")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_MAC_ATMOS]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Coilguns")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_COILGUNS]
				selected_mode.initiate_fire_support(target_turf)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			// Dropship hovering

			if("Pelican (Unarmed)")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_PELICAN_HOVER]
				if(user.dir)
					selected_mode.initiate_fire_support(target_turf, user.dir)
				else
					selected_mode.initiate_fire_support(target_turf, NORTH)
				return TRUE
			if("Pelican")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_PELICAN_HOVER_LIGHT]
				if(user.dir)
					selected_mode.initiate_fire_support(target_turf, user.dir)
				else
					selected_mode.initiate_fire_support(target_turf, NORTH)
				return TRUE
			if("Pelican - Rocket Pods")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_PELICAN_HOVER_ARMED]
				if(user.dir)
					selected_mode.initiate_fire_support(target_turf, user.dir)
				else
					selected_mode.initiate_fire_support(target_turf, NORTH)
				return TRUE
			if("Phantom (Unarmed)")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_PHANTOM_HOVER]
				if(user.dir)
					selected_mode.initiate_fire_support(target_turf, user.dir)
				else
					selected_mode.initiate_fire_support(target_turf, NORTH)
				return TRUE
			if("Phantom")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_PHANTOM_HOVER_ARMED]
				if(user.dir)
					selected_mode.initiate_fire_support(target_turf, user.dir)
				else
					selected_mode.initiate_fire_support(target_turf, NORTH)
				return TRUE
			if("Spirit (Unarmed)")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_SPIRIT_HOVER]
				if(user.dir)
					selected_mode.initiate_fire_support(target_turf, user.dir)
				else
					selected_mode.initiate_fire_support(target_turf, NORTH)
				return TRUE
			if("Spirit")
				selected_mode = GLOB.fire_support_types[FIRESUPPORT_TYPE_SPIRIT_HOVER_ARMED]
				if(user.dir)
					selected_mode.initiate_fire_support(target_turf, user.dir)
				else
					selected_mode.initiate_fire_support(target_turf, NORTH)
				return TRUE

			// ================
			// resupply
			// ================

			// weapons
			if("MA5C")
				new /obj/structure/closet/ordnance_canister/dropping/weapon/ma5c(target_turf)
				return TRUE
			if("MA5B")
				new /obj/structure/closet/ordnance_canister/dropping/weapon/ma5b(target_turf)
				return TRUE
			if("BR55")
				new /obj/structure/closet/ordnance_canister/dropping/weapon/br55(target_turf)
				return TRUE
			if("M7")
				new /obj/structure/closet/ordnance_canister/dropping/weapon/m7(target_turf)
				return TRUE
			if("M7/S")
				new /obj/structure/closet/ordnance_canister/dropping/weapon/m7_socom(target_turf)
				return TRUE
			if("M90 CAWS")
				new /obj/structure/closet/ordnance_canister/dropping/weapon/m90_shotgun(target_turf)
				return TRUE
			if("SRS99-AM")
				new /obj/structure/closet/ordnance_canister/dropping/weapon/srs99_sniper(target_turf)
				return TRUE
			if("M41 SPNKr")
				new /obj/structure/closet/ordnance_canister/dropping/weapon/m41_spnkr(target_turf)
				return TRUE

			// ammo
			if("MA5C (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/ma5c(target_turf)
				return TRUE
			if("MA5C Shredder (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/ma5c_shredder(target_turf)
				return TRUE
			if("MA5B (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/ma5b(target_turf)
				return TRUE
			if("MA5B Shredder (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/ma5b_shredder(target_turf)
				return TRUE
			if("BR55 (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/br55(target_turf)
				return TRUE
			if("BR55 Extended (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/br55_extended(target_turf)
				return TRUE
			if("M7 (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/m7(target_turf)
				return TRUE
			if("M6C (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/m6c(target_turf)
				return TRUE
			if("M6C SOCOM (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/m6c_socom(target_turf)
				return TRUE
			if("M6G (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/m6g(target_turf)
				return TRUE
			if("M6D (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/m6d(target_turf)
				return TRUE
			if("Buckshot 8G (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/shotgun(target_turf)
				return TRUE
			if("M41 SPNKr (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/spnkr(target_turf)
				return TRUE
			if("SRS99-AM (Ammo)")
				new /obj/structure/closet/ordnance_canister/dropping/ammo/sniper(target_turf)
				return TRUE

			// misc
			if("M9 (Grenades)")
				new /obj/structure/closet/ordnance_canister/dropping/misc/m9_grenades(target_turf)
				return TRUE
			if("40mm (Grenades)")
				new /obj/structure/closet/ordnance_canister/dropping/misc/launchable_grenades(target_turf)
				return TRUE
			if("Medical Supplies")
				new /obj/structure/closet/ordnance_canister/dropping/misc/medical_resupply(target_turf)
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
/datum/fire_support_menu/proc/handle_dropship_ordnance(turf/target_turf, obj/structure/ship_ammo/ammo, sound = TRUE)
	if(sound)
		addtimer(CALLBACK(src, PROC_REF(handle_dropship_sound), target_turf), 0.5 SECONDS)
	if(!istype(ammo, /obj/structure/ship_ammo/heavygun/))
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(playsound), target_turf, ammo.warning_sound, ammo.warning_sound_volume, 1, 15), 1.5 SECONDS)
	addtimer(CALLBACK(ammo, TYPE_PROC_REF(/obj/structure/ship_ammo, detonate_on), target_turf), 2.5 SECONDS)
	QDEL_IN(ammo, 5 SECONDS)

/datum/fire_support_menu/proc/handle_orbital_ordnance(turf/target_turf, obj/structure/ob_ammo/warhead/ammo)
	ammo.warhead_impact(target_turf)

//datum based fire support options
/datum/fire_support/custom
	///How far the fire support can land from the target turf
	scatter_range = 1
	///How many impacts per use
	impact_quantity = 1
	///How much delay between impacts
	impact_delay = 0.15 SECONDS
	///How much delay between visual effect of impacts
	visual_impact_delay = 0.15 SECONDS
	///Chat message when initiating fire support
	var/warning_chat_message = "SHELL"
	///Verb used for the warning message
	var/warning_chat_verb = "HIT"
	///Max range of warning message
	var/warning_range = 15
	///Initiating sound effect
	initiate_sound = null
	///Delay between initiation and impact
	delay_to_impact = 4 SECONDS
	///visual when initiated
	initiate_visual = null
	///visual when impact starts
	start_visual = null
	///visual for every impact
	impact_start_visual = null
	///sound when impact starts
	start_sound = null
	///sound per impact
	impact_sound = null
	///sound ranges
	var/sound_ranges = null
	var/datum/cause_data/cause_data
	var/shadow_cooldown
	var/has_shadow

///Initiates fire support proc chain
/datum/fire_support/custom/initiate_fire_support(turf/target_turf, additional_variable)
	addtimer(CALLBACK(src, PROC_REF(start_fire_support), target_turf, additional_variable), delay_to_impact)

	if(initiate_visual)
		new initiate_visual(target_turf)
	if(initiate_sound)
		playsound(target_turf, initiate_sound, 100, sound_range = sound_ranges)

	addtimer(CALLBACK(src, PROC_REF(early_warning), target_turf), delay_to_impact/4)
	addtimer(CALLBACK(src, PROC_REF(late_warning), target_turf), delay_to_impact/2)

/datum/fire_support/custom/proc/early_warning(turf/target_turf)
	var/relative_dir
	for(var/mob/mob in range(warning_range, target_turf))
		if(get_turf(mob) == target_turf)
			relative_dir = 0
		else
			relative_dir = Get_Compass_Dir(mob, target_turf)
		mob.show_message( \
			SPAN_DANGER("A [warning_chat_message] IS COMING DOWN [SPAN_UNDERLINE(relative_dir ? uppertext(("TO YOUR " + dir2text(relative_dir))) : uppertext("right above you"))]!"), SHOW_MESSAGE_VISIBLE, \
			SPAN_DANGER("YOU HEAR SOMETHING COMING DOWN [SPAN_UNDERLINE(relative_dir ? uppertext(("TO YOUR " + dir2text(relative_dir))) : uppertext("right above you"))]!"), SHOW_MESSAGE_AUDIBLE \
		)

/datum/fire_support/custom/proc/late_warning(turf/target_turf)
	var/relative_dir
	for(var/mob/mob in range(warning_range/1.5, target_turf))
		if(get_turf(mob) == target_turf)
			relative_dir = 0
		else
			relative_dir = Get_Compass_Dir(mob, target_turf)
		mob.show_message( \
			SPAN_HIGHDANGER("A [warning_chat_message] IS ABOUT TO [warning_chat_verb] [SPAN_UNDERLINE(relative_dir ? uppertext(("TO YOUR " + dir2text(relative_dir))) : uppertext("right above you"))]!"), SHOW_MESSAGE_VISIBLE, \
			SPAN_HIGHDANGER("YOU HEAR SOMETHING VERY CLOSE COMING DOWN [SPAN_UNDERLINE(relative_dir ? uppertext(("TO YOUR " + dir2text(relative_dir))) : uppertext("right above you"))]!"), SHOW_MESSAGE_AUDIBLE \
		)

///Actually begins the fire support attack
/datum/fire_support/custom/start_fire_support(turf/target_turf, additional_variable)
	select_target(target_turf, additional_variable)
	if(has_shadow)
		if(!shadow_cooldown)
			shadow_cooldown = addtimer(VARSET_CALLBACK(src, shadow_cooldown, null), 4 SECONDS, TIMER_STOPPABLE)
			new start_visual(target_turf)
	else
		if(start_visual)
			new start_visual(target_turf)
	if(start_sound)
		playsound(target_turf, start_sound, 100, sound_range = sound_ranges)

///Selects the final target turf(s) and calls impact procs
/datum/fire_support/custom/select_target(turf/target_turf, additional_variable)
	var/list/turf_list = RANGE_TURFS(scatter_range, target_turf)
	for(var/i = 1 to impact_quantity)
		var/turf/impact_turf = pick(turf_list)
		addtimer(CALLBACK(src, PROC_REF(do_impact), impact_turf, additional_variable), impact_delay * i)
		addtimer(CALLBACK(src, PROC_REF(do_impact_effect), impact_turf), visual_impact_delay * i)

///The actual impact of the fire support
/datum/fire_support/custom/do_impact(turf/target_turf, additional_variable)
	return

/datum/fire_support/custom/do_impact_effect(turf/target_turf)
	if(impact_sound)
		playsound(target_turf, impact_sound, 100, 1, sound_ranges)
	if(impact_start_visual)
		new impact_start_visual(target_turf)
	return

/datum/fire_support/custom/wraith_plasma
	name = "wraith plasma"
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

/datum/fire_support/custom/wraith_plasma/do_impact(turf/target_turf)
	cause_data = create_cause_data(src.name)
	new /obj/effect/temp_visual/plasma_explosion(target_turf)
	cell_explosion(target_turf, 180, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, explosion_cause_data = cause_data)
	flame_radius(cause_data, radius, target_turf, flame_level, burn_level, flameshape, null, fire_type)
	return

/datum/fire_support/custom/banshee_fuel_rod
	name = "banshee fuel rod"
	scatter_range = 0
	start_visual = /obj/effect/temp_visual/flyby/banshee_flyby
	start_sound = 'sound/weapons/halo/fire_support/banshee_flyby.ogg'
	warning_chat_message = "BANSHEE"
	delay_to_impact = 2 SECONDS
	has_shadow = TRUE
	var/radius = 1
	var/flame_level = BURN_TIME_INSTANT
	var/burn_level = BURN_LEVEL_TIER_2
	var/flameshape = FLAMESHAPE_IRREGULAR
	var/fire_type = FIRE_VARIANT_TYPE_B

/datum/fire_support/custom/banshee_fuel_rod/do_impact(turf/target_turf)
	var/datum/cause_data/cause_data = create_cause_data("fuel rod")
	new /obj/effect/temp_visual/plasma_explosion/green(target_turf)
	cell_explosion(target_turf, 180, 80, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, explosion_cause_data = cause_data)
	flame_radius(cause_data, radius, target_turf, flame_level, burn_level, flameshape, null, fire_type)

/datum/fire_support/custom/banshee_fuel_rod/seraph
	name = "seraph fuel rod"
	scatter_range = 2
	start_visual = /obj/effect/temp_visual/flyby/seraph_flyby
	start_sound = 'sound/weapons/halo/fire_support/seraph_flyby.ogg'
	warning_chat_message = "SERAPH"
	delay_to_impact = 2 SECONDS
	has_shadow = TRUE
	scatter_range = 2
	impact_quantity = 2
	radius = 2

/datum/fire_support/custom/banshee_strafe
	name = "banshee strafe"
	scatter_range = 2
	impact_quantity = 15
	delay_to_impact = 0.4 SECONDS
	impact_delay = 0.05 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/banshee_flyby
	has_shadow = TRUE
	initiate_sound = 'sound/weapons/halo/fire_support/banshee_strafe.ogg'
	start_sound = 'sound/weapons/halo/fire_support/banshee_flyby.ogg'
	warning_chat_message = "BANSHEE"

/datum/fire_support/custom/banshee_strafe/seraph
	name = "seraph strafe"
	impact_quantity = 45
	impact_delay = 0.02 SECONDS
	initiate_sound = 'sound/weapons/halo/fire_support/seraph_strafe.ogg'
	start_sound = 'sound/weapons/halo/fire_support/seraph_flyby.ogg'
	start_visual = /obj/effect/temp_visual/flyby/seraph_flyby
	warning_chat_message = "SERAPH"
	scatter_range = 4

/datum/fire_support/custom/banshee_strafe/do_impact(turf/target_turf)
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

/datum/fire_support/custom/banshee_flyby
	name = "banshee flyby"
	delay_to_impact = 0.4 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/banshee_flyby
	has_shadow = FALSE // this is so you can have several in formation if you want!
	initiate_sound = null
	start_sound = 'sound/weapons/halo/fire_support/banshee_flyby.ogg'
	warning_chat_message = "BANSHEE"
	warning_chat_verb = "FLY OVER"

/datum/fire_support/custom/banshee_flyby/do_impact(turf/target_turf)
	return

/datum/fire_support/custom/seraph_flyby
	name = "seraph flyby"
	delay_to_impact = 0.4 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/seraph_flyby
	has_shadow = FALSE // this is so you can have several in formation if you want!
	initiate_sound = null
	start_sound = 'sound/weapons/halo/fire_support/banshee_flyby.ogg'
	warning_chat_message = "SERAPH"
	warning_chat_verb = "FLY OVER"

/datum/fire_support/custom/seraph_flyby/do_impact(turf/target_turf)
	return

/datum/fire_support/custom/glassing_beam
	name = "glassing beam"

	scatter_range = 0
	initiate_sound = 'sound/weapons/halo/fire_support/cruiser_overhead.ogg'
	start_sound = 'sound/weapons/halo/fire_support/glassing_beam.ogg'
	delay_to_impact = 30 SECONDS
	impact_delay = 1.7 SECONDS
	warning_chat_message = "COVENANT SHIP"
	warning_range = 30
	sound_ranges = 85
	var/clear_power = 1200
	var/clear_falloff = 400
	var/standard_power = 600
	var/standard_falloff = 30
	var/distance = 18
	var/fire_level = 70
	var/burn_level = 80
	var/fire_color = LIGHT_COLOR_RED
	var/fire_type = "white"

/datum/fire_support/custom/glassing_beam/fast
	initiate_sound = 'sound/weapons/halo/fire_support/cruiser_overhead_fast.ogg'
	delay_to_impact = 4 SECONDS

/datum/fire_support/custom/glassing_beam/weak
	initiate_sound = 'sound/weapons/halo/fire_support/cruiser_overhead_fast.ogg'
	delay_to_impact = 4 SECONDS
	clear_power = 300
	clear_falloff = 100
	standard_power = 200
	standard_falloff = 15
	distance = 7

/datum/fire_support/custom/glassing_beam/weak/instant
	initiate_sound = null
	delay_to_impact = 1 SECONDS

/datum/fire_support/custom/glassing_beam/do_impact(turf/target_turf)
	new /obj/effect/temp_visual/glassing_beam(target_turf)
	var/datum/cause_data/cause_data = create_cause_data("glassing beam")
	cell_explosion(target_turf, clear_power, clear_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data) //break shit around
	cell_explosion(target_turf, standard_power, standard_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data)
	handle_shake(target_turf, 15, 3, 3)
	fire_spread(target_turf, cause_data, distance, fire_level, burn_level, fire_color, fire_type, TURF_PROTECTION_OB)
	return

/datum/fire_support/custom/proc/handle_shake(turf/epicenter, max_shake_factor, shake_frequency, max_knockdown_time)
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

// ============================ UNSC ORDNANCE ============================ \\

// ================
// wombat
// ================

/datum/fire_support/custom/wombat_gau
	name = "F-99 Wombat GAU strafe"
	scatter_range = 3
	impact_quantity = 4
	delay_to_impact = 0.4 SECONDS
	impact_delay = 0.05 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/wombat_flyby
	has_shadow = TRUE
	initiate_sound = 'sound/weapons/halo/fire_support/wombat_flyover.ogg'
	start_sound = 'sound/weapons/fire_support/casplane_flyby.ogg'
	warning_chat_message = "WOMBAT"

/datum/fire_support/custom/wombat_gau/do_impact(turf/target_turf)
	var/revdir = REVERSE_DIR(NORTH)
	for(var/i=0 to 2)
		target_turf = get_step(target_turf, revdir)
	var/list/strafelist = list(target_turf)
	strafelist += get_step(target_turf, turn(NORTH, 90))
	strafelist += get_step(target_turf, turn(NORTH, -90)) //Build this list 3 turfs at a time for strafe_turfs
	for(var/b=0 to 6)
		target_turf = get_step(target_turf, NORTH)
		strafelist += target_turf
		strafelist += get_step(target_turf, turn(NORTH, 90))
		strafelist += get_step(target_turf, turn(NORTH, -90))

	if(!length(strafelist))
		return

	strafe_turfs(strafelist)

/datum/fire_support/custom/wombat_gau/proc/strafe_turfs(list/strafelist)
	var/turf/strafed
	playsound(strafelist[1], 'sound/effects/gauimpact.ogg', 10, 1, 20, falloff = 3)
	for(var/i=1 to 3)
		strafed = strafelist[1]
		strafelist -= strafed
		strafed.ex_act(EXPLOSION_THRESHOLD_HIGH)
		for(var/target in strafed)
			if(isliving(target))
				var/mob/living/living_target = target
				living_target.apply_damage(250, BRUTE)
			else if(isVehicleMultitile(target))
				var/obj/vehicle/multitile/vic = target
				vic.ex_act(800)
				playsound(vic, 'sound/effects/meteorimpact.ogg', 50)
				vic.at_munition_interior_explosion_effect(cause_data = create_cause_data("GAU strike"))
				vic.interior_crash_effect()
			else if(isobj(target))
				var/obj/obj_target = target
				if(!(obj_target.indestructible))
					obj_target.update_health(250)
		new /obj/effect/temp_visual/heavyimpact_cas(strafed)

	if(length(strafelist))
		addtimer(CALLBACK(src, PROC_REF(strafe_turfs), strafelist), 0.2 SECONDS)

/datum/fire_support/custom/wombat_missile
	name = "F-99 Wombat ASGM-4 missile run"
	scatter_range = 5
	impact_quantity = 6
	delay_to_impact = 0.4 SECONDS
	impact_delay = 0.3 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/wombat_flyby
	has_shadow = TRUE
	initiate_sound = 'sound/weapons/halo/fire_support/wombat_flyover.ogg'
	start_sound = 'sound/weapons/halo/fire_support/wombat_missile.ogg'
	warning_chat_message = "WOMBAT"

/datum/fire_support/custom/wombat_missile/do_impact(turf/target_turf)
	cell_explosion(target_turf, 180, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("F-99 Wombat ASGM-4 missile run"))

/datum/fire_support/custom/wombat_incendiary_missile
	name = "F-99 Wombat ASGIM-5 missile run"
	scatter_range = 5
	impact_quantity = 10
	delay_to_impact = 0.4 SECONDS
	impact_delay = 0.2 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/wombat_flyby
	has_shadow = TRUE
	initiate_sound = 'sound/weapons/halo/fire_support/wombat_flyover.ogg'
	start_sound = 'sound/weapons/halo/fire_support/wombat_missile.ogg'
	warning_chat_message = "WOMBAT"

/datum/fire_support/custom/wombat_incendiary_missile/do_impact(turf/target_turf)
	cell_explosion(target_turf, 100, 50, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("F-99 Wombat ASGIM-5 missile run"))
	fire_spread(target_turf, create_cause_data("Incendiary rockets"), 3, 25, 20, "#EE6515")

/datum/fire_support/custom/wombat_flyby
	name = "F-99 Wombat Flyby"
	delay_to_impact = 0.4 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/wombat_flyby
	has_shadow = FALSE // this is so you can have several in formation if you want!
	initiate_sound = 'sound/weapons/halo/fire_support/wombat_flyover.ogg'
	warning_chat_message = "WOMBAT"
	warning_chat_verb = "FLY OVER"

/datum/fire_support/custom/wombat_flyby/do_impact(turf/target_turf)
	return

// ================
// c712
// ================

/datum/fire_support/custom/c712_coilgun
	name = "C712 Longsword Coilgun"
	scatter_range = 5
	impact_quantity = 16
	delay_to_impact = 0.4 SECONDS
	impact_delay = 0.1 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/c712_longsword_flyby
	has_shadow = TRUE
	initiate_sound = 'sound/weapons/halo/fire_support/c712_flyover.ogg'
	start_sound = 'sound/weapons/halo/fire_support/c712_coilgun.ogg'
	warning_chat_message = "C712 LONGSWORD"

/datum/fire_support/custom/c712_coilgun/do_impact(turf/target_turf)
	cell_explosion(target_turf, 80, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("C712 Longsword Coilgun"))

/datum/fire_support/custom/c712_cluster
	name = "C712 Cluster Bomb"
	scatter_range = 10
	impact_quantity = 20
	delay_to_impact = 0.5 SECONDS
	impact_delay = 0.1 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/c712_longsword_flyby
	has_shadow = TRUE
	initiate_sound = 'sound/weapons/halo/fire_support/c712_flyover.ogg'
	start_sound = null
	warning_chat_message = "C712 LONGSWORD"

/datum/fire_support/custom/c712_cluster/do_impact(turf/target_turf)
	cell_explosion(target_turf, 90, 90, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("C712 Cluster Bomb"))
	addtimer(CALLBACK(src, PROC_REF(shrapnelboom), target_turf), 0.2 SECONDS)

/datum/fire_support/custom/c712_cluster/proc/shrapnelboom(turf/target_turf)
	create_shrapnel(target_turf, rand(8, 12), , , /datum/ammo/bullet/shrapnel/heavy, create_cause_data("C712 Cluster Bomb"))

/datum/fire_support/custom/c712_missile
	name = "C712 Missile Strike"
	scatter_range = 3
	impact_quantity = 2
	delay_to_impact = 0.5 SECONDS
	impact_delay = 1 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/c712_longsword_flyby
	has_shadow = TRUE
	initiate_sound = 'sound/weapons/halo/fire_support/c712_flyover.ogg'
	start_sound = 'sound/weapons/halo/fire_support/c712_missile.ogg'
	warning_chat_message = "C712 LONGSWORD"

/datum/fire_support/custom/c712_missile/do_impact(turf/target_turf)
	cell_explosion(target_turf, 400, 75, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("C712 Missile Strike"))

/datum/fire_support/custom/c712_flyby
	name = "C712 Longsword Flyby"
	start_visual = /obj/effect/temp_visual/flyby/c712_longsword_flyby
	has_shadow = FALSE // this is so you can have several in formation if you want!
	initiate_sound = 'sound/weapons/halo/fire_support/c712_flyover.ogg'
	warning_chat_message = "C712 LONGSWORD"
	warning_chat_verb = "FLY OVER"

/datum/fire_support/custom/c712_flyby/do_impact(turf/target_turf)
	return

// ================
// c709
// ================

/datum/fire_support/custom/c709_missile
	name = "C709 Missile Strike"
	scatter_range = 0
	impact_quantity = 1
	delay_to_impact = 25 SECONDS
	impact_delay = 1 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/c709_longsword_flyby
	has_shadow = TRUE
	initiate_sound = 'sound/weapons/halo/fire_support/c709_flyover.ogg'
	start_sound = 'sound/weapons/halo/fire_support/c712_missile.ogg'
	warning_chat_message = "C709 LONGSWORD"
	warning_range = 35

/datum/fire_support/custom/c709_missile/do_impact(turf/target_turf)
	var/obj/structure/ob_ammo/warhead/explosive/ammo = new()
	ammo.warhead_impact(target_turf)

/datum/fire_support/custom/c709_cluster
	name = "C709 Cluster Bomb"
	scatter_range = 0
	impact_quantity = 1
	delay_to_impact = 25 SECONDS
	impact_delay = 1 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/c709_longsword_flyby
	has_shadow = TRUE
	initiate_sound = 'sound/weapons/halo/fire_support/c709_flyover.ogg'
	start_sound = 'sound/weapons/halo/fire_support/c712_missile.ogg'
	warning_chat_message = "C709 LONGSWORD"
	warning_range = 35

/datum/fire_support/custom/c709_cluster/do_impact(turf/target_turf)
	var/obj/structure/ob_ammo/warhead/cluster/ammo = new()
	ammo.warhead_impact(target_turf)

/datum/fire_support/custom/c709_incendiary
	name = "C709 Inc. Bomb"
	scatter_range = 0
	impact_quantity = 1
	delay_to_impact = 25 SECONDS
	impact_delay = 1 SECONDS
	start_visual = /obj/effect/temp_visual/flyby/c709_longsword_flyby
	has_shadow = TRUE
	initiate_sound = 'sound/weapons/halo/fire_support/c709_flyover.ogg'
	start_sound = 'sound/weapons/halo/fire_support/c712_missile.ogg'
	warning_chat_message = "C709 LONGSWORD"
	warning_range = 35

/datum/fire_support/custom/c709_incendiary/do_impact(turf/target_turf)
	var/obj/structure/ob_ammo/warhead/incendiary/ammo = new()
	ammo.warhead_impact(target_turf)

/datum/fire_support/custom/c709_flyby
	name = "C709 Longsword Flyby"
	start_visual = /obj/effect/temp_visual/flyby/c709_longsword_flyby
	has_shadow = FALSE // this is so you can have several in formation if you want!
	delay_to_impact = 25 SECONDS
	initiate_sound = 'sound/weapons/halo/fire_support/c709_flyover.ogg'
	warning_chat_message = "C709 LONGSWORD"
	warning_chat_verb = "FLY OVER"

/datum/fire_support/custom/c709_flyby/do_impact(turf/target_turf)
	return

// ================
// naval fire support
// ================

/datum/fire_support/custom/mac_gun
	name = "MAC"
	scatter_range = 0
	impact_quantity = 1
	delay_to_impact = 0 SECONDS
	impact_delay = 0 SECONDS
	impact_sound = null
	start_sound = 'sound/weapons/halo/fire_support/frigate_mac.ogg'
	warning_chat_message = "MAC"
	warning_range = 35

/datum/fire_support/custom/mac_gun/do_impact(turf/target_turf)

	var/clear_power = 1600
	var/clear_falloff = 3
	var/standard_power = 800
	var/standard_falloff = 20
	var/clear_delay = 3
	var/double_explosion_delay = 6

	new /obj/effect/overlay/temp/blinking_laser (target_turf)
	sleep(10)
	var/datum/cause_data/cause_data = create_cause_data("MAC")
	cell_explosion(target_turf, clear_power, clear_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data) //break shit around
	sleep(clear_delay)

	// Explosion if turf is not a wall.
	if(!target_turf.density)
		cell_explosion(target_turf, standard_power, standard_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data)
		handle_shake(target_turf, 15, 3, 3)
		sleep(double_explosion_delay)
		cell_explosion(target_turf, standard_power, standard_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data)
		qdel(src)
		return

	// Checks turf around the target_turf
	for(var/turf/T in range(2, target_turf))
		if(!T.density)
			cell_explosion(target_turf, standard_power, standard_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data)
			handle_shake(target_turf, 15, 3, 3)
			sleep(double_explosion_delay)
			cell_explosion(target_turf, standard_power, standard_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data)
			qdel(src)
			return

/datum/fire_support/custom/mac_gun/in_atmosphere
	name = "MAC - Atmospheric"
	delay_to_impact = 4 SECONDS
	initiate_sound = 'sound/weapons/halo/fire_support/frigate_mac_in_atmos.ogg'
	start_sound = null

/datum/fire_support/custom/coilgun_fire
	name = "Coilguns"
	scatter_range = 10
	impact_quantity = 25
	delay_to_impact = 8 SECONDS
	impact_delay = 0.5 SECONDS
	impact_sound = null
	initiate_sound = 'sound/weapons/halo/fire_support/frigate_gunfire.ogg'
	warning_chat_message = "COILGUN BARRAGE"
	warning_range = 35

/datum/fire_support/custom/coilgun_fire/do_impact(turf/target_turf)
	cell_explosion(target_turf, 80, 20, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("Coilgun Battery"))

// ================
// dropship hovering
// ================

/datum/fire_support/custom/pelican_hover
	name = "D77-TCE Pelican"
	delay_to_impact = 0.5 SECONDS
	start_visual = null
	scatter_range = 0
	has_shadow = FALSE // this is to prevent you spawning a bunch of them and having sentries without shadows.
	initiate_sound = null
	start_sound = null
	warning_chat_message = "D77-TCE PELICAN"
	warning_chat_verb = "HOVER OVER"

/datum/fire_support/custom/pelican_hover/do_impact(turf/target_turf, direction)
	var/obj/effect/temp_visual/dropship_hover/pelican/dropship = new(target_turf)
	if(direction)
		dropship.setDir(direction)
	animate(dropship, time = 1 SECONDS, loop = -1, LINEAR_EASING, pixel_y = dropship.pixel_y +2)
	animate(time = 1 SECONDS, easing = LINEAR_EASING, pixel_y = dropship.pixel_y - 2)
/datum/fire_support/custom/pelican_hover/armed
	name = "(Rocket Pods) D77-TCE Pelican"

/datum/fire_support/custom/pelican_hover/armed/do_impact(turf/target_turf, direction)
	var/obj/effect/temp_visual/dropship_hover/pelican/dropship = new(target_turf)
	if(direction)
		dropship.setDir(direction)

	var/turf/gun_turf
	var/turf/turret_turf_1 // left side
	var/turf/turret_turf_2 // right side
	var/obj/structure/machinery/defenses/sentry/halo_cas_turret/pelican_main_turret/main_turret
	var/obj/structure/machinery/defenses/sentry/halo_cas_turret/pelican_rocket_pod/side_turret_1
	var/obj/structure/machinery/defenses/sentry/halo_cas_turret/pelican_rocket_pod/side_turret_2
	var/main_turret_offset = 11
	var/turret_offset_forward = 6
	var/turret_offset_side = 8

	switch(dropship.dir)
		if(NORTH)
			gun_turf = locate(dropship.x, dropship.y + main_turret_offset, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(NORTH)

			turret_turf_1 = locate(dropship.x - turret_offset_side, dropship.y + turret_offset_forward, dropship.z)
			side_turret_1 = new (turret_turf_1)
			side_turret_1.setDir(NORTH)

			turret_turf_2 = locate(dropship.x + turret_offset_side, dropship.y + turret_offset_forward, dropship.z)
			side_turret_2 = new (turret_turf_2)
			side_turret_2.setDir(NORTH)
		if(SOUTH)
			gun_turf = locate(dropship.x, dropship.y - main_turret_offset, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(SOUTH)

			turret_turf_1 = locate(dropship.x + turret_offset_side, dropship.y - turret_offset_forward, dropship.z)
			side_turret_1 = new (turret_turf_1)
			side_turret_1.setDir(SOUTH)

			turret_turf_2 = locate(dropship.x - turret_offset_side, dropship.y - turret_offset_forward, dropship.z)
			side_turret_2 = new (turret_turf_2)
			side_turret_2.setDir(SOUTH)
		if(EAST)
			gun_turf = locate(dropship.x + main_turret_offset, dropship.y, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(EAST)

			turret_turf_1 = locate(dropship.x + turret_offset_forward, dropship.y + turret_offset_side, dropship.z)
			side_turret_1 = new (turret_turf_1)
			side_turret_1.setDir(EAST)

			turret_turf_2 = locate(dropship.x + turret_offset_forward, dropship.y - turret_offset_side, dropship.z)
			side_turret_2 = new (turret_turf_2)
			side_turret_2.setDir(EAST)
		if(WEST)
			gun_turf = locate(dropship.x - main_turret_offset, dropship.y, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(WEST)

			turret_turf_1 = locate(dropship.x - turret_offset_forward, dropship.y - turret_offset_side, dropship.z)
			side_turret_1 = new (turret_turf_1)
			side_turret_1.setDir(WEST)

			turret_turf_2 = locate(dropship.x - turret_offset_forward, dropship.y + turret_offset_side, dropship.z)
			side_turret_2 = new (turret_turf_2)
			side_turret_2.setDir(WEST)
	if(main_turret)
		QDEL_IN(main_turret, 59 SECONDS)
	if(side_turret_1)
		QDEL_IN(side_turret_1, 59 SECONDS)
	if(side_turret_2)
		QDEL_IN(side_turret_2, 59 SECONDS)


/datum/fire_support/custom/pelican_hover/light
	name = "(Armed) D77-TCE Pelican"

/datum/fire_support/custom/pelican_hover/light/do_impact(turf/target_turf, direction)
	var/obj/effect/temp_visual/dropship_hover/pelican/dropship = new(target_turf)
	if(direction)
		dropship.setDir(direction)

	var/turf/gun_turf
	var/obj/structure/machinery/defenses/sentry/halo_cas_turret/pelican_main_turret/main_turret
	var/main_turret_offset = 11

	switch(dropship.dir)
		if(NORTH)
			gun_turf = locate(dropship.x, dropship.y + main_turret_offset, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(NORTH)
		if(SOUTH)
			gun_turf = locate(dropship.x, dropship.y - main_turret_offset, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(SOUTH)
		if(EAST)
			gun_turf = locate(dropship.x + main_turret_offset, dropship.y, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(EAST)
		if(WEST)
			gun_turf = locate(dropship.x - main_turret_offset, dropship.y, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(WEST)
	QDEL_IN(main_turret, 59 SECONDS)

/datum/fire_support/custom/phantom_hover
	name = "Phantom"
	delay_to_impact = 0.5 SECONDS
	start_visual = null
	scatter_range = 0
	has_shadow = FALSE // this is to prevent you spawning a bunch of them and having sentries without shadows.
	initiate_sound = null
	start_sound = null
	warning_chat_message = "PHANTOM"
	warning_chat_verb = "HOVER OVER"

/datum/fire_support/custom/phantom_hover/do_impact(turf/target_turf, direction)
	var/obj/effect/temp_visual/dropship_hover/phantom/dropship = new(target_turf)
	if(direction)
		dropship.setDir(direction)

/datum/fire_support/custom/phantom_hover/armed
	name = "Armed Phantom"

/datum/fire_support/custom/phantom_hover/armed/do_impact(turf/target_turf, direction)
	var/obj/effect/temp_visual/dropship_hover/phantom/dropship = new(target_turf)
	if(direction)
		dropship.setDir(direction)

	var/turf/gun_turf
	var/turf/turret_turf_1 // left side
	var/turf/turret_turf_2 // right side
	var/obj/structure/machinery/defenses/sentry/halo_cas_turret/phantom_main_turret/main_turret
	var/obj/structure/machinery/defenses/sentry/halo_cas_turret/phantom_plasma_turret/side_turret_1
	var/obj/structure/machinery/defenses/sentry/halo_cas_turret/phantom_plasma_turret/side_turret_2
	var/main_turret_offset = 16
	var/turret_offset_forward = 3
	var/turret_offset_side = 7

	switch(dropship.dir)
		if(NORTH)
			gun_turf = locate(dropship.x, dropship.y + main_turret_offset, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(NORTH)

			turret_turf_1 = locate(dropship.x - turret_offset_side, dropship.y + turret_offset_forward, dropship.z)
			side_turret_1 = new (turret_turf_1)
			side_turret_1.setDir(WEST)

			turret_turf_2 = locate(dropship.x + turret_offset_side, dropship.y + turret_offset_forward, dropship.z)
			side_turret_2 = new (turret_turf_2)
			side_turret_2.setDir(EAST)
		if(SOUTH)
			gun_turf = locate(dropship.x, dropship.y - main_turret_offset, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(SOUTH)

			turret_turf_1 = locate(dropship.x + turret_offset_side, dropship.y - turret_offset_forward, dropship.z)
			side_turret_1 = new (turret_turf_1)
			side_turret_1.setDir(EAST)

			turret_turf_2 = locate(dropship.x - turret_offset_side, dropship.y - turret_offset_forward, dropship.z)
			side_turret_2 = new (turret_turf_2)
			side_turret_2.setDir(WEST)
		if(EAST)
			gun_turf = locate(dropship.x + main_turret_offset, dropship.y, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(EAST)

			turret_turf_1 = locate(dropship.x + turret_offset_forward, dropship.y + turret_offset_side, dropship.z)
			side_turret_1 = new (turret_turf_1)
			side_turret_1.setDir(NORTH)

			turret_turf_2 = locate(dropship.x + turret_offset_forward, dropship.y - turret_offset_side, dropship.z)
			side_turret_2 = new (turret_turf_2)
			side_turret_2.setDir(SOUTH)
		if(WEST)
			gun_turf = locate(dropship.x - main_turret_offset, dropship.y, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(WEST)

			turret_turf_1 = locate(dropship.x - turret_offset_forward, dropship.y - turret_offset_side, dropship.z)
			side_turret_1 = new (turret_turf_1)
			side_turret_1.setDir(SOUTH)

			turret_turf_2 = locate(dropship.x - turret_offset_forward, dropship.y + turret_offset_side, dropship.z)
			side_turret_2 = new (turret_turf_2)
			side_turret_2.setDir(NORTH)
	if(main_turret)
		QDEL_IN(main_turret, 59 SECONDS)
	if(side_turret_1)
		QDEL_IN(side_turret_1, 59 SECONDS)
	if(side_turret_2)
		QDEL_IN(side_turret_2, 59 SECONDS)

/datum/fire_support/custom/spirit_hover
	name = "Spirit"
	delay_to_impact = 0.5 SECONDS
	start_visual = null
	scatter_range = 0
	has_shadow = FALSE // this is to prevent you spawning a bunch of them and having sentries without shadows.
	initiate_sound = null
	start_sound = null
	warning_chat_message = "SPIRIT"
	warning_chat_verb = "HOVER OVER"

/datum/fire_support/custom/spirit_hover/do_impact(turf/target_turf, direction)
	var/obj/effect/temp_visual/dropship_hover/spirit/dropship = new(target_turf)
	if(direction)
		dropship.setDir(direction)

/datum/fire_support/custom/spirit_hover/armed
	name = "Armed Spirit"

/datum/fire_support/custom/spirit_hover/armed/do_impact(turf/target_turf, direction)
	var/obj/effect/temp_visual/dropship_hover/spirit/dropship = new(target_turf)
	if(direction)
		dropship.setDir(direction)

	var/turf/gun_turf
	var/obj/structure/machinery/defenses/sentry/halo_cas_turret/phantom_main_turret/main_turret
	var/main_turret_offset = 9

	switch(dropship.dir)
		if(NORTH)
			gun_turf = locate(dropship.x, dropship.y - main_turret_offset, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(NORTH)
		if(SOUTH)
			gun_turf = locate(dropship.x, dropship.y + main_turret_offset, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(SOUTH)
		if(EAST)
			gun_turf = locate(dropship.x - main_turret_offset, dropship.y, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(EAST)
		if(WEST)
			gun_turf = locate(dropship.x + main_turret_offset, dropship.y, dropship.z)
			main_turret = new(gun_turf)
			main_turret.setDir(WEST)
	QDEL_IN(main_turret, 59 SECONDS)

#undef ORDNANCE_OPTIONS
#undef COVENANT_ORDNANCE
#undef UNSC_ORDNANCE
#undef GLASSING_BEAMS
#undef ORBITAL_ORDNANCE
#undef MORTAR_ORDNANCE
#undef MISC_ORDNANCE
#undef CHEMICAL_ORDNANCE
#undef THROWABLES_ORDNANCE
#undef FIRE_SUPPORT_CLICK_INTERCEPT_ACTION
#undef WEAPON_RESUPPLY
#undef AMMO_RESUPPLY
