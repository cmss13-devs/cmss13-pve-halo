//-----------------------AMMUNITION BOXES (LOOSE AMMO)-----------------------

//----------------10x24mm Ammunition Boxes (for M41 family, M49A, and L42)------------------

/obj/item/ammo_box/rounds/ap
	name = "\improper rifle ammunition box (10x24mm AP)"
	desc = "A 10x24mm armor-piercing ammunition box. Used to refill M41A MK2, and M49A AP magazines. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_ap"
	default_ammo = /datum/ammo/bullet/rifle/ap

/obj/item/ammo_box/rounds/ap/empty
	empty = TRUE

/obj/item/ammo_box/rounds/le
	name = "\improper rifle ammunition box (10x24mm LE)"
	desc = "A 10x24mm armor-shredding ammunition box. Used to refill M41A MK2 LE magazines. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_le"
	default_ammo = /datum/ammo/bullet/rifle/le

/obj/item/ammo_box/rounds/le/empty
	empty = TRUE

/obj/item/ammo_box/rounds/incen
	name = "\improper rifle ammunition box (10x24mm Incen)"
	desc = "A 10x24mm incendiary ammunition box. Used to refill M41A MK2 and M49A incendiary magazines. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_incen"
	default_ammo = /datum/ammo/bullet/rifle/incendiary
	bullet_amount = 400 //Incen is OP
	max_bullet_amount = 400

/obj/item/ammo_box/rounds/incen/empty
	empty = TRUE

/obj/item/ammo_box/rounds/heap
	name = "rifle ammunition box (10x24mm HEAP)"
	desc = "A 10x24mm high-explosive armor-piercing ammunition box. Used to refill magazines. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_heap"
	default_ammo = /datum/ammo/bullet/rifle/heap

/obj/item/ammo_box/rounds/heap/empty
	empty = TRUE

//----------------10x28mm Ammunition Boxes (for smartguns)------------------

/obj/item/ammo_box/rounds/smartgun
	name = "\improper smartgun ammunition box (10x28mm)"
	icon_state = "base_m56rd"
	desc = "A 10x28mm ammunition box. Used to refill smartgun drum magazines. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_reg"
	default_ammo = /datum/ammo/bullet/rifle/heavy/tracer
	caliber = "10x28mm"
	bullet_amount = 1000
	max_bullet_amount = 1000

/obj/item/ammo_box/rounds/smartgun/empty
	empty = TRUE

// RMC SG
/obj/item/ammo_box/rounds/smartgun/holo_target
	name = "\improper holo-targetting smartgun ammunition box (10x28mm)"
	desc = "An ammunition box full of 10x28mm holo-targetting rounds. Used to refill L58A3 smartgun drums. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_impact"
	default_ammo = /datum/ammo/bullet/rifle/heavy/holo_target

/obj/item/ammo_box/rounds/smartgun/holo_target/empty
	empty = TRUE

//----------------9mm Ammunition Boxes (for Viper 9 SMG)------------------

/obj/item/ammo_box/rounds/smg
	name = "\improper SMG ammunition box (9mm)"
	desc = "A 9mm ammunition box. It comes with a leather strap allowing to wear it on the back."
	caliber = "9mm"
	icon_state = "base_m39"
	overlay_content = "_hv"
	default_ammo = /datum/ammo/bullet/pistol

/obj/item/ammo_box/rounds/smg/empty
	empty = TRUE

/obj/item/ammo_box/rounds/smg/ap
	name = "\improper SMG ammunition box (9mm AP)"
	desc = "A 9mm armor-piercing ammunition box. It comes with a leather strap allowing to wear it on the back."
	caliber = "9mm"
	overlay_content = "_ap"
	default_ammo = /datum/ammo/bullet/pistol/ap

/obj/item/ammo_box/rounds/smg/ap/empty
	empty = TRUE

/obj/item/ammo_box/rounds/smg/le
	name = "\improper SMG ammunition box (9mm LE)"
	desc = "A 9mm armor-shredding ammunition box. It comes with a leather strap allowing to wear it on the back."
	caliber = "9mm"
	overlay_content = "_le"
	default_ammo = /datum/ammo/bullet/pistol/le

/obj/item/ammo_box/rounds/smg/le/empty
	empty = TRUE

/obj/item/ammo_box/rounds/smg/incen
	name = "\improper SMG ammunition box (9mm Incen)"
	desc = "A 9mm incendiary ammunition box. It comes with a leather strap allowing to wear it on the back."
	caliber = "9mm"
	overlay_content = "_incen"
	default_ammo = /datum/ammo/bullet/pistol/incendiary
	bullet_amount = 400 //Incen is OP
	max_bullet_amount = 400

