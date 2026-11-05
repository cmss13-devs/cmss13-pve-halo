/obj/structure/machinery/cm_vending/sorted/covenant/ammo
	name = "\improper Covenant Ammo Supply"
	desc = "Ammo supply vendor."
	icon = 'icons/halo/obj/structures/machinery/cov_vending.dmi'
	icon_state = "ammo"
	req_access = null

/obj/structure/machinery/cm_vending/sorted/covenant/ammo/populate_product_list(scale)
	listed_products = list(
		list("AMMO", -1, null, null),
		list("Blamite Crystal", 40, /obj/item/ammo_magazine/needler_crystal, VENDOR_ITEM_REGULAR),
		list("Carbine Canister", 40, /obj/item/ammo_magazine/carbine, VENDOR_ITEM_REGULAR),
		list("Blamite Canister", 40, /obj/item/ammo_magazine/needle_rifle, VENDOR_ITEM_REGULAR),
)
