/obj/effect/temp_visual//ported (pasted) from TG13
	icon_state = null
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	//time, in deciseconds of duration
	var/duration = 10
	///if true, will pick a random direction when created.
	var/randomdir = TRUE
	///id of the deletion timer
	var/timerid

/obj/effect/temp_visual/Initialize(mapload)
	. = ..()
	if(randomdir)
		setDir(pick(GLOB.cardinals))

	timerid = QDEL_IN(src, duration)

/obj/effect/temp_visual/Destroy()
	. = ..()
	deltimer(timerid)

//-----------------------------------------
//HEAVY IMPACT
//-----------------------------------------

/obj/effect/temp_visual/heavy_impact
	icon = 'icons/effects/heavyimpact.dmi'
	icon_state = "heavyimpact"
	duration = 1.3 SECONDS

/obj/effect/temp_visual/heavyimpact/Initialize(mapload)
	. = ..()
	flick("heavyimpact", src)

/obj/effect/temp_visual/dir_setting
	randomdir = FALSE

/obj/effect/temp_visual/dir_setting/Initialize(mapload, set_dir)
	if(set_dir)
		setDir(set_dir)
	. = ..()

//------------------------------------------
//BLOOD HITS
//------------------------------------------

/obj/effect/temp_visual/dir_setting/bloodsplatter
	icon = 'icons/effects/blood.dmi'
	duration = 5
	randomdir = FALSE
	layer = ABOVE_XENO_LAYER
	var/splatter_type = "splatter"

/obj/effect/temp_visual/dir_setting/bloodsplatter/Initialize(mapload, set_dir, fx_duration, color_override)
	if(color_override)
		color = color_override
	if(IS_DIAGONAL_DIR(set_dir))
		icon_state = "[splatter_type][pick(1, 2, 6)]"
	else
		icon_state = "[splatter_type][pick(3, 4, 5)]"
	. = ..()
	if(fx_duration)
		duration = fx_duration
	var/target_pixel_x = 0
	var/target_pixel_y = 0
	switch(set_dir)
		if(NORTH)
			target_pixel_y = 16
		if(SOUTH)
			target_pixel_y = -16
		if(EAST)
			target_pixel_x = 16
		if(WEST)
			target_pixel_x = -16
		if(NORTHEAST)
			target_pixel_x = 16
			target_pixel_y = 16
		if(NORTHWEST)
			target_pixel_x = -16
			target_pixel_y = 16
		if(SOUTHEAST)
			target_pixel_x = 16
			target_pixel_y = -16
		if(SOUTHWEST)
			target_pixel_x = -16
			target_pixel_y = -16
	animate(src, pixel_x = target_pixel_x, pixel_y = target_pixel_y, alpha = 0, time = duration)


/obj/effect/temp_visual/dir_setting/bloodsplatter/xenosplatter
	splatter_type = "csplatter"
	color = BLOOD_COLOR_XENO

/obj/effect/temp_visual/dir_setting/bloodsplatter/human
	splatter_type = "csplatter"
	color = BLOOD_COLOR_HUMAN

/obj/effect/temp_visual/dir_setting/bloodsplatter/hellhound
	splatter_type = "csplatter"
	color = BLOOD_COLOR_YAUTJA

/obj/effect/temp_visual/dir_setting/bloodsplatter/yautjasplatter
	splatter_type = "csplatter"
	color = BLOOD_COLOR_YAUTJA_DARK

/obj/effect/temp_visual/dir_setting/bloodsplatter/synthsplatter
	splatter_type = "csplatter"
	color = BLOOD_COLOR_SYNTHETIC

//------------------------------------------
//Shockwaves
//------------------------------------------

/obj/effect/shockwave
	icon = 'icons/effects/light_overlays/shockwave.dmi'
	icon_state = "shockwave"
	plane = DISPLACEMENT_PLATE_RENDER_LAYER
	pixel_x = -496
	pixel_y = -496

/obj/effect/shockwave/Initialize(mapload, radius, speed, easing_type = LINEAR_EASING, y_offset, x_offset)
	. = ..()
	if(!speed)
		speed = 1
	if(y_offset)
		pixel_y += y_offset
	if(x_offset)
		pixel_x += x_offset
	QDEL_IN(src, 0.5 * radius * speed)
	transform = matrix().Scale(32 / 1024, 32 / 1024)
	animate(src, time = 0.5 * radius * speed, transform=matrix().Scale((32 / 1024) * radius * 1.5, (32 / 1024) * radius * 1.5), easing = easing_type)

/obj/effect/temp_visual/dropship_flyby
	icon = 'icons/obj/structures/props/flyby_shadows.dmi'
	icon_state = "ud"
	layer = FLY_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	duration = 3 SECONDS
	pixel_x = -134
	pixel_y = -134
	pixel_z = -480
	indestructible = TRUE

/obj/effect/temp_visual/dropship_flyby/Initialize()
	. = ..()
	animate(src, pixel_z = 960, time = 3 SECONDS)