/obj/item/ammo_box/rounds/smg/incen/empty
	empty = TRUE

/obj/item/ammo_box/rounds/smg/heap
	name = "SMG ammunition box (9mm HEAP)"
	desc = "A 9mm armor-piercing high-explosive ammunition box. It comes with a leather strap allowing to wear it on the back."
	caliber = "9mm"
	overlay_content = "_heap"
	default_ammo = /datum/ammo/bullet/smg/heap

/obj/item/ammo_box/rounds/smg/heap/empty
	empty = TRUE

//----------------10x27mm Ammunition Boxes (for UPP Type71 family)------------------

/obj/item/ammo_box/rounds/type71
	name = "\improper rifle ammunition box (10x27mm)"
	desc = "A 10x27mm ammunition box. Used to refill Type71 magazines. It comes with a leather strap allowing to wear it on the back."
	icon_state = "base_type71"
	overlay_gun_type = "_rounds_type71"
	overlay_content = "_type71_reg"
	caliber = "10x27mm"
	default_ammo = /datum/ammo/bullet/rifle/upp

/obj/item/ammo_box/rounds/type71/empty
	empty = TRUE

/obj/item/ammo_box/rounds/type71/ap
	name = "\improper rifle ammunition box (10x27mm AP)"
	desc = "A 10x27mm armor-piercing ammunition box. Used to refill Type71 AP magazines. It comes with a leather strap allowing to wear it on the back."
	icon_state = "base_type71"
	overlay_gun_type = "_rounds_type71"
	overlay_content = "_type71_ap"
	default_ammo = /datum/ammo/bullet/rifle/upp/ap

/obj/item/ammo_box/rounds/type71/ap/empty
	empty = TRUE

/obj/item/ammo_box/rounds/type71/heap
	name = "rifle ammunition box (10x27mm HEAP)"
	desc = "A 10x27mm high-explosive armor-piercing ammunition box. Used to refill Type 71 and QYJ-72 HEAP magazines. It comes with a leather strap allowing to wear it on the back."
	icon_state = "base_type71"
	overlay_gun_type = "_rounds_type71"
	overlay_content = "_type71_heap"
	default_ammo = /datum/ammo/bullet/rifle/upp/heap

/obj/item/ammo_box/rounds/type71/heap/empty
	empty = TRUE

/obj/item/ammo_box/rounds/pkp
	name = "large rifle ammunition box (10x27mm)"
	desc = "A 10x27mm machinegun ammunition box. Used to mostly to refill Type 71 and QYJ-72 box magazines. It comes with a leather strap allowing to wear it on the back."
	icon_state = "base_type71"
	overlay_gun_type = "_rounds_pkp"
	overlay_content = "_type71_heap"
	default_ammo = /datum/ammo/bullet/rifle/upp/heap/tracer
	bullet_amount = 1500
	max_bullet_amount = 1500
	caliber = "10x27mm"

//----------------9mm Pistol Ammunition Boxes (for mod88, M4A3 pistols)------------------

/obj/item/ammo_box/rounds/pistol
	name = "\improper pistol ammunition box (9mm)"
	desc = "A 9mm ammunition box. Used to refill M4A3 magazines. It comes with a leather strap allowing to wear it on the back."
	caliber = "9mm"
	icon_state = "base_m4a3"
	overlay_content = "_reg"
	default_ammo = /datum/ammo/bullet/pistol

/obj/item/ammo_box/rounds/pistol/empty
	empty = TRUE

/obj/item/ammo_box/rounds/pistol/ap
	name = "\improper pistol ammunition box (9mm AP)"
	desc = "A 9mm armor-piercing ammunition box. Used to refill mod88 and M4A3 magazines. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_ap"
	default_ammo = /datum/ammo/bullet/pistol/ap

/obj/item/ammo_box/rounds/pistol/ap/empty
	empty = TRUE

/obj/item/ammo_box/rounds/pistol/hp
	name = "\improper pistol ammunition box (9mm HP)"
	desc = "A 9mm hollow-point ammunition box. Used to refill M4A3 magazines. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_hp"
	default_ammo = /datum/ammo/bullet/pistol/hollow

/obj/item/ammo_box/rounds/pistol/hp/empty
	empty = TRUE

