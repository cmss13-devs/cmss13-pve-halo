


/obj/structure/reagent_dispensers/fueltank/cov
	name = "Plasma Battery"
	desc = "Covenant Plasma Battery"
	icon = 'modular_pve_halo/icons/covProps32x32.dmi'
	icon_state = "plasmabattery"

/obj/structure/prop/static_tank/fuel/cov
	name = "Large Plasma Battery"
	desc = "Covenant Plasma Battery"
	icon = 'modular_pve_halo/icons/covProps64x64.dmi'
	icon_state = "fuel thingy"

/obj/structure/machinery/telecomms/relay/preset/ice_colony/cov
	name = "Covenant Relay Antenna"
	desc = "Covenant Relay Antenna"
	icon = 'modular_pve_halo/icons/covAntenna.dmi'
	icon_state = "antenna"
	id = "Covenant Station Relay"
	unslashable = FALSE
	unacidable = FALSE

/obj/structure/bed/chair/comfy/cov
	name = "covenant stool"
	desc = "A floating purple stool"
	icon = 'modular_pve_halo/icons/covProps32x32.dmi'
	icon_state = "floaty stool"
	color = null

/obj/item/device/assembly/prox_sensor/cov
	name = "covenant proximity sensor"
	desc = "Used for scanning and alerting when someone enters a certain proximity."
	icon = 'modular_pve_halo/icons/covProps32x32.dmi'
	icon_state = "sentry spotter"

/obj/item/device/assembly/prox_sensor/cov/active
	name = "armed covenant proximity sensor"
	range = 6
	anchored = TRUE

/obj/item/device/assembly/prox_sensor/cov/active/New()
	..()
	secured = TRUE
	scanning = TRUE
	update_icon()
	START_PROCESSING(SSobj, src)
