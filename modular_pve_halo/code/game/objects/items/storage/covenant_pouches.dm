/obj/item/storage/pouch/general/covenant
	name = "covenant storage shellcase"
	desc = "A general-purpose shellcase made of nanolaminate. Intended to fit a variety of items."
	icon = 'icons/halo/obj/items/clothing/covenant/pouches.dmi'
	icon_state = "general"
	max_storage_space = 4

/obj/item/storage/pouch/general/covenant/large
	name = "large covenant storage shellcase"
	desc = "A general-purpose shellcase made of nanolaminate. Intended to fit a variety of items. This one is larger than most standard models."
	icon_state = "generallarge"
	max_storage_space = 6

/obj/item/storage/pouch/magazine/covenant
	name = "ammo storage shellcases"
	desc = "A set of nanolaminate shellcases for storing ammunition."
	icon = 'icons/halo/obj/items/clothing/covenant/pouches.dmi'
	icon_state = "ammo"
	max_w_class = SIZE_MEDIUM
	storage_slots = 4
	can_hold = list(
		/obj/item/attachable/bayonet,
		/obj/item/weapon/knife,
		/obj/item/device/flashlight/flare,
		/obj/item/ammo_magazine/rifle,
		/obj/item/ammo_magazine/m60,
		/obj/item/ammo_magazine/smg,
		/obj/item/ammo_magazine/pistol,
		/obj/item/ammo_magazine/revolver,
		/obj/item/ammo_magazine/sniper,
		/obj/item/ammo_magazine/handful,
		/obj/item/explosive/grenade,
		/obj/item/explosive/mine,
		/obj/item/reagent_container/food/snacks,
		/obj/item/ammo_magazine/plasma,
		/obj/item/ammo_magazine/needler_crystal,
		/obj/item/ammo_magazine/carbine,
		/obj/item/ammo_magazine/needle_rifle,
	)
	bypass_w_limit = list(
		/obj/item/ammo_magazine/rifle,
		/obj/item/ammo_magazine/smg,
		/obj/item/ammo_magazine/plasma,
		/obj/item/ammo_magazine/needler_crystal,
		/obj/item/ammo_magazine/carbine,
		/obj/item/ammo_magazine/needle_rifle,
	)

/obj/item/storage/pouch/magazine/covenant/large
	name = "expanded ammo storage shellcases"
	desc = "An expanded set of nanolaminate shellcases for storing ammunition."
	icon_state = "ammolarge"
	storage_slots = 6

/obj/item/storage/pouch/tools/covenant
	name = "tool shellcases"
	desc = "It's designed to hold maintenance tools - screwdriver, wrench, cable coil, etc. It also has a hook for an entrenching tool or light replacer."
	icon = 'icons/halo/obj/items/clothing/covenant/pouches.dmi'
	icon_state = "tools"
	storage_slots = 5
	max_w_class = SIZE_MEDIUM

/obj/item/storage/pouch/tools/covenant/full/fill_preset_inventory()
	new /obj/item/tool/screwdriver/tactical(src)
	new /obj/item/tool/wirecutters/tactical(src)
	new /obj/item/tool/crowbar/tactical(src)
	new /obj/item/stack/cable_coil(src)
	new /obj/item/device/multitool(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/explosive/plastic(src)
	new /obj/item/explosive/plastic(src)

/obj/item/storage/pouch/medkit/covenant
	name = "medical shellcase"
	desc = "A nanolaminate shellcase purpose built for storing medical supplies and tools."
	icon = 'icons/halo/obj/items/clothing/covenant/pouches.dmi'
	icon_state = "medical"
	storage_slots = 9
	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/reagent_container/dropper,
		/obj/item/reagent_container/pill,
		/obj/item/reagent_container/glass/bottle,
		/obj/item/reagent_container/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/reagent_container/hypospray,
		/obj/item/storage/syringe_case,
		/obj/item/storage/surgical_case,
		/obj/item/tool/surgery/surgical_line,
		/obj/item/tool/surgery/synthgraft,
		/obj/item/roller,
		/obj/item/bodybag,
		/obj/item/reagent_container/blood,
		/obj/item/tool/surgery/FixOVein,
		/obj/item/reagent_container/glass/beaker/vial/covenant_vial,
		/obj/item/tool/covenant_tweezers,
	)

