
// shotgun internal magazines

/obj/item/ammo_magazine/internal/shotgun/m90
	caliber = "8g"
	max_rounds = 12
	current_rounds = 12
	default_ammo = /datum/ammo/bullet/shotgun/buckshot/unsc

/obj/item/ammo_magazine/internal/shotgun/m90/unloaded
	current_rounds = 0

/obj/item/ammo_magazine/internal/shotgun/m90/police
	default_ammo = /datum/ammo/bullet/shotgun/beanbag/unsc

// shotgun shells

/obj/item/ammo_magazine/shotgun/buckshot/unsc
	name = "UNSC 8-gauge shotgun shell box"
	desc = "A box filled with 8-gauge MAG 15P-00B buckshot shells."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_magazines.dmi'
	icon_state = "8g"
	default_ammo = /datum/ammo/bullet/shotgun/buckshot/unsc
	transfer_handful_amount = 6
	max_rounds = 24
	caliber = "8g"

/obj/item/ammo_magazine/shotgun/beanbag/unsc
	name = "UNSC 8-gauge shotgun beanbag box"
	desc = "A box filled with 8-gauge MAG LLHB beanbag shells."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_magazines.dmi'
	icon_state = "8g_beanbag"
	default_ammo = /datum/ammo/bullet/shotgun/beanbag/unsc
	transfer_handful_amount = 6
	max_rounds = 24
	caliber = "8g"
