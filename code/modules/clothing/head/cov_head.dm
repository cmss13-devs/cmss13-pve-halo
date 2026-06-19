//======================
// SANGHEILI
//======================

/obj/item/clothing/head/helmet/marine/sangheili
	name = "\improper Sangheili helmet"
	desc = "A nanolaminate helmet inspired by ancient Sangheili armours of the Pre-Covenant, having not changed its design in fifty generations. Fitted with comprehensive communications and smart-link systems allowing the wearer to maintain both control of their levies and fine operation of their weapons."
	icon = 'icons/halo/obj/items/clothing/covenant/helmets.dmi'
	icon_state = "sang_minor_1"
	item_state = "sang_minor_1"

	item_icons = list(
		WEAR_HEAD = 'icons/halo/mob/humans/onmob/clothing/sangheili/hat.dmi'
	)

	allowed_species_list = list(SPECIES_LIST_SANGHEILI)

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

//======================
// UNGGOY
//======================

/obj/item/clothing/head/helmet/marine/unggoy
	name = "\improper Unggoy helmet"
	desc = "A nanolaminate helmet for Unggoy."
	icon = 'icons/halo/obj/items/clothing/covenant/helmets.dmi'
	icon_state = "unggoy_minor_assault"
	item_state = "unggoy_minor_assault"

	item_icons = list(
		WEAR_HEAD = 'icons/halo/mob/humans/onmob/clothing/unggoy/hat.dmi'
	)

	allowed_species_list = list(SPECIES_LIST_UNGGOY)

	flags_marine_helmet = NO_FLAGS
	flags_inventory = NO_FLAGS
	flags_inv_hide = NO_FLAGS
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	built_in_visors = list()

	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW

/obj/item/clothing/head/helmet/marine/unggoy/minor
	name = "\improper Unggoy Minor assault helmet"
	icon_state = "unggoy_minor_assault"
	item_state = "unggoy_minor_assault"

/obj/item/clothing/head/helmet/marine/unggoy/major
	name = "\improper Unggoy Major assault helmet"
	icon_state = "unggoy_major_assault"
	item_state = "unggoy_major_assault"

/obj/item/clothing/head/helmet/marine/unggoy/ultra
	name = "\improper Unggoy Ultra assault helmet"
	icon_state = "unggoy_ultra_assault"
	item_state = "unggoy_ultra_assault"

	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/marine/unggoy/heavy
	name = "\improper Unggoy Heavy assault helmet"
	icon_state = "unggoy_heavy_assault"
	item_state = "unggoy_heavy_assault"

	armor_bomb = CLOTHING_ARMOR_VERYHIGH


/obj/item/clothing/head/helmet/marine/unggoy/specops
	name = "\improper Unggoy Special Operations assault helmet"
	icon_state = "unggoy_specops_assault"
	item_state = "unggoy_specops_assault"

	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/marine/unggoy/specops_ultra
	name = "\improper Unggoy Special Operations assault helmet"
	icon_state = "unggoy_specultra_assault"
	item_state = "unggoy_specultra_assault"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH

//======================
// KIGYAR
//======================

/obj/item/clothing/head/helmet/marine/ruuhtian
	name = "\improper Ruuhtian combat helmet"
	desc = "A basic helmet given to Kig'yar warriors, covers the sides and top of the head. Standard issue nanolaminate helmet featuring simple elastic straps and a padded interior providing a modicum of comfort. Capable of deflecting a deceptively high amount of damage, despite its simple appearance."
	icon = 'icons/halo/obj/items/clothing/covenant/helmets.dmi'
	icon_state = "ruuhtian_standard"
	item_state = "ruuhtian_standard"

	item_icons = list(
		WEAR_HEAD = 'icons/halo/mob/humans/onmob/clothing/ruuhtian/hat.dmi'
	)

	allowed_species_list = list(SPECIES_LIST_RUUHTIAN)

	flags_marine_helmet = NO_FLAGS
	flags_inventory = NO_FLAGS
	flags_inv_hide = NO_FLAGS
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	built_in_visors = list()

	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW

