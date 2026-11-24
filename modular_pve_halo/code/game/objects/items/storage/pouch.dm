/obj/item/storage/pouch/first_responder/unsc

	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/reagent_container/pill,
		/obj/item/reagent_container/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/reagent_container/hypospray,
		/obj/item/tool/extinguisher/mini,
		/obj/item/roller,
		/obj/item/bodybag,
		/obj/item/storage/syringe_case,
	)


/obj/item/storage/pouch/first_responder/unsc/fill_preset_inventory()
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/reagent_container/hypospray/autoinjector/primeable/biofoam/small(src)
	new /obj/item/storage/syringe_case/unsc/morphine/full(src)

//=========================
//Flare & Chemlight pouches
//=========================

/obj/item/storage/pouch/flare/unsc
	name = "UNSC illumination equipment pouch"
	desc = "A pouch designed to hold flares and chemlights. Refillable with flare or chemlight packs."
	icon = 'icons/halo/obj/items/clothing/pouches.dmi'
	icon_state = "flare"
	can_hold = list(
		/obj/item/device/flashlight/flare/unsc,
		/obj/item/device/flashlight/flare/signal/unsc,
		/obj/item/device/flashlight/chemlight,
	)

/obj/item/storage/pouch/flare/unsc/full/fill_preset_inventory()
	for(var/i = 1 to storage_slots)
		new /obj/item/device/flashlight/flare/unsc(src)

/obj/item/storage/pouch/flare/unsc/full_random_chemlights/fill_preset_inventory()
	var/add_glowsticks = rand(1,5)
	switch(add_glowsticks)
		if(1)
			for(var/i = 1 to storage_slots)
				new /obj/item/device/flashlight/chemlight(src)
		if(2)
			for(var/i = 1 to storage_slots)
				new /obj/item/device/flashlight/chemlight/blue(src)
		if(3)
			for(var/i = 1 to storage_slots)
				new /obj/item/device/flashlight/chemlight/orange(src)
		if(4)
			for(var/i = 1 to storage_slots)
				new /obj/item/device/flashlight/chemlight/red(src)
		if(5)
			for(var/i = 1 to storage_slots)
				new /obj/item/device/flashlight/chemlight/yellow(src)

/obj/item/storage/pouch/flare/unsc/chemlight
	name = "UNSC chemical illumination stick pouch"
	desc = "A pouch designed to hold a plethora of chemlights. Refillable with chemlight packs."
	icon = 'icons/halo/obj/items/clothing/pouches.dmi'
	icon_state = "glowstick_pouch"
	can_hold = list(
		/obj/item/device/flashlight/chemlight,
		/obj/item/device/flashlight/chemlight/blue,
		/obj/item/device/flashlight/chemlight/red,
		/obj/item/device/flashlight/chemlight/yellow,
		/obj/item/device/flashlight/chemlight/orange,
		/obj/item/device/flashlight/chemlight/radioisotope,
	)

#define PLAYER_CHEMLIGHT_LIST list("/obj/item/device/flashlight/chemlight", "/obj/item/device/flashlight/chemlight/red", "/obj/item/device/flashlight/chemlight/yellow", "/obj/item/device/flashlight/chemlight/blue", "/obj/item/device/flashlight/chemlight/orange")

/obj/item/storage/pouch/flare/unsc/chemlight/full/fill_preset_inventory()
	var/list/glowsticks = PLAYER_CHEMLIGHT_LIST
	for(var/i=1 to max_storage_space)
		var/sticks_to_pick = pick(glowsticks)
		var/obj/item/device/flashlight/chemlight/forbidden_juice_stick = new sticks_to_pick(src)
		forbidden_juice_stick.on = FALSE

/obj/item/storage/pouch/flare/unsc/chemlight/full/green
	icon_state = "glowstick_pouch_green"

/obj/item/storage/pouch/flare/unsc/chemlight/full/green/fill_preset_inventory()
	for(var/i = 1 to storage_slots)
		new /obj/item/device/flashlight/chemlight(src)

/obj/item/storage/pouch/flare/unsc/chemlight/full/blue
	icon_state = "glowstick_pouch_blue"

/obj/item/storage/pouch/flare/unsc/chemlight/full/blue/fill_preset_inventory()
	for(var/i = 1 to storage_slots)
		new /obj/item/device/flashlight/chemlight/blue(src)

/obj/item/storage/pouch/flare/unsc/chemlight/full/red
	icon_state = "glowstick_pouch_red"

/obj/item/storage/pouch/flare/unsc/chemlight/full/red/fill_preset_inventory()
	for(var/i = 1 to storage_slots)
		new /obj/item/device/flashlight/chemlight/red(src)

/obj/item/storage/pouch/flare/unsc/chemlight/full/yellow
	icon_state = "glowstick_pouch_yellow"

/obj/item/storage/pouch/flare/unsc/chemlight/full/yellow/fill_preset_inventory()
	for(var/i = 1 to storage_slots)
		new /obj/item/device/flashlight/chemlight/yellow(src)

/obj/item/storage/pouch/flare/unsc/chemlight/full/yellow/radioisotope/fill_preset_inventory() //Visually similar enough to share the same pouch icon
	for(var/i = 1 to storage_slots)
		new /obj/item/device/flashlight/chemlight/radioisotope(src)

/obj/item/storage/pouch/flare/unsc/chemlight/full/orange
	icon_state = "glowstick_pouch_orange"

/obj/item/storage/pouch/flare/unsc/chemlight/full/orange/fill_preset_inventory()
	for(var/i = 1 to storage_slots)
		new /obj/item/device/flashlight/chemlight/orange(src)
