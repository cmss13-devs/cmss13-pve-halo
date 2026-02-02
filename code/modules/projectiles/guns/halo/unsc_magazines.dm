// rifle magazines

/obj/item/ammo_magazine/rifle/halo
	name = "halo magazine"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_magazines.dmi'
	icon_state = null
	ammo_band_icon = null
	ammo_band_icon_empty = null

/obj/item/ammo_magazine/rifle/halo/ma5c
	name = "\improper MA5C magazine (7.62x51mm FMJ)"
	desc = "A rectangular box magazine for the MA5C holding 48 rounds of 7.62x51 FMJ ammunitions."
	icon_state = "ma5c"
	max_rounds = 48
	gun_type = /obj/item/weapon/gun/rifle/halo/ma5c
	default_ammo = /datum/ammo/bullet/rifle/ma5
	caliber = "7.62x51"
	ammo_band_icon = "+ma5c_band"
	ammo_band_icon_empty = "+ma5c_band_e"

/obj/item/ammo_magazine/rifle/halo/ma5c/shredder
	name = "\improper MA5C magazine (7.62x51mm Shredder)"
	desc = "A rectangular box magazine for the MA5C holding 48 rounds of 7.62x51 shredder ammunitions, a specialized ammunition that pierces armor and splinters in the target."
	max_rounds = 48
	gun_type = /obj/item/weapon/gun/rifle/halo/ma5c
	default_ammo = /datum/ammo/bullet/rifle/ma5/shredder
	caliber = "7.62x51"
	ammo_band_color = "#994545"

/obj/item/ammo_magazine/rifle/halo/ma5b
	name = "\improper MA5B magazine (7.62x51mm FMJ)"
	desc = "A rectangular box magazine for the MA5C holding 60 rounds of 7.62x51 FMJ ammunitions."
	icon_state = "ma5b"
	max_rounds = 60
	gun_type = /obj/item/weapon/gun/rifle/halo/ma5b
	default_ammo = /datum/ammo/bullet/rifle/ma5
	caliber = "7.62x51"
	ammo_band_icon = "+ma5b_band"
	ammo_band_icon_empty = "+ma5b_band_e"

/obj/item/ammo_magazine/rifle/halo/ma5b/shredder
	name = "\improper MA5B magazine (7.62x51mm Shredder)"
	desc = "A rectangular box magazine for the MA5B holding 60 rounds of 7.62x51 shredder ammunitions, a specialized ammunition that pierces armor and splinters in the target."
	max_rounds = 60
	gun_type = /obj/item/weapon/gun/rifle/halo/ma5b
	default_ammo = /datum/ammo/bullet/rifle/ma5/shredder
	caliber = "7.62x51"
	ammo_band_color = "#994545"

/obj/item/ammo_magazine/rifle/halo/ma3a
	name = "\improper MA3A magazine (7.62x51mm FMJ)"
	desc = "A rectangular box magazine for the MA3A holding 32 rounds of 7.62x51 FMJ ammunitions."
	icon_state = "ma3a"
	max_rounds = 32
	gun_type = /obj/item/weapon/gun/rifle/halo/ma3a
	default_ammo = /datum/ammo/bullet/rifle/ma3a
	caliber = "7.62x51"

/obj/item/ammo_magazine/rifle/halo/vk78
	name = "\improper VK78 magazine (6.5x48mm FMJ)"
	desc = "An angular box magazine for the VK78 holding 20 rounds of 6.5x48mm FMJ ammunitions."
	icon_state = "vk78"
	max_rounds = 20
	gun_type = /obj/item/weapon/gun/rifle/halo/vk78
	default_ammo = /datum/ammo/bullet/rifle/vk78
	caliber = "6.5x48"

/obj/item/ammo_magazine/rifle/halo/br55
	name = "\improper BR55 magazine (9.5x40mm X-HP SAP-HE)"
	desc = "A rectangular box magazine for the BR55 holding 36 rounds of 9.5x40mm X-HP SAP-HE ammunitions."
	icon_state = "br55"
	max_rounds = 36
	gun_type = /obj/item/weapon/gun/rifle/halo/br55
	default_ammo = /datum/ammo/bullet/rifle/br55
	caliber = "9.5x40mm"
	bonus_overlay = "br55_overlay"

/obj/item/ammo_magazine/rifle/halo/br55/extended
	name = "\improper quad-stack BR55 magazine (9.5x40mm X-HP SAP-HE)"
	desc = "A quad-stack rectangular box magazine for the BR55 holding 60 rounds of 9.5x40mm X-HP SAP-HE ammunitions."
	icon_state = "br55_quadstack"
	max_rounds = 60
	bonus_overlay = "br55_ext_overlay"

/obj/item/ammo_magazine/rifle/halo/dmr
	name = "\improper M392 DMR magazine (7.62x51mm FMJ)"
	desc = "A rectangular 15 round box magazine for the M392 DMR filled with 7.62x51mm FMJ ammo."
	icon_state = "dmr"
	max_rounds = 15
	gun_type = /obj/item/weapon/gun/rifle/halo/dmr
	default_ammo = /datum/ammo/bullet/rifle/dmr
	caliber = "7.62x51"

