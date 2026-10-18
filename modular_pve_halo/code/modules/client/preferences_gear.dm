#define GEAR_DISABLED null
/*
// Overrides to loadout gear.
// Gear is sometimes disabled via the use of `display_name = GEAR_DISABLED`
*/

/*
//================================================
				Eyewear
//================================================
*/

/datum/gear/eyewear/rpg_glasses
	allowed_origins = FACTION_ORIGINS

/datum/gear/eyewear/bimex_shades
	display_name = "Tactical Shades"
	allowed_origins = FACTION_ORIGINS

/datum/gear/eyewear/bimex_shades_orange
	display_name = "Orange Tactical Shades"
	allowed_origins = FACTION_ORIGINS

/datum/gear/eyewear/bimex_shades_classic
	display_name = "Ballistic Aviator Shades"
	allowed_origins = FACTION_ORIGINS

/datum/gear/eyewear/sunglasses
	cost = 2

/datum/gear/eyewear/pilot_visor_black
	display_name = GEAR_DISABLED

/datum/gear/eyewear/pilot_visor_yellow
	display_name = GEAR_DISABLED

/*
//================================================
				Masks & Scarves
//================================================
*/

/datum/gear/mask/balaclava_black
	path = /obj/item/clothing/mask/rebreather/scarf

/datum/gear/mask/balaclava_green
	path = /obj/item/clothing/mask/rebreather/scarf/green

/datum/gear/mask/balaclava_threehole
	display_name = GEAR_DISABLED

/datum/gear/mask/balaclava_grey
	display_name = "Balaclava, grey"
	path = /obj/item/clothing/mask/rebreather/scarf/gray

/datum/gear/mask/balaclava_tan
	display_name = "Balaclava, tan"
	path = /obj/item/clothing/mask/rebreather/scarf/tan

/datum/gear/mask/coif
	display_name = GEAR_DISABLED

/datum/gear/mask/gas
	display_name = GEAR_DISABLED

/datum/gear/mask/uscm/balaclava_green
	display_name = GEAR_DISABLED

/datum/gear/mask/uscm/balaclava_grey
	display_name = GEAR_DISABLED

/datum/gear/mask/uscm/balaclava_tan
	display_name = GEAR_DISABLED

/datum/gear/mask/uscm/skull_balaclava_blue
	display_name = GEAR_DISABLED

/datum/gear/mask/uscm/skull_balaclava_black
	display_name = GEAR_DISABLED

/*
//================================================
				Headwear
//================================================
*/

/datum/gear/headwear/durag_black
	cost = 2

/datum/gear/headwear/durag
	cost = 2

/datum/gear/headwear/uscm/bandana_green
	display_name = GEAR_DISABLED

/datum/gear/headwear/bandana_green
	display_name = "bandana, green"
	path = /obj/item/clothing/head/cmbandana
	cost = 2

/datum/gear/headwear/uscm/bandana_tan
	display_name = GEAR_DISABLED

/datum/gear/headwear/bandana_tan
	display_name = "bandana, tan"
	path = /obj/item/clothing/head/cmbandana/tan
	cost = 2

/datum/gear/headwear/beanie_black
	display_name = "beanie, black"
	path = /obj/item/clothing/head/beanie/royal_marine
	cost = 2

/datum/gear/headwear/uscm/beanie_grey
	display_name = GEAR_DISABLED

/datum/gear/headwear/beanie_grey
	display_name = "beanie, grey"
	path = /obj/item/clothing/head/beanie/gray
	cost = 2

/datum/gear/headwear/uscm/beanie_green
	display_name = GEAR_DISABLED

/datum/gear/headwear/beanie_green
	display_name = "beanie, green"
	path = /obj/item/clothing/head/beanie/green
	cost = 2

/datum/gear/headwear/uscm/beanie_tan
	display_name = GEAR_DISABLED

/datum/gear/headwear/beanie_tan
	display_name = "beanie, tan"
	path = /obj/item/clothing/head/beanie/tan
	cost = 2

/datum/gear/headwear/uscm/boonie_jungle
	display_name = GEAR_DISABLED

/datum/gear/headwear/boonie_jungle
	display_name = "boonie hat, jungle"
	path = /obj/item/clothing/head/cmcap/boonie

/datum/gear/headwear/uscm/boonie_desert
	display_name = GEAR_DISABLED