/obj/effect/temp_visual/dropship_flyby/krokodil
	icon = 'icons/obj/structures/props/flyby_shadows.dmi'
	icon_state = "krokodil"

/particles/shuttle_dust_hover
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	width = 750
	height = 750
	count = 1000
	spawning = 20
	lifespan = 8
	fade = 50
	grow = 0.3
	velocity = list(0, 0)
	position = generator(GEN_CIRCLE, 180, 170, NORMAL_RAND)
	gravity = list(0, 0)
	scale = generator(GEN_VECTOR, list(1, 1), list(2,2), NORMAL_RAND)
	rotation = 0
	spin = generator(GEN_NUM, -20, 20)

/obj/effect/temp_visual/dropship_hover
	icon = 'icons/obj/structures/props/flyby_shadows.dmi'
	icon_state = "ud"
	layer = FLY_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	duration = 5 SECONDS
	pixel_x = -134
	pixel_y = -134
	alpha = 0
	indestructible = TRUE

/obj/effect/temp_visual/dropship_hover/Initialize()
	. = ..()
	particles = new /particles/shuttle_dust_hover
	animate(src, alpha = 255, time = 1 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(fade_away)), 4 SECONDS)

/obj/effect/temp_visual/dropship_hover/proc/fade_away()
	animate(src, alpha = 0, time = 1 SECONDS)
	particles.spawning = 0

/obj/effect/temp_visual/dropship_hover/krokodil
	icon_state = "krokodil"

/obj/effect/temp_visual/heavyimpact_cas
	name = "heavy impact"
	icon = 'icons/effects/heavyimpact.dmi'
	icon_state = ""
	duration = 13
	indestructible = TRUE

/obj/effect/temp_visual/heavyimpact_cas/Initialize(mapload)
	. = ..()
	flick("heavyimpact", src)

/obj/effect/temp_visual/falling_obj
	icon = 'icons/obj/structures/mortar.dmi'
	icon_state = "mortar_ammo_he"
	appearance_flags = PIXEL_SCALE
	layer = FLY_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	duration = 0.2 SECONDS
	pixel_z = 200
	pixel_x = 16
	indestructible = TRUE

/obj/effect/temp_visual/falling_obj/Initialize()
	. = ..()
	var/angle = -135
	add_filter("blur", 2, motion_blur_filter(-1, -1))
	pixel_x = cos(angle) * -400
	pixel_z = sin(angle) * -400
	transform = matrix().Turn(angle)
	animate(src, pixel_z = 0, pixel_x = -16, time = 0.2 SECONDS, , easing = LINEAR_EASING)

/obj/effect/temp_visual/falling_obj/incend
	icon_state = "mortar_ammo_inc"

/obj/effect/temp_visual/falling_obj/smoke
	icon_state = "mortar_ammo_smk"

/obj/effect/temp_visual/falling_obj/nerve
	icon_state = "mortar_ammo_smk"

/obj/effect/temp_visual/falling_obj/flare
	icon_state = "mortar_ammo_smk"
	duration = 0.1 SECONDS

/obj/effect/temp_visual/falling_obj/mlrs
	icon_state = "mlrs_rocket"

/obj/effect/temp_visual/falling_obj/mlrs_smoke
	icon_state = "mlrs_smoke_rocket"

/obj/effect/temp_visual/falling_obj/ob
	icon = 'icons/obj/structures/props/almayer_props.dmi'
	icon_state = "he_ob_upright"

/obj/effect/temp_visual/falling_obj/keeper
	icon = 'icons/obj/structures/props/almayer_props64.dmi'
	icon_state = "paveway_rackless"
	pixel_x = -64
	pixel_y = -64

/obj/effect/temp_visual/falling_obj/napalm
	icon = 'icons/obj/structures/props/almayer_props64.dmi'
	icon_state = "napalm_rackless"
	pixel_x = -64
	pixel_y = -64

/obj/effect/temp_visual/falling_obj/banshee
	icon = 'icons/obj/structures/props/almayer_props64.dmi'
	icon_state = "banshee_rackless"
	pixel_x = -64
	pixel_y = -64
/particles/plasma
	icon = 'icons/halo/effects/plasma.dmi'
	icon_state = "circle"
	width = 340
	height = 340
	count = 100
	spawning = 5
	gradient = list("#FFFFFF", "#9990ffff", "#3e308aff")
	color_change = generator(GEN_NUM, 0.025, 0.05)
	lifespan = 15
	fade = generator(GEN_NUM, 25, 45)
	grow = -0.075
	velocity = list(0, 15)
	position = generator(GEN_CIRCLE, 3, 3, NORMAL_RAND)
	scale = generator(GEN_NUM, 0.65, 0.9)
	rotation = generator(GEN_NUM, 45, 135)
	spin = generator(GEN_NUM, -20, 20)
	drift = generator(GEN_VECTOR, list(-0.5, 0), list(0.5,0), LINEAR_RAND)

