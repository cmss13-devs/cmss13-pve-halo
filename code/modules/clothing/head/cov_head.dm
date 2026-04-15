/obj/item/clothing/head/helmet/marine/sangheili
	name = "\improper Sangheili helmet"
	desc = "A nanolaminate helmet inspired by ancient Sangheili armours of the Pre-Covenant, having not changed its design in fifty generations. Fitted with comprehensive communications and smart-link systems allowing the wearer to maintain both control of their levies and fine operation of their weapons."
	icon = 'icons/halo/obj/items/clothing/covenant/helmets.dmi'
	icon_state = "sang_minor_1"
	item_state = "sang_minor_1"

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

/obj/item/clothing/head/helmet/marine/sangheili/minor/manta_hat
	icon_state = "sang_minor_2"

/obj/item/clothing/head/helmet/marine/sangheili/major
	name = "\improper Sangheili Major helmet"
	icon_state = "sang_major_1"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/head/helmet/marine/sangheili/major/manta_hat
	icon_state = "sang_major_2"

/obj/item/clothing/head/helmet/marine/sangheili/ultra
	name = "\improper Sangheili Ultra helmet"
	icon_state = "sang_ultra_1"

	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/head/helmet/marine/sangheili/ultra/manta_hat
	icon_state = "sang_ultra_2"

/obj/item/clothing/head/helmet/marine/sangheili/zealot
	name = "\improper Sangheili Zealot helmet"
	icon_state = "sang_zealot_1"

	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/head/helmet/marine/sangheili/zealot/manta_hat
	icon_state = "sang_zealot_2"

/obj/item/clothing/head/helmet/marine/sangheili/specops
	name = "\improper Sangheili Special Operations helmet"
	icon_state = "sang_specops_1"

	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/head/helmet/marine/sangheili/specops/manta_hat
	icon_state = "sang_specops_2"

/obj/item/clothing/head/helmet/marine/sangheili/specops/assault
	name = "Sangheili Special Operations Assault helmet"
	icon_state = "sang_specops_3"
	flags_inventory = COVEREYES|COVERMOUTH|NOPRESSUREDMAGE|BLOCKGASEFFECT
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES

/obj/item/clothing/head/helmet/marine/sangheili/specops/ultra
	name = "\improper Sangheili Special Operations Ultra helmet"
	icon_state = "sang_specultra_1"

	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/head/helmet/marine/sangheili/specops/ultra/manta_hat
	icon_state = "sang_specultra_2"

/obj/item/clothing/head/helmet/marine/sangheili/specops/ultra/assault
	name = "Sangheili Special Operations Ultra Assault helmet"
	icon_state = "sang_specultra_3"
	flags_inventory = COVEREYES|COVERMOUTH|NOPRESSUREDMAGE|BLOCKGASEFFECT
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES

/obj/item/clothing/head/helmet/marine/sangheili/stealth
	name = "\improper Sangheili Stealth helmet"
	icon_state = "sang_stealth_1"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/head/helmet/marine/sangheili/stealth/manta_hat
	icon_state = "sang_stealth_2"

/obj/item/clothing/head/helmet/marine/sangheili/stealth/assault
	name = "Sangheili Stealth Assault helmet"
	icon_state = "sang_stealth_3"
	flags_inventory = COVEREYES|COVERMOUTH|NOPRESSUREDMAGE|BLOCKGASEFFECT
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES

/obj/item/clothing/head/helmet/marine/sangheili/honor_guard // kill everyone forever. stupidly op but its ok.
	name = "\improper Sangheili Honor Guard helmet"
	icon_state = "sang_honorguard"
	item_icons = list(
		WEAR_HEAD = 'icons/halo/mob/humans/onmob/clothing/sangheili/hat_64.dmi'
	)

	armor_melee = CLOTHING_ARMOR_GIGAHIGH
	armor_bullet = CLOTHING_ARMOR_GIGAHIGH
	armor_laser = CLOTHING_ARMOR_GIGAHIGH
	armor_bomb = CLOTHING_ARMOR_GIGAHIGHDOUBLEPLUSGOOD
