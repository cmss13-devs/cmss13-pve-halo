/obj/item/reagent_container/hypospray/covenant
	name = "subcutaneous jet-injector"
	desc = "A jet-injector capable of bloodlessly delivering chemicals straight into the subcutaneous tissue."
	icon = 'icons/halo/obj/items/cov_medical.dmi'
	icon_state = "injector"
	item_state = "injector"
	volume = 180
	amount_per_transfer_from_this = 15
	possible_transfer_amounts = list(5, 7.5, 10, 15, 30)
	starting_vial = /obj/item/reagent_container/glass/beaker/vial/covenant_vial

/obj/item/reagent_container/hypospray/covenant/update_icon()
	overlays.Cut()
	if(mag)
		icon_state = "[initial(icon_state)]_primed"
		if(!istype(mag, /obj/item/reagent_container/glass/beaker/vial/covenant_vial))
			var/image/inserted_vial = image('icons/halo/obj/items/cov_medical.dmi', src, "+vial")
			overlays += inserted_vial
		else
			var/obj/item/reagent_container/glass/beaker/vial/covenant_vial/cov_mag = mag
			var/image/inserted_vial = image('icons/halo/obj/items/cov_medical.dmi', src, "+[cov_mag.icon_state]")
			overlays += inserted_vial
			if(cov_mag.display_maptext)
				if((isstorage(loc) || ismob(loc)))
					maptext = SPAN_LANGCHAT("[cov_mag.maptext_label]")
				else
					maptext = ""
	else
		icon_state = "[initial(icon_state)]"

/obj/item/reagent_container/hypospray/covenant/hypoload(obj/item/reagent_container/glass/beaker/vial/covenant_vial/cov_vial)
	flags_atom |= OPENCONTAINER
	playsound(loc, 'sound/weapons/handling/safety_toggle.ogg', 25, 1, 6)
	if(cov_vial.reagents.total_volume)
		cov_vial.reagents.trans_to(src, cov_vial.reagents.total_volume) //Might bug if a vial was varedited to hold more than 30u or a hypo edited to have a larger volume. Should still function but some reagents would vanish.
	mag = cov_vial
	update_icon()

/obj/item/reagent_container/hypospray/covenant/tricord
	starting_vial = /obj/item/reagent_container/glass/beaker/vial/covenant_vial/tricord

/obj/item/reagent_container/hypospray/covenant/bica_kelo_mix
	starting_vial = /obj/item/reagent_container/glass/beaker/vial/covenant_vial/bica_kelo_mix

/obj/item/reagent_container/hypospray/autoinjector/covenant
	name = "jet-autoinjector"
	desc = "A rather simple-to-use jet injector capable of bloodlessly delivering chemicals straight into the tissue."
	icon = 'icons/halo/obj/items/cov_medical.dmi'
	icon_state = "pen_injector"
	uses_left = 2

/obj/item/reagent_container/hypospray/autoinjector/covenant/oxycodone
	name = "oxycodone jet-autoinjector"
	desc = "A jet-autoinjector used to bloodlessly deliver oxycodone, a painkiller, straight into the tissue."
	chemname = "oxycodone"
	volume = 20
	amount_per_transfer_from_this = 10
	display_maptext = TRUE
	maptext_label = "Ox"

/obj/item/reagent_container/hypospray/autoinjector/covenant/dexalinp
	name = "dexalin+ jet-autoinjector"
	desc = "A jet-autoinjector used to bloodlessly deliver dexalin+, a chemical that oxygenates the body, straight into the tissue."
	chemname = "dexalinp"
	volume = 2
	amount_per_transfer_from_this = 1
	display_maptext = TRUE
	maptext_label = "D+"

/obj/item/reagent_container/hypospray/autoinjector/covenant/organfixer
	name = "organ-repair stimulant"
	desc = "A jet-autoinjector used to bloodlessly deliver an organ-repairing cocktail of chemicals straight into the tissue."
	chemname = "organfixer"
	volume = 20
	amount_per_transfer_from_this = 10
	display_maptext = TRUE
	maptext_label = "OR"

/obj/item/reagent_container/hypospray/autoinjector/covenant/veinfixer
	name = "vein-repair stimulant"
	desc = "A jet-autoinjector used to bloodlessly deliver a vein-repairing cocktail of chemicals straight into the tissue."
	icon_state = "green_injector"
	chemname = "veinfixer"
	volume = 20
	amount_per_transfer_from_this = 10
	display_maptext = TRUE
	maptext_label = "VR"

/obj/item/reagent_container/hypospray/autoinjector/covenant/veinfixer/update_icon()
	overlays.Cut()
	if(uses_left <= 0)
		icon_state = "[initial(icon_state)]_empty"
	if((isstorage(loc) || ismob(loc)) && display_maptext)
		maptext = SPAN_LANGCHAT("[maptext_label]")
	else
		maptext = ""