/particles/plasma_explosion
	icon = 'icons/halo/effects/plasma.dmi'
	icon_state = list("shape_1" = 1, "shape_2" = 1, "shape_3" = 1, "shape_4" = 1)
	width = 340
	height = 340
	count = 45
	spawning = 45
	gradient = list("#FFFFFF", "#9990ffff", "#3e308aff")
	color_change = generator(GEN_NUM, 0.025, 0.01)
	lifespan = 6
	fade = generator(GEN_NUM, 25, 45)
	grow = -0.075
	velocity = generator(GEN_CIRCLE, 45, 35, NORMAL_RAND)
	scale = generator(GEN_NUM, 1.5, 1.7)
	friction = generator(GEN_NUM, 0.5, 0.25)

/particles/plasma_explosion/small
	count = 15
	spawning = 15
	velocity = generator(GEN_CIRCLE, 10, 15, NORMAL_RAND)
	scale = generator(GEN_NUM, 0.5, 1)

/particles/plasma_explosion/green
	count = 35
	spawning = 35
	gradient = list("#FFFFFF", "#5dbf67ff", "#328a30ff")
	velocity = generator(GEN_CIRCLE, 35, 25, NORMAL_RAND)

/particles/plasma_explosion/glassing
	width = 850
	height = 850
	count = 500
	spawning = 45
	fade = generator(GEN_NUM, 25, 55)
	position = list(0, -218)
	scale = generator(GEN_NUM, 2, 3)
	gradient = list("#FFFFFF", "#e67d71ff", "#470d0dff")
	velocity = generator(GEN_CIRCLE, 85, 75, NORMAL_RAND)

/obj/effect/temp_visual/plasma_incoming
	icon = null
	duration = 3 SECONDS
	pixel_z = 480
	light_on = TRUE
	light_power = 3
	light_range = 3
	light_color = "#71a2e6ff"
	layer = ABOVE_FLY_LAYER
	indestructible = TRUE

/obj/effect/temp_visual/plasma_incoming/Initialize(mapload)
	. = ..()
	particles = new /particles/plasma
	add_filter("pixel_outline", 1, outline_filter(1, "#4f308aff", OUTLINE_SHARP))
	add_filter("glow", 2, drop_shadow_filter(0, 0, 5, 1, "#4f308aff"))
	addtimer(VARSET_CALLBACK(particles, count, 0), 0.65 SECONDS)
	animate(src, pixel_z = -140, time = 1.25 SECONDS)

/obj/effect/temp_visual/plasma_explosion
	icon = null
	duration = 7
	light_on = TRUE
	light_power = 5
	light_range = 6
	light_color = "#71a2e6ff"
	layer = ABOVE_MOB_LAYER
	indestructible = TRUE
	var/outline_color = "#4f308aff"
	var/particles_used = /particles/plasma_explosion

/obj/effect/temp_visual/plasma_explosion/Initialize(mapload)
	. = ..()
	particles = new particles_used
	add_filter("pixel_outline", 1, outline_filter(1, outline_color, OUTLINE_SHARP))
	add_filter("glow", 2, drop_shadow_filter(0, 0, 5, 1, outline_color))
	addtimer(VARSET_CALLBACK(particles, count, 0), 0.25 SECONDS)

/obj/effect/temp_visual/plasma_explosion/small
	light_power = 2
	light_range = 3
	particles_used = /particles/plasma_explosion/small

/obj/effect/temp_visual/plasma_explosion/green
	light_color = "#75d66eff"
	particles_used = /particles/plasma_explosion/green
	outline_color = "#328a30ff"

/obj/effect/temp_visual/banshee_flyby
	icon = 'icons/halo/effects/banshee_flyby.dmi'
	icon_state = "banshee_shadow"
	layer = FLY_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	duration = 2 SECONDS
	pixel_x = -22
	pixel_z = -480
	indestructible = TRUE

/obj/effect/temp_visual/banshee_flyby/Initialize()
	. = ..()
	animate(src, pixel_z = 960, time = 2 SECONDS)

/obj/effect/temp_visual/glassing_beam
	icon = 'icons/halo/effects/glassing.dmi'
	icon_state = "beam"
	pixel_x = -50
	duration = 8.5 SECONDS
	light_on = TRUE
	light_power = 25
	light_range = 50
	light_color = "#e67d71ff"
	layer = ABOVE_FLY_LAYER
	indestructible = TRUE
	var/outline_color = "#c50909ff"
	var/particles_used = /particles/plasma_explosion/glassing

/obj/effect/temp_visual/glassing_beam/Initialize(mapload)
	. = ..()
	particles = new particles_used
	add_filter("pixel_outline", 1, outline_filter(1, outline_color, OUTLINE_SHARP))
	add_filter("glow", 2, drop_shadow_filter(0, 0, 3, 1, outline_color))
	addtimer(CALLBACK(src, PROC_REF(beam_off)), 7.5 SECONDS)

/obj/effect/temp_visual/glassing_beam/proc/beam_off()
	particles.count = 0
	icon_state = "off"
	light_on = FALSE
