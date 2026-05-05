GLOBAL_LIST_EMPTY(gear_datums_by_category)
GLOBAL_LIST_EMPTY(gear_datums_by_name)

/proc/populate_gear_list()
	var/datum/gear/G
	for(var/gear_type in subtypesof(/datum/gear))
		G = new gear_type()
		if(!G.display_name)
			continue //Skipping parent types that are not actual items.
		if(!G.category)
			log_debug("Improper gear datum: [gear_type].")
			continue
		if(G.display_name in GLOB.gear_datums_by_name)
			log_debug("Duplicate gear datum name: [G.display_name].")
			continue
		if(!G.special_conditions())
			continue
		LAZYSET(GLOB.gear_datums_by_category[G.category], "[G.display_name] [G.cost == 1 ? "(1 point)" : "([G.cost] points)"]", G)
		GLOB.gear_datums_by_name[G.display_name] = G

/datum/gear
	var/display_name  // Name/index.
	var/category //Used for sorting in the loadout selection.
	var/path  // Path to item.
	var/cost = 2 // Number of points used.
	var/slot // Slot to equip to, if any.
	var/list/allowed_roles   // Roles that can spawn with this item.
	var/list/allowed_origins

/datum/gear/proc/special_conditions()
	return TRUE

/*
//================================================
				Eyewear
//================================================
*/

/datum/gear/eyewear
	category = "Eyewear"
	slot = WEAR_EYES

/datum/gear/eyewear/aviators
	display_name = "Aviator shades"
	path = /obj/item/clothing/glasses/sunglasses/aviator

/datum/gear/eyewear/eyepatch
	display_name = "Eyepatch"
	path = /obj/item/clothing/glasses/eyepatch

/datum/gear/eyewear/eyepatch/green
	display_name = "Green Eyepatch"
	path = /obj/item/clothing/glasses/eyepatch/green

/datum/gear/eyewear/rpg_glasses
	display_name = "Marine RPG Glasses"
	path = /obj/item/clothing/glasses/regular
	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/eyewear/prescription_glasses
	display_name = "Prescription Glasses"
	path = /obj/item/clothing/glasses/regular/hipster

/datum/gear/eyewear/prescription_goggles
	display_name = "Prescription ballistic goggles"
	path = /obj/item/clothing/glasses/mgoggles/prescription

/datum/gear/eyewear/goggles_black/prescription
	display_name = "Prescription ballistic goggles, sun-shaded"
	path = /obj/item/clothing/glasses/mgoggles/black/prescription

/datum/gear/eyewear/goggles_orange/prescription
	display_name = "Prescription ballistic goggles, laser-shaded (brown)"
	path = /obj/item/clothing/glasses/mgoggles/orange/prescription

/datum/gear/eyewear/goggles_green/prescription
	display_name = "Prescription ballistic goggles, laser-shaded (green)"
	path = /obj/item/clothing/glasses/mgoggles/green/prescription

/datum/gear/eyewear/bimex_shades
	// HALO PVE EDIT - START - ITEM RENAMING
	display_name = "Tactical Shades"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/glasses/sunglasses/big
	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/eyewear/bimex_shades_orange
	// HALO PVE EDIT - START - ITEM RENAMING
	display_name = "Orange Tactical Shades"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/glasses/sunglasses/big/orange
	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/eyewear/bimex_shades_classic
	// HALO PVE EDIT - START - ITEM RENAMING
	display_name = "Ballistic Aviator Shades"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/glasses/sunglasses/big/classic
	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
	/*
	allowed_origins = NON_UPP_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/eyewear/sunglasses
	display_name = "Sunglasses"
	path = /obj/item/clothing/glasses/sunglasses
	cost = 0

/datum/gear/eyewear/prescription_sunglasses
	display_name = "Prescription sunglasses"
	path = /obj/item/clothing/glasses/sunglasses/prescription

/datum/gear/eyewear/pilot_visor_black
	// HALO PVE EDIT - START - ITEM RENAMING, ORIGIN LOCK REMOVAL, REPATHING
	display_name = "IHADSS visor, black"
	path = /obj/item/device/helmet_visor/po_visor/marine/unsc
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/eyewear/pilot_visor_yellow
	// HALO PVE EDIT - START - ITEM RENAMING, ORIGIN LOCK REMOVAL, ITEM REPATHING
	display_name = "IHADSS visor, yellow"
	path = /obj/item/device/helmet_visor/po_visor/marine/unsc/yellow
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

/*
//================================================
				Masks & Scarves
//================================================
*/

/datum/gear/mask
	category = "Masks and scarves"
	slot = WEAR_FACE

/datum/gear/mask/balaclava_black
	// HALO PVE EDIT - START - REPATHING

	display_name = "Balaclava, black"
	path = /obj/item/clothing/mask/rebreather/scarf
	// HALO PVE EDIT - END

/datum/gear/mask/balaclava_green
	// HALO PVE EDIT - START - REPATHING
	display_name = "Balaclava, green"
	path = /obj/item/clothing/mask/rebreather/scarf/green
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - OPTION REMOVAL
/*
/datum/gear/mask/balaclava_threehole
	display_name = "Balaclava, three-hole"
	path = /obj/item/clothing/mask/balaclava/threehole
	allowed_origins = UPP_ORIGINS
*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - ITEM SHUFFLING, ORIGINAL LINE 226
/datum/gear/mask/balaclava_grey
	display_name = "Balaclava, grey"
	path = /obj/item/clothing/mask/rebreather/scarf/gray

/datum/gear/mask/balaclava_tan
	display_name = "Balaclava, tan"
	path = /obj/item/clothing/mask/rebreather/scarf/tan
	// HALO PVE EDIT - END

/datum/gear/mask/face_wrap_black
	display_name = "Face wrap, black"
	path = /obj/item/clothing/mask/rebreather/scarf/tacticalmask/black

/datum/gear/mask/face_wrap_green
	display_name = "Face wrap, green"
	path = /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green

/datum/gear/mask/face_wrap_grey
	display_name = "Face wrap, grey"
	path = /obj/item/clothing/mask/rebreather/scarf/tacticalmask

/datum/gear/mask/face_wrap_red
	display_name = "Face wrap, red"
	path = /obj/item/clothing/mask/rebreather/scarf/tacticalmask/red

/datum/gear/mask/face_wrap_tan
	display_name = "Face wrap, tan"
	path = /obj/item/clothing/mask/rebreather/scarf/tacticalmask/tan

/datum/gear/mask/face_wrap_bravo
	display_name = "Face wrap, yellow"
	path = /obj/item/clothing/mask/rebreather/scarf/tacticalmask/bravo

/datum/gear/mask/face_wrap_charlie
	display_name = "Face wrap, purple"
	path = /obj/item/clothing/mask/rebreather/scarf/tacticalmask/charlie

/datum/gear/mask/face_wrap_delta
	display_name = "Face wrap, blue"
	path = /obj/item/clothing/mask/rebreather/scarf/tacticalmask/delta

/datum/gear/mask/face_wrap_echo
	display_name = "Face wrap, cyan green"
	path = /obj/item/clothing/mask/rebreather/scarf/tacticalmask/echo

/datum/gear/mask/gas
	display_name = "Gas mask"
	path = /obj/item/clothing/mask/gas //Civ market gas-mask, no longer USCM locked
	cost = 1
	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/mask/scarf_black
	display_name = "Scarf, black"
	path = /obj/item/clothing/mask/tornscarf/black

/datum/gear/mask/scarf_desert
	display_name = "Scarf, desert"
	path = /obj/item/clothing/mask/tornscarf/desert

/datum/gear/mask/scarf_green
	display_name = "Scarf, green"
	path = /obj/item/clothing/mask/tornscarf/green

/datum/gear/mask/scarf_grey
	display_name = "Scarf, grey"
	path = /obj/item/clothing/mask/tornscarf

/datum/gear/mask/scarf_urban
	display_name = "Scarf, urban"
	path = /obj/item/clothing/mask/tornscarf/urban

/datum/gear/mask/scarf_white
	display_name = "Scarf, white"
	path = /obj/item/clothing/mask/tornscarf/snow

/datum/gear/mask/neckerchief_black
	display_name = "Neckerchief, black"
	path = /obj/item/clothing/mask/neckerchief/black

/datum/gear/mask/neckerchief_tan
	display_name = "Neckerchief, tan"
	path = /obj/item/clothing/mask/neckerchief

/datum/gear/mask/neckerchief_green
	display_name = "Neckerchief, green"
	path = /obj/item/clothing/mask/neckerchief/green

/datum/gear/mask/neckerchief_gray
	display_name = "Neckerchief, gray"
	path = /obj/item/clothing/mask/neckerchief/gray

/datum/gear/mask/neckerchief_red
	display_name = "Neckerchief, red"
	path = /obj/item/clothing/mask/neckerchief/red

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/mask/uscm
	allowed_origins = USCM_ORIGINS

/datum/gear/mask/uscm/balaclava_green
	display_name = "USCM balaclava, green"
	path = /obj/item/clothing/mask/rebreather/scarf/green

/datum/gear/mask/uscm/balaclava_grey
	display_name = "USCM balaclava, grey"
	path = /obj/item/clothing/mask/rebreather/scarf/gray

/datum/gear/mask/uscm/balaclava_tan
	display_name = "USCM balaclava, tan"
	path = /obj/item/clothing/mask/rebreather/scarf/tan

/datum/gear/mask/uscm/skull_balaclava_blue
	display_name = "USCM balaclava, blue skull"
	path = /obj/item/clothing/mask/rebreather/skull
	cost = 4 //same as skull facepaint
	slot = WEAR_FACE

/datum/gear/mask/uscm/skull_balaclava_black
	display_name = "USCM balaclava, black skull"
	path = /obj/item/clothing/mask/rebreather/skull/black
	cost = 4
	slot = WEAR_FACE
*/
	// HALO PVE EDIT - END

