/obj/item/clothing/head/helmet/marine/sangheili
	name = "Sangheili helmet"
	desc = "Standard pattern of Sangheili helmet. Usually paired with a combat harness."
	icon = 'icons/halo/obj/items/clothing/covenant/helmets.dmi'
	icon_state = "sanghelmet_minor"
	item_state = "helmet_minor"

	item_icons = list(
		WEAR_HEAD = 'icons/halo/mob/humans/onmob/clothing/sangheili/hat.dmi'
	)

	allowed_species_list = list(SPECIES_SANGHEILI)

	flags_marine_helmet = NO_FLAGS
	flags_inventory = NO_FLAGS
	flags_inv_hide = NO_FLAGS
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	built_in_visors = list()

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/marine/sangheili/minor
	name = "Sangheili Minor helmet"
	desc = "Standard blue Sangheili Minor helmet. Usually paired with a combat harness."
