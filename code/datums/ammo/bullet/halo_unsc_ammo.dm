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
