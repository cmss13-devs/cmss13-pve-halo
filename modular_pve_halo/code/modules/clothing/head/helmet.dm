/obj/item/clothing/head/helmet/marine/unsc
	name = "\improper CH252 helmet"
	desc = "The standard issue ballistic helmet in use by the UNSC's Army and Marine Corps. Latest technologies rate this helmet very strong against most conventional human weaponry, while still providing a comfortable platform for a trooper's communications and HUD/Smartlink systems."
	icon = 'icons/halo/obj/items/clothing/hats/hats_by_faction/hat_unsc.dmi'
	icon_state = "helmet_2"
	item_state = "helmet_2"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	built_in_visors = null
	start_down_visor_type = null
	item_icons = list(
		WEAR_HEAD = 'icons/halo/mob/humans/onmob/clothing/hats/hats_by_faction/hat_unsc.dmi'
	)
	var/motion_tracker = FALSE

/obj/item/clothing/head/helmet/marine/unsc/Initialize(mapload, list/new_protection)
	. = ..()
	if(motion_tracker)
		AddComponent(/datum/component/motion_tracker_manager)

/obj/item/clothing/head/helmet/marine/unsc/motion
	name = "\improper CH252-M helmet"
	desc = "The standard issue ballistic helmet in use by the UNSC's Army and Marine Corps. Latest technologies rate this helmet very strong against most conventional human weaponry, while still providing a comfortable platform for a trooper's communications and HUD/Smartlink systems. This one comes with a motion tracker."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/marine/unsc/variant_2
	name = "\improper CH252/UA helmet"
	desc = "Reinforced variant of the standard CH252 ballistic helmet given to Army and Marine Corps troops. Features an up-armoured module, providing greater protection along the forward arc of the helmet. Thanks to material enhancements it is only moderately heavier than the standard. The helmet retains the same communication and HUD/Smartlink equipment as the CH252."
	icon_state = "helmet"
	item_state = "helmet"

/obj/item/clothing/head/helmet/marine/unsc/variant_2/motion
	name = "\improper CH252/UA-M helmet"
	desc = "Reinforced variant of the standard CH252 ballistic helmet given to Army and Marine Corps troops. Features an up-armoured module, providing greater protection along the forward arc of the helmet. Thanks to material enhancements it is only moderately heavier than the standard. The helmet retains the same communication and HUD/Smartlink equipment as the CH252."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/marine/unsc/enclosed
	name = "\improper CH299 helmet"
	desc = "An enclosed helmet modeled after the CH252. Although it greatly resembles ODST helmets, it lacks many of their advanced capabilities and is instead primarily used in lightly hazardous environments or extreme weather conditions."
	icon_state = "enclosed"
	item_state = "enclosed"
	flags_atom = ALLOWINTERNALS|NO_SNOW_TYPE|NO_NAME_OVERRIDE|BLOCKGASEFFECT|ALLOWREBREATH|ALLOWCPR
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR

/obj/item/clothing/head/helmet/marine/unsc/forecon
	name = "\improper CH288 Helmet"
	desc = "Reinforced combat helmet built from the ground up as part of the expensive M65 program. This helmet has been given superior armour composition and more significant hardening of precision electronics against conventional and electronic damage. Fits snugly, if a little heavy."
	desc_lore = "The CH288 is similar to its older CH252 sibling in form and function, but features many stark differences in internal construction and materials. While considered heavier than the standard helmet, enough for troops to consistently complain, it remains popular with those that can get their hands on it thanks to its greater deal of protection, and its plusher fit."
	icon_state = "forecon"
	item_state = "forecon"
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_HIGH

/obj/item/clothing/head/helmet/marine/unsc/forecon/motion
	name = "\improper CH288-M Helmet"
	desc = "Reinforced combat helmet built from the ground up as part of the expensive M65 program. This helmet has been given superior armour composition and more significant hardening of precision electronics against conventional and electronic damage. Fits snugly, if a little heavy. This one has a motion tracker."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/marine/unsc/forecon/enclosed
	name = "\improper ECH288 Helmet"
	desc = "The ECH288 is similar in all ways to the common CH288 helmet, save for its inclusion of an enclosed face covering visor, providing superior all around protection. The ECH288 also includes air filtration and a 15 minute emergency oxygen supply."
	desc_lore = "The ECH288 has seen adoption by UNSC Marine VBSS teams and even some ODST units which have yet to be equipped with their newer generation equipment, some still preferring the mythic reputation of the 'cruder' armour systems."
	icon_state = "forecon_enclosed"
	item_state = "forecon_enclosed"
	flags_atom = ALLOWINTERNALS|NO_SNOW_TYPE|NO_NAME_OVERRIDE|BLOCKGASEFFECT|ALLOWREBREATH|ALLOWCPR
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR

