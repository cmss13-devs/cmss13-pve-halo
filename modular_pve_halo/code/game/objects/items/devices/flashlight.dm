/obj/item/device/flashlight/flare/unsc
	name = "flare"
	desc = "A UNSC issued flare, burns with a bright red light. There are instructions on the side, it reads 'pull cord, make light'."
	icon = 'icons/halo/obj/items/lighting.dmi'
	icon_state = "flare"
	item_state = "flare"
	actions = list() //just pull it manually, neckbeard.
	raillight_compatible = 0
	can_be_broken = FALSE
	rotation_on_throw = TRUE

/obj/item/device/flashlight/flare/unsc/update_icon()
	overlays?.Cut()
	. = ..()
	if(on)
		icon_state = "[initial(icon_state)]-on"
		if(show_flame)
			var/image/flame = image('icons/halo/obj/items/lighting.dmi', src, "flare_flame")
			flame.color = flame_tint
			flame.appearance_flags = KEEP_APART|RESET_COLOR|RESET_TRANSFORM
			var/image/flame_base = image('icons/halo/obj/items/lighting.dmi', src, "flare_flame")
			flame_base.color = flame_base_tint
			flame_base.appearance_flags = KEEP_APART|RESET_COLOR
			flame_base.blend_mode = BLEND_ADD
			flame.overlays += flame_base
			overlays += flame
	else if(burnt_out)
		icon_state = "[initial(icon_state)]-empty"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/device/flashlight/flare/signal/unsc
	name = "signal flare"
	desc = "A UNSC issued signal flare, burns with a bright green light. Commonly used for signalling and marking purposes thanks to the hotter flame emitted by this model."
	icon = 'icons/halo/obj/items/lighting.dmi'
	icon_state = "cas_flare"
	item_state = "cas_flare"

/obj/item/device/flashlight/flare/signal/unsc/update_icon()
	overlays?.Cut()
	. = ..()
	if(on)
		icon_state = "[initial(icon_state)]-on"
		if(show_flame)
			var/image/flame = image('icons/halo/obj/items/lighting.dmi', src, "flare_flame")
			flame.color = flame_tint
			flame.appearance_flags = KEEP_APART|RESET_COLOR|RESET_TRANSFORM
			var/image/flame_base = image('icons/halo/obj/items/lighting.dmi', src, "flare_flame")
			flame_base.color = flame_base_tint
			flame_base.appearance_flags = KEEP_APART|RESET_COLOR
			flame_base.blend_mode = BLEND_ADD
			flame.overlays += flame_base
			overlays += flame
	else if(burnt_out)
		icon_state = "[initial(icon_state)]-empty"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/device/flashlight/flare/chemlight
	name = "green glowstick"
	desc = "A military-grade chemical light. Burns for much, much longer than a flare, but at the cost of luminosity."
	w_class = SIZE_TINY
	icon = 'icons/halo/obj/items/lighting.dmi'
	light_color = "#49F37C"
	var/glow_color = "green"
	light_power = 2
	light_range = 5
	flame_tint = "#49F37C"
	flame_base_tint = "#49F37C"
	icon_state = "glowstick_green"
	item_state = "glowstick_green"
	raillight_compatible = 0
	can_be_broken = FALSE
	rotation_on_throw = TRUE
	fuel = 90 MINUTES
	show_flame = FALSE
	activation_sound = 'sound/items/pen_click_off.ogg'
	watcher_activation_message = "cracks and shakes the chemlight."
	user_activation_message = "You crack and shake the chemlight, making it glow!"

/obj/item/device/flashlight/flare/chemlight/get_examine_text(mob/user)
	. = ..()
	if(!fuel)
		. += SPAN_INFO("This one is cracked and spent!")
	else
		. += SPAN_INFO("This one is [glow_color] colored.")

/obj/item/device/flashlight/flare/chemlight/turn_on()
	set_light_color(light_color)
	on = TRUE
	update_brightness()
	START_PROCESSING(SSobj, src)

/obj/item/device/flashlight/flare/chemlight/flare_burn_down()
	var/starting_light = initial(light_range)
	switch(fuel)
		if(72 MINUTES to 90 MINUTES)
			set_light_range(starting_light)
		if(54 MINUTES to 71.99 MINUTES)
			set_light_range(starting_light-1)
		if(36 MINUTES to 36.99 MINUTES)
			set_light_range(starting_light-2)
		if(18 MINUTES to 35.99 MINUTES)
			set_light_range(starting_light-3)
		if(0 MINUTES to 17.99 MINUTES)
			set_light_range(starting_light-4)
			set_light_power(0.5) // A power of 2 results in no light at all, while .5 results in a small light.

/obj/item/device/flashlight/flare/chemlight/red
	name = "red glowstick"
	glow_color = "red"
	light_color = "#FC0F29"
	flame_tint = "#FC0F29"
	flame_base_tint = "#FC0F29"
	icon_state = "glowstick_red"
	item_state = "glowstick_red"

/obj/item/device/flashlight/flare/chemlight/blue
	name = "blue glowstick"
	glow_color = "blue"
	light_color = "#599DFF"
	flame_tint = "#599DFF"
	flame_base_tint = "#599DFF"
	icon_state = "glowstick_blue"
	item_state = "glowstick_blue"

/obj/item/device/flashlight/flare/chemlight/orange
	name = "orange glowstick"
	glow_color = "orange"
	light_color = "#FA7C0B"
	flame_tint = "#FA7C0B"
	flame_base_tint = "#FA7C0B"
	icon_state = "glowstick_orange"
	item_state = "glowstick_orange"

/obj/item/device/flashlight/flare/chemlight/yellow
	name = "yellow glowstick"
	glow_color = "yellow"
	light_color = "#FEF923"
	flame_tint = "#FEF923"
	flame_base_tint = "#FEF923"
	icon_state = "glowstick_yellow"
	item_state = "glowstick_yellow"

/obj/item/device/flashlight/flare/chemlight/radioisotope
	name = "radioisotope glowstick"
	desc = "A radioisotope powered military-grade chemical light. Escaping particles light up the area far brighter on similar levels to flares and for longer. Inadvisable to ingest the contents of."
	glow_color = "radioisotope-green"
	icon_state = "glowstick_isotope"
	item_state = "glowstick_isotope"
	light_color = "#49F37C"
	flame_tint = "#49F37C"
	flame_base_tint = "#49F37C"
	light_range = 8
	light_power = 3
