// rifle magazines

/obj/item/ammo_magazine/rifle/halo
	name = "halo magazine"
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_magazines.dmi'
	ammo_band_icon = null
	ammo_band_icon_empty = null

/obj/item/ammo_magazine/rifle/halo/ma5c
	name = "\improper MA5C magazine (7.62x51mm FMJ)"
	desc = "A rectangular box magazine for the MA5C holding 32 rounds of 7.62x51 FMJ ammunitions."
	icon_state = "ma5c"
	max_rounds = 32
	gun_type = /obj/item/weapon/gun/rifle/halo/ma5c
	default_ammo = /datum/ammo/bullet/rifle/ma5c

// sniper magazines

/obj/item/ammo_magazine/rifle/halo/sniper
	name = "\improper SRS99-AM magazine (14.5x114mm APFSDS)"
	desc = "A rectangular box magazine for the SRS99-AM holding four rounds of 14.5x114mm armor-piercing, fin-stabilized, discarding sabot."
	icon_state = "srs99"
	max_rounds = 4
	gun_type = /obj/item/weapon/gun/rifle/sniper/halo
	default_ammo = /datum/ammo/bullet/rifle/srs99

// pistol magazines

/obj/item/ammo_magazine/pistol/halo
	name = "halo magazine"
	icon = 'icons/obj/items/weapons/guns/halo/unsc/unsc_magazines.dmi'
	ammo_band_icon = null
	ammo_band_icon_empty = null

/obj/item/ammo_magazine/pistol/halo/magnum
	name = "\improper M6C magazine (12.7x40mm SAP-HE)"
	desc = "A rectangular and slanted magazine for the M6C, holding 12 rounds of 12.7x40mm SAP-HE ammunition."
	icon_state = "m6c"
	gun_type = /obj/item/weapon/gun/pistol/halo/magnum
	default_ammo = /datum/ammo/bullet/pistol/magnum

/obj/item/ammo_magazine/pistol/halo/magnum/m6g
	name = "\improper M6G magazine (12.7x40mm SAP-HE)"
	desc = "A rectangular slanted magazine for the M6G, holding 8 rounds of 12.7x40mm SAP-HE ammunition"
	icon_state = "m6g"
	gun_type = /obj/item/weapon/gun/pistol/halo/magnum/m6g
	default_ammo = /datum/ammo/bullet/pistol/magnum
