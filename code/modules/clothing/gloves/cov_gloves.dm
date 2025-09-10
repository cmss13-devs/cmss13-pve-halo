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
