
/obj/item/clothing/suit/storage/marine/halo
	name = "Halo armor holder"

/obj/item/clothing/head/helmet/marine/halo/
	name = "Halo helmet holder"

/obj/item/clothing/under/marine/halo
	name = "Halo undersuit holder"

// -- Halo Undersuits --
/obj/item/clothing/under/marine/halo/marine
	name = "UNSC Marine BDU"
	desc = "A tan-colored BDU for the UNSC Marine Corps. It comes with strap-points for the M52B body armor and is fitted with additional layers to protect against plasma strikes."
	icon = 'icons/mob/humans/onmob/uniform_halo.dmi'
	icon_state = "marine_bdu"
	item_state = "marine_bdu"
	worn_state = "marine_bdu"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/uniform_halo.dmi'
	)

// -- Halo Armor --

/obj/item/clothing/suit/storage/marine/halo/marine
	name = "M52B body armor"
	desc = "Lightweight and durable, the M52B body armor is standard issue to the UNSC Marine Corps, coming equipped with attachment points for a variety of storage solutions."
	icon = 'icons/mob/humans/onmob/suit_halo.dmi'
	icon_state = "marine_armor"
	item_state = "marine_armor"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/suit_halo.dmi'
	)

// -- Halo Helmets --

/obj/item/clothing/head/helmet/marine/halo/marine
	name = "CH252 helmet"
	desc = "The primary combat helmet for the UNSC Marine Corps. Too many variations exist to count, but they are all reliable."
	icon = 'icons/mob/humans/onmob/head_halo.dmi'
	icon_state = "marine_helmet"
	item_state = "marine_helmet"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	item_icons = list(
		WEAR_HEAD = 'icons/mob/humans/onmob/head_halo.dmi'
	)


// -- Halo Glasses --
/obj/item/clothing/glasses/sunglasses/big/hudglasses
	name = "ballistic shooting glasses"
	desc = "A pair of orange ballistic shooting glasses intended to be used for intense engagements. Some models even come with an in-built motion tracker linked with the armor systems. The only thing this pair does however, is interface with your gun's sights."
	icon = 'icons/obj/items/halo/halo_objects.dmi'
	icon_state = "hudglasses"
	item_state = "hudglasses"
	item_icons = list(
		WEAR_EYES = 'icons/mob/humans/onmob/eyes_halo.dmi',
		WEAR_FACE = 'icons/mob/humans/onmob/eyes_halo.dmi'
	)
