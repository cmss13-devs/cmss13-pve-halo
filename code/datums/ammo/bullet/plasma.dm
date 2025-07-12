/datum/ammo/energy/plasma
	name = "plasma bolt"
	icon = 'icons/halo/obj/items/weapons/halo_projectiles.dmi'
	flags_ammo_behavior = AMMO_LASER
	shell_speed = AMMO_SPEED_TIER_3

/datum/ammo/energy/plasma/plasma_pistol
	name = "light plasma bolt"
	icon_state = "plasma_teal"
	accurate_range = 14
	max_range = 22
	damage = 35

/datum/ammo/energy/plasma/plasma_pistol/overcharge
	name = "overcharged light plasma bolt"
	damage = 55
	shell_speed = AMMO_SPEED_TIER_4
