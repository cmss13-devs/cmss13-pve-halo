// ================ ELITES ================

/obj/item/clothing/gloves/marine/sangheili
	name = "\improper Sangheili gauntlets"
	desc = "Simple gauntlets worn over the wrists of a Sangheili, made of common nanolaminate composites. Fitted precisely, these gauntlets do not interfere whatsoever with the warriors work, and in the case where pure brute strength is needed, prove sufficient as improvised weapons."
	icon = 'icons/halo/obj/items/clothing/covenant/gloves.dmi'
	icon_state = "sanggauntlets_minor"
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
	icon_state = "sanggauntlets_major"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/gloves/marine/sangheili/ultra
	name = "\improper Sangheili Ultra gauntlets"
	icon_state = "sanggauntlets_ultra"

	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/gloves/marine/sangheili/zealot
	name = "\improper Sangheili Zealot gauntlets"
	icon_state = "sanggauntlets_zealot"

	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

// ================ JACKALS ================

/obj/item/clothing/gloves/marine/ruuhtian
	name = "\improper Ruuhtian vambrace"
	desc = "A heavily armoured vambrace designed to provide protection to the weapon hand of a Kig'yar warrior when used in conjunction with a point defence gauntlet. The otherwise lesser protected limb is a common casualty to high intensity combat frontline Kig'yar find themselves in, this vambrace ensures that they cannot abandon their duty through the loss of a limb."
	icon = 'icons/halo/obj/items/clothing/covenant/gloves.dmi'
	icon_state = "ruuhtian_vambrace"
	item_state = "ruuhtian_vambrace"

	item_icons = list(
		WEAR_HANDS = 'icons/halo/mob/humans/onmob/clothing/ruuhtian/gloves.dmi'
	)

	allowed_species_list = list(SPECIES_RUUHTIAN)
