/obj/item/hardpoint/special/vulcan/gauss //I am NOT redefining all the stuff the vulcan's already changed from the base FPW
	name = "M68 'Gauss Cannon' ALIM"
	desc = "The M68 Asynchronus Linear-Induction Motor, more commonly referred to as the 'mini-MAC', is an anti-armor weapon capable of firing it's 25x130mm high-density projectiles at hypersonic velocities. Personnel within 20 meters of the weapon are advised to wear hearing protection, as the hypersonic boom when fired is substantial."
	desc_lore = "The M68 is powered by a liquid-metal capacitor attached to the turret frame, capable of providing power for up to fifty shots from full charge. The cannon's capacitor is commonly topped up by surplus energy from an M12 LAAV's powerplant, or connected to a local powergrid when fielded in static positions. Whilst primarily designed for anti-armor purposes, the hypervelocity shell and advanced targetting computer of the M68 means it commonly sees use as an improvised anti-air weapon too."

	icon_state = "gauss_cannon"
	disp_icon_state = "gauss_cannon"
	activation_sounds = list('sound/vehicles/halo/gun_m68_fire_1.ogg', 'sound/vehicles/halo/gun_m68_fire_2.ogg', 'sound/vehicles/halo/gun_m68_fire_3.ogg', 'sound/vehicles/halo/gun_m68_fire_4.ogg')

	ammo = new /obj/item/ammo_magazine/hardpoint/vulcan/gauss
	max_clips = 1

	scatter = 1
	gun_firemode = GUN_FIREMODE_SEMIAUTO
	gun_firemode_list = list(
		GUN_FIREMODE_SEMIAUTO,
	)
	fire_delay = FIRE_DELAY_TIER_6

	muzzle_flash_pos = list(
		"1" = list(-12, 20),
		"2" = list(-22, -50),
		"4" = list(28, -14),
		"8" = list(-60, -4)
	)

	reload_time = 5 SECONDS

/obj/item/ammo_magazine/hardpoint/vulcan/gauss
	name = "M68 'Gauss Cannon' Rotary Magazine"
	desc = "A rotary magazine for an M68 'Gauss Cannon' ALIM. Supports IFF."
	caliber = "25x130mm"
	default_ammo = /datum/ammo/bullet/sniper/anti_materiel/vulture/gauss
	max_rounds = 3
	gun_type = /obj/item/hardpoint/special/vulcan/gauss

/obj/item/ammo_magazine/hardpoint/vulcan/gauss/update_icon()
	icon_state = "cupola_[current_rounds <= 0 ? "0" : "1"]"

/datum/ammo/bullet/sniper/anti_materiel/vulture/gauss
	name = "25x130 hypervelocity slug"
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_ANTIVEHICLE|AMMO_ANTISTRUCT

/datum/ammo/bullet/sniper/anti_materiel/vulture/gauss/set_bullet_traits()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_iff),
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_penetrating/heavy)
	))

/datum/ammo/bullet/sniper/anti_materiel/vulture/gauss/on_hit_mob(mob/hit_mob, obj/projectile/bullet)
	. = ..()
	burst(get_turf(hit_mob),bullet,damage_type, 1 , 20)
	knockback(hit_mob, bullet, 30)
	hit_mob.apply_effect(3, SLOW)
	cell_explosion(get_turf(hit_mob), 10, 5, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, bullet.weapon_cause_data)

/datum/ammo/bullet/sniper/anti_materiel/vulture/gauss/on_near_target(turf/tile, obj/projectile/bullet)
	burst(get_turf(tile),bullet,damage_type, 1 , 20)
	cell_explosion(get_turf(tile), 10, 5, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, bullet.weapon_cause_data)
	return 1

/datum/ammo/bullet/sniper/anti_materiel/vulture/gauss/on_hit_obj(obj/object, obj/projectile/bullet)
	burst(get_turf(bullet),bullet,damage_type, 1 , 20)
	cell_explosion(get_turf(bullet), 10, 5, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, bullet.weapon_cause_data)

/datum/ammo/bullet/sniper/anti_materiel/vulture/gauss/on_hit_turf(turf/tile, obj/projectile/bullet)
	burst(get_turf(tile),bullet,damage_type, 1 , 20)
	cell_explosion(get_turf(tile), 10, 5, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, bullet.weapon_cause_data)