// smg magazines
/obj/item/ammo_magazine/smg/halo
	name = "halo smg magazine"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_magazines.dmi'
	icon_state = null
	ammo_band_icon = null
	ammo_band_icon_empty = null

/obj/item/ammo_magazine/smg/halo/m7
	name = "\improper M7 magazine (5×23mm M443 Caseless FMJ)"
	desc = "A rectangular magazine to be inserted into the side of the M7 submachine gun. It holds 60 rounds of 5×23mm M443 Caseless FMJ."
	icon_state = "m7"
	max_rounds = 60
	gun_type = /obj/item/weapon/gun/smg/halo/
	default_ammo = /datum/ammo/bullet/smg/m7
	caliber = "5x23mm"

// sniper magazines

/obj/item/ammo_magazine/rifle/halo/sniper
	name = "\improper SRS99-AM magazine (14.5x114mm APFSDS)"
	desc = "A rectangular box magazine for the SRS99-AM holding four rounds of 14.5x114mm armor-piercing, fin-stabilized, discarding sabot."
	icon_state = "srs99"
	max_rounds = 4
	gun_type = /obj/item/weapon/gun/rifle/sniper/halo
	default_ammo = /datum/ammo/bullet/rifle/srs99
	caliber = "14.5x114mm"

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

// rockets

/obj/item/ammo_magazine/spnkr
	name = "\improper M19 SSM tube assembly"
	desc = "A 102mm dual-tubed rocket assembly intended to be loaded into an M41 spnkr."
	caliber = "102mm"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/special.dmi'
	icon_state = "spnkr_rockets"
	bonus_overlay = "spnkr_rockets"
	w_class = SIZE_LARGE
	max_rounds = 2
	default_ammo = /datum/ammo/rocket/spnkr
	gun_type = /obj/item/weapon/gun/halo_launcher/spnkr
	reload_delay = 30

/obj/item/ammo_magazine/spnkr/update_icon()
	..()
	if(current_rounds <= 0)
		name = "\improper spent M19 SSM tube assembly"
		desc = "A spent 102mm dual-tubed rocket assembly previously loaded into a spnkr. Of no use to you now..."

/obj/item/ammo_magazine/spnkr/attack(mob/living/carbon/human/carbon, mob/living/carbon/human/user)
	if(!istype(carbon) || !istype(user) || get_dist(user, carbon) > 1)
		return
	var/obj/item/weapon/gun/halo_launcher/spnkr/in_hand = carbon.get_active_hand()
	if(!in_hand || !istype(in_hand))
		return
	if(!skillcheck(carbon, SKILL_FIREARMS, SKILL_FIREARMS_TRAINED))
		to_chat(user, SPAN_WARNING("You don't know how to reload \the [in_hand]!"))
		return
	var/obj/item/weapon/twohanded/offhand/off_hand = carbon.get_inactive_hand()
	if(!off_hand || !istype(off_hand))
		to_chat(user, SPAN_WARNING("\the [carbon] needs to be wielding \the [in_hand] in order to reload!"))
		to_chat(carbon, SPAN_WARNING("You need to be wielding \the [in_hand] in order for [user] to reload it for you!"))
		return
	if(in_hand.current_mag && in_hand.current_mag.current_rounds > 0)
		to_chat(user, SPAN_WARNING("\the [in_hand] still has ammo left!"))
		to_chat(carbon, SPAN_WARNING("[user] tries to reload \the [in_hand] but it still has ammo left!"))
		return
	if(user.action_busy)
		return
	if(!in_hand.cover_open)
		in_hand.toggle_cover(user)
	to_chat(user, SPAN_NOTICE("You begin reloading \the [carbon]'s [in_hand]! Hold still..."))
	to_chat(carbon, SPAN_NOTICE("[user] begins reloading your [in_hand]! Hold still..."))
	if(!do_after(user,(reload_delay / 2), INTERRUPT_ALL, BUSY_ICON_FRIENDLY, carbon, INTERRUPT_ALL, BUSY_ICON_GENERIC))
		to_chat(user, SPAN_WARNING("Your reload was interrupted!"))
		to_chat(carbon, SPAN_WARNING("[user]'s reload was interrupted!"))
		return
	if(off_hand != carbon.get_inactive_hand())
		to_chat(user, SPAN_WARNING("\the [carbon] needs to be wielding \the [in_hand] in order to reload!"))
		to_chat(carbon, SPAN_WARNING("You need to be wielding \the [in_hand] in order for [user] to reload it for you!"))
		return
	user.drop_inv_item_on_ground(src)
	if(in_hand.current_mag)
		in_hand.current_mag.forceMove(get_turf(carbon))
	in_hand.replace_ammo(user,src)
	in_hand.current_mag = src
	forceMove(in_hand)
	to_chat(user, SPAN_NOTICE("You load \the [src] into \the [carbon]'s [in_hand]."))
	to_chat(carbon, SPAN_WARNING("[user] loads \the [src] into your [in_hand]."))
	in_hand.toggle_cover(user)
	if(in_hand.reload_sound)
		playsound(carbon, in_hand.reload_sound, 25, 1)
	else
		playsound(carbon,'sound/machines/click.ogg', 25, 1)

	return 1

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
