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
		list("Menu 1: Chili & Cornbread", 15, /obj/item/reagent_container/food/snacks/mre_pack/meal1, VENDOR_ITEM_REGULAR),
		list("Menu 2: Ham & Potatoes", 15, /obj/item/reagent_container/food/snacks/mre_pack/meal2, VENDOR_ITEM_REGULAR),
		list("Menu 3: Spaghetti", 15, /obj/item/reagent_container/food/snacks/mre_pack/meal3, VENDOR_ITEM_REGULAR),
		list("Menu 4: Pizza", 15, /obj/item/reagent_container/food/snacks/mre_pack/meal4, VENDOR_ITEM_REGULAR),
		list("Menu 5: Chicken", 15, /obj/item/reagent_container/food/snacks/mre_pack/meal5, VENDOR_ITEM_REGULAR),
		list("Menu 6: Vegetarian Tofu", 15, /obj/item/reagent_container/food/snacks/mre_pack/meal6, VENDOR_ITEM_REGULAR),
		list("Menu 7: Vegetarian Macaroni & Cheese", 15, /obj/item/reagent_container/food/snacks/mre_pack/meal7, VENDOR_ITEM_REGULAR),
		// these spaces are purely for readability. Preemptive Action is an unsubtle reference to First Strike Bars.
		list("PREEMPTIVE ACTION BARS", -1, null, null),
		list("Chocolate Flavor", 50, /obj/item/reagent_container/food/snacks/protein_pack, VENDOR_ITEM_REGULAR),
		list("Strawberry Flavor", 50, /obj/item/reagent_container/food/snacks/protein_pack2, VENDOR_ITEM_REGULAR),
		list("Vanilla Flavor", 50, /obj/item/reagent_container/food/snacks/protein_pack3, VENDOR_ITEM_REGULAR),
		// I kind of wish there was just a generic sweet mix.
		list("DRINK MIXES", -1, null, null),
		list("Orange Drink Packet", 15, /obj/item/reagent_container/food/condiment/juice/orange, VENDOR_ITEM_REGULAR),
		list("Apple Drink Packet", 15, /obj/item/reagent_container/food/condiment/juice/apple, VENDOR_ITEM_REGULAR),
		list("Watermelon Drink Packet", 15, /obj/item/reagent_container/food/condiment/juice/watermelon, VENDOR_ITEM_REGULAR),
		list("Grape Drink Packet", 15, /obj/item/reagent_container/food/condiment/juice/grape, VENDOR_ITEM_REGULAR),
		list("Pineapple Drink Packet", 15, /obj/item/reagent_container/food/condiment/juice/pineapple, VENDOR_ITEM_REGULAR),
		//weird to have these here but I guess I'll toss in cups.
		list("CONTAINERS", -1, null, null),
		list("Canteen", 10, /obj/item/reagent_container/food/drinks/flask/canteen, VENDOR_ITEM_REGULAR),
		list("Metal Flask", 10, /obj/item/reagent_container/food/drinks/flask, VENDOR_ITEM_REGULAR),
		list("USCM Flask", 5, /obj/item/reagent_container/food/drinks/flask/marine, VENDOR_ITEM_REGULAR),
		list("W-Y Flask", 5, /obj/item/reagent_container/food/drinks/flask/weylandyutani, VENDOR_ITEM_REGULAR),
		list("Plastic Cup", 20, /obj/item/reagent_container/food/drinks/cup, VENDOR_ITEM_REGULAR)
	)
