//======================
// SANGHEILI
//======================

/obj/item/clothing/gloves/marine/sangheili
	name = "\improper Sangheili gauntlets"
	desc = "Simple gauntlets worn over the wrists of a Sangheili, made of common nanolaminate composites. Fitted precisely, these gauntlets do not interfere whatsoever with the warriors work, and in the case where pure brute strength is needed, prove sufficient as improvised weapons."
	icon = 'icons/halo/obj/items/clothing/covenant/gloves.dmi'
	icon_state = "sang_minor"
	item_state = "sangauntlets_minor"

	item_icons = list(
		WEAR_HANDS = 'icons/halo/mob/humans/onmob/clothing/sangheili/gloves.dmi'
	)

	allowed_species_list = list(SPECIES_SANGHEILI)

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/gloves/marine/sangheili/minor
	name = "\improper Sangheili Minor gauntlets"

/obj/item/clothing/gloves/marine/sangheili/major
	name = "\improper Sangheili Major gauntlets"
	icon_state = "sang_major"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/gloves/marine/sangheili/ultra
	name = "\improper Sangheili Ultra gauntlets"
	icon_state = "sang_ultra"

	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/gloves/marine/sangheili/zealot
	name = "\improper Sangheili Zealot gauntlets"
	icon_state = "sang_zealot"

	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/gloves/marine/sangheili/specops
	name = "\improper Sangheili Special Operations gauntlets"
	icon_state = "sang_specops"

	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/gloves/marine/sangheili/specops/ultra
	name = "\improper Sangheili Special Operations Ultra gauntlets"
	icon_state = "sang_specultra"

	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

/obj/item/clothing/gloves/marine/sangheili/stealth
	name = "\improper Sangheili Stealth gauntlets"
	icon_state = "sang_stealth"

	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/gloves/marine/sangheili/honor_guard // deflects ur bullets
	name = "\improper Sangheili Honor Guard gauntlets"
	icon_state = "sang_honorguard"

	armor_melee = CLOTHING_ARMOR_GIGAHIGH
	armor_bullet = CLOTHING_ARMOR_GIGAHIGH
	armor_laser = CLOTHING_ARMOR_GIGAHIGH
	armor_bomb = CLOTHING_ARMOR_GIGAHIGHDOUBLEPLUSGOOD

//======================
// KIGYAR
//======================

/obj/item/clothing/gloves/marine/ruuhtian
	name = "\improper Ruuhtian vambrace"
	desc = "A heavily armoured vambrace designed to provide protection to the weapon hand of a Kig'yar warrior when used in conjunction with a point defence gauntlet. The otherwise lesser protected limb is a common casualty to high intensity combat frontline Kig'yar find themselves in, this vambrace ensures that they cannot abandon their duty through the loss of a limb."
	icon = 'icons/halo/obj/items/clothing/covenant/gloves.dmi'
	icon_state = "ruuhtian_vambrace"
	item_state = "ruuhtian_vambrace"

	item_icons = list(
		WEAR_HANDS = 'icons/halo/mob/humans/onmob/clothing/ruuhtian/gloves.dmi'
	)

	allowed_species_list = list(SPECIES_RUUHTIAN)

	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW

/obj/item/clothing/gloves/marine/ruuhtian/minor
	name = "\improper Ruuhtian Minor defense gauntlet"
	desc = "A directional energy shield projector given to Jackals within the Covenant, the barrier is a light blue when deployed. Deceptively strong single-direction energy field that effortlessly deflects ballistic weapon fire or shrapnel and provides fair protection against plasma weapons, nearly every Jackal has one."
	icon_state = "ruuhtian_minor"
	item_state = "ruuhtian_minor"

/obj/item/clothing/gloves/marine/ruuhtian/major
	name = "\improper Ruuhtian Major defense gauntlet"
	desc = "A superior model of directional energy shield given to Major ranked Jackals, glows an orange colour when deployed. These defense gauntlets show an improved capability at absorbing damage compared to more common blue variants, which seems to provide greater courage to he wielder."
	icon_state = "ruuhtian_major"
	item_state = "ruuhtian_major"

/obj/item/clothing/gloves/marine/ruuhtian/ultra
	name = "\improper Ruuhtian Ultra defense gauntlet"
	desc = "A rarely spotted white coloured energy shield projector used exclusively by Jacakl Ultras. Shows significant defensive qualities compared to more common models, with reports suggesting the ability to dampen or deflect anti-tank weaponry."
	icon_state = "ruuhtian_ultra"
	item_state = "ruuhtian_ultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/gloves/marine/ruuhtian/specops
	name = "\improper Ruuhtian Special Operations defense gauntlet"
	desc = "Used by Jackal special operations troops, showing comparable defensive qualities to those used by more common Ultras. Improvements in recharge rate and the ability to be obscurbed by active-camouflage makes these dangerous pieces of equipment."
	icon_state = "ruuhtian_specops"
	item_state = "ruuhtian_specops"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/gloves/marine/ruuhtian/specops_ultra
	name = "\improper Ruuhtian Special Operations Ultra defense gauntlet"
	desc = "Used by Jackal special operations troops, showing comparable defensive qualities to those used by more common Ultras. Improvements in recharge rate and the ability to be obscurbed by active-camouflage makes these dangerous pieces of equipment."
	icon_state = "ruuhtian_specultra"
	item_state = "ruuhtian_specultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH


//======================
// UNGGOY
//======================

/obj/item/clothing/gloves/marine/unggoy
	name = "\improper Unggoy bracers"
	desc = "Simple bracers worn over the wrists of an Unggoy."
	icon = 'icons/halo/obj/items/clothing/covenant/gloves.dmi'
	icon_state = "unggoy_minor"
	item_state = "unggoy_minor"

	item_icons = list(
		WEAR_HANDS = 'icons/halo/mob/humans/onmob/clothing/unggoy/gloves.dmi'
	)

	allowed_species_list = list(SPECIES_UNGGOY)

	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW

/obj/item/clothing/gloves/marine/unggoy/minor
	name = "\improper Unggoy Minor bracers"

/obj/item/clothing/gloves/marine/unggoy/major
	name = "\improper Unggoy Major bracers"
	icon_state = "unggoy_major"
	item_state = "unggoy_major"

/obj/item/clothing/gloves/marine/unggoy/ultra
	name = "\improper Unggoy Ultra bracers"
	icon_state = "unggoy_ultra"
	item_state = "unggoy_ultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/gloves/marine/unggoy/heavy
	name = "\improper Unggoy Heavy bracers"
	icon_state = "unggoy_heavy"
	item_state = "unggoy_heavy"

	armor_bomb = CLOTHING_ARMOR_VERYHIGH

/obj/item/clothing/gloves/marine/unggoy/specops
	name = "\improper Unggoy Special Operations bracers"
	icon_state = "unggoy_specops"
	item_state = "unggoy_specops"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/gloves/marine/unggoy/specops_ultra
	name = "\improper Unggoy Special Operations Ultra bracers"
	icon_state = "unggoy_specultra"
	item_state = "unggoy_specultra"

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