/obj/item/ammo_box/rounds/pistol/incen
	name = "\improper pistol ammunition box (9mm Incendiary)"
	desc = "A 9mm incendiary ammunition box. Used to refill M4A3 magazines. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_incen"
	default_ammo = /datum/ammo/bullet/pistol/incendiary

/obj/item/ammo_box/rounds/pistol/incen/empty
	empty = TRUE

// HALO PVE EDIT - START - VARIOUS AMMO PACKETS

/obj/item/ammo_box/rounds/unsc
	name = "\improper generic ammunition packet"
	desc = "A tear-open packet of ammo to refill spent magazines. This one reads \"SHOULD NOT BE SEEN\"."
	icon = 'icons/halo/obj/items/storage/packets.dmi'
	icon_state = "ammo_packet"
	item_state = "ammo_packet"
	flags_equip_slot = null
	w_class = SIZE_SMALL
	default_ammo = /datum/ammo/bullet/rifle/ma5
	bullet_amount = 120 //120 AR, 48 magnum, 180 SMG, 72 BR
	max_bullet_amount = 120
	caliber = "7.62x51"
	can_explode = FALSE
	var/opened = FALSE
	var/use_sound = "rip"
	///Should the packet rotate when thrown?
	var/rotation_on_throw = FALSE

//---------------------GENERAL PROCS

/obj/item/ammo_box/rounds/unsc/Initialize()
	. = ..()
	if(empty)
		opened = TRUE
		bullet_amount = 0
		empty = TRUE
		update_icon()
	else
		opened = FALSE
		icon_state = "[initial(icon_state)]"

/obj/item/ammo_box/rounds/unsc/update_icon()
	if(opened)
		icon_state = "[initial(icon_state)]_o"

//---------------------INTERACTION PROCS

/obj/item/ammo_box/rounds/unsc/attack_self(mob/living/carbon/human/user)
	if(user.a_intent == INTENT_HARM)
		unfold_box(user)
		return
	else
		if(!opened)
			open_packet()
			user.pickup_recent()
			return
	..()

/obj/item/ammo_box/rounds/unsc/proc/open_packet(mob/living/user)
	if(!opened)
		opened = TRUE
		playsound(loc, use_sound, 25, TRUE, 3)
		update_icon()

/obj/item/ammo_box/rounds/unsc/unfold_box(mob/user)
	if(is_loaded())
		to_chat(user, SPAN_WARNING("You need to empty the packet before unfolding it!"))
		return
	qdel(src)

/obj/item/ammo_box/rounds/unsc/attackby(obj/item/I, mob/user)
	if(!opened)
		to_chat(user, SPAN_DANGER("How do you expect to refill your magazine whilst the packet is sealed shut? Open it first!"))
		return
	if(burning)
		to_chat(user, SPAN_DANGER("It's on fire and might explode!"))
		return
	if(istype(I, /obj/item/ammo_magazine))
		var/obj/item/ammo_magazine/AM = I
