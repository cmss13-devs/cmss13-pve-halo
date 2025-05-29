/*
	This datum is used to store all of the values for halo shielding, both Spartan and Covenant.
	It also stores the shields of specific ranks within the Covenant. Icons and other values such as
	the current health of a shield are found within the armor itself
*/

/datum/halo_shield
	/// The maximum health of the shield
	var/max_shield_strength
	/// The maximum regeneration rate of the shield
	var/max_shield_regen_rate
	/// The rate at which max_shield_regen_rate recovers itself after damaged
	var/shield_regen_recovery
	/// The time it takes to begin recovery after taking damage
	var/time_to_recovery

/datum/halo_shield/tester_shield
	max_shield_strength = 100
	max_shield_regen_rate = 10
	shield_regen_recovery = 1
	time_to_recovery = 5

/datum/halo_shield/sangheili
	time_to_recovery = 15

/datum/halo_shield/sangheili/minor
	max_shield_strength = 150
	max_shield_regen_rate = 20
	shield_regen_recovery = 2

/datum/halo_shield/sangheili/major
	max_shield_strength = 200
	max_shield_regen_rate = 25
	shield_regen_recovery = 3

/datum/halo_shield/sangheili/ultra
	max_shield_strength = 300
	max_shield_regen_rate = 35
	shield_regen_recovery = 5

/datum/halo_shield/sangheili/zealot
	max_shield_strength = 400
	max_shield_regen_rate = 35
	shield_regen_recovery = 7

/datum/halo_shield/sangheili/stealth
	max_shield_strength = 100
	max_shield_regen_rate = 15
	shield_regen_recovery = 2
	time_to_recovery = 12

