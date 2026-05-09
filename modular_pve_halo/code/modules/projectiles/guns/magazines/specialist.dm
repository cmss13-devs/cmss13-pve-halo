// sniper magazines

/obj/item/ammo_magazine/rifle/halo/sniper
	name = "\improper SRS99-AM magazine (14.5x114mm APFSDS)"
	desc = "A rectangular box magazine for the SRS99-AM holding four rounds of 14.5x114mm armor-piercing, fin-stabilized, discarding sabot."
	icon_state = "srs99"
	max_rounds = 4
	gun_type = /obj/item/weapon/gun/rifle/sniper/halo
	default_ammo = /datum/ammo/bullet/rifle/srs99
	caliber = "14.5x114mm"


// rockets

/obj/item/ammo_magazine/spnkr
	name = "\improper M19 SSM tube assembly"
	desc = "A 102mm dual-tubed rocket assembly intended to be loaded into an M41 spnkr."
	caliber = "102mm"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/special.dmi'
	icon_state = "spnkr_rockets"
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

