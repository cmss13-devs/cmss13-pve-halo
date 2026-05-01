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
	display_name = "Tinted Shooting Glasses"
	path = /obj/item/clothing/glasses/sunglasses/big

/datum/gear/eyewear/bimex_shades_orange
	display_name = "Tactical Shooting Glasses"
	path = /obj/item/clothing/glasses/sunglasses/big/orange

/datum/gear/eyewear/bimex_shades_classic
	display_name = "Prototype Tinted Shooting Glasses"
	path = /obj/item/clothing/glasses/sunglasses/big/classic

/datum/gear/eyewear/sunglasses
	display_name = "Sunglasses"
	path = /obj/item/clothing/glasses/sunglasses
	cost = 0

/datum/gear/eyewear/prescription_sunglasses
	display_name = "Prescription sunglasses"
	path = /obj/item/clothing/glasses/sunglasses/prescription

/datum/gear/eyewear/pilot_visor_black
	display_name = "IHADSS visor, black"
	path = /obj/item/device/helmet_visor/po_visor/marine/unsc

/datum/gear/eyewear/pilot_visor_yellow
	display_name = "IHADSS visor, yellow"
	path = /obj/item/device/helmet_visor/po_visor/marine/unsc/yellow

/*
//================================================
				Masks & Scarves
//================================================
*/

/datum/gear/mask
	category = "Masks and scarves"
	slot = WEAR_FACE

/datum/gear/mask/balaclava_black
	display_name = "Balaclava, black"
	path = /obj/item/clothing/mask/rebreather/scarf

/datum/gear/mask/balaclava_green
	display_name = "Balaclava, green"
	path = /obj/item/clothing/mask/rebreather/scarf/green

/datum/gear/mask/balaclava_grey
	display_name = "Balaclava, grey"
	path = /obj/item/clothing/mask/rebreather/scarf/gray

/datum/gear/mask/balaclava_tan
	display_name = "Balaclava, tan"
	path = /obj/item/clothing/mask/rebreather/scarf/tan

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

/*
//================================================
				Headwear
//================================================
*/

/datum/gear/headwear
	category = "Headwear"
	cost = 3
	slot = WEAR_HEAD

/datum/gear/headwear/santa_hat
	display_name = "santa hat, red"
	path = /obj/item/clothing/head/santa
	cost = 1
	allowed_origins = USCM_ORIGINS

/datum/gear/headwear/santa_hat/special_conditions()
	return is_month(12) && (is_day(21) || is_day(22) || is_day(23) || is_day(24) || is_day(25) || is_day(26))

/datum/gear/headwear/santa_hat_green
	display_name = "santa hat, green"
	path = /obj/item/clothing/head/santa/green
	cost = 1
	allowed_origins = USCM_ORIGINS

/datum/gear/headwear/santa_hat_green/special_conditions()
	return is_month(12) && (is_day(21) || is_day(22) || is_day(23) || is_day(24) || is_day(25) || is_day(26))

/datum/gear/headwear/durag_black
	display_name = "Durag, black"
	path = /obj/item/clothing/head/durag/black

/datum/gear/headwear/durag
	display_name = "Durag, jungle"
	path = /obj/item/clothing/head/durag

/datum/gear/headwear/bandana_green
	display_name = "bandana, green"
	path = /obj/item/clothing/head/cmbandana

/datum/gear/headwear/bandana_tan
	display_name = "bandana, tan"
	path = /obj/item/clothing/head/cmbandana/tan

/datum/gear/headwear/beanie_black
	display_name = "beanie, black"
	path = /obj/item/clothing/head/beanie/royal_marine

/datum/gear/headwear/beanie_grey
	display_name = "beanie, grey"
	path = /obj/item/clothing/head/beanie/gray

/datum/gear/headwear/beanie_green
	display_name = "beanie, green"
	path = /obj/item/clothing/head/beanie/green

/datum/gear/headwear/beanie_tan
	display_name = "beanie, tan"
	path = /obj/item/clothing/head/beanie/tan

/datum/gear/headwear/boonie_jungle
	display_name = "boonie hat, jungle"
	path = /obj/item/clothing/head/cmcap/boonie

/datum/gear/headwear/boonie_desert
	display_name = "boonie hat, desert"
	path = /obj/item/clothing/head/cmcap/boonie/tan

/datum/gear/headwear/boonie_snow
	display_name = "boonie hat, snow"
	path = /obj/item/clothing/head/cmcap/boonie/snow

/datum/gear/headwear/cap
	display_name = "utility cap, jungle"
	path = /obj/item/clothing/head/cmcap
	cost = 2

/datum/gear/headwear/cap_desert
	display_name = "utility cap, desert"
	path = /obj/item/clothing/head/cmcap/desert
	cost = 2

/datum/gear/headwear/cap_snow
	display_name = "utility cap, snow"
	path = /obj/item/clothing/head/cmcap/snow
	cost = 2

