/obj/structure/machinery/cm_vending/sorted/marine_food/unsc
	name = "military food dispenser"
	desc = "An automated food prep and dispensing station. It pre-prepares meals and beverages for UNSC personnel and automatically cleans itself and any trays fed back into it. The self-cleaning option is often disabled to encourage discipline among marines."
	icon = 'icons/halo/obj/structures/machinery/vending.dmi'
	icon_state = "top_unsc_food"
	tiles_with = list(
		/obj/structure/window/framed/unsc,
		/obj/structure/machinery/door/airlock,
		/turf/closed/wall/unsc,
	)

/obj/structure/machinery/cm_vending/sorted/marine_food/unsc/alt
	icon_state = "unsc_food"

/obj/structure/machinery/vending/dinnerware/unsc
	name = "\improper military utensils dispenser"
	desc = "Paired with the food dispenser, the utensils machine is a much more simplistic design and only requires manual restocking."
	icon = 'icons/halo/obj/structures/machinery/vending.dmi'
	icon_state = "top_unsc_dinnerware"
	icon_vend = "top_unsc_dinnerware_vend"
	icon_deny = "top_unsc_dinnerware_deny"
	tiles_with = list(
		/obj/structure/window/framed/unsc,
		/obj/structure/machinery/door/airlock,
		/turf/closed/wall/unsc,
	)

/obj/structure/machinery/vending/dinnerware/unsc/alt
	icon_state = "unsc_dinnerware"
	icon_vend = "unsc_dinnerware_vend"
	icon_deny = "unsc_dinnerware_deny"

/obj/structure/machinery/cm_vending/sorted/medical/unsc
	name = "\improper Optican Military Supply"
	desc = "Medical pharmaceutical dispenser. Provided by Optican."
	icon = 'icons/halo/obj/structures/machinery/vending.dmi'
	icon_state = "shipmed"
	vendor_theme = VENDOR_THEME_USCM

/obj/structure/machinery/cm_vending/sorted/medical/unsc/populate_product_list(scale)
	listed_products = list(
		list("FIELD SUPPLIES", -1, null, null),
		list("Ointment", floor(scale * 10), /obj/item/stack/medical/ointment, VENDOR_ITEM_REGULAR),
		list("Roll of Gauze", floor(scale * 10), /obj/item/stack/medical/bruise_pack, VENDOR_ITEM_REGULAR),
		list("Splints", floor(scale * 10), /obj/item/stack/medical/splint, VENDOR_ITEM_REGULAR),\

		list("BRUTE TREATMENT", -1, null, null),
		list("Trauma Kit", floor(scale * 10), /obj/item/stack/medical/advanced/bruise_pack, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Bicaridine)", floor(scale * 5), /obj/item/reagent_container/hypospray/autoinjector/bicaridine, VENDOR_ITEM_REGULAR),
		list("Bottle (Bicaridine)", floor(scale * 3), /obj/item/reagent_container/glass/beaker/unsc/bicaridine, VENDOR_ITEM_REGULAR),

		list("BURN TREATMENT", -1, null, null),
		list("Burn Kit", floor(scale * 10), /obj/item/stack/medical/advanced/ointment, VENDOR_ITEM_REGULAR),
		list("Optican Burn Guard", floor(scale * 3), /obj/item/reagent_container/hypospray/autoinjector/primeable/burnguard, VENDOR_ITEM_REGULAR),

		list("OXYGEN TREATMENT", -1, null, null),
		list("Autoinjector (Dexalin+)", floor(scale * 5), /obj/item/reagent_container/hypospray/autoinjector/dexalinp, VENDOR_ITEM_REGULAR),
		list("Bottle (Dexalin)", floor(scale * 3), /obj/item/reagent_container/glass/beaker/unsc/dexalin, VENDOR_ITEM_REGULAR),

		list("PAIN TREATMENT", -1, null, null),
		list("Autoinjector (Oxycodone)", floor(scale * 5), /obj/item/reagent_container/hypospray/autoinjector/oxycodone, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Tramadol)", floor(scale * 5), /obj/item/reagent_container/hypospray/autoinjector/tramadol, VENDOR_ITEM_REGULAR),
		list("Bottle (Tramadol)", floor(scale * 3), /obj/item/reagent_container/glass/beaker/unsc/tramadol, VENDOR_ITEM_REGULAR),
		list("Bottle (Oxycodone)", floor(scale * 3), /obj/item/reagent_container/glass/beaker/unsc/oxycodone, VENDOR_ITEM_REGULAR),

		list("OTHER TREATMENT", -1, null, null),
		list("Autoinjector (Inaprovaline)", floor(scale * 5), /obj/item/reagent_container/hypospray/autoinjector/inaprovaline, VENDOR_ITEM_REGULAR),
		list("Bottle (Inaprovaline)", floor(scale * 3), /obj/item/reagent_container/glass/beaker/unsc/inaprovaline, VENDOR_ITEM_REGULAR),
		list("Bottle (Peridaxon)", floor(scale * 3), /obj/item/reagent_container/glass/beaker/unsc/peridaxon, VENDOR_ITEM_REGULAR),
		list("Bottle (Dylovene)", floor(scale * 3), /obj/item/reagent_container/glass/beaker/unsc/dylovene, VENDOR_ITEM_REGULAR),

		list("MEDICAL UTILITIES", -1, null, null),
		list("Surgical Line", floor(scale * 2), /obj/item/tool/surgery/surgical_line, VENDOR_ITEM_REGULAR),
		list("Synth-Graft", floor(scale * 2), /obj/item/tool/surgery/synthgraft, VENDOR_ITEM_REGULAR),
		list("Hypospray", floor(scale * 3), /obj/item/reagent_container/hypospray/tricordrazine, VENDOR_ITEM_REGULAR),
		list("Health Analyzer", floor(scale * 5), /obj/item/device/healthanalyzer, VENDOR_ITEM_REGULAR),
		list("M276 Pattern Medical Storage Rig", floor(scale * 2), /obj/item/storage/belt/medical, VENDOR_ITEM_REGULAR),
		list("Medical HUD Glasses", floor(scale * 3), /obj/item/clothing/glasses/hud/health, VENDOR_ITEM_REGULAR),
		list("Syringe", floor(scale * 7), /obj/item/reagent_container/syringe, VENDOR_ITEM_REGULAR)
	)
