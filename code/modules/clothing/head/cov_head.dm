// ================ ELITES ================

/obj/item/clothing/head/helmet/marine/sangheili
	name = "\improper Sangheili helmet"
	desc = "A nanolaminate helmet inspired by ancient Sangheili armours of the Pre-Covenant, having not changed its design in fifty generations. Fitted with comprehensive communications and smart-link systems allowing the wearer to maintain both control of their levies and fine operation of their weapons."
	icon = 'icons/halo/obj/items/clothing/covenant/helmets.dmi'
	icon_state = "sanghelmet_minor"
	item_state = "sanghelmet_minor"

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
	name = "\improper Sangheili Minor helmet"

/obj/item/clothing/head/helmet/marine/sangheili/major
	name = "\improper Sangheili Major helmet"
	icon_state = "sanghelmet_major"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/head/helmet/marine/sangheili/ultra
	name = "\improper Sangheili Ultra helmet"
	icon_state = "sanghelmet_ultra"

	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/head/helmet/marine/sangheili/zealot
	name = "\improper Sangheili Zealot helmet"
	icon_state = "sanghelmet_zealot"

	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

// ================ JACKALS ================

/obj/item/clothing/head/helmet/marine/ruuhtian
	name = "\improper Ruuhtian combat helmet"
	desc = "A basic helmet given to Kig'yar warriors, covers the sides and top of the head. Standard issue nanolaminate helmet featuring simple elastic straps and a padded interior providing a modicum of comfort. Capable of deflecting a deceptively high amount of damage, despite its simple appearance."
	icon = 'icons/halo/obj/items/clothing/covenant/helmets.dmi'
	icon_state = "standard_helmet"
	item_state = "standard_helmet"

	item_icons = list(
		WEAR_HEAD = 'icons/halo/mob/humans/onmob/clothing/ruuhtian/hat.dmi'
	)

	allowed_species_list = list(SPECIES_RUUHTIAN)

	flags_marine_helmet = NO_FLAGS
	flags_inventory = NO_FLAGS
	flags_inv_hide = NO_FLAGS
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	built_in_visors = list()

/obj/item/clothing/head/helmet/marine/ruuhtian/major
	name = "\improper superior Ruuhtian combat helmet"
	icon_state = "superior_helmet"
	item_state = "superior_helmet"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/marine/ruuhtian/sniper
	name = "\improper Ruuhtian sniper helmet"
	desc = "An advanced helmet given to specialist Kig'yar marksmen and snipers. Features an advanced optical suite over the standard combat helmet, allowing seamless smart-link with any held weapon, several modular vision modes, and high-fidelity independent magnification capabilities."
	icon_state = "sniper_helmet"
	item_state = "sniper_helmet"

/obj/item/clothing/head/helmet/marine/ruuhtian/marksman
	name = "\improper Ruuhtian marksman helmet"
	desc = "An advanced helmet given to specialist Kig'yar marksmen and snipers. Features an advanced optical suite over the standard combat helmet, allowing seamless smart-link with any held weapon, several modular vision modes, and high-fidelity independent magnification capabilities."
	icon_state = "marksman_helmet"
	item_state = "marksman_helmet"

/obj/item/clothing/head/helmet/marine/ruuhtian/headset

	name = "\improper Ruuhtian tactical headset"
	desc = "A simple optical headset used by some Kig'yar warriors. While not as comprehensive as the marksmen helmet, the tactical headset provides significant benefits over more simple smart-link units used by common warriors, alongside the ability to display complex information from the Covenant Battle-Net."
	icon_state = "headset"
	item_state = "headset"
