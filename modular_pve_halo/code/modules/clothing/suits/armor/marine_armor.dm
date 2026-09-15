/obj/item/clothing/suit/marine/unsc
	name = "\improper M52B body armor"
	desc = "Standard-issue to the UNSC Marine Corps, the M52B armor entered service by 2531 for use in the Human Covenant war, coming with improved protection against plasma-based projectiles compared to older models."
	icon = 'icons/halo/obj/items/clothing/suits/suits_by_faction/suit_unsc.dmi'
	icon_state = "m52b"
	item_state = "m52b"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	item_icons = list(
		WEAR_JACKET = 'icons/halo/mob/humans/onmob/clothing/suits/suits_by_faction/suit_unsc.dmi')
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_DECORARMOR, ACCESSORY_SLOT_DECORGROIN, ACCESSORY_SLOT_DECORSHIN, ACCESSORY_SLOT_DECORBRACER, ACCESSORY_SLOT_DECORNECK, ACCESSORY_SLOT_PAINT, ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_PONCHO, ACCESSORY_SLOT_DECORKNEE)
	restricted_accessory_slots = list(ACCESSORY_SLOT_DECORARMOR, ACCESSORY_SLOT_DECORGROIN, ACCESSORY_SLOT_DECORBRACER, ACCESSORY_SLOT_DECORNECK, ACCESSORY_SLOT_DECORSHIN, ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_PAINT, ACCESSORY_SLOT_DECORKNEE)
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/prop/prop_gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/storage/bible,
		/obj/item/attachable/bayonet,
		/obj/item/storage/backpack/general_belt,
		/obj/item/storage/large_holster/machete,
		/obj/item/storage/belt/gun/type47,
		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/smartpistol,
		/obj/item/storage/belt/gun/flaregun,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
		/obj/item/storage/belt/gun/m39,
		/obj/item/storage/belt/gun/xm51,
		/obj/item/storage/belt/gun/m6,
		/obj/item/storage/belt/gun/m7,
	)

/obj/item/clothing/suit/marine/unsc/oni
	name = "\improper ONI M52B body armor"
	desc = "A modified variant of the standard M52B armor, used by ONI security forces. Has no significant differences in protection compared to standard issue armor, but is painted black."
	icon_state = "oni_sec"
	item_state = "oni_sec"

/obj/item/clothing/suit/marine/unsc/police
	name = "\improper police RD90 ballistic armor"
	desc = "An older model of the M52B body armor, designated as the RD90 by local police and security forces. Whilst not as comfortable, it still does the job for most of it's users, and has added protection against melee attacks."
	icon = 'icons/halo/obj/items/clothing/suits/suits_by_faction/suit_unsc.dmi'
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_DECORGROIN, ACCESSORY_SLOT_DECORBRACER, ACCESSORY_SLOT_DECORNECK, ACCESSORY_SLOT_PAINT, ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_PONCHO)
	restricted_accessory_slots = list(ACCESSORY_SLOT_DECORGROIN, ACCESSORY_SLOT_DECORBRACER, ACCESSORY_SLOT_DECORNECK, ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_PAINT)
	icon_state = "police"
	item_state = "police"
	item_icons = list(
		WEAR_JACKET = 'icons/halo/mob/humans/onmob/clothing/suits/suits_by_faction/suit_unsc.dmi')
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW

/obj/item/clothing/suit/marine/unsc/insurrection
	icon_state = "insurgent"
	item_state = "insurgent"
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW

//Halo CE plate-armor vest

/obj/item/clothing/suit/marine/unsc/forecon
	name = "\improper M65A Body Armour"
	desc = "Advanced armour system seeing limited use with Marine-Special-Forces and other specialist troops within the UNSC. The primary features of M56A are heavier and more comprehensive armour plating paired with careful material developments to increase the overall 'toughness' of the armour. Developments that have given it mild resistance to Covenant plasma weaponry."
	desc_lore = "The M65 program was developed in response to increasingly violent and drawn out close quarters urban fighting against conventional insurrection forces, which saw most armour systems in use fail under significant combat fatigue. To offset the armour's increased mass, it was designed to be paired with pre-existing cooling/infrastructure vests, providing some comfort to potentially overheating marines."
	icon_state = "forecon"
	item_state = "forecon"
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_HIGH

//Halo CE soft-armor vest