/*
//================================================
				Headwear
//================================================
*/

/datum/gear/headwear
	category = "Headwear"
	cost = 3
	slot = WEAR_HEAD

	// HALO PVE EDIT - START - REPATHING
/datum/gear/headwear/santa_hat
	// HALO PVE EDIT - END
	display_name = "santa hat, red"
	path = /obj/item/clothing/head/santa
	cost = 1
	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - REPATHING
/datum/gear/headwear/santa_hat/special_conditions()
	// HALO PVE EDIT - END
	return is_month(12) && (is_day(21) || is_day(22) || is_day(23) || is_day(24) || is_day(25) || is_day(26))

	// HALO PVE EDIT - START - REPATHING
/datum/gear/headwear/santa_hat_green
	// HALO PVE EDIT - END
	display_name = "santa hat, green"
	path = /obj/item/clothing/head/santa/green
	cost = 1
	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - REPATHING
/datum/gear/headwear/santa_hat_green/special_conditions()
	// HALO PVE EDIT - END
	return is_month(12) && (is_day(21) || is_day(22) || is_day(23) || is_day(24) || is_day(25) || is_day(26))

/datum/gear/headwear/durag_black
	display_name = "Durag, black"
	path = /obj/item/clothing/head/durag/black

/datum/gear/headwear/durag
	display_name = "Durag, jungle"
	path = /obj/item/clothing/head/durag

	// HALO PVE EDIT - START - ITEM RENAMING, ORIGIN LOCK REMOVAL, DATUM REPATHING
/*
/datum/gear/headwear/uscm
	allowed_origins = USCM_ORIGINS
*/

/datum/gear/headwear/bandana_green

	display_name = "bandana, green"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmbandana

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/bandana_tan
	display_name = "bandana, tan"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmbandana/tan

	// HALO PVE EDIT - START - ITEM ADDITION
/datum/gear/headwear/beanie_black
	display_name = "beanie, black"
	path = /obj/item/clothing/head/beanie/royal_marine
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/beanie_grey
	display_name = "beanie, grey"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/beanie/gray

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/beanie_green
	display_name = "beanie, green"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/beanie/green

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/beanie_tan
	display_name = "beanie, tan"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/beanie/tan

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/boonie_jungle
	display_name = "boonie hat, jungle"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmcap/boonie

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/boonie_desert
	display_name = "boonie hat, desert"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmcap/boonie/tan

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/boonie_snow
	display_name = "boonie hat, snow"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmcap/boonie/snow

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/cap
	display_name = "utility cap, jungle"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmcap
	cost = 2

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/cap_desert
	display_name = "utility cap, desert"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmcap/desert
	cost = 2

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/cap_snow
	display_name = "utility cap, snow"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmcap/snow
	cost = 2

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/cap_operations
	display_name = "UNSC Operations Cap, Green"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmcap/bridge

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/cap_operations2
	display_name = "UNSC Operations Cap, Tan"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmcap/bridge/tan

	// HALO PVE EDIT - START - OPTION REMOVAL
/*
/datum/gear/headwear/uscm/cap/sulaco
	display_name = "USS Golden Arrow cap"
	path = /obj/item/clothing/head/sulacocap
	cost = 1
*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/cap/flap_jungle
	display_name = "UNSC expedition flapcap, jungle"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmcap/flap

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/cap/flap_desert
	display_name = "UNSC expedition flapcap, desert"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmcap/flap/desert

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/cap/flap_snow
	display_name = "UNSC expedition flapcap, snow"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/cmcap/flap/snow

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/headband_brown
	display_name = "headband, brown"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/headband/brown

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/headband_green
	display_name = "headband, green"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/headband

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/headband_grey
	display_name = "headband, grey"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/headband/gray

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/headband_red
	display_name = "headband, red"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/headband/red

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/headband_tan
	display_name = "headband, tan"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/headband/tan

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/headband_intel
	display_name = "headband, black"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/headband/intel

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/headband_bravo
	display_name = "headband, orange"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/headband/bravo

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/headband_charlie
	display_name = "headband, purple"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/headband/charlie

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/headband_delta
	display_name = "headband, blue"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/headband/delta

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/headband_echo
	display_name = "headband, cyan green"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/headband/echo

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/headset
	display_name = "UNSC headset"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/headset

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/headwear/uscm/beret_white
	display_name = "Beret, white"
	path = /obj/item/clothing/head/beret/cm/white

/datum/gear/headwear/uscm/beret_alpha
	display_name = "Beret, red flash"
	path = /obj/item/clothing/head/beret/cm/alpha

/datum/gear/headwear/uscm/beret_bravo
	display_name = "Beret, yellow flash"
	path = /obj/item/clothing/head/beret/cm/bravo

/datum/gear/headwear/uscm/beret_charlie
	display_name = "Beret, purple flash"
	path = /obj/item/clothing/head/beret/cm/charlie

/datum/gear/headwear/uscm/beret_delta
	display_name = "Beret, blue flash"
	path = /obj/item/clothing/head/beret/cm/delta

/datum/gear/headwear/uscm/beret_echo
	display_name = "Beret, green flash"
	path = /obj/item/clothing/head/beret/cm/echo

/datum/gear/headwear/uscm/beret_foxtrot
	display_name = "Beret, brown flash"
	path = /obj/item/clothing/head/beret/cm/foxtrot

/datum/gear/headwear/uscm/beret_intel
	display_name = "Beret, black flash"
	path = /obj/item/clothing/head/beret/cm/intel

/datum/gear/headwear/upp
	allowed_origins = UPP_ORIGINS

/datum/gear/headwear/upp/cap
	display_name = "UPP cap"
	path = /obj/item/clothing/head/uppcap

/datum/gear/headwear/upp/boonie
	display_name = "UPP boonie"
	path = /obj/item/clothing/head/uppcap/boonie
*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - ITEM RENAMING, DATUM REPATHING
/datum/gear/headwear/ushanka
	display_name = "Ushanka"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/head/uppcap/ushanka

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/headwear/rmc
	allowed_origins = TWE_ORIGINS

/datum/gear/headwear/rmc/beanie
	display_name = "RMC beanie"
	path = /obj/item/clothing/head/beanie/royal_marine

/datum/gear/headwear/rmc/turban
	display_name = "RMC turban"
	path = /obj/item/clothing/head/beanie/royal_marine/turban

/datum/gear/headwear/beret_red
	display_name = "Beret, red"
	path = /obj/item/clothing/head/beret

/datum/gear/headwear/beret_black
	display_name = "Beret, black"
	path = /obj/item/clothing/head/beret/black
*/
	// HALO PVE EDIT - END

