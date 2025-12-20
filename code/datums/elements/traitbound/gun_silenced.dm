/datum/element/traitbound/gun_silenced
	associated_trait = TRAIT_GUN_SILENCED
	compatible_types = list(/obj/item/weapon/gun)

/datum/element/traitbound/gun_silenced/Attach(datum/target)
	. = ..()
	if(. & ELEMENT_INCOMPATIBLE)
		return
	var/obj/item/weapon/gun/G = target
	for(var/slot in G.attachments)
		if(istype(G.attachments[slot], /obj/item/attachable/suppressor))
			var/obj/item/attachable/suppressor/silencer = G.attachments[slot]
			G.flags_gun_features |= GUN_SILENCED
			G.muzzleflash_iconstate = null
			if(!HAS_TRAIT_FROM(G, TRAIT_GUN_SILENCED, TRAIT_SOURCE_INHERENT))
				G.fire_sound = silencer.new_fire_sound
		else
			G.flags_gun_features |= GUN_SILENCED
			G.muzzleflash_iconstate = null
			if(!HAS_TRAIT_FROM(G, TRAIT_GUN_SILENCED, TRAIT_SOURCE_INHERENT))
				G.fire_sound = "gun_silenced"

/datum/element/traitbound/gun_silenced/Detach(datum/target)
	var/obj/item/weapon/gun/G = target
	G.flags_gun_features &= ~GUN_SILENCED
	G.muzzleflash_iconstate = initial(G.muzzle_flash)
	G.fire_sound = initial(G.fire_sound)
	return ..()
