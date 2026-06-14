/obj/item/storage/box/tear_packet
	name = "packet"
	desc = "A plastic packet."
	icon = 'icons/halo/obj/items/storage/packets.dmi'
	icon_state = "ammo_packet"
	w_class = SIZE_SMALL
	can_hold = list()
	storage_slots = 3
	use_sound = "rip"
	var/isopened = FALSE

/obj/item/storage/box/tear_packet/m7
	name = "magazine packet (M7, x2)"
	storage_slots = 2

/obj/item/storage/box/tear_packet/m7/fill_preset_inventory()
	new /obj/item/ammo_magazine/smg/halo/m7(src)
	new /obj/item/ammo_magazine/smg/halo/m7(src)

/obj/item/storage/box/tear_packet/Initialize()
	. = ..()
	isopened = FALSE
	icon_state = "[initial(icon_state)]"
	use_sound = "rip"

/obj/item/storage/box/tear_packet/update_icon()
	if(!isopened)
		isopened = TRUE
		icon_state = "[initial(icon_state)]_o"
		use_sound = "rustle"

/obj/item/storage/box/tear_packet/medical_packet
	name = "UNSC medical packet"
	desc = "A combat-rated first aid medical packet filled with the bare bones basic essentials to ensuring you or your buddies don't die on the battlefield."
	icon_state = "medical_packet"
	w_class = 3
	storage_slots = 6
	max_w_class = 3
	can_hold = list(
		/obj/item/reagent_container/hypospray/autoinjector/primeable/biofoam/small,
		/obj/item/stack/medical/advanced/bruise_pack,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/advanced/ointment,
		/obj/item/stack/medical/ointment,
		/obj/item/stack/medical/splint,
		/obj/item/storage/syringe_case/unsc,
	)

/obj/item/storage/box/tear_packet/medical_packet/fill_preset_inventory()
	new /obj/item/reagent_container/hypospray/autoinjector/primeable/biofoam/small(src)
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/storage/syringe_case/unsc/morphine/full(src)

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
		/obj/item/device/flashlight/flare/chemlight,
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
	desc = "A packet of fourteen chemlights. Carried by UNSC soldiers to light dark areas or mark points of interest."
	icon_state = "chemlight"
	icon = 'icons/halo/obj/items/storage/packets.dmi'
	w_class = SIZE_MEDIUM
	storage_slots = 21
	max_storage_space = 21
	can_hold = list(
		/obj/item/device/flashlight/flare/chemlight,
	)

/obj/item/storage/box/flare/chemlight/fill_preset_inventory()
	var/add_glowsticks = rand(1,6)
	switch(add_glowsticks)
		if(1)
			for(var/i = 1 to storage_slots)
				new /obj/item/device/flashlight/flare/chemlight(src)
		if(2)
			for(var/i = 1 to storage_slots)
				new /obj/item/device/flashlight/flare/chemlight/blue(src)
		if(3)
			for(var/i = 1 to storage_slots)
				new /obj/item/device/flashlight/flare/chemlight/orange(src)
		if(4)
			for(var/i = 1 to storage_slots)
				new /obj/item/device/flashlight/flare/chemlight/red(src)
		if(5)
			for(var/i = 1 to storage_slots)
				new /obj/item/device/flashlight/flare/chemlight/yellow(src)
		if(6)
			for(var/i = 1 to storage_slots)
				new /obj/item/device/flashlight/flare/chemlight/radioisotope(src)

/obj/item/storage/box/flare/chemlight/update_icon()
	if(!length(contents))
		icon_state = "chemlight_e"
	else
		icon_state = "chemlight"

/obj/item/storage/box/flare/chemlight/get_examine_text(mob/user)
	. = ..()
	var/obj/item/device/flashlight/flare/chemlight/glowstick = locate(/obj/item/device/flashlight/flare/chemlight) in src.contents
	if(get_dist(src,user) > 2 && !isobserver(user))
		return
	if(!length(contents))
		. += SPAN_INFO("This box is empty now!")
	else
		. += SPAN_INFO("This one is full of [glowstick.glow_color] chemlights.")
