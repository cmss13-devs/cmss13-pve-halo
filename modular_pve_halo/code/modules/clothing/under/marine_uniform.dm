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

/obj/item/clothing/under/marine/unsc/spartan
	name = "\improper Mjolnir Mk IV Undersuit"
	desc = "The undersuit of the Mjolnir Mk IV Powered Assault Armour. Despite appearances, this thick black undersuit employs extremely advanced technology; its material composition is primarily a titanium nanoncomposite overlayer. Beneath this is an advanced gel-layer which wicks sweat and waste such as dead skin, alongside regulating body-temperature. The gel-layer also responds to kinetic strikes against it, stiffening into a barrier capable of stopping bullets and breaking blades, sections of it can be manually adjusted as needed."
	icon = 'icons/halo/obj/items/clothing/undersuit.dmi'
	icon_state = "spartan"
	item_state = "spartan"
	worn_state = "spartan"
	drop_sound = "armorequip"
	allowed_species_list = list(SPECIES_SPARTAN)
	item_state_slots = list()

	item_icons = list(
		WEAR_BODY = 'icons/halo/mob/humans/onmob/clothing/uniforms_48.dmi',
		WEAR_L_HAND = 'icons/halo/mob/humans/onmob/items_lefthand_halo.dmi',
		WEAR_R_HAND = 'icons/halo/mob/humans/onmob/items_righthand_halo.dmi'
	)
	flags_jumpsuit = null
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_VERYLOW
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_LOW
	fire_intensity_resistance = BURN_LEVEL_TIER_1
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROT
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
