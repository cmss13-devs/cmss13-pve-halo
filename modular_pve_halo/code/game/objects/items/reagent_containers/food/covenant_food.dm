/obj/item/reagent_container/food/snacks/covenant/ration
	name = "\improper covenant ration"
	desc = "A Covenant ration."
	icon = 'icons/halo/obj/items/food/covenant_food.dmi'
	icon_state = "sangheili_mre"
	trash = /obj/item/trash/covenant_ration
	var/designated_species
	var/opened = FALSE

/obj/item/reagent_container/food/snacks/covenant/ration/get_examine_text(mob/living/carbon/human/user)
	. = ..()
	var/list/origin = .
	var/insert_line
	if(iscovenant(user))
		origin[1] = "[icon2html(src, user)] This is a[designated_species] Liquid Sustainment Unit"
		insert_line = "Contained in a hermetically sealed cylindrical container, the Liquid Sustainment Unit is a long-standing field ration unappealing in all aspects from flavor to texture. Many describe it as both inexplicably \"wet\", yet very chalky or grainy."
	else
		origin[1] = "[icon2html(src, user)] This is a Covenant Ration"
		insert_line = "A cylindrical device, known to contain Covenant field rations."
	origin.Insert(2, insert_line)

/obj/item/reagent_container/food/snacks/covenant/ration/attack_self(mob/user)
	..()

	if(!opened)
		opened = TRUE
		playsound(user, 'sound/items/air_release.ogg')
		user.visible_message(SPAN_NOTICE("[user] twists the lid and unseals [src] with a hiss."), SPAN_NOTICE("You twist the lid and unseal [src] with a hiss."))
		icon_state = "[initial(icon_state)]_o"

// food

/obj/item/reagent_container/food/snacks/covenant/ration/sangheili
	designated_species = " Sangheili"

/obj/item/reagent_container/food/snacks/covenant/ration/sangheili/Initialize()
	. = ..()
	reagents.add_reagent("sangheilinutriment", 100)
	bitesize = 10

/obj/item/reagent_container/food/snacks/covenant/ration/kigyar
	designated_species = " Kig-Yar"
	icon_state = "kigyar_mre"

/obj/item/reagent_container/food/snacks/covenant/ration/kigyar/Initialize()
	. = ..()
	reagents.add_reagent("kigyarnutriment", 100)
	bitesize = 10

/obj/item/reagent_container/food/snacks/covenant/ration/unggoy
	designated_species = " Unggoy"
	icon_state = "unggoy_mre"

/obj/item/reagent_container/food/snacks/covenant/ration/unggoy/Initialize()
	. = ..()
	reagents.add_reagent("unggoynutriment", 100)
	bitesize = 10


// trash

/obj/item/trash/covenant_ration
	name = "\improper empty covenant ration"
	desc = "An empty covenant field ration."
	icon = 'icons/halo/obj/items/food/covenant_food.dmi'
	icon_state = "sangheili_mre_e"

/obj/item/trash/covenant_ration/kigyar
	icon_state = "kigyar_mre_e"

/obj/item/trash/covenant_ration/unggoy
	icon_state = "unggoy_mre_e"
