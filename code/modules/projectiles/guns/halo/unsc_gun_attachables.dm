

/obj/item/attachable/ma5c_shroud
	name = "\improper MA5C shroud"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma5c_shroud"
	attach_icon = "ma5c_shroud"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = -3

/obj/item/attachable/attached_gun/grenade/ma5c
	name = "\improper M301C 40mm grenade launcher"
	desc = "A 40mm underslung grenade launcher. The C variant of the M301 is purpose built for the MA5C ICWS to serve as a grip for the weapon much like the standard-issue flashlight of the MA5C."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma5c_gl"
	attach_icon = "ma5c_gl"
	current_rounds = 0
	max_rounds = 1
	max_range = 10
	attachment_firing_delay = 5

/obj/item/attachable/attached_gun/grenade/New()
	..()
	recoil_mod = -RECOIL_AMOUNT_TIER_4

/obj/item/attachable/br55_muzzle
	name = "\improper BR55 muzzle"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "br55_muzzle"
	attach_icon = "br55_muzzle"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = -7

/obj/item/attachable/m90_muzzle
	name = "\improper M90 CAWS muzzle"
	desc = "This isn't supposed to be separated from the gun, how'd this happen?"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "m90_muzzle"
	attach_icon = "m90_muzzle"
	slot = "special"
	wield_delay_mod = WIELD_DELAY_NONE
	flags_attach_features = NO_FLAGS
	melee_mod = 0 //Integrated attachment for visuals, stats handled on main gun.
	size_mod = 0
	hud_offset_mod = -7

/obj/item/attachable/flashlight/ma5c
	name = "\improper MA5 integrated flashlight"
	desc = "The MA5 integrated flashlight, standard-issue to any MA5-model assault rifle and essential to handling it."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma5c_flashlight"
	attach_icon = "ma5c_flashlight"
	original_state = "ma5c_flashlight"
	original_attach = "ma5c_flashlight"
	slot = "under"

/obj/item/attachable/flashlight/ma5c/New()
	..()
	recoil_mod = -RECOIL_AMOUNT_TIER_4

/obj/item/attachable/flashlight/m90
	name = "\improper M90 integrated flashlight"
	desc = "The M90 integrated flashlight, standard-issue to any M90 series shotgun and built into the pump. You shouldn't see this, actually."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "m90_flashlight"
	attach_icon = "m90_flashlight_a"
	original_state = "m90_flashlight"
	original_attach = "m90_flashlight_a"
	slot = "under"

/obj/item/attachable/flashlight/m90/police
	icon_state = "m90_police_flashlight"
	attach_icon = "m90_police_flashlight_a"
	original_state = "m90_police_flashlight"
	original_attach = "m90_police_flashlight_a"
	slot = "under"

/obj/item/attachable/flashlight/ma5c/New()
	..()
	recoil_mod = -RECOIL_AMOUNT_TIER_2

/obj/item/attachable/ma5c_barrel
	name = "\improper MA5C barrel"
	desc = "The barrel to an MA5C ICWS assault rifle. Better not leave without it."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "ma5c_barrel"
	attach_icon = "ma5c_barrel"
	slot = "muzzle"
	size_mod = 0

/obj/item/attachable/ma5c_barrel/New()
	..()
	scatter_mod = -SCATTER_AMOUNT_TIER_3
	burst_scatter_mod = -SCATTER_AMOUNT_TIER_3


/obj/item/attachable/br55_barrel
	name = "\improper BR55 barrel"
	desc = "The barrel to an BR55 battle rifle. Better not leave without it."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "br55_barrel"
	attach_icon = "br55_barrel"
	slot = "muzzle"
	size_mod = 0

/obj/item/attachable/br55_barrel/New()
	..()
	scatter_mod = -9
	burst_scatter_mod = -SCATTER_AMOUNT_TIER_3

/obj/item/attachable/scope/spnkr
	name = "\improper spnkr scope"
	desc = "This shouldn't be able to come off the spnkr..."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "spnkr_scope"
	attach_icon = null
	size_mod = 0
	hidden = TRUE