/*
//================================================
				Helmet Accessories
//================================================
*/

/datum/gear/helmet_garb
	category = "Helmet accessories"
	cost = 1

/datum/gear/helmet_garb/flair_initech
	display_name = "Flair, Initech"
	path = /obj/item/prop/helmetgarb/flair_initech

/datum/gear/helmet_garb/flair_io
	display_name = "Flair, Io"
	path = /obj/item/prop/helmetgarb/flair_io

/datum/gear/helmet_garb/flair_peace
	display_name = "Flair, Peace and Love"
	path = /obj/item/prop/helmetgarb/flair_peace

	// HALO PVE EDIT - START - ITEM RENAMING, ORIGIN LOCK REMOVAL
/datum/gear/helmet_garb/flair_uscm
	display_name = "Flair, UNSC"
	path = /obj/item/prop/helmetgarb/flair_uscm
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/helmet_garb/gunoil
	display_name = "Gun oil"
	path = /obj/item/prop/helmetgarb/gunoil

	// HALO PVE EDIT - START - OPTION REMOVAL
/*
/datum/gear/helmet_garb/netting
	display_name = "Helmet netting"
	path = /obj/item/prop/helmetgarb/netting
*/
	// HALO PVE EDIT - END

/datum/gear/helmet_garb/lucky_feather
	display_name = "Lucky feather, red"
	path = /obj/item/prop/helmetgarb/lucky_feather

/datum/gear/helmet_garb/lucky_feather/yellow
	display_name = "Lucky feather, yellow"
	path = /obj/item/prop/helmetgarb/lucky_feather/yellow

/datum/gear/helmet_garb/lucky_feather/purple
	display_name = "Lucky feather, purple"
	path = /obj/item/prop/helmetgarb/lucky_feather/purple

/datum/gear/helmet_garb/lucky_feather/blue
	display_name = "Lucky feather, blue"
	path = /obj/item/prop/helmetgarb/lucky_feather/blue

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/helmet_garb/broken_nvgs
	display_name = "M1 Multispectrum Visor"
	path = /obj/item/prop/helmetgarb/helmet_nvg/cosmetic/larp
	allowed_origins = USCM_ORIGINS

/datum/gear/helmet_garb/prescription_bottle
	display_name = "Prescription bottle"
	path = /obj/item/prop/helmetgarb/prescription_bottle

/datum/gear/helmet_garb/raincover
	display_name = "Rain cover"
	path = /obj/item/prop/helmetgarb/raincover
*/
	// HALO PVE EDIT - END

/datum/gear/helmet_garb/rabbits_foot
	display_name = "Rabbit's foot"
	path = /obj/item/prop/helmetgarb/rabbitsfoot

/datum/gear/helmet_garb/rosary
	display_name = "Rosary"
	path = /obj/item/prop/helmetgarb/rosary

/datum/gear/helmet_garb/spent_buck
	display_name = "Spent buckshot"
	path = /obj/item/prop/helmetgarb/spent_buckshot

/datum/gear/helmet_garb/spent_flechette
	display_name = "Spent flechette"
	path = /obj/item/prop/helmetgarb/spent_flech

/datum/gear/helmet_garb/spent_slugs
	display_name = "Spent slugs"
	path = /obj/item/prop/helmetgarb/spent_slug

/datum/gear/helmet_garb/cartridge
	display_name = "Cartridge"
	path = /obj/item/prop/helmetgarb/cartridge

/datum/gear/helmet_garb/spacejam_tickets
	display_name = "Tickets to Space Jam"
	path = /obj/item/prop/helmetgarb/spacejam_tickets

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/helmet_garb/trimmed_wire
	display_name = "Trimmed barbed wire"
	path = /obj/item/prop/helmetgarb/trimmed_wire

/datum/gear/helmet_garb/bullet_pipe
	display_name = "10x99mm XM43E1 casing pipe"
	path = /obj/item/prop/helmetgarb/bullet_pipe
	allowed_origins = USCM_ORIGINS

/datum/gear/helmet_garb/chaplain_patch
	display_name = "USCM chaplain helmet patch"
	path = /obj/item/prop/helmetgarb/chaplain_patch
	allowed_origins = USCM_ORIGINS
*/
	// HALO PVE EDIT - END

/*
//================================================
				Clothing
//================================================
*/

/datum/gear/clothing
	category = "Non-standard clothing"

/datum/gear/clothing/jungle_boots
	display_name = "jungle combat boots"
	path = /obj/item/clothing/shoes/marine/civilian/jungle

/datum/gear/clothing/brown_boots
	display_name = "brown combat boots"
	path = /obj/item/clothing/shoes/marine/civilian/brown

/datum/gear/clothing/brown_gloves
	display_name = "brown combat gloves"
	path = /obj/item/clothing/gloves/marine/brown

/datum/gear/clothing/black_fingerless_gloves
	display_name = "black fingerless combat gloves"
	path = /obj/item/clothing/gloves/marine/fingerless

/datum/gear/clothing/brown_fingerless_gloves
	display_name = "brown fingerless combat gloves"
	path = /obj/item/clothing/gloves/marine/brown/fingerless

	// HALO PVE EDIT - START - OPTION REMOVAL
