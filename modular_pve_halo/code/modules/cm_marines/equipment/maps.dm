/obj/item/tacmap_map
	name = "\improper MC3 individual data/net terminal"
	desc = "A handheld terminal manufactured by Misriah Armory, capable of linking to various UNSC database systems and battle-networks if the prerequisite software packages are installed. This one seems to have just a barebones GPS program available."
	icon = 'icons/halo/obj/items/devices.dmi'
	icon_state = "tacpad"
	item_state = "Cotablet"
	w_class = SIZE_SMALL

/obj/item/datapad
	name = "\improper SC2 data-pad"
	desc = "A civilian-market handheld terminal manufactured by Misriah Armory, capable of scheduling appointments, taking notes, storing contact information and much more besides."
	icon = 'icons/halo/obj/items/devices.dmi'
	icon_state = "datapad"
	item_state = "Cotablet"
	w_class = SIZE_SMALL

/obj/item/datapad/Initialize(mapload, ...)
	. = ..()

/obj/item/datapad/attack_self(mob/user) //Ze tablet, it does nothing!
	. = ..()
	user.visible_message(SPAN_NOTICE("[user] looks closely at [src]."))

/obj/item/datapad/attack(mob/attacked_mob, mob/user)
	. = ..()
	if(ishuman(attacked_mob))
		user.visible_message(SPAN_NOTICE("[user] shows [attacked_mob] [src]."),SPAN_NOTICE("You show [attacked_mob] the screen of [src]"))
		to_chat(attacked_mob, SPAN_NOTICE("[user] shows you the screen of [src]."))
		return
