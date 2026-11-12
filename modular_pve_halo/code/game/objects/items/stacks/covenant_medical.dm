// ==== BRUISE PACK ====

/obj/item/stack/medical/bruise_pack/covenant
	name = "\improper alien bandages"
	singular_name = "\improper alien bandage"
	desc = null
	icon = 'icons/halo/obj/items/cov_medical.dmi'
	icon_state = "sealant_mesh_full"
	wrapped = FALSE
	alien = TRUE
	amount = 20
	max_amount = 20
	heal_brute = 20
	stack_id = "cov_bandage"

/obj/item/stack/medical/bruise_pack/covenant/update_icon()
	if(amount == 1)
		icon_state = "sealant_mesh_single"
		return
	else if(amount <= max_amount/2)
		icon_state = "sealant_mesh_half"
		return
	else
		icon_state = "sealant_mesh_full"
		return

/obj/item/stack/medical/bruise_pack/covenant/get_examine_text(mob/living/carbon/human/user)
	. = ..()
	var/list/origin = .
	var/insert_line
	if(iscovenant(user))
		origin[1] = "[icon2html(src, user)] This is a sealant mesh"
		insert_line = "A bronze coloured foil sheet that forms a seal over traumatic injuries, employing a coagulant gel on the wound-facing side that stops blood loss, alongside stabilizing the area for more permanent treatment in the case of serious injuries, like punctured lungs."
	else
		origin[1] = "[icon2html(src, user)] This is gross covenant foil"
		insert_line = "An alien bandage of some description, a crinkly metallic-esque foil sheet that adheres to wounds when pressed. The gel coating one side of the foil is some kind of coagulant, though it reacts violently to human biology, creating dangerous free-floating blood clots, which may lead to aneurysm, stroke or heart attacks."
	origin.Insert(2, insert_line)

/obj/item/stack/medical/bruise_pack/covenant/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1
	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M

		var/obj/limb/affecting = H.get_limb(user.zone_selected)

		if(user.skills)
			if(!skillcheck(user, SKILL_MEDICAL, SKILL_MEDICAL_MEDIC))
				if(!do_after(user, 10, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY, M, INTERRUPT_MOVED, BUSY_ICON_MEDICAL))
					return 1

		if(affecting.get_incision_depth())
			to_chat(user, SPAN_NOTICE("[M]'s [affecting.display_name] is cut open, you'll need more than a bandage!"))
			return TRUE

		var/possessive = "[user == M ? "your" : "\the [M]'s"]"
		var/possessive_their = "[user == M ? user.gender == MALE ? "his" : "her" : "\the [M]'s"]"
		switch(affecting.bandage())
			if(WOUNDS_BANDAGED)
				user.affected_message(M,
					SPAN_HELPFUL("You <b>bandage</b> [possessive] <b>[affecting.display_name]</b>."),
					SPAN_HELPFUL("[user] <b>bandages</b> your <b>[affecting.display_name]</b>."),
					SPAN_NOTICE("[user] bandages [possessive_their] [affecting.display_name]."))
				use(1)
				affecting.heal_damage(brute = heal_brute)
				playsound(user, 'sound/handling/bandage.ogg', 25, 1, 2)
				update_icon()
			if(WOUNDS_ALREADY_TREATED)
				to_chat(user, SPAN_WARNING("The wounds on [possessive] [affecting.display_name] have already been treated."))
				return TRUE
			else
				to_chat(user, SPAN_WARNING("There are no wounds on [possessive] [affecting.display_name]."))
				return TRUE

// ==== BURN PACK ====

/obj/item/stack/medical/ointment/covenant
	name = "\improper burn-gel canister"
	singular_name = "burn-gel canister"
	desc = null
	icon = 'icons/halo/obj/items/cov_medical.dmi'
	icon_state = "burncream"
	alien = TRUE
	amount = 20
	max_amount = 20
	heal_burn = 20
	stack_id = "cov_ointment"
	desc_lore = "The ancestors of modern thermal applicators were designed by San'Shyuum clerics before the founding of the Covenant, to treat burns earned during maintenance and exploration of the holy vessel. Later, during their war with the Sangheili, these earlier applicators were enhanced. A slow procession of development has led them to their current modern version."

/obj/item/stack/medical/ointment/covenant/update_icon()
	if(amount == 1)
		icon_state = "burncream_single"
		return
	if(amount <= max_amount/2)
		icon_state = "burncream_half"
		return
	if (amount <= max_amount-1)
		icon_state = "burncream_full"
		return
	else
		icon_state = "burncream"

