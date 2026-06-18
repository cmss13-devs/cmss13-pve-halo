/obj/item/clothing/suit/marine/ruuhtian
	name = "placeholder Ruuhtian combat harness"
	desc = "A combat harness made to fit a Ruuhtian. Placeholder."
	slowdown = SLOWDOWN_ARMOR_LIGHT

	icon = 'icons/halo/obj/items/clothing/covenant/armor.dmi'
	icon_state = "ruuhtian_minor"
	item_state = "ruuhtian_minor"

	item_icons = list(
		WEAR_JACKET = 'icons/halo/mob/humans/onmob/clothing/ruuhtian/armor.dmi'
	)
	allowed_species_list = list(SPECIES_RUUHTIAN)

	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

	valid_accessory_slots = list(ACCESSORY_SLOT_RUUHTIAN_BICEP, ACCESSORY_SLOT_RUUHTIAN_SHOULDER)
	restricted_accessory_slots = list(ACCESSORY_SLOT_RUUHTIAN_BICEP, ACCESSORY_SLOT_RUUHTIAN_SHOULDER)

/obj/item/clothing/suit/marine/ruuhtian/minor
	name = "Ruuhtian Minor combat harness"
	desc =  "Standard issue body armour worn by low ranking Jackals serving the Covenant. Made of nanolaminate plating, providing ample protection for the wearers torso and legs, effective against most human or Covenant small arms under light fire."


/obj/item/clothing/suit/marine/ruuhtian/major
	name = "Ruuhtian Major combat harness"
	desc = "A bronze coloured modification of the armour worn by Jackals, sports superior coverage and additional armour segments, such as pauldrons or gauntlets. Given to Major ranked Jackals, usually seen commanding lower rates or acting as heavy support roles."
	icon_state = "ruuhtian_major"
	item_state = "ruuhtian_major"

/obj/item/clothing/suit/marine/ruuhtian/ultra
	name = "Ruuhtian Ultra combat harness"
	desc = "A heavily reinforced set of Jackal body armour worn by those ranked as Ultras, features a notably white-silver colouration and vastly improved protective qualities. A full set of pauldrons, arm guards and expanded torso protection, Jackals wearing this are extreme threats."
	icon_state = "ruuhtian_ultra"
	item_state = "ruuhtian_ultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
