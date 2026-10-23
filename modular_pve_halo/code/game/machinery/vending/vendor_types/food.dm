/obj/structure/machinery/cm_vending/sorted/marine_food/covenant
	name = "\improper Food Dispensery"
	desc = "To be added..."
	icon = 'icons/halo/obj/structures/machinery/vending_covenant.dmi'
	icon_state = "food_machine"
	wrenchable = FALSE

/obj/structure/machinery/cm_vending/sorted/marine_food/covenant/alt
	icon_state = "food_machine2"

/obj/structure/machinery/cm_vending/sorted/marine_food/covenant/populate_product_list(scale) // we keep this for now until we get new food...
	listed_products = list(
		list("MECHANICALLY PREPARED MEALS", -1, null, null),
		list("Sangheili Ration", 15, /obj/item/reagent_container/food/snacks/covenant/ration/sangheili, VENDOR_ITEM_REGULAR),
		list("Kig-Yar Ration", 15, /obj/item/reagent_container/food/snacks/covenant/ration/kigyar, VENDOR_ITEM_REGULAR),
		list("Unggoy Ration", 15, /obj/item/reagent_container/food/snacks/covenant/ration/unggoy, VENDOR_ITEM_REGULAR),
	)