/obj/item/attachable/scope/mini/br55
	name = "\improper A2 scope"
	desc = "A telescopic sight with 2x zoom capability. While typically reliable, it often needs adjustment and fine tuning to maintain perfect accuracy."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "br55_scope"
	attach_icon = "br55_scope"
	size_mod = 0

/obj/item/attachable/srs_barrel
	name = "\improper SRS99-AM sniper rifle barrel"
	desc = "The detachable barrel of an SRS-99AM sniper rifle featuring a large muzzle brake at the end. Essential to the operation of the rifle. It's detachable nature allows it to be swapped out with other barrels featuring alternative integrated attachments. "
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "srs_barrel"
	attach_icon = "srs_barrel"
	slot = "muzzle"
	size_mod = 0
	flags_attach_features = NO_FLAGS

/obj/item/attachable/srs_barrel/New()
	..()
	scatter_mod = -SCATTER_AMOUNT_TIER_1

/obj/item/attachable/scope/variable_zoom/oracle
	name = "\improper N-Variant oracle scope"
	desc= "One of the most common sniper optic systems utilized by the UNSC. Able to switch between different zoom modes. Some models even provide night vision optics."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "oracle_scope"
	attach_icon = "oracle_scope"
	slot = "rail"

/obj/item/attachable/srs_assembly
	name = "\improper SRS99-AM assembly"
	desc = "That's not supposed to come off. You should probably report it to your supervisor..."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "srs_assembly"
	attach_icon = "srs_assembly"
	slot = "special"
	flags_attach_features = NO_FLAGS

/obj/item/attachable/bipod/srs_bipod
	name = "\improper SRS99-AM bipod"
	desc = "A detachable bipod system belonging to the SRS99-AM sniper rifle. Why you would detach it from such an unwieldy rifle is a mystery."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "srs_bipod"
	attach_icon = "srs_bipod"
	flags_attach_features = NO_FLAGS

/obj/item/attachable/scope/mini/smartscope
	name = "\improper KFA-2 x2 smart-linked scope"
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = null
	slot = "rail"
	zoom_offset = 3

/obj/item/attachable/scope/mini/smartscope/m6g
	name = "\improper KFA-2/G smart-linked scope"
	desc = "A smart-linked scope designed to attach to the M6G magnum, allowing for advanced magnification and linking with UNSC optics to provide the HUD a reticle and ammunition counter."
	icon_state = "m6c_smartscope_obj"
	attach_icon = "m6g_smartscope"

/obj/item/attachable/scope/mini/smartscope/m6c
	name = "\improper KFA-2/C smart-linked scope"
	desc = "A smart-linked scope designed to attach to the M6C magnum, allowing for advanced magnification and linking with UNSC optics to provide the HUD a reticle and ammunition counter."
	icon_state = "m6c_smartscope_obj"
	attach_icon = "m6c_smartscope"

/obj/item/attachable/flashlight/m6
	name = "\improper M6 flashlight"
	desc = "The M6 Flashlight. Not much can be said about it, it turns on and off."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "flashlight"
	attach_icon = "m6g_light"
	original_state = "flashlight"
	original_attach = "m6g_light"
	slot = "under"

/obj/item/attachable/flashlight/m6/Attach(obj/item/weapon/gun/subject)
	if(istype(subject, /obj/item/weapon/gun/pistol/halo/m6g))
		attach_icon = "m6g_light"
		original_attach = "m6g_light"
		..()
	if(istype(subject, /obj/item/weapon/gun/pistol/halo/m6c))
		attach_icon = "m6c_light"
		original_attach = "m6c_light"
		..()
	else return

/obj/item/attachable/stock/m7
	name = "M7 SMG collapsable stock"
	desc = "A collapsable stock for the M7 SMG. Extending it makes it more difficult to fire with one and unable to fit into belts, but improves the accuracy and scatter of the weapon."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "m7_stock"
	attach_icon = "m7_stock"
	w_class = SIZE_TINY
	flags_attach_features = ATTACH_ACTIVATION
	collapsible = TRUE
	stock_activated = FALSE
	collapse_delay  = 0.5 SECONDS
	attachment_action_type = /datum/action/item_action/toggle
	slot = "stock"