/obj/item/stack/medical/ointment/covenant/get_examine_text(mob/living/carbon/human/user)
	. = ..()
	var/list/origin = .
	var/insert_line
	if(iscovenant(user))
		origin[1] = "[icon2html(src, user)] This is a thermal applicator canister"
		insert_line = "A cylindrical tube of self-cleaning antiseptic alloy designed to hold numerous 'thermal applicators', the tube reseals and decontaminates automatically when the cap is placed back on. A thermal applicator is a jelly-like semi-solid circular tablet of self-applicating medicinal compounds that automatically 'bandages', disinfects and begins to repair severe burns. The user must only rub the applicator to the site."
	else
		origin[1] = "[icon2html(src, user)] This is a Covenant medical canister"
		insert_line = "A cold to the touch silver cylinder which opens at one end, filled with a vaguely viscous gel that holds several distinct teal coloured discs. The discs are malleable and fluid, though cause a burning or numbing sensation to exposed skin. They also smell faintly of mint, or sugared candies. Despite appearances they should not be consumed under any circumstances. Extreme toxicity, total breakdown of internal organ lining."
	origin.Insert(2, insert_line)

/obj/item/stack/medical/ointment/covenant/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M

		var/obj/limb/affecting = H.get_limb(user.zone_selected)

		if(user.skills)
			if(!skillcheck(user, SKILL_MEDICAL, SKILL_MEDICAL_MEDIC))
				if(!do_after(user, 10, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY, M, INTERRUPT_MOVED, BUSY_ICON_MEDICAL))
					return 1

		if(affecting.get_incision_depth())
			to_chat(user, SPAN_NOTICE("[M]'s [affecting.display_name] is cut open, you'll need more than an ointment!"))
			return TRUE

		var/possessive = "[user == M ? "your" : "\the [M]'s"]"
		var/possessive_their = "[user == M ? user.gender == MALE ? "his" : "her" : "\the [M]"]"
		switch(affecting.salve())
			if(WOUNDS_BANDAGED)
				user.affected_message(M,
					SPAN_HELPFUL("You <b>salve the burns</b> on [possessive] <b>[affecting.display_name]</b>."),
					SPAN_HELPFUL("[user] <b>salves the burns</b> on your <b>[affecting.display_name]</b>."),
					SPAN_NOTICE("[user] salves the burns on [possessive_their] [affecting.display_name]."))
				affecting.heal_damage(burn = heal_burn)
				use(1)
				playsound(user, 'sound/handling/ointment_spreading.ogg', 25, 1, 2)
				update_icon()
			if(WOUNDS_ALREADY_TREATED)
				to_chat(user, SPAN_WARNING("The burns on [possessive] [affecting.display_name] have already been treated."))
				return TRUE
			else
				to_chat(user, SPAN_WARNING("There are no burns on [possessive] [affecting.display_name]."))
				return TRUE

// ==== SPLINTS ====

/obj/item/stack/medical/splint/covenant
	name = "magnetic splints"
	singular_name = "covenant splint"
	desc = "A set of magnetic splints made to adjust to a variety of alien limbs."
	icon = 'icons/halo/obj/items/cov_medical.dmi'
	icon_state = "splints"
	amount = 7
	max_amount = 7
	stack_id = "cov_splint"
	alien = TRUE

/obj/item/stack/medical/splint/covenant/get_examine_text(mob/living/carbon/human/user)
	. = ..()
	var/list/origin = .
	var/insert_line
	if(iscovenant(user))
		origin[1] = "[icon2html(src, user)] This is a magnetic splint"
		insert_line = "A magnetic splint designed to stabilize a broken limb. The magnetic splint automatically aligns the users wounded bones and uses non-invasive magnetic field technology to hold the limb securely without reducing overall mobility, critical for combat troops."
	else
		origin[1] = "[icon2html(src, user)] This is a Covenant magnetic device"
		insert_line = "A series of powerful magnets lining the inside of a collection of metallic 'bars' and 'rings' of adjustable alloy bands. The exact purpose has been theorized, but no solid theory currently exists. Previous attempts to wear these like a sleeve on the leg or arm has led to crippling injuries, with the worst case requiring amputation..."
	origin.Insert(2, insert_line)

// ==== SCANNER ====

/obj/item/device/healthanalyzer/covenant
	name = "\improper multi-species health scanner"
	desc = "Forged from nanolaminate, this health scanner is able to give accurate health analysis of every Covenant member species."
	icon = 'icons/halo/obj/items/cov_medical.dmi'
	icon_state = "health_scanner"
	alien = TRUE

/obj/item/device/healthanalyzer/covenant/attack(mob/living/M, mob/living/user)
	if(!popup_window)
		last_scan = M.health_scan(user, FALSE, TRUE, popup_window, alien)
	else
		if (!last_health_display)
			last_health_display = new(M)
		else
			last_health_display.target_mob = M
		SStgui.close_user_uis(user, src)
		last_scan = last_health_display.ui_data(user, DETAIL_LEVEL_BODYSCAN)
		last_health_display.look_at(user, DETAIL_LEVEL_BODYSCAN, bypass_checks = FALSE, ignore_delay = FALSE, alien = alien, associated_equipment = src)
	to_chat(user, SPAN_NOTICE("[user] has analyzed [M]'s vitals."))
	playsound(src.loc, 'sound/items/healthanalyzer.ogg', 50)
	src.add_fingerprint(user)
	return
