/datum/ammo/energy/plasma
	name = "plasma bolt"
	icon = 'icons/halo/obj/items/weapons/halo_projectiles.dmi'
	flags_ammo_behavior = AMMO_LASER
	shell_speed = AMMO_SPEED_TIER_2

/datum/ammo/energy/plasma/plasma_pistol
	name = "light plasma bolt"
	icon_state = "plasma_teal"
	accurate_range = 10
	max_range = 20
	damage = 32

/datum/ammo/energy/plasma/plasma_pistol/overcharge
	name = "overcharged light plasma bolt"
	damage = 80
	shell_speed = AMMO_SPEED_TIER_1

/datum/ammo/energy/plasma/plasma_rifle
	name = "plasma bolt"
	icon_state = "plasma_blue"
	accurate_range = 14
	max_range = 24
	damage = 34

/datum/ammo/needler
	name = "needle"
	icon = 'icons/halo/obj/items/weapons/halo_projectiles.dmi'
	icon_state = "needle"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	damage = 26
	penetration = ARMOR_PENETRATION_TIER_3
	accurate_range = 16
	accuracy = HIT_ACCURACY_TIER_MAX
	scatter = SCATTER_AMOUNT_TIER_10
	shell_speed = AMMO_SPEED_TIER_3
	effective_range_max = 7
	damage_falloff = DAMAGE_FALLOFF_TIER_7
	max_range = 24
	var/needle_per_hit = 1

/datum/ammo/needler/on_hit_mob(mob/M, obj/projectile/P)
	. = ..()
	M.AddComponent(/datum/component/supercombine, needle_per_hit, P.weapon_cause_data, P.dir)

/datum/ammo/bullet/rifle/carbine
	name = "carbine bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	damage = 60
	penetration = ARMOR_PENETRATION_TIER_3
	accurate_range = 24
	scatter = SCATTER_AMOUNT_TIER_10
	shell_speed = 1.5*AMMO_SPEED_TIER_6
	effective_range_max = 24
	damage_falloff = DAMAGE_FALLOFF_TIER_7
	max_range = 32
	shrapnel_chance = null
