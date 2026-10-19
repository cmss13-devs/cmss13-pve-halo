/obj/item/reagent_container/glass/beaker/vial/covenant_vial
	name = "subcutaneous injector vial"
	desc = "A rather strong vial for storing liquid."
	icon = 'icons/halo/obj/items/cov_medical.dmi'
	icon_state = "vial"
	volume = 180
	amount_per_transfer_from_this = 15
	possible_transfer_amounts = list(5,15,30,60)
	flags_atom = FPRINT
	splashable = FALSE
	ground_offset_x = 9
	ground_offset_y = 8
	var/chemname
	var/display_maptext = FALSE
	var/maptext_label

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/update_icon()
	. = ..()
	if((isstorage(loc) || ismob(loc)) && display_maptext)
		maptext = SPAN_LANGCHAT("[maptext_label]")
	else
		maptext = ""

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/equipped()
	..()
	update_icon()

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/on_exit_storage()
	..()
	update_icon()

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/dropped()
	..()
	update_icon()

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/Initialize()
	. = ..()
	if(chemname)
		reagents.add_reagent(chemname, 180)
		update_icon()


/obj/item/reagent_container/glass/beaker/vial/covenant_vial/bicaridine
	name = "(bicaridine) subcutaneous injector vial"
	desc = "A red-tinted vial, storing a chemical agent that heals brute damage."
	icon_state = "vial_red"
	chemname = "bicaridine"
	maptext_label = "Bi"

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/kelotane
	name = "(kelotane) subcutaneous injector vial"
	desc = "A gold-tinted vial, storing a chemical agent that heals burn damage."
	icon_state = "vial_gold"
	chemname = "kelotane"
	maptext_label = "Kl"

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/bica_kelo_mix
	name = "(bicaridine) subcutaneous injector vial"
	desc = "A green-tinted vial, storing chemical agents that heal brute and burn damage."
	icon_state = "vial_green"
	maptext_label = "BK"

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/bica_kelo_mix/Initialize()
	. = ..()
	reagents.add_reagent("bicaridine", 90)
	reagents.add_reagent("kelotane", 90)

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/tricord
	name = "(tricordrazine) subcutaneous injector vial"
	desc = "An orange-tinted vial, storing a chemical agent that heals general damage."
	icon_state = "vial_orange"
	chemname = "tricordrazine"
	maptext_label = "Tc"

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/dexalin
	name = "(dexalin) subcutaneous injector vial"
	desc = "A blue-tinted vial, storing a chemical agent that treats oxygen loss."
	icon_state = "vial_blurple"
	chemname = "dexalin"
	maptext_label = "Dx"

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/antitox
	name = "(dylovene) subcutaneous injector vial"
	desc = "A green-tinted vial, storing a chemical agent that treats toxin-based damage."
	icon_state = "vial_lightgreen"
	chemname = "anti_toxin"
	maptext_label = "Dy"

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/tramadol
	name = "(tramadol) subcutaneous injector vial"
	desc = "A pink-tinted vial, storing a chemical agent that helps with pain."
	icon_state = "vial_pink"
	chemname = "tramadol"
	maptext_label = "Tr"

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/peridaxon
	name = "(peridaxon) subcutaneous injector vial"
	desc = "A black-tinted vial, storing a chemical agent that temporarily offsets the effects of organ damage."
	icon_state = "vial_black"
	chemname = "peridaxon"
	maptext_label = "Pr"

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/inaprovaline
	name = "(inaprovaline) subcutaneous injector vial"
	desc = "A magenta-tinted vial, storing a chemical agent that temporarily offsets the effects of being in a critical state."
	icon_state = "vial_magenta"
	chemname = "inaprovaline"
	maptext_label = "In"

/obj/item/reagent_container/glass/beaker/vial/covenant_vial/blood_regen
	name = "(blood-regenerator) subcutaneous injector vial"
	desc = "A grey-tinted vial, storing a chemical agent that regenerates the blood and gives a fair amount of nutrition. Overdoses at 60u."
	icon_state = "vial_gray"
	chemname = "bloodregen"
	maptext_label = "BR"
