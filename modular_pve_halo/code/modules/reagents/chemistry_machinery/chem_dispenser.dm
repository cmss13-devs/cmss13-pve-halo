/obj/structure/machinery/chem_dispenser/covenant
	name = "Drink Dispenser"
	desc = "A dispenser holding various different fluids in stasis fields. This one is specialized in the storing, distribution, and optional heating of common recreational beverages such as teas, fruit juices, and poorly flavored vitamin supplements. Nutritional supplements are also available as well."
	icon = 'icons/halo/obj/structures/machinery/vending_covenant.dmi'
	icon_state = "drink_machine"
	ui_title = "Dispenser, Recreational Beverages"
	req_skill = null
	req_skill_level = null
	wrenchable = FALSE
	dispensable_reagents = list(
		"water",
		"cream",
		"tea",
		"milk",
		"orangejuice",
		"limejuice",
		"watermelonjuice",
		"berryjuice",
		"grapejuice",
	)

/obj/structure/machinery/chem_dispenser/covenant/alt
	icon_state = "drink_machine2"

/obj/structure/machinery/chem_dispenser/covenant/update_icon()
	. = ..()
	overlays.Cut()
	if(!beaker)
		return
	overlays += "+cup"
	if(inoperable())
		return