/*
/datum/gear/clothing/shotgun_holster_belt
	display_name = "shotgun holster belt"
	path = /obj/item/storage/belt/gun/shotgunholster
	cost = 3
	allowed_origins = USCM_ORIGINS
*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - ITEM RENAMING, ORIGIN LOCK REMOVAL
/datum/gear/clothing/flak
	display_name = "vintage flak jacket (Blue)"
	path = /obj/item/clothing/accessory/flak
	cost = 3
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/clothing/flak/od
	display_name = "vintage flak jacket (Green)"
	path = /obj/item/clothing/accessory/flak/od
	// HALO PVE EDIT - END

/datum/gear/clothing/windbreaker_green
	display_name = "Windbreaker, Green"
	path = /obj/item/clothing/suit/storage/windbreaker/windbreaker_green
	cost = 3

/datum/gear/clothing/windbreaker_khaki
	display_name = "Windbreaker, Brown"
	path = /obj/item/clothing/suit/storage/windbreaker/windbreaker_brown
	cost = 3

/datum/gear/clothing/windbreaker_blue
	display_name = "Windbreaker, Blue"
	path = /obj/item/clothing/suit/storage/windbreaker/windbreaker_blue
	cost = 3

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/clothing/service_jacket
	display_name = "USCM service jacket"
	path = /obj/item/clothing/suit/storage/jacket/marine/service
	cost = 3
	allowed_origins = USCM_ORIGINS

/datum/gear/clothing/upp_service_jacket
	display_name = "UPP service jacket"
	path = /obj/item/clothing/suit/storage/jacket/marine/upp/naval
	cost = 3
	allowed_origins = UPP_ORIGINS

/datum/gear/clothing/shorts
	display_name = "USCM PT Shorts"
	path = /obj/item/clothing/under/shorts/red/uscm
	cost = 1
	allowed_origins = USCM_ORIGINS
*/
	// HALO PVE EDIT - END

/*
//================================================
				Armor & Body Paints
//================================================
*/

/datum/gear/paint
	category = "Armor & body paints"
	cost = 0

	// HALO PVE EDIT - START - OPTION REMOVAL
/*
/datum/gear/paint/paint_sg
	display_name = "Black Smartgun Harness Paint"
	path = /obj/item/clothing/accessory/paint/sg
*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/paint/paint_skull
	display_name = "Skull Armor Paint"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/accessory/paint

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/paint/paint_heart
	display_name = "Heart Armor Paint"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/accessory/paint/heart

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/paint/target
	display_name = "Target Armor Paint"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/accessory/paint/target

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/paint/smiley
	display_name = "Smiley-Face Armor Paint"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/accessory/paint/alcoholism

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/paint/neutral
	display_name = "Neutral-Face Armor Paint"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/accessory/paint/melancholy

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/paint/cross
	display_name = "Cross Armor Paint"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/accessory/paint/cross

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/paint/pandora
	display_name = "Inscription Armor Paint"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/accessory/paint/inscription

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/paint/flames
	display_name = "Fire Armor Paint"
	// HALO PVE EDIT - END
	path = /obj/item/clothing/accessory/paint/fire


/datum/gear/paint/facepaint_green
	display_name = "Facepaint, green"
	path = /obj/item/facepaint/green
	cost = 2

/datum/gear/paint/facepaint_brown
	display_name = "Facepaint, brown"
	path = /obj/item/facepaint/brown
	cost = 2

/datum/gear/paint/facepaint_black
	display_name = "Facepaint, black"
	path = /obj/item/facepaint/black
	cost = 2

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/paint/facepaint_skull
	display_name = "Facepaint, skull"
	path = /obj/item/facepaint/skull
	cost = 3

/datum/gear/paint/facepaint_body
	display_name = "Fullbody paint"
	path = /obj/item/facepaint/sniper
	cost = 4 //To match with the skull paint amount of point, gave this amount of point for the same reason of the skull facepaint (too cool for everyone to be able to constantly use)
*/
	// HALO PVE EDIT - END

/*
//================================================
				Paperwork
//================================================
*/

/datum/gear/paperwork
	category = "Paperwork"

/datum/gear/paperwork/pen
	display_name = "Pen, black"
	path = /obj/item/tool/pen
	cost = 1

/datum/gear/paperwork/pen_blue
	display_name = "Pen, blue"
	path = /obj/item/tool/pen/blue

/datum/gear/paperwork/pen_green
	display_name = "Pen, green"
	path = /obj/item/tool/pen/green

/datum/gear/paperwork/pen_red
	display_name = "Pen, red"
	path = /obj/item/tool/pen/red

/datum/gear/paperwork/pen_fountain
	display_name = "Pen, fountain"
	path = /obj/item/tool/pen/fountain
	cost = 3

/datum/gear/paperwork/paper
	display_name = "Sheet of paper"
	path = /obj/item/paper
	cost = 1

/datum/gear/paperwork/clipboard
	display_name = "Clipboard"
	path = /obj/item/clipboard

/datum/gear/paperwork/folder_black
	display_name = "Folder, black"
	path = /obj/item/folder/black

/datum/gear/paperwork/folder_blue
	display_name = "Folder, blue"
	path = /obj/item/folder/blue

/datum/gear/paperwork/folder_red
	display_name = "Folder, red"
	path = /obj/item/folder/red

/datum/gear/paperwork/folder_white
	display_name = "Folder, white"
	path = /obj/item/folder/white

/datum/gear/paperwork/folder_yellow
	display_name = "Folder, yellow"
	path = /obj/item/folder/yellow

/datum/gear/paperwork/notepad_black
	display_name = "Notepad, black"
	path = /obj/item/notepad/black

/datum/gear/paperwork/notepad_blue
	display_name = "Notepad, blue"
	path = /obj/item/notepad/blue

/datum/gear/paperwork/notepad_green
	display_name = "Notepad, green"
	path = /obj/item/notepad/green

/datum/gear/paperwork/notepad_red
	display_name = "Notepad, red"
	path = /obj/item/notepad/red

/*
//================================================
				Recreational
//================================================
*/

/datum/gear/toy
	category = "Recreational"

/datum/gear/toy/camera
	display_name = "Camera"
	path = /obj/item/device/camera

	// HALO PVE EDIT - START - ITEM RENAMING, ORIGIN LOCK REMOVAL
/datum/gear/toy/mags
	cost = 1
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/toy/mags/boots
	allowed_origins = NON_UPP_ORIGINS

/datum/gear/toy/mags/boots/boots_magazine_one
	display_name = "Boots Issue No.117"
	path = /obj/item/prop/magazine/boots/n117

/datum/gear/toy/mags/boots/boots_magazine_two
	display_name = "Boots Issue No.150"
	path = /obj/item/prop/magazine/boots/n150

/datum/gear/toy/mags/boot_magazine_three
	display_name = "Boots Issue No.160"
	path = /obj/item/prop/magazine/boots/n160

/datum/gear/toy/mags/boots/boots_magazine_four
	display_name = "Boots Issue No.54"
	path = /obj/item/prop/magazine/boots/n054

/datum/gear/toy/mags/boots/boots_magazine_five
	display_name = "Boots Issue No.55"
	path = /obj/item/prop/magazine/boots/n055
*/
	// HALO PVE EDIT - END

/datum/gear/toy/mags/magazine_dirty
	display_name = "Magazine"
	path = /obj/item/prop/magazine/dirty

/datum/gear/toy/film
	display_name = "Camera film"
	path = /obj/item/device/camera_film
	cost = 0

	// HALO PVE EDIT - START - ITEM RENAMING, ORIGIN LOCK REMOVAL
/datum/gear/toy/card
	cost = 1
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/toy/card/ace_of_spades
	display_name = "Card, ace of spades"
	path = /obj/item/toy/handcard/aceofspades