/datum/gear/headwear/cap_operations
	display_name = "UNSC Operations Cap, Green"
	path = /obj/item/clothing/head/cmcap/bridge

/datum/gear/headwear/cap_operations2
	display_name = "UNSC Operations Cap, Tan"
	path = /obj/item/clothing/head/cmcap/bridge/tan

/datum/gear/headwear/cap/flap_jungle
	display_name = "UNSC expedition flapcap, jungle"
	path = /obj/item/clothing/head/cmcap/flap

/datum/gear/headwear/cap/flap_desert
	display_name = "UNSC expedition flapcap, desert"
	path = /obj/item/clothing/head/cmcap/flap/desert

/datum/gear/headwear/cap/flap_snow
	display_name = "UNSC expedition flapcap, snow"
	path = /obj/item/clothing/head/cmcap/flap/snow

/datum/gear/headwear/headband_brown
	display_name = "headband, brown"
	path = /obj/item/clothing/head/headband/brown

/datum/gear/headwear/headband_green
	display_name = "headband, green"
	path = /obj/item/clothing/head/headband

/datum/gear/headwear/headband_grey
	display_name = "headband, grey"
	path = /obj/item/clothing/head/headband/gray

/datum/gear/headwear/headband_red
	display_name = "headband, red"
	path = /obj/item/clothing/head/headband/red

/datum/gear/headwear/headband_tan
	display_name = "headband, tan"
	path = /obj/item/clothing/head/headband/tan

/datum/gear/headwear/headband_intel
	display_name = "headband, black"
	path = /obj/item/clothing/head/headband/intel

/datum/gear/headwear/headband_bravo
	display_name = "headband, orange"
	path = /obj/item/clothing/head/headband/bravo

/datum/gear/headwear/headband_charlie
	display_name = "headband, purple"
	path = /obj/item/clothing/head/headband/charlie

/datum/gear/headwear/headband_delta
	display_name = "headband, blue"
	path = /obj/item/clothing/head/headband/delta

/datum/gear/headwear/headband_echo
	display_name = "headband, cyan green"
	path = /obj/item/clothing/head/headband/echo

/datum/gear/headwear/headset
	display_name = "UNSC headset"
	path = /obj/item/clothing/head/headset

/datum/gear/headwear/ushanka
	display_name = "Ushanka"
	path = /obj/item/clothing/head/uppcap/ushanka

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

/datum/gear/helmet_garb/flair_uscm
	display_name = "Flair, UNSC"
	path = /obj/item/prop/helmetgarb/flair_uscm

/datum/gear/helmet_garb/gunoil
	display_name = "Gun oil"
	path = /obj/item/prop/helmetgarb/gunoil

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

/datum/gear/clothing/flak
	display_name = "vintage flak jacket (Blue)"
	path = /obj/item/clothing/accessory/flak
	cost = 3

/datum/gear/clothing/flak/od
	display_name = "vintage flak jacket (Green)"
	path = /obj/item/clothing/accessory/flak/od

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

/*
//================================================
				Armor & Body Paints
//================================================
*/

/datum/gear/paint
	category = "Armor & body paints"
	cost = 0

/datum/gear/paint/paint_skull
	display_name = "Skull Armor Paint"
	path = /obj/item/clothing/accessory/paint

/datum/gear/paint/paint_heart
	display_name = "Heart Armor Paint"
	path = /obj/item/clothing/accessory/paint/heart

/datum/gear/paint/target
	display_name = "Target Armor Paint"
	path = /obj/item/clothing/accessory/paint/target

/datum/gear/paint/smiley
	display_name = "Smiley-Face Armor Paint"
	path = /obj/item/clothing/accessory/paint/alcoholism

/datum/gear/paint/neutral
	display_name = "Neutral-Face Armor Paint"
	path = /obj/item/clothing/accessory/paint/melancholy

/datum/gear/paint/cross
	display_name = "Cross Armor Paint"
	path = /obj/item/clothing/accessory/paint/cross

/datum/gear/paint/pandora
	display_name = "Inscription Armor Paint"
	path = /obj/item/clothing/accessory/paint/inscription

/datum/gear/paint/flames
	display_name = "Fire Armor Paint"
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

/datum/gear/toy/mags
	cost = 1

/datum/gear/toy/mags/magazine_dirty
	display_name = "Magazine"
	path = /obj/item/prop/magazine/dirty

/datum/gear/toy/film
	display_name = "Camera film"
	path = /obj/item/device/camera_film
	cost = 0

/datum/gear/toy/card
	cost = 1

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

/datum/gear/toy/deck
	display_name = "Deck of cards, regular"
	path = /obj/item/toy/deck

/datum/gear/toy/deck/uno
	display_name = "Deck of cards, Uno"
	path = /obj/item/toy/deck/uno

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

/datum/gear/weapon/bayonet
	display_name = "M5 combat knife"
	path = 	/obj/item/attachable/bayonet

