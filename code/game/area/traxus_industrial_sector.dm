//================================================TRAXUS GAMMA SECTOR
//BASE
/area/gamma_sector
	name = "Gamma Sector"
	icon_state = "lv626"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY

//PARENTS
/area/gamma_sector/highway
	name = "Highway"
/area/gamma_sector/unsc_base
	name = "Base"
	ceiling = CEILING_METAL
/area/gamma_sector/traxus_base
	name = "Factory"
	ceiling = CEILING_METAL
/area/gamma_sector/open
	name = "Exterior"
	ceiling = CEILING_NONE
/area/gamma_sector/closed_soft
	name = "Interior"
	ceiling = CEILING_METAL
/area/gamma_sector/closed_hard
	name = "Coverage"
	ceiling = CEILING_DEEP_UNDERGROUND


//SHUTTLES
/area/gamma_sector/shuttles
	name = "Clearing"
	icon_state = "shuttlegrn"
	ceiling = CEILING_NONE
	minimap_color = MINIMAP_AREA_LZ
/area/gamma_sector/shuttles/drop1
	name = "Southwest Facility Clearing"
/area/gamma_sector/shuttles/drop2
	name = "Southern Clearing"
/area/gamma_sector/shuttles/drop3
	name = "Northern Engineering Clearing"
/area/gamma_sector/shuttles/drop4
	name = "Southeastern Highway Coast Clearing"
/area/gamma_sector/shuttles/drop5
	name = "Northeastern Industrial Plaza"


//UNSC BASE PORTION
//[southern vents]
/area/gamma_sector/unsc_base/armory
	name = "Armory"
	icon_state = "armory"
/area/gamma_sector/unsc_base/large_garage
	name = "Primary Garage"
	icon_state = "garage"
/area/gamma_sector/unsc_base/command
	name = "Operations"
	icon_state = "bunker01_command"
/area/gamma_sector/unsc_base/east_wing
	name = "East Wing"
	icon_state = "hallP"
/area/gamma_sector/unsc_base/communications
	name = "Communications"
	icon_state = "tcomsatcham"
/area/gamma_sector/unsc_base/medbay
	name = "Medical Clinic"
	icon_state = "medbay"
/area/gamma_sector/unsc_base/west_wing
	name = "West Wing"
	icon_state = "hallS"
/area/gamma_sector/unsc_base/central_vent
	name = "Main Vent Airway"
	icon_state = "iso1"
/area/gamma_sector/unsc_base/side_vent
	name = "Breached Vent Airway"
	icon_state = "iso2"
/area/gamma_sector/unsc_base/command_office
	name = "Operations Office"
	icon_state = "tactical"
/area/gamma_sector/unsc_base/communication_office
	name = "Traxus Affairs"
	icon_state = "law"

//[northern vents and east]
/area/gamma_sector/unsc_base/small_garage
	name = "Secondary Garage"
	icon_state = "garage_one"
/area/gamma_sector/unsc_base/joint_wing
	name = "Joint Wing"
	icon_state = "entry"
/area/gamma_sector/unsc_base/north_wing
	name = "North Wing"
	icon_state = "hallF"
/area/gamma_sector/unsc_base/maintenance_substation
	name = "Maintenance substation"
	icon_state = "fsmaint"
/area/gamma_sector/unsc_base/auxiliary_office
	name = "Auxiliary Office"
	icon_state = "conference"
/area/gamma_sector/unsc_base/auxiliary_storage
	name = "Auxiliary Storage"
	icon_state = "eva"
/area/gamma_sector/unsc_base/auxiliary_wing
	name = "Auxiliary Wing"
	icon_state = "auxstorage"
/area/gamma_sector/unsc_base/engineering_wing
	name = "Engineering Wing"
	icon_state = "bunker01_engineering"
/area/gamma_sector/unsc_base/mess_hall
	name = "Eatery"
	icon_state = "bunker01_break"


//TRAXUS PORTION
//[central area (west transfer)]
/area/gamma_sector/traxus_base/main_filtration
	name = "Central Filtration"
	icon_state = "fsmaint"
/area/gamma_sector/traxus_base/refiller
	name = "Refiller Station"
	icon_state = "emergencystation"
/area/gamma_sector/traxus_base/lockers
	name = "Locker"
	icon_state = "locker"
/area/gamma_sector/traxus_base/maintenance_station
	name = "Maintenance Station"
	icon_state = "maint_arrivals"
/area/gamma_sector/traxus_base/traxus_office
	name = "Traxus Office"
	icon_state = "mining_outpost"
/area/gamma_sector/traxus_base/traxus_central_storage
	name = "Central Storage"
	icon_state = "garage_two"
/area/gamma_sector/traxus_base/maintenance_shack
	name = "Maintenance Shack"
	icon_state = "substation"
/area/gamma_sector/traxus_base/water_filtration
	name = "Water Filtration Station"
	icon_state = "mining_eva"
/area/gamma_sector/traxus_base/hub_1
	name = "Filtration Hub 1"
	icon_state = "LP"
/area/gamma_sector/traxus_base/hub_2
	name = "Filtration Hub 2"
	icon_state = "LPS"
/area/gamma_sector/traxus_base/tertiary_hub
	name = "Tertiary Filtration Hub"
	icon_state = "HH_Second"
/area/gamma_sector/traxus_base/central_hub
	name = "Central Fitlration Hub"
	icon_state = "head_quarters"

//[Transfers]
/area/gamma_sector/traxus_base/transfer_storage
	name = "Traxus Storage Transfers"
	icon_state = "start"
/area/gamma_sector/traxus_base/transfer_security
	name = "Traxus Security Sublet"
	icon_state = "security"
