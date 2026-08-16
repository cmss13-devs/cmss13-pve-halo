/obj/item/storage/box/flare/unsc
	name = "\improper M62 illumination flare pack"
	desc = "A packet of fourteen M62 Illumination Flares. Infrequently carried by UNSC soldiers to light dark areas."
	icon_state = "m62"
	icon = 'icons/halo/obj/items/storage/packets.dmi'
	w_class = SIZE_MEDIUM
	storage_slots = 14
	max_storage_space = 14
	can_hold = list(
		/obj/item/device/flashlight/flare/unsc,
		/obj/item/device/flashlight/flare/signal/unsc,
		/obj/item/device/flashlight/chemlight,
	)

/obj/item/storage/box/flare/unsc/fill_preset_inventory()
	for(var/i = 1 to max_storage_space)
		new /obj/item/device/flashlight/flare/unsc(src)

/obj/item/storage/box/flare/unsc/update_icon()
	if(!length(contents))
		icon_state = "m62_e"
	else
		icon_state = "m62"

/obj/item/storage/box/flare/signal/unsc
	name = "\improper M73-S signal flare pack"
	desc = "A packet of fourteen M73-S Signal Flares. Capable of being locked onto by UNSCDF strike-craft for fire support, or dropships as LZ-markers."
	icon = 'icons/halo/obj/items/storage/packets.dmi'
	icon_state = "m73"

/obj/item/storage/box/flare/signal/unsc/fill_preset_inventory()
	for(var/i = 1 to max_storage_space)
		new /obj/item/device/flashlight/flare/signal/unsc(src)

/obj/item/storage/box/flare/signal/unsc/update_icon()
	if(!length(contents))
		icon_state = "m73_e"
	else
		icon_state = "m73"


/obj/item/storage/box/flare/chemlight
	name = "\improper chemical illumination stick pack"
	desc = "A packet of twenty one chemlights. Carried by UNSC soldiers to light dark areas or mark points of interest."
	icon_state = "chemlight"
	icon = 'icons/halo/obj/items/storage/packets.dmi'
	w_class = SIZE_MEDIUM
	storage_slots = 21
	max_storage_space = 21
	can_hold = list(
		/obj/item/device/flashlight/chemlight,
	)

/obj/item/storage/box/flare/chemlight/fill_preset_inventory()
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

/obj/item/storage/box/flare/chemlight/update_icon()
	if(!length(contents))
		icon_state = "chemlight_e"
	else
		icon_state = "chemlight"

/obj/item/storage/box/flare/chemlight/get_examine_text(mob/user)
	. = ..()
	var/obj/item/device/flashlight/chemlight/glowstick = locate(/obj/item/device/flashlight/chemlight) in src.contents
	if(get_dist(src,user) > 2 && !isobserver(user))
		return
	if(!length(contents))
		. += SPAN_INFO("This box is empty now!")
	else
		. += SPAN_INFO("This one is full of [glowstick.glow_color] chemlights.")

/obj/item/storage/box/flare/chemlight/radioisotope
	name = "\improper radioisotope chemical illumination stick pack"
	desc = "A packet of fourteen high-illumination chemlights. Carried by UNSC soldiers to light dark areas or mark points of interest."
	icon_state = "chemlight"
	icon = 'icons/halo/obj/items/storage/packets.dmi'
	w_class = SIZE_MEDIUM
	storage_slots = 21
	max_storage_space = 21
	can_hold = list(
		/obj/item/device/flashlight/chemlight/radioisotope,
	)

/obj/item/storage/box/flare/chemlight/radioisotope/fill_preset_inventory()
	for(var/i = 1 to storage_slots)
		new /obj/item/device/flashlight/chemlight/radioisotope(src)
