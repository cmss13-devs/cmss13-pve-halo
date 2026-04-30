/obj/item/clothing/suit/marine/unggoy
	name = "placeholder Unggoy combat harness"
	desc = "A combat harness made to fit an Unggoy. Placeholder."
	slowdown = SLOWDOWN_ARMOR_LIGHT

	icon = 'icons/halo/obj/items/clothing/covenant/armor.dmi'
	icon_state = "unggoy_minor"
	item_state = "unggoy_minor"

	item_icons = list(
		WEAR_JACKET = 'icons/halo/mob/humans/onmob/clothing/unggoy/armor.dmi'
	)
	allowed_species_list = list(SPECIES_UNGGOY)

	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW

	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

	valid_accessory_slots = list(ACCESSORY_SLOT_UNGGOY_BICEP, ACCESSORY_SLOT_UNGGOY_SHOULDER)
	restricted_accessory_slots = list(ACCESSORY_SLOT_UNGGOY_BICEP, ACCESSORY_SLOT_UNGGOY_SHOULDER)

/obj/item/clothing/suit/marine/unggoy/minor
	name = "Unggoy Minor combat harness"
	desc = "A combat harness designed for use by Unggoy warriors, made of a sturdy nanolaminate composite and coloured to denote the warriors rank. Thanks to the weight of the methane tank usually mounted to the harness, the actual coverage of the plating is relatively limited, only covering the chest, waist and shoulders. <b>This one indicates the wearer is an Unggoy Minor.</b>"

/obj/item/clothing/suit/marine/unggoy/major
	name = "Unggoy Major combat harness"
	desc = "A red coloured harness is the sign of an Unggoy Major, a more veteran warrior usually given charge of files of Minors. While featuring no superior protective qualities to the standard orange harness of its lessers, the Major's harness is noted to fit just a bit more comfortably and provide higher-quality methane to its user."
	desc_lore = "Minor adjustments include a more robust communications system, allowing for more efficient comms with their superiors, a noted negative by anyone who isn't an Unggoy."
	icon_state = "unggoy_major"
	item_state = "unggoy_major"

/obj/item/clothing/suit/marine/unggoy/heavy
	name = "Unggoy Heavy combat harness"
	desc = "This green combat harness denotes the wearer as a special weapons operator, from plasma cannons and shade turrets to fuel rod cannons and explosive ordinance. Features additional padding and a specific nanolaminate composition to more easily resist explosive damage in the case of enemy counter fire, or semi-common accidents."
	icon_state = "unggoy_heavy"
	item_state = "unggoy_heavy"

	armor_bomb = CLOTHING_ARMOR_VERYHIGH

/obj/item/clothing/suit/marine/unggoy/ultra
	name = "Unggoy Ultra combat harness"
	desc = "A white coloured combat harness marking its user as a Ultra, a combat veteran of many campaigns. The armour not only features vastly superior material composition in its protective qualities, but is fitted to its owner exactly, providing a comfortable fit that allows for more natural movement."
	icon_state = "unggoy_ultra"
	item_state = "unggoy_ultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/suit/marine/unggoy/deacon
	name = "Unggoy Deacon harness"
	desc = "This harness is of the highest quality, reserved for ministry personnel who serve as Deacons to their San'shyuum betters. Its many features include custom fitting and more robust mounting brackets, alongside a superior nanolaminate composite that is not only both light without sacrificing protective quality, but also may include small holographic projectors to provide reinforcement to ones sermons and duties."
	icon_state = "unggoy_deacon"
	item_state = "unggoy_deacon"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