/obj/item/clothing/head/helmet/marine/ruuhtian/better
	name = "\improper superior Ruuhtian combat helmet"
	icon_state = "ruuhtian_superior"
	item_state = "ruuhtian_superior"

	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/marine/ruuhtian/sniper
	name = "\improper Ruuhtian sniper helmet"
	desc = "An advanced helmet given to specialist Kig'yar marksmen and snipers. Features an advanced optical suite over the standard combat helmet, allowing seamless smart-link with any held weapon, several modular vision modes, and high-fidelity independent magnification capabilities."
	icon_state = "ruuhtian_sniper"
	item_state = "ruuhtian_sniper"

	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/marine/ruuhtian/marksman
	name = "\improper Ruuhtian marksman helmet"
	desc = "An advanced helmet given to specialist Kig'yar marksmen and snipers. Features an advanced optical suite over the standard combat helmet, allowing seamless smart-link with any held weapon, several modular vision modes, and high-fidelity independent magnification capabilities."
	icon_state = "ruuhtian_marksman"
	item_state = "ruuhtian_marksman"

/obj/item/clothing/head/helmet/marine/ruuhtian/headset

	name = "\improper Ruuhtian tactical headset"
	desc = "A simple optical headset used by some Kig'yar warriors. While not as comprehensive as the marksmen helmet, the tactical headset provides significant benefits over more simple smart-link units used by common warriors, alongside the ability to display complex information from the Covenant Battle-Net."
	icon_state = "ruuhtian_headsight"
	item_state = "ruuhtian_headsight"

	armor_melee = CLOTHING_ARMOR_VERYLOW
	armor_bullet = CLOTHING_ARMOR_VERYLOW
	armor_laser = CLOTHING_ARMOR_VERYLOW

// assault

/obj/item/clothing/head/helmet/marine/ruuhtian/assault
	name = "\improper Ruuhtian assault helmet"
	desc = "A heavily armoured helmet sometimes seen used by Jackal troops. While it has obvious benefits in protecting the head from injury, it seems to also feature other upgrades not common to most gear worn by Covenant troops."
	flags_inv_hide = HIDEALLHAIR

	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/marine/ruuhtian/assault/minor
	name = "\improper Ruuhtian Minor assault helmet"
	icon_state = "ruuhtian_minor_assault"
	item_state = "ruuhtian_minor_assault"

/obj/item/clothing/head/helmet/marine/ruuhtian/assault/major
	name = "\improper Ruuhtian Major assault helmet"
	icon_state = "ruuhtian_major_assault"
	item_state = "ruuhtian_major_assault"

/obj/item/clothing/head/helmet/marine/ruuhtian/assault/ultra
	name = "\improper Ruuhtian Ultra assault helmet"
	icon_state = "ruuhtian_ultra_assault"
	item_state = "ruuhtian_ultra_assault"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/marine/ruuhtian/assault/specops
	name = "\improper Ruuhtian Special Operations assault helmet"
	icon_state = "ruuhtian_specops_assault"
	item_state = "ruuhtian_specops_assault"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/marine/ruuhtian/assault/specops_ultra
	name = "\improper Ruuhtian Special Operations Ultra assault helmet"
	icon_state = "ruuhtian_specultra_assault"
	item_state = "ruuhtian_specultra_assault"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGHPLUS

/obj/item/clothing/head/helmet/marine/ruuhtian/specops
	name = "\improper Ruuhtian Special Operations helmet"
	desc = "Advanced combat helmet used by Jackal special operations troops. A technology dense piece of kit filled with complex sensor suites, migraine inducing UI elements and an unnervingly plush interior, little is known past the fact it can take significant damage and is always a bad sign."
	icon_state = "ruuhtian_specops"
	item_state = "ruuhtian_specops"

	flags_inv_hide = HIDEALLHAIR

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/marine/ruuhtian/specops/specops_ultra
	name = "\improper Ruuhtian Special Operations Ultra helmet"
	icon_state = "ruuhtian_specultra"
	item_state = "ruuhtian_specultra"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGHPLUS
