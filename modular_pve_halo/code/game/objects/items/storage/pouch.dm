/obj/item/storage/pouch/first_responder/unsc

	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/reagent_container/pill,
		/obj/item/reagent_container/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/reagent_container/hypospray,
		/obj/item/tool/extinguisher/mini,
		/obj/item/roller,
		/obj/item/bodybag,
		/obj/item/storage/syringe_case,
	)


/obj/item/storage/pouch/first_responder/unsc/fill_preset_inventory()
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/reagent_container/hypospray/autoinjector/primeable/biofoam/small(src)
	new /obj/item/storage/syringe_case/unsc/morphine/full(src)