/obj/item/attachable/stock/m7/New()
	..()

	accuracy_mod = 0
	scatter_mod = 0
	movement_onehanded_acc_penalty_mod = 0
	accuracy_unwielded_mod = 0
	scatter_unwielded_mod = 0
	wield_delay_mod = 0
	recoil_unwielded_mod = 0

/obj/item/attachable/stock/m7/apply_on_weapon(obj/item/weapon/gun/gun)
	if(stock_activated)
		//folded up
		accuracy_mod = -HIT_ACCURACY_MULT_TIER_2
		scatter_mod = -SCATTER_AMOUNT_TIER_9
		movement_onehanded_acc_penalty_mod = -MOVEMENT_ACCURACY_PENALTY_MULT_TIER_5
		accuracy_unwielded_mod = -HIT_ACCURACY_MULT_TIER_4
		scatter_unwielded_mod = SCATTER_AMOUNT_TIER_6
		recoil_unwielded_mod = RECOIL_AMOUNT_TIER_5
		icon_state = "m7_stock-on"
		attach_icon = "m7_stock-on"
		wield_delay_mod = WIELD_DELAY_NONE

	else
		accuracy_mod = 0
		recoil_mod = 0
		scatter_mod = 0
		movement_onehanded_acc_penalty_mod = 0
		accuracy_unwielded_mod = 0
		scatter_unwielded_mod = 0
		icon_state = "m7_stock"
		attach_icon = "m7_stock"
		wield_delay_mod = 0 //stock is folded so no wield delay
		recoil_unwielded_mod = 0

	gun.recalculate_attachment_bonuses()
	gun.update_overlays(src, "stock")

/obj/item/attachable/stock/m7/grip
	name = "M7 SMG folding grip"
	desc = "A folding grip that comes standard with the M7 SMG. Folding it up makes it more portable and quicker to wield but as a downside becomes slightly less accurate and has worse scatter."
	icon = 'icons/halo/obj/items/weapons/guns_by_faction/unsc/unsc_attachments.dmi'
	icon_state = "m7_grip"
	attach_icon = "m7_grip"
	flags_attach_features = ATTACH_ACTIVATION
	collapsible = TRUE
	stock_activated = FALSE
	collapse_delay  = 0.5 SECONDS
	attachment_action_type = /datum/action/item_action/toggle
	slot = "under"

/obj/item/attachable/stock/m7/grip/New()
	..()

	accuracy_mod = 0
	scatter_mod = 0
	movement_onehanded_acc_penalty_mod = 0
	accuracy_unwielded_mod = 0
	scatter_unwielded_mod = 0
	wield_delay_mod = 0
	recoil_unwielded_mod = 0

/obj/item/attachable/stock/m7/grip/apply_on_weapon(obj/item/weapon/gun/gun)
	if(stock_activated)
		//folded up
		accuracy_mod = -HIT_ACCURACY_MULT_TIER_2
		scatter_mod = -SCATTER_AMOUNT_TIER_9
		movement_onehanded_acc_penalty_mod = -MOVEMENT_ACCURACY_PENALTY_MULT_TIER_5
		accuracy_unwielded_mod = -HIT_ACCURACY_MULT_TIER_3
		scatter_unwielded_mod = SCATTER_AMOUNT_TIER_7
		recoil_unwielded_mod = -RECOIL_AMOUNT_TIER_5
		icon_state = "m7_grip-on"
		attach_icon = "m7_grip-on"
		wield_delay_mod = WIELD_DELAY_NONE

	else
		accuracy_mod = 0
		recoil_mod = 0
		scatter_mod = 0
		movement_onehanded_acc_penalty_mod = 0
		accuracy_unwielded_mod = 0
		scatter_unwielded_mod = 0
		icon_state = "m7_grip"
		attach_icon = "m7_grip"
		wield_delay_mod = 0 //stock is folded so no wield delay
		recoil_unwielded_mod = 0

	gun.recalculate_attachment_bonuses()
	gun.update_overlays(src, "under")