/obj/item/clothing/suit/marine/unsc/forecon_flakvest
	name = "\improper M55-TAV Flak Vest"
	desc = "The M55 Tactical Assault Vest (TAV) is a standard issue flak jacket worn by UNSC troops across most branches, either under their armour or alone. It is primarily made of ballistic soft armour materials, with rigid armour inserts covering the chest and back. The lack of significant armoring on the vest allows increased reaction times. Lacks mounting points for a webbing system, but has some pouches for holding small bits of equipment."
	desc_lore = "The real benefit of the M55 vest however is its built in cooling systems and redundant backups, like ballistic computers and a radio transceiver. This allows troopers who lose their helmet to retain combat efficiency. Thanks to the effectiveness of Covenant plasma weapons, some veterans will forgo wearing any armour at all, instead just using the M55-TAV alone."
	icon_state = "flak"
	item_state = "flak"
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_DECORARMOR, ACCESSORY_SLOT_DECORSHIN, ACCESSORY_SLOT_DECORBRACER, ACCESSORY_SLOT_PONCHO, ACCESSORY_SLOT_DECORKNEE)
	restricted_accessory_slots = list(ACCESSORY_SLOT_DECORARMOR, ACCESSORY_SLOT_DECORBRACER, ACCESSORY_SLOT_DECORSHIN, ACCESSORY_SLOT_DECORKNEE)
	var/obj/item/storage/internal/pockets
	var/storage_slots = 4

//It's redefine these here for this armor alone, or re-path the above to be a subtype of /suit/storage/marine, both are frankly a lot of tedious repetition
/obj/item/clothing/suit/marine/unsc/forecon_flakvest/Initialize()
	. = ..()
	pockets = new/obj/item/storage/internal(src)
	pockets.storage_slots = storage_slots
	pockets.max_w_class = SIZE_SMALL //fit only small items
	pockets.max_storage_space = 4

/obj/item/clothing/suit/marine/unsc/forecon_flakvest/Destroy()
	QDEL_NULL(pockets)
	return ..()

/obj/item/clothing/suit/marine/unsc/forecon_flakvest/get_pockets()
	if(pockets)
		return pockets
	return ..()

/obj/item/clothing/suit/marine/unsc/forecon_flakvest/attack_hand(mob/user, mods)
	if(loc != user)
		..(user) // If it's in a box (e.g. SG or spec gear), don't click the pockets pls
		return

	if(pockets.handle_attack_hand(user, mods))
		..(user)

/obj/item/clothing/suit/marine/unsc/forecon_flakvest/MouseDrop(obj/over_object)
	if (pockets.handle_mousedrop(usr, over_object))
		..(over_object)

/obj/item/clothing/suit/marine/unsc/forecon_flakvest/attackby(obj/item/W, mob/user)
	. = ..()
	if(!.) //To prevent bugs with accessories being moved into storage slots after being attached.
		return pockets.attackby(W, user)

/obj/item/clothing/suit/marine/unsc/forecon_flakvest/emp_act(severity)
	. = ..()
	pockets.emp_act(severity)

//ODST armor & subtypes

/obj/item/clothing/suit/marine/unsc/odst
	name = "\improper M70DT ODST BDU"
	desc = "The sum total of the ODST's armour complex, simply called 'Battle-Dress-Uniform'. Designed for several environments, be it in vacuum with its 30 minutes of air, in the racket of a SOEIV or the clamour of a battlefield; this BDU is ready for it all. Consists of heat-dispersing and vacuum rated body glove, and the armour worn over it, which reflects heat and bullets quite well. Do not test shock absorption for recreation."
	icon_state = "odst"
	item_state = "odst"
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_HIGH

/obj/item/clothing/suit/marine/unsc/odst/oni
	name = "\improper M70DT/S ODST BDU"
	desc = "Utilized by ONI security forces and field agents, this is a slightly modified variant of the ODST M70DT BDU."
	icon_state = "onist"
	item_state = "onist"

/obj/item/clothing/suit/marine/unsc/odst/insurrection
	name = "\improper scavenged M70DT ODST BDU"
	icon_state = "odst_insurgent"
	item_state = "odst_insurgent"
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_PAINT, ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_PONCHO)
	restricted_accessory_slots = list(ACCESSORY_SLOT_DECORGROIN, ACCESSORY_SLOT_DECORBRACER, ACCESSORY_SLOT_DECORNECK, ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_PAINT, ACCESSORY_SLOT_DECORBRACER)
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
