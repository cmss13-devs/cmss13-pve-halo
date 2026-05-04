//======================
// SANGHEILI
//======================

/obj/item/clothing/shoes/sangheili
	name = "\improper Sangheili combat boots"
	desc = "A pair of fitted greaves and accompanying boots. While the external nanolaminate construction may suggest rigidity and discomfort, the internal lining is surprisingly plush, wicking sweat and passively regulating tempature. These benefits allow the warrior to focus on the art of killing, and not how much they may hate marching."
	icon = 'icons/halo/obj/items/clothing/covenant/shoes.dmi'
	icon_state = "sang_minor"
	item_state = "sang_minor"

	drop_sound = "armorequip"

	item_icons = list(
		WEAR_FEET = 'icons/halo/mob/humans/onmob/clothing/sangheili/shoes.dmi'
	)

	allowed_species_list = list(SPECIES_SANGHEILI)

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/shoes/sangheili/minor
	name = "\improper Sangheili Minor combat boots"

/obj/item/clothing/shoes/sangheili/major
	name = "\improper Sangheili Major combat boots"
	icon_state = "sang_major"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/shoes/sangheili/ultra
	name = "\improper Sangheili Ultra combat boots"
	icon_state = "sang_ultra"

	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/shoes/sangheili/zealot
	name = "\improper Sangheili Zealot combat boots"
	icon_state = "sang_zealot"

	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/shoes/sangheili/specops
	name = "\improper Sangheili Special Operations combat boots"
	icon_state = "sang_specops"

	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/shoes/sangheili/specops/ultra
	name = "\improper Sangheili Special Operations Ultra combat boots"
	icon_state = "sang_specultra"

	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/shoes/sangheili/stealth
	name = "\improper Sangheili Stealth combat boots"
	icon_state = "sang_stealth"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/shoes/sangheili/honor_guard
	name = "\improper Sangheili Honor Guard combat boots"
	icon_state = "sang_honorguard"

	armor_melee = CLOTHING_ARMOR_GIGAHIGH
	armor_bullet = CLOTHING_ARMOR_GIGAHIGH
	armor_laser = CLOTHING_ARMOR_GIGAHIGH
	armor_bomb = CLOTHING_ARMOR_GIGAHIGHDOUBLEPLUSGOOD

//======================
// UNGGOY
//======================

/obj/item/clothing/shoes/unggoy
	name = "\improper Unggoy greaves"
	desc = "A pair of fitted greaves."
	icon = 'icons/halo/obj/items/clothing/covenant/shoes.dmi'
	icon_state = "unggoy_minor"
	item_state = "unggoy_minor"

	drop_sound = "armorequip"

	item_icons = list(
		WEAR_FEET = 'icons/halo/mob/humans/onmob/clothing/unggoy/shoes.dmi'
	)

	allowed_species_list = list(SPECIES_UNGGOY)

	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW

/obj/item/clothing/shoes/unggoy/minor
	name = "\improper Unggoy Minor greaves"
	icon_state = "unggoy_minor"
	item_state = "unggoy_minor"

/obj/item/clothing/shoes/unggoy/major
	name = "\improper Unggoy Major greaves"
	icon_state = "unggoy_major"
	item_state = "unggoy_major"

/obj/item/clothing/shoes/unggoy/ultra
	name = "Unggoy Ultra greaves"
	icon_state = "unggoy_ultra"
	item_state = "unggoy_ultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/shoes/unggoy/heavy
	name = "Unggoy Heavy greaves"
	icon_state = "unggoy_heavy"
	item_state = "unggoy_heavy"

	armor_bomb = CLOTHING_ARMOR_VERYHIGH

/obj/item/clothing/shoes/unggoy/specops
	name = "Unggoy Special Operations greaves"
	icon_state = "unggoy_specops"
	item_state = "unggoy_specops"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/shoes/unggoy/specops_ultra
	name = "Unggoy Special Operations Ultra greaves"
	icon_state = "unggoy_specultra"
	item_state = "unggoy_specultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

//======================
// KIGYAR
//======================

/obj/item/clothing/shoes/ruuhtian
	name = "Ruuhtian foot guards"
	desc = "Placeholder."
	icon = 'icons/halo/obj/items/clothing/covenant/shoes.dmi'
	icon_state = "ruuhtian_minor"
	item_state = "ruuhtian_minor"

	drop_sound = "armorequip"

	item_icons = list(
		WEAR_FEET = 'icons/halo/mob/humans/onmob/clothing/ruuhtian/shoes.dmi'
	)

	allowed_species_list = list(SPECIES_RUUHTIAN)

/obj/item/clothing/shoes/ruuhtian/minor
	name = "Ruuhtian Minor foot guards"
	desc = "Extensions attached to the tops of the Kig'yar's foot. Made of common nanolaminate armour material the foot guards are designed to be as unobtrusive as possible, ensuring the wearer can make full use of their species high mobility unimpeded."
	icon_state = "ruuhtian_minor"
	item_state = "ruuhtian_minor"

/obj/item/clothing/shoes/ruuhtian/major
	name = "Ruuhtian Major foot guards"
	desc = "Extensions attached to the tops of the Kig'yar's foot. Made of common nanolaminate armour material the foot guards are designed to be as unobtrusive as possible, ensuring the wearer can make full use of their species high mobility unimpeded."
	icon_state = "ruuhtian_major"
	item_state = "ruuhtian_minor"

/obj/item/clothing/shoes/ruuhtian/ultra
	name = "Ruuhtian Ultra foot guards"
	desc = "Extensions attached to the tops of the Kig'yar's foot. Made of common nanolaminate armour material the foot guards are designed to be as unobtrusive as possible, ensuring the wearer can make full use of their species high mobility unimpeded."
	icon_state = "ruuhtian_ultra"
	item_state = "ruuhtian_minor"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
