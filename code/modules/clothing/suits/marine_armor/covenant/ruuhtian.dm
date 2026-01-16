/obj/item/clothing/suit/marine/kigyar
	name = "placeholder Kigyar combat harness"
	desc = "Standard issue combat harness issued to Kig'yar warriors, colouration and complexity will denote the wearers rank or veterancy. Made of dense nanolaminate plating, covering the front, sides, and back of the torso with comprehensive coverage."
	slowdown = SLOWDOWN_ARMOR_LIGHT

	icon = 'icons/halo/obj/items/clothing/covenant/armor.dmi'
	icon_state = "ruuhtian_minor"
	item_state = "ruuhtian_minor"

	item_icons = list(
		WEAR_JACKET = 'icons/halo/mob/humans/onmob/clothing/ruuhtian/armor.dmi'
	)
	allowed_species_list = list(SPECIES_RUUHTIAN)

	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW

	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
