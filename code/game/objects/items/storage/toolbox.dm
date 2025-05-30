/obj/item/storage/toolbox
	name = "toolbox"
	desc = "Danger. Very robust."
	icon = 'icons/obj/items/storage/toolbox.dmi'
	icon_state = "red"
	item_state = "toolbox_red"
	pickup_sound = 'sound/handling/toolbox_pickup.ogg'
	drop_sound = 'sound/handling/toolbox_drop.ogg'
	flags_atom = FPRINT|CONDUCT
	force = 5
	throwforce = 10
	throw_speed = SPEED_FAST
	throw_range = 7
	w_class = SIZE_LARGE
	use_sound = "toolbox"

	attack_verb = list("robusted")

/obj/item/storage/toolbox/emergency
	name = "emergency toolbox"
	icon_state = "red"
	item_state = "toolbox_red"

/obj/item/storage/toolbox/emergency/fill_preset_inventory()
	new /obj/item/tool/crowbar/red(src)
	new /obj/item/tool/extinguisher/mini(src)
	if(prob(50))
		new /obj/item/device/flashlight(src)
	else
		new /obj/item/device/flashlight/flare(src)
	new /obj/item/device/radio(src)

/obj/item/storage/toolbox/mechanical
	name = "mechanical toolbox"
	icon_state = "blue"
	item_state = "toolbox_blue"

/obj/item/storage/toolbox/mechanical/green
	name = "mechanical toolbox"
	icon_state = "green"
	item_state = "toolbox_green"

/obj/item/storage/toolbox/mechanical/fill_preset_inventory()
	new /obj/item/tool/screwdriver(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/device/analyzer(src)
	new /obj/item/tool/wirecutters(src)

/obj/item/storage/toolbox/electrical
	name = "electrical toolbox"
	icon_state = "yellow"
	item_state = "toolbox_yellow"

/obj/item/storage/toolbox/electrical/fill_preset_inventory()
	var/color = pick("red","yellow","green","blue","pink","orange","cyan","white")
	new /obj/item/tool/screwdriver(src)
	new /obj/item/tool/wirecutters(src)
	new /obj/item/circuitboard/apc(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/stack/cable_coil(src,30,color)
	new /obj/item/stack/cable_coil(src,30,color)
	if(prob(5))
		new /obj/item/clothing/gloves/yellow(src)
	else
		new /obj/item/stack/cable_coil(src,30,color)

/obj/item/storage/toolbox/syndicate
	name = "suspicious looking toolbox"
	icon_state = "syndicate"
	item_state = "toolbox_syndi"

	force = 7

/obj/item/storage/toolbox/syndicate/fill_preset_inventory()
	var/color = pick("red","yellow","green","blue","pink","orange","cyan","white")
	new /obj/item/tool/screwdriver(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/stack/cable_coil(src,30,color)
	new /obj/item/tool/wirecutters(src)
	new /obj/item/device/multitool(src)

/obj/item/storage/toolbox/traxus
	name = "traxus toolbox"
	desc = "A large red toolbox rounded at the top capable of holding a variety of tools and equipment for all manners of tasks. This one is produced by Traxus Heavy Industries and looks fairly...robust."
	icon = 'icons/halo/obj/items/storage/toolbox.dmi'
	icon_state = "traxus"
	force = 6
	storage_slots = 8

/obj/item/storage/toolbox/traxus/fill_preset_inventory()
	var/color = pick("red","yellow","green","blue","pink","orange","cyan","white")
	new /obj/item/tool/screwdriver(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/stack/cable_coil(src,30,color)
	new /obj/item/tool/wirecutters(src)
	new /obj/item/device/analyzer(src)
	new /obj/item/device/multitool(src)

/obj/item/storage/toolbox/traxus/alt
	desc = "A large red toolbox with an angular top capable of holding a variety of tools and equipment for all manners of tasks. This one is produced by Traxus Heavy Industries and looks fairly...robust."
	icon_state = "traxus_2"

/obj/item/storage/toolbox/traxus/big
	name = "traxus toolbox"
	desc = "A large red toolbox rounded at the top capable of holding a variety of tools and equipment for all manners of tasks. This one is produced by Traxus Heavy Industries and looks fairly...robust."
	icon = 'icons/halo/obj/items/storage/toolbox.dmi'
	icon_state = "traxus_big"
	force = 8
	throw_range = 3
	storage_slots = 10

/obj/item/storage/toolbox/traxus/big/fill_preset_inventory()
	var/color = pick("red","yellow","green","blue","pink","orange","cyan","white")
	new /obj/item/tool/screwdriver(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/stack/cable_coil(src,30,color)
	new /obj/item/tool/wirecutters(src)
	new /obj/item/device/analyzer(src)
	new /obj/item/device/multitool(src)
	new /obj/item/circuitboard/apc(src)
	new /obj/item/device/flashlight(src)