/datum/gear/toy/card/uno_reverse_red
	display_name = "Card, Uno Reverse - red"
	path = /obj/item/toy/handcard/uno_reverse_red

/datum/gear/toy/card/uno_reverse_blue
	display_name = "Card, Uno Reverse - blue"
	path = /obj/item/toy/handcard/uno_reverse_blue

/datum/gear/toy/card/uno_reverse_purple
	display_name = "Card, Uno Reverse - purple"
	path = /obj/item/toy/handcard/uno_reverse_purple

/datum/gear/toy/card/uno_reverse_yellow
	display_name = "Card, Uno Reverse - yellow"
	path = /obj/item/toy/handcard/uno_reverse_yellow

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/toy/card/trading_card
	display_name = "Card, random WeyYu Trading"
	path = /obj/item/toy/trading_card
*/
	// HALO PVE EDIT - END

/datum/gear/toy/deck
	display_name = "Deck of cards, regular"
	path = /obj/item/toy/deck

/datum/gear/toy/deck/uno
	display_name = "Deck of cards, Uno"
	path = /obj/item/toy/deck/uno

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/toy/trading_card
	display_name = "Trading Card Packet"
	path = /obj/item/storage/fancy/trading_card
*/
	// HALO PVE EDIT - END

/datum/gear/toy/d6
	display_name = "Die, 6 sides"
	cost = 1
	path = /obj/item/toy/dice

/datum/gear/toy/d20
	display_name = "Die, 20 sides"
	cost = 1
	path = /obj/item/toy/dice/d20

/datum/gear/toy/crayon
	display_name = "Crayon"
	cost = 1
	path = /obj/item/toy/crayon/rainbow

/datum/gear/toy/pride
	display_name = "Box of Prideful Crayons"
	path = /obj/item/storage/box/pride

/*
//================================================
				Cassettes
//================================================
*/

/datum/gear/cassettes
	category = "Cassettes"

/datum/gear/cassettes/walkman
	display_name = "Walkman"
	path = /obj/item/device/walkman

/datum/gear/cassettes/pop1
	display_name = "Blue Cassette"
	path = /obj/item/device/cassette_tape/pop1
	cost = 1

/datum/gear/cassettes/pop2
	display_name = "Rainbow Cassette"
	path = /obj/item/device/cassette_tape/pop2
	cost = 1

/datum/gear/cassettes/pop3
	display_name = "Orange Cassette"
	path = /obj/item/device/cassette_tape/pop3
	cost = 1

/datum/gear/cassettes/pop4
	display_name = "Pink Cassette"
	path = /obj/item/device/cassette_tape/pop4
	cost = 1

/datum/gear/cassettes/heavymetal
	display_name = "Red-Black Cassette"
	path = /obj/item/device/cassette_tape/heavymetal
	cost = 1

/datum/gear/cassettes/hairmetal
	display_name = "Red Striped Cassette"
	path = /obj/item/device/cassette_tape/hairmetal
	cost = 1

/datum/gear/cassettes/indie
	display_name = "Rising Sun Cassette"
	path = /obj/item/device/cassette_tape/indie
	cost = 1

/datum/gear/cassettes/hiphop
	display_name = "Blue Stripe Cassette"
	path = /obj/item/device/cassette_tape/hiphop
	cost = 1

/datum/gear/cassettes/nam
	display_name = "Green Cassette"
	path = /obj/item/device/cassette_tape/nam
	cost = 1

/datum/gear/cassettes/ocean
	display_name = "Ocean Cassette"
	path = /obj/item/device/cassette_tape/ocean
	cost = 1

/datum/gear/cassettes/pouch
	display_name = "Cassette Pouch"
	path = 	/obj/item/storage/pouch/cassette

/*
//================================================
				Plushies
//================================================
*/

/datum/gear/plush
	category = "Plushies"
	cost = 4

/datum/gear/plush/random
	display_name = "Random plush"
	path = /obj/item/toy/plush/random_plushie
	cost = 2

/datum/gear/plush/farwa
	display_name = "Farwa plush"
	path = /obj/item/toy/plush/farwa

/datum/gear/plush/barricade
	display_name = "Barricade plush"
	path = /obj/item/toy/plush/barricade

/datum/gear/plush/bee
	display_name = "Bee plush"
	path = /obj/item/toy/plush/bee

/datum/gear/plush/shark
	display_name = "Shark plush"
	path = /obj/item/toy/plush/shark

/datum/gear/plush/moth
	display_name = "Moth plush"
	path = /obj/item/toy/plush/moth

/datum/gear/plush/rock
	display_name = "Rock plush"
	path = /obj/item/toy/plush/rock

/datum/gear/plush/otter
	display_name = "Otter plush"
	path = /obj/item/toy/plush/otter

/datum/gear/plush/fox
	display_name = "Fox plush"
	path = /obj/item/toy/plush/fox

/datum/gear/plush/kitten
	display_name = "Kitten plush"
	path = /obj/item/toy/plush/kitten

/datum/gear/plush/box
	display_name = "Box plush"
	path = /obj/item/toy/plush/box

/datum/gear/plush/carp
	display_name = "Carp plush"
	path = /obj/item/toy/plush/carp

/datum/gear/plush/therapy
	display_name = "Therapy plush"
	path = /obj/item/toy/plush/therapy

/datum/gear/plush/therapy/red
	display_name = "Therapy plush (Red)"
	path = /obj/item/toy/plush/therapy/red

/datum/gear/plush/therapy/blue
	display_name = "Therapy plush (Blue)"
	path = /obj/item/toy/plush/therapy/blue

/datum/gear/plush/therapy/green
	display_name = "Therapy plush (Green)"
	path = /obj/item/toy/plush/therapy/green

/datum/gear/plush/therapy/orange
	display_name = "Therapy plush (Orange)"
	path = /obj/item/toy/plush/therapy/orange

/datum/gear/plush/therapy/purple
	display_name = "Therapy plush (Purple)"
	path = /obj/item/toy/plush/therapy/purple

/datum/gear/plush/therapy/yellow
	display_name = "Therapy plush (Yellow)"
	path = /obj/item/toy/plush/therapy/yellow

/datum/gear/plush/therapy/random
	display_name = "Therapy plush (???)"
	path = /obj/item/toy/plush/therapy/random_color
	cost = 7

/*
//================================================
				Weapons
//================================================
*/

/datum/gear/weapon
	category = "Weapons"

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/weapon/bayonet
	display_name = "M5 combat knife"
	// HALO PVE EDIT - END
	path = 	/obj/item/attachable/bayonet

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/weapon/kabar
	display_name = "MK88 Ratio survival knife"
	// HALO PVE EDIT - END
	path = 	/obj/item/weapon/knife/marine/kabar

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/weapon/bowie
	display_name = "Model 52 Navy knife"
	// HALO PVE EDIT - END
	path = 	/obj/item/storage/box/loadout/bowie
	cost = 4

	// HALO PVE EDIT - START - ITEM RENAMING, ORIGIN LOCK REMOVAL
