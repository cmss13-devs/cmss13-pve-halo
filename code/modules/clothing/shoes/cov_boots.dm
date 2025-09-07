/obj/item/clothing/shoes/sangheili
	name = "Sangheili combat boots"
	desc = "A pair of sangheili combat boots and greaves to go with a combat harness."
	icon = 'icons/halo/obj/items/clothing/covenant/shoes.dmi'
	icon_state = "sangboots_minor"
	item_state = "sangboots_minor"

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
	name = "Sangheili Minor combat boots"
	desc = "A pair of blue Sangheili Minor combat boots and greaves to go with a combat harness."
