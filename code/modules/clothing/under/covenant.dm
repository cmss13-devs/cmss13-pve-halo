/obj/item/clothing/under/marine/covenant
	name = "undersuit"
	desc = "Covenant undersuit. You shouldn't see this."
	icon = 'icons/halo/obj/items/clothing/covenant/under.dmi'
	icon_state = "undersuit"
	item_state = "undersuit"
	flags_jumpsuit = null
	flags_atom = NO_SNOW_TYPE
	drop_sound = "armorequip"
	allowed_species_list = list()

/obj/item/clothing/under/marine/covenant/sangheili
	name = "sangheili undersuit"
	desc = "A high-tech jumpsuit that for the most part conforms to the users body. Interlaced with nanolaminate armoring, it provides ample protection for how flexible it is - enabling the wearer to be aggressive while still protecting themselves. Advanced magnetic projectors on the undersuit are capable of locking armor to it with considerable force."
	icon = 'icons/halo/obj/items/clothing/covenant/under.dmi'
	icon_state = "undersuit"
	item_state = "undersuit"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_SNOW_TYPE
	drop_sound = "armorequip"
	allowed_species_list = list(SPECIES_SANGHEILI)
	item_state_slots = list()

	item_icons = list(
		WEAR_BODY = 'icons/halo/mob/humans/onmob/sangheili/uniforms.dmi',
		WEAR_L_HAND = 'icons/halo/mob/humans/onmob/items_lefthand_halo.dmi',
		WEAR_R_HAND = 'icons/halo/mob/humans/onmob/items_righthand_halo.dmi'
	)