/datum/gear/headwear/boonie_desert
	display_name = "boonie hat, desert"
	path = /obj/item/clothing/head/cmcap/boonie/tan

/datum/gear/headwear/uscm/boonie_snow
	display_name = GEAR_DISABLED

/datum/gear/headwear/boonie_snow
	display_name = "boonie hat, snow"
	path = /obj/item/clothing/head/cmcap/boonie/snow

/datum/gear/headwear/uscm/cap
	display_name = GEAR_DISABLED

/datum/gear/headwear/cap
	display_name = "utility cap, jungle"
	path = /obj/item/clothing/head/cmcap

/datum/gear/headwear/uscm/cap_desert
	display_name = GEAR_DISABLED

/datum/gear/headwear/cap_desert
	display_name = "utility cap, desert"
	path = /obj/item/clothing/head/cmcap/desert

/datum/gear/headwear/uscm/cap_snow
	display_name = GEAR_DISABLED

/datum/gear/headwear/cap_snow
	display_name = "utility cap, snow"

	path = /obj/item/clothing/head/cmcap/snow

/datum/gear/headwear/uscm/cap_operations
	display_name = GEAR_DISABLED

/datum/gear/headwear/cap_operations
	display_name = "UNSC Operations Cap, Green"
	path = /obj/item/clothing/head/cmcap/bridge

/datum/gear/headwear/uscm/cap_operations2
	display_name = GEAR_DISABLED

/datum/gear/headwear/cap_operations2
	display_name = "UNSC Operations Cap, Tan"
	path = /obj/item/clothing/head/cmcap/bridge/tan

/datum/gear/headwear/uscm/cap/sulaco
	display_name = GEAR_DISABLED

/datum/gear/headwear/uscm/cap/flap_jungle
	display_name = GEAR_DISABLED

/datum/gear/headwear/cap/flap_jungle
	display_name = "UNSC expedition flapcap, jungle"
	path = /obj/item/clothing/head/cmcap/flap

/datum/gear/headwear/uscm/cap/flap_desert
	display_name = GEAR_DISABLED

/datum/gear/headwear/cap/flap_desert
	display_name = "UNSC expedition flapcap, desert"
	path = /obj/item/clothing/head/cmcap/flap/desert

/datum/gear/headwear/uscm/cap/flap_snow
	display_name = GEAR_DISABLED

/datum/gear/headwear/cap/flap_snow
	display_name = "UNSC expedition flapcap, snow"
	path = /obj/item/clothing/head/cmcap/flap/snow

/datum/gear/headwear/uscm/headband_brown
	display_name = GEAR_DISABLED

/datum/gear/headwear/headband_brown
	display_name = "headband, brown"
	path = /obj/item/clothing/head/headband/brown
	cost = 2

/datum/gear/headwear/uscm/headband_green
	display_name = GEAR_DISABLED

/datum/gear/headwear/headband_green
	display_name = "headband, green"
	path = /obj/item/clothing/head/headband
	cost = 2

/datum/gear/headwear/uscm/headband_grey
	display_name = GEAR_DISABLED

/datum/gear/headwear/headband_grey
	display_name = "headband, grey"
	path = /obj/item/clothing/head/headband/gray
	cost = 2

/datum/gear/headwear/uscm/headband_red
	display_name = GEAR_DISABLED

/datum/gear/headwear/headband_red
	display_name = "headband, red"
	path = /obj/item/clothing/head/headband/red
	cost = 2

/datum/gear/headwear/uscm/headband_tan
	display_name = GEAR_DISABLED

/datum/gear/headwear/headband_tan
	display_name = "headband, tan"
	path = /obj/item/clothing/head/headband/tan
	cost = 2

/datum/gear/headwear/uscm/headband_intel
	display_name = GEAR_DISABLED

/datum/gear/headwear/headband_intel
	display_name = "headband, black"
	path = /obj/item/clothing/head/headband/intel
	cost = 2

/datum/gear/headwear/uscm/headband_bravo
	display_name = GEAR_DISABLED

/datum/gear/headwear/headband_bravo
	display_name = "headband, orange"
	path = /obj/item/clothing/head/headband/bravo
	cost = 2

/datum/gear/headwear/uscm/headband_charlie
	display_name = GEAR_DISABLED

/datum/gear/headwear/headband_charlie
	display_name = "headband, purple"
	path = /obj/item/clothing/head/headband/charlie
	cost = 2

