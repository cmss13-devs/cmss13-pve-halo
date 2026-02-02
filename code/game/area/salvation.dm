//Areas for the halo map CSS Salvation.

/area/salvation
	can_build_special = TRUE
	powernet_name = "ground"
	icon_state = "dl_yellow"
	icon = 'icons/turf/area_salvation.dmi'
	minimap_color = MINIMAP_AREA_COLONY

//SECURITY
/area/salvation/security
	name = "\improper security department"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/salvation/security/port/entrance
	name = "\improper security port entrance"
	icon_state = "brig"

/area/salvation/security/starboard/entrance
	name = "\improper security starboard entrance"
	icon_state = "brig"

/area/salvation/security/armoury
	name = "\improper security armoury"
	icon_state = "armory"

/area/salvation/security/port/equipment
	name = "\improper equipment room"
	icon_state = "brig"

/area/salvation/security/port/checkpoint
	name = "\improper port security checkpoint"
	icon_state = "checkpoint1"

//MEDICAL

/area/salvation/medbay
	name = "\improper infirmary"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY
/area/salvation/medbay/theatre/A
	name = "\improper surgical theatre"
	icon_state = "medbay3"
/area/salvation/medbay/theatre/B
	name = "\improper surgical theatre"
	icon_state = "medbay3"
/area/salvation/medbay/theatre/C
	name = "\improper surgical theatre"
	icon_state = "medbay3"

//Hangar

/area/salvation/hangar/a
	name = "\improper Landing zone 1"
	icon_state = "shuttle"

/area/salvation/hangar/a/lounge
	name = "\improper civilian arrival lounge"
	icon_state = "hangar_alpha"

/area/salvation/hangar/b
	name = "\improper Landing zone 2"
	icon_state = "shuttle2"

/area/salvation/hangar/b/unloading
	name = "\improper cargo arrival lounge"
	icon_state = "hangar_beta"

/area/salvation/hangar/evac/hallway
	name = "\improper evacuation hallway"
	icon_state = "exit"
/area/salvation/hangar/evac/escape
	name = "\improper escape bay"
	icon_state = "exit"

//Engi

/area/salvation/engi
	name = "\improper engineering department"
	icon_state = "yellow"

/area/salvation/engi/transformer
	name = "\improper powergrid transformer"
	icon_state = "substation"

/area/salvation/engi/generators
	name = "\improper powergrid generator"
	icon_state = "substation"

/area/salvation/engi/power_main
	name = "\improper power control room"
	icon_state = "engine_monitoring"
	minimap_color = MINIMAP_AREA_ENGI

/area/salvation/engi/substation/a
	name = "\improper alpha sector substation"
	icon_state = "substation"

/area/salvation/engi/substation/b
	name = "\improper beta sector substation"
	icon_state = "substation"

/area/salvation/engi/substation/c
	name = "\improper gamma sector substation"
	icon_state = "substation"

/area/salvation/engi/relay
	name = "\improper Communications Relay"
	icon_state = "tcomsatcham"