/datum/gear/weapon/kukri
	display_name = "Kukri utility knife"
	path = 	/obj/item/storage/box/loadout/bowie/kukri
	cost = 4
	/*
	allowed_origins = TWE_ORIGINS
	*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/weapon/baker
	display_name = "M11 combat knife"
	// HALO PVE EDIT - END
	path = 	/obj/item/weapon/knife/marine/baker

	// HALO PVE EDIT - START - ITEM RENAMING, ORIGIN LOCK REMOVAL
/datum/gear/weapon/chinese
	display_name = "Colonial Military Authority M2 bayonet"
	path = 	/obj/item/attachable/bayonet/canc
	/*
	allowed_origins = UPP_ORIGINS
	*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/weapon/type_80_Bayonet
	display_name = "Type 80 bayonet"
	path = /obj/item/attachable/bayonet/upp/surplus
	cost = 3
	allowed_origins = USCM_ORIGINS

/datum/gear/weapon/m8_cartridge_bayonet
	display_name = "M8 Cartridge Bayonet"
	path = /obj/item/storage/box/loadout/co2_knife
	allowed_origins = USCM_ORIGINS
*/
	// HALO PVE EDIT - END

/datum/gear/weapon/butterfly_knife
	display_name = "Butterfly Knife"
	path = /obj/item/weapon/butterfly
	cost = 3

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/weapon/clfpistol
	display_name = "Hummingbird Pistol"
	path = /obj/item/storage/box/loadout/CLF_loadout
	cost = 4

/datum/gear/weapon/t73
	display_name = "Type 73 Pistol"
	path = /obj/item/storage/box/loadout/T73_loadout
	cost = 4

/datum/gear/weapon/zhnk72
	display_name = "ZHNK-72 Revolver"
	path = /obj/item/storage/box/loadout/ZHNK72_loadout
	cost = 4

/datum/gear/weapon/m4a3_custom
	display_name = "Custom M4A3 Pistol"
	path = /obj/item/storage/box/loadout/M4A3_custom_loadout
	cost = 4
	allowed_origins = USCM_ORIGINS

/datum/gear/weapon/m1911
	display_name = "M1911 Pistol"
	path = /obj/item/storage/box/loadout/M1911_loadout
	cost = 4
	allowed_origins = USCM_ORIGINS

/datum/gear/weapon/m44
	display_name = "M44 Revolver"
	path = /obj/item/storage/box/loadout/M44_loadout
	cost = 4

/datum/gear/weapon/m44_custom_revolver
	display_name = "Custom M44 Revolver"
	path = /obj/item/storage/box/loadout/M44_custom_loadout
	cost = 4
	allowed_origins = USCM_ORIGINS

/datum/gear/weapon/hg45_civilian
	display_name = "HG 45 'Aguila' Pistol"
	path = /obj/item/storage/box/loadout/HG45_civilian_loadout
	cost = 4

/datum/gear/weapon/hg45_marine
	display_name = "HG 45 'Marina' Pistol"
	path = /obj/item/storage/box/loadout/HG45_marine_loadout
	cost = 4
	allowed_origins = NON_UPP_ORIGINS

/datum/gear/weapon/hg44
	display_name = "HG 44 'Automag' Pistol"
	path = /obj/item/storage/box/loadout/HG44_loadout
	cost = 4

/datum/gear/weapon/spearhead
	display_name = "Spearhead Armoury Revolver"
	path = /obj/item/storage/box/loadout/Spearhead_loadout
	cost = 4

/datum/gear/weapon/spearhead_custom
	display_name = "Custom Spearhead Armoury Revolver"
	path = /obj/item/storage/box/loadout/Spearhead_loadout/custom
	cost = 4
	allowed_origins = NON_UPP_ORIGINS

/datum/gear/weapon/l54
	display_name = "L54A2 Pistol"
	path = /obj/item/storage/box/loadout/L54_loadout
	cost = 4

/datum/gear/weapon/m9
	display_name = "M9 Pistol"
	path = /obj/item/storage/box/loadout/M9_loadout
	cost = 4

/datum/gear/weapon/vp78
	display_name = "VP78 Pistol"
	path = /obj/item/storage/box/loadout/VP78_loadout
	cost = 4
	allowed_origins = USCM_ORIGINS //RMC get the better kind of VP78 on their ship, so they won't need to buy subpar civ-market models

/datum/gear/weapon/m2100_machete
	display_name = "M2100 Machete"
	path = /obj/item/storage/large_holster/machete/arnold/weak
	cost = 4
	allowed_origins = USCM_ORIGINS
*/
	// HALO PVE EDIT - END

/*
//================================================
				Canned Drinks
//================================================
*/

	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
/datum/gear/drink
	category = "Canned drinks"
	/*
	allowed_origins = NON_UPP_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/drink/water
	display_name = "Bottled water"
	path = /obj/item/reagent_container/food/drinks/cans/waterbottle
	cost = 1

/datum/gear/drink/grape_juice
	display_name = "Grape juice"
	path = /obj/item/reagent_container/food/drinks/cans/grape_juice

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/drink/lemon_lime
	display_name = "BLAST lemon-lime soda"
	// HALO PVE EDIT - END
	path = /obj/item/reagent_container/food/drinks/cans/lemon_lime

/datum/gear/drink/iced_tea
	display_name = "Iced tea"
	path = /obj/item/reagent_container/food/drinks/cans/iced_tea

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/drink/cola
	display_name = "Coca-Cola"
	// HALO PVE EDIT - END
	path = /obj/item/reagent_container/food/drinks/cans/classcola

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/drink/mountain_wind
	display_name = "Mountain Wind"
	path = /obj/item/reagent_container/food/drinks/cans/space_mountain_wind

/datum/gear/drink/space_up
	display_name = "Space Up"
	path = /obj/item/reagent_container/food/drinks/cans/space_up

/datum/gear/drink/souto_classic
	display_name = "Classic Souto"
	path = /obj/item/reagent_container/food/drinks/cans/souto/classic

/datum/gear/drink/souto_diet
	display_name = "Diet Souto"
	path = /obj/item/reagent_container/food/drinks/cans/souto/diet/classic
*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - ITEM ADDITION
/datum/gear/drink/bepis
	display_name = "Pepsi"
	path = /obj/item/reagent_container/food/drinks/cans/pepsi
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/drink/boda
	display_name = "Boda Soda"
	path = /obj/item/reagent_container/food/drinks/cans/boda
	cost = 3 //Legally imported from UPP.
	allowed_origins = FACTION_ORIGINS

/datum/gear/drink/boda/plus
	display_name = "Boda Cola"
	path = /obj/item/reagent_container/food/drinks/cans/bodaplus

/datum/gear/drink/alcohol
	cost = 3 //Illegal in military.
	allowed_origins = NON_UPP_ORIGINS // UPP stricter on enforcement, I figure

/datum/gear/drink/alcohol/ale
	display_name = "Weyland-Yutani IPA Ale"
	path = /obj/item/reagent_container/food/drinks/cans/ale

/datum/gear/drink/alcohol/aspen
	display_name = "Weyland-Yutani Aspen Beer"
	path = /obj/item/reagent_container/food/drinks/cans/aspen

/datum/gear/drink/alcohol/beer
	display_name = "Weyland-Yutani Lite Beer"
	path = /obj/item/reagent_container/food/drinks/cans/beer

/datum/gear/drink/alcohol/loko
	display_name = "Thirteen Loko"
	path = /obj/item/reagent_container/food/drinks/cans/thirteenloko
*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - ITEM ADDITION
/datum/gear/drink/orange_soda
	display_name = "Oranj Soda"
	path = /obj/item/reagent_container/food/drinks/cans/starkist
	// HALO PVE EDIT - END

/*
//================================================
				Flasks
//================================================
*/

/datum/gear/flask
	category = "Flasks"

