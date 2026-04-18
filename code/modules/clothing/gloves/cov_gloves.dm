//======================
// SANGHEILI
//======================

/obj/item/clothing/gloves/marine/sangheili
	name = "\improper Sangheili gauntlets"
	desc = "Simple gauntlets worn over the wrists of a Sangheili, made of common nanolaminate composites. Fitted precisely, these gauntlets do not interfere whatsoever with the warriors work, and in the case where pure brute strength is needed, prove sufficient as improvised weapons."
	icon = 'icons/halo/obj/items/clothing/covenant/gloves.dmi'
	icon_state = "sang_minor"
	item_state = "sangauntlets_minor"

	item_icons = list(
		WEAR_HANDS = 'icons/halo/mob/humans/onmob/clothing/sangheili/gloves.dmi'
	)

	allowed_species_list = list(SPECIES_SANGHEILI)

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/gloves/marine/sangheili/minor
	name = "\improper Sangheili Minor gauntlets"

/obj/item/clothing/gloves/marine/sangheili/major
	name = "\improper Sangheili Major gauntlets"
	icon_state = "sang_major"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/gloves/marine/sangheili/ultra
	name = "\improper Sangheili Ultra gauntlets"
	icon_state = "sang_ultra"

	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/gloves/marine/sangheili/zealot
	name = "\improper Sangheili Zealot gauntlets"
	icon_state = "sang_zealot"

	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/gloves/marine/sangheili/specops
	name = "\improper Sangheili Special Operations gauntlets"
	icon_state = "sang_specops"

	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/gloves/marine/sangheili/specops/ultra
	name = "\improper Sangheili Special Operations Ultra gauntlets"
	icon_state = "sang_specultra"

	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/gloves/marine/sangheili/stealth
	name = "\improper Sangheili Stealth gauntlets"
	icon_state = "sang_stealth"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/gloves/marine/sangheili/honor_guard // deflects ur bullets
	name = "\improper Sangheili Honor Guard gauntlets"
	icon_state = "sang_honorguard"

	armor_melee = CLOTHING_ARMOR_GIGAHIGH
	armor_bullet = CLOTHING_ARMOR_GIGAHIGH
	armor_laser = CLOTHING_ARMOR_GIGAHIGH
	armor_bomb = CLOTHING_ARMOR_GIGAHIGHDOUBLEPLUSGOOD

//======================
// UNGGOY
//======================

/obj/item/clothing/gloves/marine/unggoy
	name = "\improper Unggoy bracers"
	desc = "Simple bracers worn over the wrists of an Unggoy."
	icon = 'icons/halo/obj/items/clothing/covenant/gloves.dmi'
	icon_state = "unggoy_minor"
	item_state = "unggoy_minor"

	item_icons = list(
		WEAR_HANDS = 'icons/halo/mob/humans/onmob/clothing/unggoy/gloves.dmi'
	)

	allowed_species_list = list(SPECIES_UNGGOY)

	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW

/obj/item/clothing/gloves/marine/unggoy/minor
	name = "\improper Unggoy Minor bracers"

/obj/item/clothing/gloves/marine/unggoy/major
	name = "\improper Unggoy Major bracers"
	icon_state = "unggoy_major"
	item_state = "unggoy_major"

/obj/item/clothing/gloves/marine/unggoy/ultra
	name = "\improper Unggoy Ultra bracers"
	icon_state = "unggoy_ultra"
	item_state = "unggoy_ultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/gloves/marine/unggoy/heavy
	name = "\improper Unggoy Heavy bracers"
	icon_state = "unggoy_heavy"
	item_state = "unggoy_heavy"

	armor_bomb = CLOTHING_ARMOR_VERYHIGH

/obj/item/clothing/gloves/marine/unggoy/specops
	name = "\improper Unggoy Special Operations bracers"
	icon_state = "unggoy_specops"
	item_state = "unggoy_specops"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/gloves/marine/unggoy/specops_ultra
	name = "\improper Unggoy Special Operations Ultra bracers"
	icon_state = "unggoy_specultra"
	item_state = "unggoy_specultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
