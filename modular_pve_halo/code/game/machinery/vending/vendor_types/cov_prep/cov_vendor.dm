/obj/structure/machinery/cm_vending/covenant
	name = "\improper warrior equipment locker"
	desc = "An automated rack hooked up to a colossal storage of Marine Rifleman standard-issue equipment."
	icon_state = "mar_rack"
	use_points = TRUE
	show_points = TRUE
	vendor_theme = VENDOR_THEME_USCM
	vend_flags = VEND_CLUTTER_PROTECTION  | VEND_UNIFORM_AUTOEQUIP | VEND_CATEGORY_CHECK


	var/list/required_species

/obj/structure/machinery/cm_vending/covenant/attack_hand(mob/user)
	if(ishuman(user) && required_species)
		var/mob/living/carbon/human/human_user = user
		if(!(human_user.species.name in required_species))
			return
	. = ..()

/obj/structure/machinery/cm_vending/covenant/ui_static_data(mob/user)
	. = ..(user)
	.["vendor_type"] = "clothing"
	.["displayed_categories"] = vendor_user_inventory_list(user)

/obj/effect/essentials_set/needle_ammo
	spawned_gear_list = list(
		/obj/item/ammo_magazine/needler_crystal,
		/obj/item/ammo_magazine/needler_crystal,
		/obj/item/ammo_magazine/needler_crystal,
		/obj/item/ammo_magazine/needler_crystal,
		/obj/item/ammo_magazine/needler_crystal,
		/obj/item/ammo_magazine/needler_crystal,
		/obj/item/ammo_magazine/needler_crystal,
	)

/obj/effect/essentials_set/needle_rifle_ammo
	spawned_gear_list = list(
		/obj/item/ammo_magazine/needle_rifle,
		/obj/item/ammo_magazine/needle_rifle,
		/obj/item/ammo_magazine/needle_rifle,
		/obj/item/ammo_magazine/needle_rifle,
		/obj/item/ammo_magazine/needle_rifle,
		/obj/item/ammo_magazine/needle_rifle,
		/obj/item/ammo_magazine/needle_rifle,
	)

/obj/effect/essentials_set/carbine_ammo
	spawned_gear_list = list(
		/obj/item/ammo_magazine/carbine,
		/obj/item/ammo_magazine/carbine,
		/obj/item/ammo_magazine/carbine,
		/obj/item/ammo_magazine/carbine,
		/obj/item/ammo_magazine/carbine,
		/obj/item/ammo_magazine/carbine,
		/obj/item/ammo_magazine/carbine,
	)