/datum/gear/headwear/uscm/headband_delta
	display_name = GEAR_DISABLED

/datum/gear/headwear/headband_delta
	display_name = "headband, blue"
	path = /obj/item/clothing/head/headband/delta
	cost = 2

/datum/gear/headwear/uscm/headband_echo
	display_name = GEAR_DISABLED

/datum/gear/headwear/headband_echo
	display_name = "headband, cyan green"
	path = /obj/item/clothing/head/headband/echo
	cost = 2

/datum/gear/headwear/uscm/headband_brown
	display_name = GEAR_DISABLED

/datum/gear/headwear/uscm/headset
	display_name = GEAR_DISABLED

/datum/gear/headwear/headset
	display_name = "UNSC headset"
	path = /obj/item/clothing/head/headset
	cost = 2

/datum/gear/headwear/uscm/beret_white
	display_name = GEAR_DISABLED

/datum/gear/headwear/uscm/beret_alpha
	display_name = GEAR_DISABLED

/datum/gear/headwear/uscm/beret_bravo
	display_name = GEAR_DISABLED

/datum/gear/headwear/uscm/beret_charlie
	display_name = GEAR_DISABLED

/datum/gear/headwear/uscm/beret_delta
	display_name = GEAR_DISABLED

/datum/gear/headwear/uscm/beret_echo
	display_name = GEAR_DISABLED

/datum/gear/headwear/uscm/beret_foxtrot
	display_name = GEAR_DISABLED

/datum/gear/headwear/uscm/beret_intel
	display_name = GEAR_DISABLED

/datum/gear/headwear/upp/cap
	display_name = GEAR_DISABLED

/datum/gear/headwear/upp/boonie
	display_name = GEAR_DISABLED

/datum/gear/headwear/upp/ushanka
	display_name = GEAR_DISABLED

/datum/gear/headwear/ushanka
	display_name = "Ushanka"
	path = /obj/item/clothing/head/uppcap/ushanka
	cost = 2

/datum/gear/headwear/rmc/beanie
	display_name = GEAR_DISABLED

/datum/gear/headwear/rmc/turban
	display_name = GEAR_DISABLED

/datum/gear/headwear/beret_red
	display_name = GEAR_DISABLED

/datum/gear/headwear/beret_black
	display_name = GEAR_DISABLED

/*
//================================================
				Helmet Accessories
//================================================
*/

/datum/gear/helmet_garb/flair_uscm
	display_name = GEAR_DISABLED

/datum/gear/helmet_garb/netting
	display_name = GEAR_DISABLED

/datum/gear/helmet_garb/broken_nvgs
	display_name = GEAR_DISABLED

/datum/gear/helmet_garb/prescription_bottle
	display_name = GEAR_DISABLED

/datum/gear/helmet_garb/raincover
	display_name = GEAR_DISABLED

/datum/gear/helmet_garb/trimmed_wire
	display_name = GEAR_DISABLED

/datum/gear/helmet_garb/bullet_pipe
	display_name = GEAR_DISABLED

/datum/gear/helmet_garb/chaplain_patch
	display_name = GEAR_DISABLED

/*
//================================================
				Clothing
//================================================
*/

/datum/gear/clothing/shotgun_holster_belt
	display_name = GEAR_DISABLED

/datum/gear/clothing/flak
	display_name = "vintage flak jacket (Blue)"
	allowed_origins = FACTION_ORIGINS

/datum/gear/clothing/flak/od
	display_name = "vintage flak jacket (Green)"

/datum/gear/clothing/service_jacket
	display_name = "UNSC service jacket"
	allowed_origins = FACTION_ORIGINS

/datum/gear/clothing/upp_service_jacket
	display_name = GEAR_DISABLED

/datum/gear/clothing/shorts
	display_name = GEAR_DISABLED

/*
//================================================
				Armor & Body Paints
//================================================
*/

/datum/gear/paint/paint_sg
	display_name = GEAR_DISABLED

/datum/gear/paint/paint_skull
	display_name = GEAR_DISABLED

/datum/gear/paint/paint_heart
	display_name = GEAR_DISABLED

/datum/gear/paint/uaflag
	display_name = GEAR_DISABLED

/datum/gear/paint/usflag
	display_name = GEAR_DISABLED

/datum/gear/paint/target
	display_name = GEAR_DISABLED

/datum/gear/paint/smiley
	display_name = GEAR_DISABLED

