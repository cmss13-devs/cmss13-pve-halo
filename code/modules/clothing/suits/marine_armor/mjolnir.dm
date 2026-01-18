/obj/item/clothing/suit/marine/unsc/mjolnir
	name = "\improper Mjolnir Mk IV armour"
	desc = "This is the main complex of the Mjolnir Mk IV Powered Assault Armour. A fully sealed and EVA capable green coloured set of armour which provides its wearer vastly improved physical capabilities through its active-powered-systems, though it requires the wearer be a Spartan. Its multilayer alloy is comparable to Titanium-A Battleplate used on starships, and features a refractive coating that can dispel a small amount of the energy from Covenant weapons. Its powered by a micro-fusion generator and costs about as much as a battlegroup of Frigates too."
	icon = 'icons/halo/obj/items/clothing/suits/suits_by_faction/suit_48.dmi'
	icon_state = "mk_iv"
	item_state = "mk_iv"

	item_icons = list(
		WEAR_JACKET = 'icons/halo/mob/humans/onmob/clothing/suits/suits_by_faction/suit_48.dmi'
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS|BODY_FLAG_HANDS|BODY_FLAG_FEET
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS|BODY_FLAG_HANDS|BODY_FLAG_FEET
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS|BODY_FLAG_HANDS|BODY_FLAG_FEET
	allowed_species_list = list(SPECIES_SPARTAN)
	slowdown = SLOWDOWN_ARMOR_NONE
	armor_melee = CLOTHING_ARMOR_GIGAHIGH
	armor_bullet = CLOTHING_ARMOR_GIGAHIGH
	armor_laser = CLOTHING_ARMOR_GIGAHIGH
	armor_bomb = CLOTHING_ARMOR_GIGAHIGH
	armor_internaldamage = CLOTHING_ARMOR_GIGAHIGH
	var/armor_status = 100

/obj/item/clothing/suit/marine/unsc/mjolnir/proc/armor_check()
	var/new_stat
	switch(armor_status)
		if(80 to 100)
			new_stat = CLOTHING_ARMOR_GIGAHIGH
		if(50 to 80)
			new_stat = CLOTHING_ARMOR_VERYHIGH
		if(20 to 50)
			new_stat = CLOTHING_ARMOR_HIGHPLUS
		if(0 to 20)
			new_stat = CLOTHING_ARMOR_MEDIUM