/obj/item/storage/pouch/medkit/covenant/full/fill_preset_inventory()
	new /obj/item/stack/medical/bruise_pack/covenant(src)
	new /obj/item/stack/medical/ointment/covenant(src)
	new /obj/item/stack/medical/splint/covenant(src)
	new /obj/item/tool/covenant_tweezers(src)
	new /obj/item/reagent_container/hypospray/covenant/bica_kelo_mix(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tramadol(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tricord(src)
	new /obj/item/reagent_container/hypospray/autoinjector/covenant/organfixer(src)
	new /obj/item/reagent_container/hypospray/autoinjector/covenant/veinfixer(src)

/obj/item/storage/pouch/medkit/covenant/full_elite/fill_preset_inventory()
	new /obj/item/stack/medical/bruise_pack/covenant(src)
	new /obj/item/stack/medical/ointment/covenant(src)
	new /obj/item/stack/medical/splint/covenant(src)
	new /obj/item/tool/covenant_tweezers/advanced(src)
	new /obj/item/reagent_container/hypospray/covenant/bica_kelo_mix(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tramadol(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tricord(src)
	new /obj/item/reagent_container/hypospray/autoinjector/covenant/organfixer(src)
	new /obj/item/reagent_container/hypospray/autoinjector/covenant/veinfixer(src)

/obj/item/storage/pouch/medkit/covenant/large
	name = "expanded medical shellcases"
	desc = "An expanded set of nanolaminate shellcases purpose built for storing medical supplies and tools."
	icon_state = "medicallarge"
	storage_slots = 14

/obj/item/storage/pouch/medkit/covenant/large/full/fill_preset_inventory()
	new /obj/item/device/healthanalyzer/covenant(src)
	new /obj/item/stack/medical/bruise_pack/covenant(src)
	new /obj/item/stack/medical/bruise_pack/covenant(src)
	new /obj/item/stack/medical/ointment/covenant(src)
	new /obj/item/stack/medical/ointment/covenant(src)
	new /obj/item/stack/medical/splint/covenant(src)
	new /obj/item/tool/covenant_tweezers(src)
	new /obj/item/reagent_container/hypospray/covenant/tricord(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/bicaridine(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/kelotane(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tramadol(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/dexalin(src)
	new /obj/item/reagent_container/hypospray/autoinjector/covenant/organfixer(src)
	new /obj/item/reagent_container/hypospray/autoinjector/covenant/veinfixer(src)

/obj/item/storage/pouch/medkit/covenant/large/full_elite/fill_preset_inventory()
	new /obj/item/device/healthanalyzer/covenant(src)
	new /obj/item/stack/medical/bruise_pack/covenant(src)
	new /obj/item/stack/medical/bruise_pack/covenant(src)
	new /obj/item/stack/medical/ointment/covenant(src)
	new /obj/item/stack/medical/ointment/covenant(src)
	new /obj/item/stack/medical/splint/covenant(src)
	new /obj/item/tool/covenant_tweezers/advanced(src)
	new /obj/item/reagent_container/hypospray/covenant/tricord(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/bicaridine(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/kelotane(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tramadol(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/dexalin(src)
	new /obj/item/reagent_container/hypospray/autoinjector/covenant/organfixer(src)
	new /obj/item/reagent_container/hypospray/autoinjector/covenant/veinfixer(src)

/obj/item/storage/pouch/medkit/covenant/vials
	name = "vial shellcases"
	desc = "Several shellcases intended to store solely subcutaneous injector vials."
	icon_state = "vials"
	storage_slots = 14
	can_hold = list(/obj/item/reagent_container/glass/beaker/vial/covenant_vial)

/obj/item/storage/pouch/medkit/covenant/vials/full/fill_preset_inventory()
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/bicaridine(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/bicaridine(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/kelotane(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/kelotane(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tramadol(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tramadol(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tricord(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/dexalin(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/antitox(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/peridaxon(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/inaprovaline(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/blood_regen(src)
	new /obj/item/reagent_container/glass/beaker/vial/covenant_vial/blood_regen(src)