/datum/gear/weapon/kabar
	display_name = "MK88 Ratio survival knife"
	path = 	/obj/item/weapon/knife/marine/kabar

/datum/gear/weapon/bowie
	display_name = "Model 52 Navy knife"
	path = 	/obj/item/storage/box/loadout/bowie
	cost = 4

/datum/gear/weapon/kukri
	display_name = "Kukri utility knife"
	path = 	/obj/item/storage/box/loadout/bowie/kukri
	cost = 4

/datum/gear/weapon/baker
	display_name = "M11 combat knife"
	path = 	/obj/item/weapon/knife/marine/baker

/datum/gear/weapon/chinese
	display_name = "Colonial Military Authority M2 bayonet"
	path = 	/obj/item/attachable/bayonet/canc

/datum/gear/weapon/butterfly_knife
	display_name = "Butterfly Knife"
	path = /obj/item/weapon/butterfly
	cost = 3

/*
//================================================
				Canned Drinks
//================================================
*/

/datum/gear/drink
	category = "Canned drinks"
	allowed_origins = NON_UPP_ORIGINS

/datum/gear/drink/water
	display_name = "Bottled water"
	path = /obj/item/reagent_container/food/drinks/cans/waterbottle
	cost = 1

/datum/gear/drink/grape_juice
	display_name = "Grape juice"
	path = /obj/item/reagent_container/food/drinks/cans/grape_juice

/datum/gear/drink/lemon_lime
	display_name = "BLAST lemon-lime soda"
	path = /obj/item/reagent_container/food/drinks/cans/lemon_lime

/datum/gear/drink/iced_tea
	display_name = "Iced tea"
	path = /obj/item/reagent_container/food/drinks/cans/iced_tea

/datum/gear/drink/cola
	display_name = "Coca-Cola"
	path = /obj/item/reagent_container/food/drinks/cans/classcola

/datum/gear/drink/bepis
	display_name = "Pepsi"
	path = /obj/item/reagent_container/food/drinks/cans/pepsi

/datum/gear/drink/orange_soda
	display_name = "Oranj Soda"
	path = /obj/item/reagent_container/food/drinks/cans/starkist

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

/datum/gear/flask/vacuum
	display_name = "Vacuum flask"
	path = /obj/item/reagent_container/food/drinks/flask/vacuumflask

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

/datum/gear/snack_packaged
	category = "Food (packaged)"

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

/datum/gear/smoking
	category = "Smoking"

/datum/gear/smoking/cigarette
	display_name = "Cigarette"
	path = /obj/item/clothing/mask/cigarette
	cost = 0
	slot = WEAR_FACE
	allowed_origins = FACTION_ORIGINS

/datum/gear/smoking/cigarette/cigar_classic
	display_name = "Sweet William cigar"
	path = /obj/item/clothing/mask/cigarette/cigar
	cost = 2

/datum/gear/smoking/cigarette/cigar_premium
	display_name = "Generic cigar"
	path = /obj/item/clothing/mask/cigarette/cigar/classic
	cost = 1
	allowed_origins = FACTION_ORIGINS

/datum/gear/smoking/pack_lucky_strikes
	display_name = "Pack Of Lucky Strikes"
	path = /obj/item/storage/fancy/cigarettes/lucky_strikes
	cost = 0

/datum/gear/smoking/pack_laika
	display_name = "Pack Of Laika"
	path = /obj/item/storage/fancy/cigarettes/laika

/datum/gear/smoking/pack_emeraldgreen
	display_name = "Pack Of Emerald Greens"
	path = /obj/item/storage/fancy/cigarettes/emeraldgreen

/datum/gear/smoking/pack_wygold
	display_name = "Pack Of Watashi-Yorro Golds"
	path = /obj/item/storage/fancy/cigarettes/wypacket

/datum/gear/smoking/pack_koorlander
	display_name = "Pack Of Koorlander Golds"
	path = /obj/item/storage/fancy/cigarettes/kpack

/datum/gear/smoking/pack_arcturian
	display_name = "Pack Of Arcadian Aces"
	path = /obj/item/storage/fancy/cigarettes/arcturian_ace

/datum/gear/smoking/pack_ladyfingers
	display_name = "Pack Of Cupid's Delights"
	path = /obj/item/storage/fancy/cigarettes/lady_finger

/datum/gear/smoking/pack_balaji
	display_name = "Pack Of Ludicrous Plaids"
	path = /obj/item/storage/fancy/cigarettes/balaji

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

/datum/gear/misc/watch
	display_name = "Seiko Pulsemeter wristwatch"
	path = /obj/item/storage/box/watch_box
	cost = 1

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

/datum/gear/misc/dogtags
	display_name = "Attachable Dogtags"
	path = /obj/item/clothing/accessory/dogtags
	cost = 0
	slot = WEAR_IN_ACCESSORY

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
