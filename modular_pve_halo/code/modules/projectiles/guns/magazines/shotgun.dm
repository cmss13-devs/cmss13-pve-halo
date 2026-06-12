
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

// shotgun shell boxes

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

// shotgun shell handfuls

/obj/item/ammo_magazine/handful/shotgun/halo
	name = "handful of MAG 15P-00B shotgun shells"
	icon_state = "8g_shell_6"
	default_ammo = /datum/ammo/bullet/shotgun/buckshot/unsc
	caliber = "8g"
	max_rounds = 6
	current_rounds = 6
	gun_type = /obj/item/weapon/gun/shotgun/pump/halo
	handful_state = "8g_shell"
	transfer_handful_amount = 6
	flags_human_ai = AMMUNITION_ITEM

/obj/item/ammo_magazine/handful/shotgun/halo/beanbag
	name = "handful of MAG LLHB shotgun shells"
	icon_state = "8g_beanbag_6"
	default_ammo = /datum/ammo/bullet/shotgun/beanbag/unsc
	handful_state = "8g_beanbag"
