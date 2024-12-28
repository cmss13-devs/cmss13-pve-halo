// rifle ammo

/datum/ammo/bullet/rifle/ma5c
	name = "FMJ bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	damage = 40
	penetration = ARMOR_PENETRATION_TIER_1
	accurate_range = 16
	accuracy = HIT_ACCURACY_TIER_6
	scatter = SCATTER_AMOUNT_TIER_10
	shell_speed = AMMO_SPEED_TIER_6
	effective_range_max = 7
	damage_falloff = DAMAGE_FALLOFF_TIER_7
	max_range = 24

/datum/ammo/bullet/rifle/br55
	name = "X-HP SAP-HE bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	damage = 50
	penetration = ARMOR_PENETRATION_TIER_3
	accurate_range = 16
	scatter = SCATTER_AMOUNT_TIER_10
	shell_speed = 1.5*AMMO_SPEED_TIER_6
	effective_range_max = 16
	damage_falloff = DAMAGE_FALLOFF_TIER_7
	max_range = 24

// shotgun ammo

/datum/ammo/bullet/shotgun/buckshot/unsc
	name = "8-gauge MAG 15P-00B"
	handful_state = "8g_shell"
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/spread/unsc
	accurate_range = 8
	max_range = 8
	damage = 60
	bonus_projectiles_amount = EXTRA_PROJECTILES_TIER_8
	firing_freq_offset = SOUND_FREQ_LOW

/datum/ammo/bullet/shotgun/spread/unsc
	name = "additional buckshot, USCM special type"

	accurate_range = 8
	max_range = 8
	damage = 90
	firing_freq_offset = SOUND_FREQ_LOW

// rocket ammo

/datum/ammo/rocket/spankr
	name = "M19 missile"
	icon = 'icons/obj/items/weapons/guns/halo/unsc/halo_projectiles.dmi'
	icon_state = "spankr_missile"
	damage = 50


// sniper ammo

/datum/ammo/bullet/rifle/srs99
	name = "APFSDS bullet"
	headshot_state = HEADSHOT_OVERLAY_HEAVY
	damage = 200
	penetration = ARMOR_PENETRATION_TIER_8
	accurate_range = 24
	accuracy = HIT_ACCURACY_TIER_10
	scatter = SCATTER_AMOUNT_TIER_10
	effective_range_max = 24
	damage_falloff = DAMAGE_FALLOFF_TIER_7
	max_range = 48

// pistol ammo

/datum/ammo/bullet/pistol/magnum
	name = "SAP-HE bullet"
	headshot_state = HEADSHOT_OVERLAY_HEAVY
	accuracy = HIT_ACCURACY_TIER_4
	accuracy_var_low = PROJECTILE_VARIANCE_TIER_6
	damage = 40
	penetration= ARMOR_PENETRATION_TIER_2
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_2