/*
		if(!isturf(loc))
			to_chat(user, SPAN_WARNING("\The [src] must be on the ground to be used."))
			return
*/
		if(AM.flags_magazine & AMMUNITION_REFILLABLE)
			if(default_ammo != AM.default_ammo)
				to_chat(user, SPAN_WARNING("Those aren't the same rounds. Better not mix them up."))
				return
			if(caliber != AM.caliber)
				to_chat(user, SPAN_WARNING("The rounds don't match up. Better not mix them up."))
				return

			var/dumping = FALSE // we REFILL BOX (dump to it) on harm intent, otherwise we refill FROM box
			if(user.a_intent == INTENT_HARM)
				if(AM.flags_magazine & AMMUNITION_CANNOT_REMOVE_BULLETS)
					to_chat(user, SPAN_WARNING("You can't remove ammo from \the [AM]!"))
					return
				dumping = TRUE

			var/transfering   = 0   // Amount of bullets we're trying to transfer
			var/transferable  = 0   // Amount of bullets that can actually be transfered
			do
				// General checking
				if(dumping)
					transferable = min(AM.current_rounds, max_bullet_amount - bullet_amount)
				else
					transferable = min(bullet_amount, AM.max_rounds - AM.current_rounds)
				if(transferable < 1)
					to_chat(user, SPAN_NOTICE("You cannot transfer any more rounds."))

				// Half-Loop 1: Start transfering
				else if(!transfering)
					transfering = min(transferable, 48) // Max per transfer
					if(!do_after(user, 1 SECONDS, INTERRUPT_ALL, dumping ? BUSY_ICON_HOSTILE : BUSY_ICON_FRIENDLY))
						to_chat(user, SPAN_NOTICE("You stop transferring rounds."))
						transferable = 0

				// Half-Loop 2: Process transfer
				else
					transfering = min(transfering, transferable)
					transferable -= transfering
					if(dumping)
						transfering = -transfering
					AM.current_rounds += transfering
					bullet_amount  -= transfering
					playsound(src, pick('sound/weapons/handling/mag_refill_1.ogg', 'sound/weapons/handling/mag_refill_2.ogg', 'sound/weapons/handling/mag_refill_3.ogg'), 20, TRUE, 6)
					to_chat(user, SPAN_NOTICE("You have transferred [abs(transfering)] round\s to [dumping ? src : AM]."))
					transfering = 0

			while(transferable >= 1)

			AM.update_icon(AM.current_rounds)
			update_icon()

		else if(AM.flags_magazine & AMMUNITION_HANDFUL)
			if(default_ammo != AM.default_ammo)
				to_chat(user, SPAN_WARNING("Those aren't the same rounds. Better not mix them up."))
				return
			if(caliber != AM.caliber)
				to_chat(user, SPAN_WARNING("The rounds don't match up. Better not mix them up."))
				return
			if(bullet_amount == max_bullet_amount)
				to_chat(user, SPAN_WARNING("\The [src] is already full."))
				return

			playsound(loc, pick('sound/weapons/handling/mag_refill_1.ogg', 'sound/weapons/handling/mag_refill_2.ogg', 'sound/weapons/handling/mag_refill_3.ogg'), 25, 1)
			var/S = min(AM.current_rounds, max_bullet_amount - bullet_amount)
			AM.current_rounds -= S
			bullet_amount += S
			AM.update_icon()
			update_icon()
			to_chat(user, SPAN_NOTICE("You put [S] round\s into [src]."))
			if(AM.current_rounds <= 0)
				user.temp_drop_inv_item(AM)
				qdel(AM)

//---------------------ACTUAL AMMO PACKETS

/obj/item/ammo_box/rounds/unsc/ma5
	name = "\improper M118 FMJ-AP (7.62x51mm) ammunition packet"
	desc = "A tear-open packet of ammo to refill spent magazines. This one reads \"M118, 7.62x51mm, FMJ-AP, 120 RNDS\" on the packaging."
	icon_state = "ammo_packet_assault_rifle"
	item_state = "ammo_packet_assault_rifle"

/obj/item/ammo_box/rounds/unsc/ma5/empty
	empty = TRUE

/obj/item/ammo_box/rounds/unsc/br55
	name = "\improper M634 X-HP SAP-HE (9.5x40mm) ammunition packet"
	desc = "A tear-open packet of ammo to refill spent magazines. This one reads \"M634, 9.5x40mm, X-HP SAP-HE, 96 RNDS\" on the packaging."
	icon_state = "ammo_packet_battle_rifle"
	item_state = "ammo_packet_battle_rifle"
	default_ammo = /datum/ammo/bullet/rifle/br55
	bullet_amount = 72
	max_bullet_amount = 72
	caliber = "9.5x40mm"

/obj/item/ammo_box/rounds/unsc/br55/empty
	empty = TRUE

/obj/item/ammo_box/rounds/unsc/m6
	name = "\improper M225 SAP-HE (12.7x40mm) ammunition packet"
	desc = "A tear-open packet of ammo to refill spent magazines. This one reads \"M225, 12.7x40mm, SAP-HE, 72 RNDS\" on the packaging."
	icon_state = "ammo_packet_pistol"
	item_state = "ammo_packet_pistol"
	default_ammo = /datum/ammo/bullet/pistol/magnum
	bullet_amount = 48
	max_bullet_amount = 48
	caliber = "12.7x40mm"

/obj/item/ammo_box/rounds/unsc/m6/empty
	empty = TRUE

/obj/item/ammo_box/rounds/unsc/m7
	name = "\improper M443 C-FMJ (5x23mm) ammunition packet"
	desc = "A tear-open packet of ammo to refill spent magazines. This one reads \"M443, 5.23mm, C-FMJ, 180 RNDS\" on the packaging."
	icon_state = "ammo_packet_smg"
	item_state = "ammo_packet_smg"
	default_ammo = /datum/ammo/bullet/smg/m7
	bullet_amount = 180
	max_bullet_amount = 180
	caliber = "5x23mm"

/obj/item/ammo_box/rounds/unsc/m7/empty
	empty = TRUE