/area/gamma_sector/traxus_base/transfer_primary
	name = "Traxus Primary Hall"
	icon_state = "houseground"
/area/gamma_sector/traxus_base/supply_section_main
	name = "Traxus Supply Section"
	icon_state = "primarystorage"
/area/gamma_sector/traxus_base/supply_section_a
	name = "Storage Section A"
	icon_state = "hangar_alpha"
/area/gamma_sector/traxus_base/supply_section_b
	name = "Storage Section B"
	icon_state = "hangar_beta"
/area/gamma_sector/traxus_base/supply_entryway
	name = "Storage Entryway"
	icon_state = "hangar"
/area/gamma_sector/traxus_base/supply_maint
	name = "Storage Maintenance"
	icon_state = "maint_cargo"
/area/gamma_sector/traxus_base/east_plaza
	name = "East Plaza"
	icon_state = "tcomsateast"
/area/gamma_sector/traxus_base/north_plaza
	name = "North Plaza"
	icon_state = "tcomsatlounge"
/area/gamma_sector/traxus_base/monitor_station
	name = "Traxus Monitoring Station"
	icon_state = "observatory"
/area/gamma_sector/traxus_base/garage
	name = "Traxus Auxiliary Garage"
	icon_state = "garage"
/area/gamma_sector/traxus_base/main_facility
	name = "Traxus Main Facility"
	icon_state = "yellow"


//HIGHWAY
/area/gamma_sector/highway/southern_maintenance
	name = "Southern Maintenance Section"
	ceiling = CEILING_METAL
	icon_state = "amaint"
/area/gamma_sector/highway/southern_bridge
	name = "Southern Bridge"
	ceiling = CEILING_NONE
	icon_state = "shuttle3"
/area/gamma_sector/highway/southern_way
	name = "Southern Highway"
	ceiling = CEILING_METAL
	icon_state = "shuttle2"
/area/gamma_sector/highway/southeastern_exit
	name = "Southern Bridge Highway Access"
	ceiling = CEILING_METAL
	icon_state = "purple"
/area/gamma_sector/highway/southern_access
	name = "Southern Highway Access"
	ceiling = CEILING_METAL
	icon_state = "purple"
/area/gamma_sector/highway/bridge_highway_maintenance
	name = "Bridge Maintainance Station"
	ceiling = CEILING_METAL
	icon_state = "asmaint"
/area/gamma_sector/highway/southeastern_roadway
	name = "Eastern Bridge"
	ceiling = CEILING_NONE
	icon_state  = "dk_yellow"
/area/gamma_sector/highway/eastern_access
	name = "Eastern Highway Access"
	ceiling = CEILING_METAL
	icon_state = "purple"
/area/gamma_sector/highway/eastern_way
	name = "Eastern Highway"
	ceiling = CEILING_METAL
	icon_state = "shuttle2"
/area/gamma_sector/highway/northeastern_exit
	name = "Northeastern Highway Access"
	ceiling = CEILING_METAL
	icon_state = "purple"
/area/gamma_sector/highway/traxus_highway_maint
	name = "Eastern Maintenance Section"
	ceiling = CEILING_METAL
	icon_state = "apmaint"
/area/gamma_sector/highway/northern_exit
	name = "Northern Highway Access"
	ceiling = CEILING_METAL
	icon_state = "purple"


//EXTRA BUILDINGS
/area/gamma_sector/closed_soft/garage
	name = "Garage Outpost"
	icon_state = "garage"
/area/gamma_sector/closed_soft/observation_hab
	name = "Observation Hab"
	icon_state = "observatory"
/area/gamma_sector/closed_soft/armory_hab
	name = "Secured Hab"
	icon_state = "armory"
/area/gamma_sector/closed_soft/road_hab
	name = "Maintenance Hab"
	icon_state = "maint_e_shuttle"
/area/gamma_sector/closed_soft/old_hab
	name = "Old Hab"
	icon_state = "HH_Crypt"
/area/gamma_sector/closed_soft/oob_hab
	name = "Empty Hab"
	icon_state = "atmos"


//CLEARING
/area/gamma_sector/open/dried_river
	name = "Dried Riverbed"
	icon_state = "north"
/area/gamma_sector/open/abandoned_area
	name = "Abandoned Area"
	icon_state = "northeast"
/area/gamma_sector/open/eastern_ridge
	name = "Eastern Ridge"
	icon_state = "east"
/area/gamma_sector/open/coastal_ridge
	name = "Coastal Cliff"
	icon_state = "southeast"
/area/gamma_sector/open/coastal_beach
	name = "Coastal Beach"
	icon_state = "south"
/area/gamma_sector/open/western_clearing
	name = "Western Clearing"
	icon_state = "west"
/area/gamma_sector/open/shorline
	name = "Northwestern Shoreline"
	icon_state = "northwest"
/area/gamma_sector/open/inner_region
	name = "Central Area"
	icon_state = "central"


//CAVES AND UNDERHANGS
/area/gamma_sector/closed_hard/overheads
	name = "Rocky Overhead"
	icon_state = "blue-red-d"
/area/gamma_sector/closed_hard/coastal_caves
	name = "Beach Cavern"
	icon_state = "caves_sw"
/area/gamma_sector/closed_hard/highway_caves
	name = "Eastern Cavern"
	icon_state = "caves_e"
/area/gamma_sector/closed_hard/facility_caves
	name = "Northern Access Cavern"
	icon_state = "caves_lambda"
/area/gamma_sector/closed_hard/engineering_caves
	name = "Western Shore Cavern"
	icon_state = "caves_n"
/area/gamma_sector/closed_hard/cliff_caves
	name = "Central Cavern"
	icon_state = "caves_virology"