/datum/gear/flask/canteen
	display_name = "Canteen"
	path = /obj/item/reagent_container/food/drinks/flask/canteen

/datum/gear/flask/canteen/empty
	display_name = "Empty canteen"
	path = /obj/item/reagent_container/food/drinks/flask/canteen/empty

/datum/gear/flask/leather
	display_name = "Leather flask"
	path = /obj/item/reagent_container/food/drinks/flask/detflask

/datum/gear/flask/leather_black
	display_name = "Black leather flask"
	path = /obj/item/reagent_container/food/drinks/flask/barflask

/datum/gear/flask/metal
	display_name = "Metal flask"
	path = /obj/item/reagent_container/food/drinks/flask

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/flask/uscm
	display_name = "USCM flask"
	path = /obj/item/reagent_container/food/drinks/flask/marine
	allowed_origins = USCM_ORIGINS
*/
	// HALO PVE EDIT - END

/datum/gear/flask/vacuum
	display_name = "Vacuum flask"
	path = /obj/item/reagent_container/food/drinks/flask/vacuumflask

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/flask/wy
	display_name = "WY flask"
	path = /obj/item/reagent_container/food/drinks/flask/weylandyutani
	allowed_origins = NON_UPP_ORIGINS
*/
	// HALO PVE EDIT - END

/*
//================================================
				Sweet Foods
//================================================
*/

/datum/gear/snack_sweet
	category = "Food (sweets)"

/datum/gear/snack_sweet/candy
	display_name = "Bar of candy"
	path = /obj/item/reagent_container/food/snacks/candy

/datum/gear/snack_sweet/chocolate
	display_name = "Bar of chocolate"
	path = /obj/item/reagent_container/food/snacks/chocolatebar

/datum/gear/snack_sweet/candy_apple
	display_name = "Candied apple"
	path = /obj/item/reagent_container/food/snacks/candiedapple

/datum/gear/snack_sweet/cookie
	display_name = "Cookie"
	path = /obj/item/reagent_container/food/snacks/cookie

/datum/gear/snack_sweet/fortune_cookie
	display_name = "Fortune cookie"
	path = /obj/item/reagent_container/food/snacks/fortunecookie/prefilled
	cost = 3

/datum/gear/snack_sweet/donut_normal
	display_name = "Donut"
	path = /obj/item/reagent_container/food/snacks/donut/normal

/datum/gear/snack_sweet/donut_jelly
	display_name = "Jelly donut"
	path = /obj/item/reagent_container/food/snacks/donut/jelly

/datum/gear/snack_sweet/donut_cherry
	display_name = "Cherry donut"
	path = /obj/item/reagent_container/food/snacks/donut/cherryjelly

/*
//================================================
				Packaged Foods
//================================================
*/

	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
/datum/gear/snack_packaged
	category = "Food (packaged)"
	/*
	allowed_origins = NON_UPP_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/snack_packaged/beef_jerky
	display_name = "Beef jerky"
	path = /obj/item/reagent_container/food/snacks/sosjerky

/datum/gear/snack_packaged/meat_bar
	display_name = "MEAT bar"
	path = /obj/item/reagent_container/food/snacks/eat_bar

/datum/gear/snack_packaged/kepler_crisps
	display_name = "Kepler Crisps"
	path = /obj/item/reagent_container/food/snacks/kepler_crisps

/datum/gear/snack_packaged/burrito
	display_name = "Packaged burrito"
	path = /obj/item/reagent_container/food/snacks/microwavable/packaged_burrito

/datum/gear/snack_packaged/cheeseburger
	display_name = "Packaged cheeseburger"
	path = /obj/item/reagent_container/food/snacks/microwavable/packaged_burger

/datum/gear/snack_packaged/hotdog
	display_name = "Packaged hotdog"
	path = /obj/item/reagent_container/food/snacks/microwavable/packaged_hdogs

/datum/gear/snack_packaged/chips_pepper
	display_name = "W-Y Pepper Chips"
	path = /obj/item/reagent_container/food/snacks/wy_chips/pepper

/*
//================================================
				Healthy Foods
//================================================
*/

/datum/gear/snack_grown
	category = "Food (healthy)"

/datum/gear/snack_grown/apple
	display_name = "Apple"
	path = /obj/item/reagent_container/food/snacks/grown/apple

/datum/gear/snack_grown/carrot
	display_name = "Carrot"
	path = /obj/item/reagent_container/food/snacks/grown/carrot

/datum/gear/snack_grown/corn
	display_name = "Corn"
	path = /obj/item/reagent_container/food/snacks/grown/corn

/datum/gear/snack_grown/lemon
	display_name = "Lemon"
	path = /obj/item/reagent_container/food/snacks/grown/lemon

/datum/gear/snack_grown/lime
	display_name = "Lime"
	path = /obj/item/reagent_container/food/snacks/grown/lime

/datum/gear/snack_grown/orange
	display_name = "Orange"
	path = /obj/item/reagent_container/food/snacks/grown/orange

/datum/gear/snack_grown/potato
	display_name = "Potato"
	path = /obj/item/reagent_container/food/snacks/grown/potato

/*
//================================================
				Smoking
//================================================
*/

	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
/datum/gear/smoking
	category = "Smoking"
	/*
	allowed_origins = NON_UPP_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/smoking/cigarette
	display_name = "Cigarette"
	path = /obj/item/clothing/mask/cigarette
	cost = 0
	slot = WEAR_FACE
	allowed_origins = FACTION_ORIGINS

	// HALO PVE EDIT - START - ITEM RENAMING, ITEM REPATHING
/datum/gear/smoking/cigarette/cigar_classic
	display_name = "Sweet William cigar"
	path = /obj/item/clothing/mask/cigarette/cigar
	// HALO PVE EDIT - END
	cost = 2

	// HALO PVE EDIT - START - ITEM RENAMING, ITEM REPATHING
/datum/gear/smoking/cigarette/cigar_premium
	display_name = "Generic cigar"
	path = /obj/item/clothing/mask/cigarette/cigar/classic
	// HALO PVE EDIT - END
	cost = 1
	allowed_origins = FACTION_ORIGINS

/datum/gear/smoking/pack_lucky_strikes
	display_name = "Pack Of Lucky Strikes"
	path = /obj/item/storage/fancy/cigarettes/lucky_strikes
	cost = 0

	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
/datum/gear/smoking/pack_laika
	display_name = "Pack Of Laika"
	path = /obj/item/storage/fancy/cigarettes/laika
	/*
	allowed_origins = UPP_ORIGINS
	*/
	// HALO PVE EDIT - END

/datum/gear/smoking/pack_emeraldgreen
	display_name = "Pack Of Emerald Greens"
	path = /obj/item/storage/fancy/cigarettes/emeraldgreen

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/smoking/pack_wygold
	display_name = "Pack Of Watashi-Yorro Golds"
	// HALO PVE EDIT - END
	path = /obj/item/storage/fancy/cigarettes/wypacket

/datum/gear/smoking/pack_koorlander
	display_name = "Pack Of Koorlander Golds"
	path = /obj/item/storage/fancy/cigarettes/kpack

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/smoking/pack_arcturian
	display_name = "Pack Of Arcadian Aces"
	// HALO PVE EDIT - END
	path = /obj/item/storage/fancy/cigarettes/arcturian_ace

	// HALO PVE EDIT - START - ITEM RENAMING
