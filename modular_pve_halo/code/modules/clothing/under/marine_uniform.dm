/obj/item/clothing/under/marine/unsc
	name = "\improper UNSC uniform"
	desc = "Standard-issue UNSC uniform."
	icon = 'icons/halo/obj/items/clothing/undersuit.dmi'
	icon_state = "marine"
	item_state = "marine"
	worn_state = "marine"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	item_icons = list(
		WEAR_BODY = 'icons/halo/mob/humans/onmob/clothing/uniforms.dmi')

/obj/item/clothing/under/marine/unsc/Initialize() //Needed because otherwise the game freaks out and thinks it isn't rollable because of different icon .dmis, something that'll be fixed on upstream merge I'm sure.
	. = ..()
	flags_jumpsuit += UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE|UNIFORM_SLEEVE_CUTTABLE

/obj/item/clothing/under/marine/unsc/odst
	name = "\improper ODST bodyglove"
	icon_state = "odst"
	worn_state = "odst"
	flags_jumpsuit = null

/obj/item/clothing/under/marine/unsc/odst/oni
	name = "\improper ONI bodyglove"
	icon_state = "secfor_onist"
	worn_state = "secfor_onist"

/obj/item/clothing/under/marine/unsc/odst/Initialize() //Needed because otherwise the game freaks out and thinks it isn't rollable because of different icon .dmis, something that'll be fixed on upstream merge I'm sure.
    . = ..()
    flags_jumpsuit = null

/obj/item/clothing/under/marine/unsc/forecon
	name = "\improper UNSC recon uniform"
	icon_state = "forecon"
	worn_state = "forecon"

/obj/item/clothing/under/marine/unsc/oni
	name = "\improper ONI security forces uniform"
	icon_state = "secfor"
	worn_state = "secfor"
