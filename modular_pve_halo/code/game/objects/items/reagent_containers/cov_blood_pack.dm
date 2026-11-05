#define BLOOD_BAG_INJECTING 1
#define BLOOD_BAG_TAKING 0

/obj/item/reagent_container/blood/covenant
	name = "nanolaminate blood case"
	desc = "A nanolaminate case designed to store blood at cold temperatures. On one end of it is an attachment point that heats the blood before it enters the flexible IV tube."
	icon_state = "blood_other"
	icon = 'icons/halo/obj/items/cov_medical.dmi'
	volume = 600

/obj/item/reagent_container/blood/covenant/update_icon()
	var/percent = floor((reagents.total_volume / volume) * 100)
	overlays = null
	underlays = null

	if(reagents && reagents.total_volume)

		if(blood_type)
			var/image/filling = image('icons/halo/obj/items/cov_medical.dmi', src, "covblood10")
			switch(percent)
				if(1 to 10) filling.icon_state = "covblood10"
				if(11 to 25) filling.icon_state = "covblood25"
				if(26 to 50) filling.icon_state = "covblood50"
				if(51 to 75) filling.icon_state = "covblood75"
				if(76 to 90) filling.icon_state = "covblood90"
				if(91 to INFINITY) filling.icon_state = "covblood100"
				else filling.icon_state = "covblood0"

			overlays += filling
		else
			var/image/filling = image('icons/halo/obj/items/chemistry.dmi', src, "covblood10")
			switch(percent)
				if(1 to 10) filling.icon_state = "covblood10"
				if(11 to 20) filling.icon_state = "covblood20"
				if(21 to 30) filling.icon_state = "covblood30"
				if(31 to 40) filling.icon_state = "covblood40"
				if(41 to 50) filling.icon_state = "covblood50"
				if(51 to 60) filling.icon_state = "covblood60"
				if(61 to 70) filling.icon_state = "covblood70"
				if(71 to 80) filling.icon_state = "covblood80"
				if(81 to 90) filling.icon_state = "covblood90"
				if(91 to INFINITY) filling.icon_state = "covblood100"

			filling.color = mix_color_from_reagents(reagents.reagent_list)
			underlays += filling

/obj/item/reagent_container/blood/covenant/process() // HALO PVE - this is all to increase the rate of blood flow so its not painfully fucking slow
	//if we're not connected to anything stop doing stuff
	if(!connected_to)
		return PROCESS_KILL

	//if we're not on a human stop doing stuff
	if(!ishuman(loc))
		bad_disconnect()
		return PROCESS_KILL

	//if we're not being held in a hand stop doing stuff
	var/mob/living/carbon/human/current_human = loc
	if(!(current_human.l_hand == src || current_human.r_hand == src))
		bad_disconnect()
		return PROCESS_KILL

	//if we're further than 3 tile away or we're not on a turf stop doing stuff
	if(!(get_dist(src, connected_to) <= 3 && isturf(connected_to.loc)))
		bad_disconnect()
		return PROCESS_KILL

	//give blood
	if(mode == BLOOD_BAG_INJECTING)
		if(volume > 0)
			item_state = initial(item_state)
			var/transfer_amount = (REAGENTS_METABOLISM * 50)/max(reagents.reagent_list.len, 1) // 30 edited to 50
			connected_to.inject_blood(src, transfer_amount)
			for(var/datum/reagent/other_reagent in reagents.reagent_list)
				if(other_reagent.id != "blood")
					reagents.trans_id_to(connected_to, other_reagent.id, transfer_amount/2)
			if(!reagents.total_volume)
				item_state = "bloodpack_empty"
				update_beam()
				update_beam()
			return

	// Take blood
	var/amount = reagents.maximum_volume - reagents.total_volume
	amount = min(amount, 4)
	if(!amount)
		return

	if(!istype(connected_to))
		return
	if(connected_to.species && connected_to.species.flags & NO_BLOOD)
		return

	connected_to.take_blood(src, amount)

/obj/item/reagent_container/blood/covenant/sangheili
	name = "(sangheili) nanolaminate blood case"
	desc = "A nanolaminate case designed to store blood at cold temperatures. On one end of it is an attachment point that heats the blood before it enters the flexible IV tube. Intended for sangheili blood."
	icon_state = "blood_sangheili"
	blood_type = "*S"

/obj/item/reagent_container/blood/covenant/ruuhtian
	name = "(ruuhtian) nanolaminate blood case"
	desc = "A nanolaminate case designed to store blood at cold temperatures. On one end of it is an attachment point that heats the blood before it enters the flexible IV tube. Intended for ruuhtian blood."
	icon_state = "blood_kigyar"
	blood_type = "*K"

/obj/item/reagent_container/blood/covenant/unggoy
	name = "(unggoy) nanolaminate blood case"
	desc = "A nanolaminate case designed to store blood at cold temperatures. On one end of it is an attachment point that heats the blood before it enters the flexible IV tube. Intended for unggoy blood."
	icon_state = "blood_unggoy"
	blood_type = "*U"

/obj/item/reagent_container/blood/covenant/saline
	name = "nanolaminate saline case"
	desc = "A nanolaminate case designed to store saline at cold temperatures. On one end of it is an attachment point that heats the blood before it enters the flexible IV tube."
	volume = 500
	bag_initial_reagents = 	list("saline" = 500)

#undef BLOOD_BAG_INJECTING
#undef BLOOD_BAG_TAKING