/obj/item/clothing/head/helmet/marine/unsc/forecon/enclosed/motion
	name = "\improper ECH288-M Helmet"
	desc = "The ECH288 is similar in all ways to the common CH288 helmet, save for its inclusion of an enclosed face covering visor, providing superior all around protection. The ECH288 also includes air filtration and a 15 minute emergency oxygen supply. This one has a motion tracker."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/marine/unsc/pilot
	name = "\improper FH400 Pilot Helmet"
	desc = "Standard issue flight helmet for UNSC dropship pilots, uses a conventional HUD visor which automatically interfaces with whatever vehicle it finds itself in. The classic FH400 pilot helmet has remained largely unchanged in over a hundred years, outside of regular hardware and software updates, which is a testament to its enduring legacy."
	icon_state = "pilot_3"
	item_state = "pilot_3"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/marine/unsc/pilot/weapons_operator
	name = "\improper FH400/WS Pilot Helmet"
	desc = "A standard flight helmet in use with the UNSC Marines, modified with an alternate WS (Weapon-Systems) module. The WS module allows for seamless integration with the aircraft's weaponry, defensive systems and sensors, while allowing the WSO to isolate themselves from unnecessary visual clutter."
	desc_lore = "While nominally seen in use by marine weapon system officers, the advanced interface systems and clear imaging provided by the blockier HUD unit has seen it also assigned to UNSC escape craft, which may require extreme maneuvers by their pilots. For the same reason it has also become unofficially popular with some regular pilots as well."
	icon_state = "pilot_2"
	item_state = "pilot_2"

/obj/item/clothing/head/helmet/marine/unsc/pilot/navy
	name = "\improper FH640 Pilot Helmet"
	desc = "The UNSC Navy's primary flight helmet assigned to nearly all combat pilots. Features top of the line hardware and software including proprietary VISR versions and 45 minutes of emergency rebreathing capability, alongside general comfort considerations like active-cooling. Cozy."
	desc_lore = "Developed in response to mounting demands by Navy combat pilots during the height of the Insurrection for a new helmet that was both advanced enough to keep up with the realities of pitched small craft combat and able to protect its wearer more readily in the event of a worse case scenario. Thanks to its success in both categories it has also become one of the most commonly stolen items when considering cross-branch theft."
	icon_state = "pilot"
	item_state = "pilot"
	flags_atom = ALLOWINTERNALS|NO_SNOW_TYPE|NO_NAME_OVERRIDE|BLOCKGASEFFECT|ALLOWREBREATH|ALLOWCPR
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR

/obj/item/clothing/head/helmet/marine/unsc/police
	name = "\improper police CH252/UA helmet"
	desc = "Standard-issue helmet to the UNSC Marine Corps, this one given to the local police and security forces across the colonies for riot suppression during the days of the insurrection."
	icon_state = "police"
	item_state = "police"

/obj/item/clothing/head/helmet/marine/unsc/insurrection
	icon_state = "insurgent_2"
	item_state = "insurgent_2"

/obj/item/clothing/head/helmet/marine/unsc/insurrection/variant_2
	name = "\improper CH252/UA helmet"
	desc = "Reinforced variant of the standard CH252 ballistic helmet given to Army and Marine Corps troops. Features an up-armoured module, providing greater protection along the forward arc of the helmet. Thanks to material enhancements it is only moderately heavier than the standard. The helmet retains the same communication and HUD/Smartlink equipment as the CH252."
	icon_state = "insurgent"
	item_state = "insurgent"


/obj/item/clothing/head/helmet/marine/unsc/oni
	name = "\improper ONI CH252 helmet"
	desc = "Standard-issue helmet to the UNSC Marine Corps. Various attachment points on the helmet allow for various equipment to be fitted to the helmet. This particular variant is used by ONI Security Forces, featuring a distinct black colour scheme."
	icon_state = "oni"
	item_state = "oni"

/obj/item/clothing/head/helmet/marine/unsc/oni/motion
	name = "\improper ONI CH252-M helmet"
	desc = "An upgraded helmet of the UNSC Marine Corps, with a motion tracker. Various attachment points on the helmet allow for various equipment to be fitted to the helmet. This particular variant is used by ONI Security Forces, featuring a distinct black colour scheme."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/marine/unsc/odst
	name = "\improper CH381 ODST helmet"
	desc = "An iconic helmet, designed for use by Orbital-Drop-Shock-Troopers of the UNSC's Marine Corps' Special Forces. An advanced piece of equipment featuring various benefits: a polarizing visor, VISR optical software, reinforced COM unit, fully sealed environment, and a nice black finish. Commonly defaced with crude graffiti by bored helljumpers."
	icon_state = "odst"
	item_state = "odst"

	flags_atom = ALLOWINTERNALS|NO_SNOW_TYPE|NO_NAME_OVERRIDE|BLOCKGASEFFECT|ALLOWREBREATH|ALLOWCPR
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_HIGH

/obj/item/clothing/head/helmet/marine/unsc/odst/motion
	name = "\improper CH381-M ODST helmet"
	desc = "An iconic helmet, designed for use by Orbital-Drop-Shock-Troopers of the UNSC's Marine Corps' Special Forces. An advanced piece of equipment featuring various benefits: a polarizing visor, VISR optical software, reinforced COM unit, fully sealed environment, a motion tracker, and a nice black finish. Commonly defaced with crude graffiti by bored helljumpers."
	motion_tracker = TRUE

/obj/item/clothing/head/helmet/marine/unsc/odst/oni
	name = "\improper CH299/S helmet"
	icon_state = "enclosed_oni"
	item_state = "enclosed_oni"
	desc = "A heavily modified variant of a standard helmet, developed for use by UEG strategic security personnel and the Office of Naval Intelligence. Modifications are primarily focused on a fully enclosed design with polarizing visor and an overall reinforced frame. Secondary modifications include advanced encryption/comms gear and proprietary VISR versions."
	motion_tracker = TRUE

/obj/item/clothing/head/uppcap/ushanka
	name = "\improper ushanka"
	desc = "An old-style cold weather hat favored by those hailing from old Russia, Eastern Europe, or colonies founded by settlers from there."
