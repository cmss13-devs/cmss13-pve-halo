/obj/structure/machinery/cm_vending/sorted/medical/covenant
	name = "\improper Covenant Apothecary Supply"
	desc = "Medical pharmaceutical dispenser. Provided by...uh...Optican..? Wait no. Sacred Promissary. Totally."
	icon = 'icons/halo/obj/structures/machinery/vending.dmi'
	icon_state = "shipmed"
	vendor_theme = VENDOR_THEME_USCM
	req_access = null

/obj/structure/machinery/cm_vending/sorted/medical/covenant/populate_product_list(scale)
	listed_products = list(
		list("ESSENTIALS", -1, null, null),
		list("Health Scanner", 20, /obj/item/device/healthanalyzer/covenant, VENDOR_ITEM_MANDATORY),
		list("Subcutaneous Injector", 20, /obj/item/reagent_container/hypospray/covenant, VENDOR_ITEM_REGULAR),
		list("Shrapnel Tweezers", 20, /obj/item/tool/covenant_tweezers, VENDOR_ITEM_REGULAR),
		list("Gravitic Shrapnel Manipulators", 1, /obj/item/tool/covenant_tweezers/advanced, VENDOR_ITEM_REGULAR),

		list("JET AUTO-INJECTORS", -1, null, null),
		list("Autoinjector (Oxycodone)", 20, /obj/item/reagent_container/hypospray/autoinjector/covenant/oxycodone, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Dexalin+)", 20, /obj/item/reagent_container/hypospray/autoinjector/covenant/dexalinp, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Organ Repair)", 20, /obj/item/reagent_container/hypospray/autoinjector/covenant/organfixer, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Vein Repair)", 20, /obj/item/reagent_container/hypospray/autoinjector/covenant/veinfixer, VENDOR_ITEM_REGULAR),

		list("BASIC TREATMENT", -1, null, null),
		list("Sealant Mesh", 40, /obj/item/stack/medical/bruise_pack/covenant, VENDOR_ITEM_REGULAR),
		list("Thermal Applicators", 40, /obj/item/stack/medical/ointment/covenant, VENDOR_ITEM_REGULAR),
		list("Magnetic Splints", 40, /obj/item/stack/medical/splint/covenant, VENDOR_ITEM_REGULAR),

		list("SUBCUTANEOUS INJECTOR VIALS", -1, null, null),
		list("Vial (Bicaridine)", 20, /obj/item/reagent_container/glass/beaker/vial/covenant_vial/bicaridine, VENDOR_ITEM_REGULAR),
		list("Vial (Kelotane)", 20, /obj/item/reagent_container/glass/beaker/vial/covenant_vial/kelotane, VENDOR_ITEM_REGULAR),
		list("Vial (Bicaridine/Kelotane)", 20, /obj/item/reagent_container/glass/beaker/vial/covenant_vial/bica_kelo_mix, VENDOR_ITEM_REGULAR),
		list("Vial (Tricordrazine)", 20, /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tricord, VENDOR_ITEM_REGULAR),
		list("Vial (Dexalin)", 20, /obj/item/reagent_container/glass/beaker/vial/covenant_vial/dexalin, VENDOR_ITEM_REGULAR),
		list("Vial (Dylovene)", 20, /obj/item/reagent_container/glass/beaker/vial/covenant_vial/antitox, VENDOR_ITEM_REGULAR),
		list("Vial (Tramadol)", 20, /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tramadol, VENDOR_ITEM_REGULAR),
		list("Vial (Peridaxon)", 20, /obj/item/reagent_container/glass/beaker/vial/covenant_vial/peridaxon, VENDOR_ITEM_REGULAR),
		list("Vial (Inaprovaline)", 20, /obj/item/reagent_container/glass/beaker/vial/covenant_vial/inaprovaline, VENDOR_ITEM_REGULAR),
		list("Vial (Blood Regen)", 20, /obj/item/reagent_container/glass/beaker/vial/covenant_vial/blood_regen, VENDOR_ITEM_REGULAR),

		list("BLOOD CASES", -1, null, null),
		list("Blood Case (Sangheili)", 20, /obj/item/reagent_container/blood/covenant/sangheili, VENDOR_ITEM_REGULAR),
		list("Blood Case (Ruuhtian)", 20, /obj/item/reagent_container/blood/covenant/ruuhtian, VENDOR_ITEM_REGULAR),
		list("Blood Case (Unggoy)", 20, /obj/item/reagent_container/blood/covenant/unggoy, VENDOR_ITEM_REGULAR),
		list("Saline Case", 20, /obj/item/reagent_container/blood/covenant/saline, VENDOR_ITEM_REGULAR),
	)
