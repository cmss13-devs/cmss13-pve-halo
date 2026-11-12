GLOBAL_LIST_EMPTY(energy_barriers)

#define BLOCKING_MODE_COSMETIC 0
#define BLOCKING_MODE_INFANTRY 1
#define BLOCKING_MODE_VEHICLE 2
#define BLOCKING_MODE_ALL 3

/obj/structure/energy_barrier
	name = "energy barrier"
	desc = "An energy barrier."
	icon = 'icons/halo/obj/structures/energy_barrier.dmi'
	icon_state = "barrier"
	indestructible = TRUE
	unslashable = TRUE
	unacidable = TRUE
	projectile_coverage = PROJECTILE_COVERAGE_MAX
	density = FALSE
	/// Determines the type of things it blocks
	var/blocking_type
	/// What factions are allowed to pass through regardless of the restriction?
	var/faction_type
	/// ID for linking to objects
	var/id


// /obj/structure/energy_barrier/BlockedPassDirs(atom/movable/mover, target_dir)