/datum/gear/smoking/pack_ladyfingers
	display_name = "Pack Of Cupid's Delights"
	// HALO PVE EDIT - END
	path = /obj/item/storage/fancy/cigarettes/lady_finger

	// HALO PVE EDIT - START - ITEM ADDITION
/datum/gear/smoking/pack_balaji
	display_name = "Pack Of Ludicrous Plaids"
	path = /obj/item/storage/fancy/cigarettes/balaji
	// HALO PVE EDIT - END

/datum/gear/smoking/spirit
	display_name = "Pack Of American Spirit, Turquoise"
	path = /obj/item/storage/fancy/cigarettes/spirit

/datum/gear/smoking/spirit_yellow
	display_name = "Pack Of American Spirit, Yellow"
	path = /obj/item/storage/fancy/cigarettes/spirit/yellow

/datum/gear/smoking/pack_exec
	display_name = "Pack Of Executive Selects"
	path = /obj/item/storage/fancy/cigarettes/blackpack
	cost = 4

	// HALO PVE EDIT - START - OPTION REMOVAL
/*
/datum/gear/smoking/weed_joint
	display_name = "Joint of weed"
	path = /obj/item/clothing/mask/cigarette/weed
	cost = 1
*/
	// HALO PVE EDIT - END

/datum/gear/smoking/lighter
	display_name = "Lighter, cheap"
	path = /obj/item/tool/lighter/random
	cost = 1
	allowed_origins = FACTION_ORIGINS

/datum/gear/smoking/zippo
	display_name = "Lighter, zippo"
	path = /obj/item/tool/lighter/zippo

/datum/gear/smoking/zippo/black
	display_name = "Black lighter, zippo"
	path = /obj/item/tool/lighter/zippo/black

/datum/gear/smoking/zippo/blue
	display_name = "Blue lighter, zippo"
	path = /obj/item/tool/lighter/zippo/blue

/datum/gear/smoking/goldzippo
	display_name = "Lighter, golden zippo"
	path = /obj/item/tool/lighter/zippo/gold
	cost = 3

/datum/gear/smoking/electronic_cigarette
	display_name = "Electronic cigarette"
	path = /obj/item/clothing/mask/electronic_cigarette

/datum/gear/smoking/electronic_cigarette/cigar
	display_name = "Electronic cigar"
	path = /obj/item/clothing/mask/electronic_cigarette/cigar
	cost = 3

/*
//================================================
				Miscellaneous
//================================================
*/

/datum/gear/misc
	category = "Miscellaneous"

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/misc/pdt_kit
	display_name = "PDT/L kit"
	path = /obj/item/storage/box/pdt_kit/advanced
	cost = 1 // it's in the vendors anyway.

/datum/gear/misc/watch
	display_name = "Seiko Pulsemeter wristwatch"
	path = /obj/item/storage/box/watch_box
	cost = 1
*/
	// HALO PVE EDIT - END

/datum/gear/misc/watch/bishop
	display_name = "Seiko 7A28-6000 wristwatch"
	path = /obj/item/storage/box/watch_box/bishop
	cost = 2

/datum/gear/misc/watch/ripley
	display_name = "Seiko 7A28-7000 wristwatch"
	path = /obj/item/storage/box/watch_box/ripley
	cost = 2

/datum/gear/misc/watch/burke
	display_name = "Seiko H556-5050 wristwatch"
	path = /obj/item/storage/box/watch_box/burke
	cost = 2

/datum/gear/misc/watch/dallas
	display_name = "Samani E-125 wristwatch"
	path = /obj/item/storage/box/watch_box/dallas
	cost = 3

	// HALO PVE EDIT - START - OPTION REMOVAL
/*
/datum/gear/misc/sunscreen_stick
	display_name = "USCM issue sunscreen"
	path = /obj/item/facepaint/sunscreen_stick
	cost = 1 //The cadmium poisoning pays for the discounted cost longterm
	allowed_origins = USCM_ORIGINS
*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - ORIGIN LOCK REMOVAL
/datum/gear/misc/dogtags
	display_name = "Attachable Dogtags"
	path = /obj/item/clothing/accessory/dogtags
	cost = 0
	slot = WEAR_IN_ACCESSORY
	/*
	allowed_origins = USCM_ORIGINS
	*/
	// HALO PVE EDIT - END

	// HALO PVE EDIT - START - OPTIONS REMOVAL
/*
/datum/gear/misc/patch_uscm
	display_name = "USCM shoulder patch"
	path = /obj/item/clothing/accessory/patch
	cost = 0
	slot = WEAR_IN_ACCESSORY
	allowed_origins = USCM_ORIGINS

/datum/gear/misc/patch_uscm/devils
	display_name = "Solar Devils shoulder patch"
	path = /obj/item/clothing/accessory/patch/devils

/datum/gear/misc/patch_uscm/ua
	display_name = "United Americas flag shoulder patch"
	path = /obj/item/clothing/accessory/patch/ua
	cost = 0
	slot = WEAR_IN_ACCESSORY
	allowed_origins = USCM_ORIGINS

/datum/gear/misc/patch_uscm/usa
	display_name = "United States flag shoulder patch" //no limited allowed_origins, a non-USCM could have the patch to show their original country
	path = /obj/item/clothing/accessory/patch/usa
	cost = 1
	slot = WEAR_IN_ACCESSORY

/datum/gear/misc/patch_upp
	display_name = "UPPAC shoulder patch"
	path = /obj/item/clothing/accessory/patch/upp
	cost = 0
	slot = WEAR_IN_ACCESSORY
	allowed_origins = UPP_ORIGINS

/datum/gear/misc/patch_upp/sof
	display_name = "Naval Infantry shoulder patch"
	path = /obj/item/clothing/accessory/patch/upp/naval

/datum/gear/misc/patch_rmc
	display_name = "Royal Marines Commando shoulder patch"
	path = /obj/item/clothing/accessory/patch/royal_marines
	cost = 0
	slot = WEAR_IN_ACCESSORY
	allowed_origins = TWE_ORIGINS

/datum/gear/misc/patch_rmc/twe
	display_name = "Three World Empire shoulder patch"
	path = /obj/item/clothing/accessory/patch/twe
*/
	// HALO PVE EDIT - END

/datum/gear/misc/family_photo
	display_name = "Family photo"
	path = /obj/item/prop/helmetgarb/family_photo
	cost = 1

/datum/gear/misc/compass
	display_name = "Compass"
	path = /obj/item/prop/helmetgarb/compass
	cost = 1

/datum/gear/misc/bug_spray
	display_name = "Bug spray"
	path = /obj/item/prop/helmetgarb/bug_spray
	cost = 1

/datum/gear/misc/straight_razor
	display_name = "Cut-throat razor"
	path = /obj/item/weapon/straight_razor
	cost = 3

/datum/gear/misc/survival_tool
	display_name = "Colonial Companion multi-tool"
	path = /obj/item/weapon/swiss_army_knife
	cost = 4 // Two tools & a knife in one package

/datum/gear/misc/can_opener
	display_name = "Can opener"
	path = /obj/item/tool/kitchen/can_opener
	cost = 1

/datum/gear/misc/can_opener/compact
	display_name = "Compact can opener"
	path = /obj/item/tool/kitchen/can_opener/compact
	cost = 2

/datum/gear/misc/eye_drops

	display_name = "Eye drops"
	path = /obj/item/prop/helmetgarb/eye_drops
	cost = 1