/datum/gear/paint/neutral
	display_name = GEAR_DISABLED

/datum/gear/paint/cross
	display_name = GEAR_DISABLED

/datum/gear/paint/pandora
	display_name = GEAR_DISABLED

/datum/gear/paint/flames
	display_name = GEAR_DISABLED

/datum/gear/paint/facepaint_green
	display_name = GEAR_DISABLED

/datum/gear/paint/facepaint_brown
	display_name = GEAR_DISABLED

/datum/gear/paint/facepaint_black
	display_name = GEAR_DISABLED

/datum/gear/paint/facepaint_skull
	display_name = GEAR_DISABLED

/datum/gear/paint/facepaint_body
	display_name = GEAR_DISABLED

/*
//================================================
				Paperwork
//================================================
*/

/*
//================================================
				Recreational
//================================================
*/

/datum/gear/toy/mags
	allowed_origins = FACTION_ORIGINS

/datum/gear/toy/mags/boots/boots_magazine_one
	display_name = GEAR_DISABLED

/datum/gear/toy/mags/boots/boots_magazine_two
	display_name = GEAR_DISABLED

/datum/gear/toy/mags/boot_magazine_three
	display_name = GEAR_DISABLED

/datum/gear/toy/mags/boots/boots_magazine_four
	display_name = GEAR_DISABLED

/datum/gear/toy/mags/boots/boots_magazine_five
	display_name = GEAR_DISABLED

/datum/gear/toy/card
	allowed_origins = FACTION_ORIGINS

/datum/gear/toy/card/trading_card
	display_name = GEAR_DISABLED

/datum/gear/toy/trading_card
	display_name = GEAR_DISABLED

/*
//================================================
				Cassettes
//================================================
*/

/*
//================================================
				Plushies
//================================================
*/

/datum/gear/plush
	category = GEAR_DISABLED

/*
//================================================
				Weapons
//================================================
*/

/datum/gear/weapon/bayonet
	display_name = "M5 combat knife"

/datum/gear/weapon/kabar
	display_name = "MK88 Ratio survival knife"

/datum/gear/weapon/bowie
	display_name = "Model 52 Navy knife"

/datum/gear/weapon/kukri
	display_name = "Kukri utility knife"
	allowed_origins = FACTION_ORIGINS

/datum/gear/weapon/baker
	display_name = "M11 combat knife"

/datum/gear/weapon/chinese
	display_name = "Colonial Military Authority M2 bayonet"
	allowed_origins = FACTION_ORIGINS

/datum/gear/weapon/type_80_Bayonet
	display_name = GEAR_DISABLED

/datum/gear/weapon/m8_cartridge_bayonet
	display_name = GEAR_DISABLED

/datum/gear/weapon/clfpistol
	display_name = GEAR_DISABLED

/datum/gear/weapon/t73
	display_name = GEAR_DISABLED

/datum/gear/weapon/zhnk72
	display_name = GEAR_DISABLED

/datum/gear/weapon/m4a3_custom
	display_name = GEAR_DISABLED

/datum/gear/weapon/m1911
	display_name = GEAR_DISABLED

/datum/gear/weapon/m44
	display_name = GEAR_DISABLED

/datum/gear/weapon/m44_custom_revolver
	display_name = GEAR_DISABLED

/datum/gear/weapon/hg45_civilian
	display_name = GEAR_DISABLED

/datum/gear/weapon/hg45_marine
	display_name = GEAR_DISABLED

/datum/gear/weapon/hg44
	display_name = GEAR_DISABLED

/datum/gear/weapon/spearhead
	display_name = GEAR_DISABLED

/datum/gear/weapon/spearhead_custom
	display_name = GEAR_DISABLED

/datum/gear/weapon/l54
	display_name = GEAR_DISABLED

/datum/gear/weapon/m9
	display_name = GEAR_DISABLED

/datum/gear/weapon/vp78
	display_name = GEAR_DISABLED

/datum/gear/weapon/m2100_machete
	display_name = GEAR_DISABLED

/*
//================================================
				Canned Drinks
//================================================
*/

/datum/gear/drink
	allowed_origins = FACTION_ORIGINS

/datum/gear/drink/lemon_lime
	display_name = "BLAST lemon-lime soda"

/datum/gear/drink/cola
	display_name = "Coca-Cola"

/datum/gear/drink/mountain_wind
	display_name = GEAR_DISABLED

