// pistol magazines

/obj/item/ammo_magazine/pistol/halo
	name = "halo magazine"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_magazines.dmi'
	icon_state = null
	ammo_band_icon = null
	ammo_band_icon_empty = null
	caliber = "12.7x40mm"

/obj/item/ammo_magazine/pistol/halo/m6c
	name = "\improper M6C magazine (12.7x40mm SAP-HE)"
	desc = "A rectangular and slanted magazine for the M6C, holding 12 rounds of 12.7x40mm SAP-HE ammunition."
	icon_state = "m6c"
	gun_type = /obj/item/weapon/gun/pistol/halo/m6c
	default_ammo = /datum/ammo/bullet/pistol/magnum
	max_rounds = 12
	bonus_overlay = "m6c_overlay"

/obj/item/ammo_magazine/pistol/halo/m6c/socom
	name = "\improper M6C/SOCOM magazine (12.7x40mm SAP-HE)"
	desc = "An extended capacity M6C magazine, capable of holding 16 rounds compared to the standard 12. Comes in special-ops black, for the true clandestine operative."
	max_rounds = 16
	icon_state = "m6c_socom"
	bonus_overlay = "m6c_ext_overlay"

/obj/item/ammo_magazine/pistol/halo/m6a
	name = "\improper M6A magazine (12.7x40mm SAP-HE)"
	desc = "A rectangular and slanted magazine for the M6A, holding 12 rounds of 12.7x40mm SAP-HE ammunition."
	icon_state = "m6c"
	gun_type = /obj/item/weapon/gun/pistol/halo/m6a
	default_ammo = /datum/ammo/bullet/pistol/magnum
	max_rounds = 12

/obj/item/ammo_magazine/pistol/halo/m6g
	name = "\improper M6G magazine (12.7x40mm SAP-HE)"
	desc = "A rectangular slanted magazine for the M6G, holding 8 rounds of 12.7x40mm SAP-HE ammunition."
	icon_state = "m6g"
	gun_type = /obj/item/weapon/gun/pistol/halo/m6g
	default_ammo = /datum/ammo/bullet/pistol/magnum
	max_rounds = 8

/obj/item/ammo_magazine/pistol/halo/m6d
	name = "\improper M6D magazine (12.7x40mm SAP-HE)"
	desc = "A rectangular slanted magazine for the M6D, holding 12 rounds of 12.7x40mm SAP-HE ammunition. Chrome finish."
	icon_state = "m6d"
	gun_type = /obj/item/weapon/gun/pistol/halo/m6d
	default_ammo = /datum/ammo/bullet/pistol/magnum
	max_rounds = 12