/datum/gear/drink/space_up
	display_name = "7-UP lemonade"

/datum/gear/drink/souto_classic
	display_name = GEAR_DISABLED

/datum/gear/drink/souto_diet
	display_name = GEAR_DISABLED

/datum/gear/drink/bepis
	display_name = "Pepsi"
	path = /obj/item/reagent_container/food/drinks/cans/pepsi

/datum/gear/drink/boda
	display_name = GEAR_DISABLED

/datum/gear/drink/boda/plus
	display_name = GEAR_DISABLED

/datum/gear/drink/alcohol/ale
	display_name = GEAR_DISABLED

/datum/gear/drink/alcohol/aspen
	display_name = GEAR_DISABLED

/datum/gear/drink/alcohol/beer
	display_name = GEAR_DISABLED

/datum/gear/drink/alcohol/loko
	display_name = GEAR_DISABLED

/datum/gear/drink/orange_soda
	display_name = "Oranj Soda"
	path = /obj/item/reagent_container/food/drinks/cans/starkist

/*
//================================================
				Flasks
//================================================
*/

/datum/gear/flask/uscm
	display_name = GEAR_DISABLED

/datum/gear/flask/wy
	display_name = GEAR_DISABLED

/*
//================================================
				Sweet Foods
//================================================
*/

/*
//================================================
				Packaged Foods
//================================================
*/

/datum/gear/snack_packaged
	allowed_origins = FACTION_ORIGINS

/datum/gear/snack_packaged/chips_pepper
	display_name = "Pepper Chips"

/*
//================================================
				Healthy Foods
//================================================
*/

/*
//================================================
				Smoking
//================================================
*/

/datum/gear/smoking
	allowed_origins = FACTION_ORIGINS

/datum/gear/smoking/cigarette/cigar_classic
	display_name = "Sweet William cigar"
	path = /obj/item/clothing/mask/cigarette/cigar

/datum/gear/smoking/cigarette/cigar_premium
	display_name = "Generic cigar"
	path = /obj/item/clothing/mask/cigarette/cigar/classic

/datum/gear/smoking/pack_lucky_strikes
	cost = 2

/datum/gear/smoking/pack_laika
	allowed_origins = FACTION_ORIGINS

/datum/gear/smoking/pack_wygold
	display_name = "Pack Of Watashi-Yorro Golds"

/datum/gear/smoking/pack_arcturian
	display_name = "Pack Of Arcadian Aces"

/datum/gear/smoking/pack_ladyfingers
	display_name = "Pack Of Cupid's Delights"

/datum/gear/smoking/pack_balaji
	display_name = "Pack Of Ludicrous Plaids"
	path = /obj/item/storage/fancy/cigarettes/balaji

/datum/gear/smoking/pack_exec
	cost = 2

/datum/gear/smoking/weed_joint
	display_name = GEAR_DISABLED

/*
//================================================
				Miscellaneous
//================================================
*/

/datum/gear/misc/pdt_kit
	display_name = GEAR_DISABLED

/datum/gear/misc/watch
	display_name = GEAR_DISABLED

/datum/gear/misc/watch/bishop
	cost = 1

/datum/gear/misc/watch/ripley
	cost = 1

/datum/gear/misc/watch/burke
	cost = 1

/datum/gear/misc/watch/dallas
	cost = 1

/datum/gear/misc/sunscreen_stick
	display_name = GEAR_DISABLED

/datum/gear/misc/dogtags
	allowed_origins = FACTION_ORIGINS

/datum/gear/misc/patch_uscm
	display_name = GEAR_DISABLED

/datum/gear/misc/patch_uscm/devils
	display_name = GEAR_DISABLED

/datum/gear/misc/patch_uscm/ua
	display_name = GEAR_DISABLED

/datum/gear/misc/patch_uscm/usa
	display_name = GEAR_DISABLED

/datum/gear/misc/patch_upp
	display_name = GEAR_DISABLED

/datum/gear/misc/patch_upp/sof
	display_name = GEAR_DISABLED

/datum/gear/misc/patch_rmc
	display_name = GEAR_DISABLED

/datum/gear/misc/patch_rmc/twe
	display_name = GEAR_DISABLED

/datum/gear/misc/datapad
	display_name = "SC2 Personal Data-Pad"
	path = /obj/item/datapad
	cost = 1

#undef GEAR_DISABLED
