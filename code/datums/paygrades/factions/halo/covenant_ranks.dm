/datum/paygrade/covenant
	name = "Civilian"
	default_faction = FACTION_COVENANT
	paygrade = PAY_SHORT_COV_CIV
	prefix = "Civ"
	ranking = 0
	pay_multiplier = 1

// ====== MINISTRY RANKS ======
//
// ====== MINISTRY RANKS ======

/datum/paygrade/covenant/ministry
	paygrade = PAY_SHORT_COV_MIN_D1
	name = "Ministry Personnel"
	prefix = "Ministry Personnel"
	ranking = 0
	pay_multiplier = 1

// Deacons

/datum/paygrade/covenant/ministry/deacon_lesser
	paygrade = PAY_SHORT_COV_MIN_D1
	name = "Sub-Deacon"
	prefix = "Sub-Deacon"
	ranking = 1
	pay_multiplier = 0.8

/datum/paygrade/covenant/ministry/deacon
	paygrade = PAY_SHORT_COV_MIN_D2
	name = "Deacon"
	prefix = "Deacon"
	ranking = 2
	pay_multiplier = 1.2

/datum/paygrade/covenant/ministry/deacon_senior
	paygrade = PAY_SHORT_COV_MIN_D3
	name = "Arch-Deacon"
	prefix = "Arch-Deacon"
	ranking = 3
	pay_multiplier = 1.6


// Other Ranks

/datum/paygrade/covenant/ministry/apprentice
	paygrade = PAY_SHORT_COV_MIN_M1
	name = "Apprentice"
	prefix = "Apprentice"
	ranking = 4
	pay_multiplier = 1.7


/datum/paygrade/covenant/ministry/steward
	paygrade = PAY_SHORT_COV_MIN_M2
	name = "Steward"
	prefix = "Steward"
	ranking = 5
	pay_multiplier = 2

// Ministry Staff

/datum/paygrade/covenant/ministry/staffer_lesser
	paygrade = PAY_SHORT_COV_MIN_S1
	name = "Junior Staffer"
	prefix = "Jr. Staffer"
	ranking = 6
	pay_multiplier = 2.4

/datum/paygrade/covenant/ministry/staffer
	paygrade = PAY_SHORT_COV_MIN_S2
	name = "Staffer"
	prefix = "Staffer"
	ranking = 7
	pay_multiplier = 2.6

/datum/paygrade/covenant/ministry/staffer_senior
	paygrade = PAY_SHORT_COV_MIN_S3
	name = "Senior Staffer"
	prefix = "Sr. Staffer"
	ranking = 7
	pay_multiplier = 2.8

/datum/paygrade/covenant/ministry/precentor
	paygrade = PAY_SHORT_COV_MIN_S4
	name = "Precentor"
	prefix = "Precentor"
	ranking = 8
	pay_multiplier = 3

// Ministers

/datum/paygrade/covenant/ministry/vice_minister
	paygrade = PAY_SHORT_COV_MIN_S5
	name = "Vice Minister"
	prefix = "Vice Minister"
	ranking = 9
	pay_multiplier = 4

/datum/paygrade/covenant/ministry/minister
	paygrade = PAY_SHORT_COV_MIN_S6
	name = "Minister"
	prefix = "Minister"
	ranking = 9
	pay_multiplier = 4

// ====== STANDARD RANKS ======
//
// ====== STANDARD RANKS ======

// Minor, Junior Enlisted equivalent

/datum/paygrade/covenant/minor_lesser
	paygrade = PAY_SHORT_COV_1
	name = "Minor Auxiliary"
	prefix = "Aux. Minor"
	ranking = 1
	pay_multiplier = 0.4

/datum/paygrade/covenant/minor
	paygrade = PAY_SHORT_COV_2
	name = "Minor"
	prefix = "Minor"
	ranking = 2
	pay_multiplier = 0.6

/datum/paygrade/covenant/minor_senior
	paygrade = PAY_SHORT_COV_3
	name = "Minor Superior"
	prefix = "Spr. Minor"
	ranking = 3
	pay_multiplier = 0.8

// Major, NCO equivalent

/datum/paygrade/covenant/major_lesser
	paygrade = PAY_SHORT_COV_4
	name = "Major Auxiliary"
	prefix = "Aux. Major"
	ranking = 4
	pay_multiplier = 1

/datum/paygrade/covenant/major
	paygrade = PAY_SHORT_COV_5
	name = "Major"
	prefix = "Major"
	ranking = 5
	pay_multiplier = 1.2

/datum/paygrade/covenant/major_senior
	paygrade = PAY_SHORT_COV_6
	name = "Major Superior"
	prefix = "Spr. Major"
	ranking = 5
	pay_multiplier = 1.2

// ====== SPECIAL RANKS ======
//
// ====== SPECIAL RANKS ======

// Misc

/datum/paygrade/covenant/kigyar_champion
	paygrade = PAY_SHORT_COV_E1
	name = "Champion"
	prefix = "Champion"
	ranking = 6
	pay_multiplier = 2.5

/datum/paygrade/covenant/kigyar_shipmaster
	paygrade = PAY_SHORT_COV_E2_M
	name = "Shipmaster"
	prefix = "Shipmaster"
	ranking = 7
	pay_multiplier = 3

/datum/paygrade/covenant/kigyar_shipmistress
	paygrade = PAY_SHORT_COV_E2_F
	name = "Shipmistress"
	prefix = "Shipmistress"
	ranking = 8
	pay_multiplier = 3.5 // Because of woke

// Zealot

/datum/paygrade/covenant/zealot
	paygrade = PAY_SHORT_COV_Z1
	name = "Zealot"
	prefix = "Zealot"
	ranking = 6
	pay_multiplier = 5.5

/datum/paygrade/covenant/field_marshal
	paygrade = PAY_SHORT_COV_Z2
	name = "Field Marshal"
	prefix = "Fld. Marshal"
	ranking = 7
	pay_multiplier = 7

// Honor Guard

/datum/paygrade/covenant/honor_guard
	paygrade = PAY_SHORT_COV_H1
	name = "Honor Guard"
	prefix = "Honor Guard"
	ranking = 6
	pay_multiplier = 5

/datum/paygrade/covenant/honor_guard_los
	paygrade = PAY_SHORT_COV_H2
	name = "Lights of Sanghelios"
	prefix = "Lights of Sanghelios"
	ranking = 7
	pay_multiplier = 6

/datum/paygrade/covenant/honor_guard_captain
	paygrade = PAY_SHORT_COV_H3
	name = "Honor Guard Captain"
	prefix = "Honor Guard Cpt."
	ranking = 8
	pay_multiplier = 7

// Ultras

/datum/paygrade/covenant/ultra
	paygrade = PAY_SHORT_COV_U1
	name = "Evocati"
	prefix = "Evocati"
	ranking = 6
	pay_multiplier = 4

/datum/paygrade/covenant/ultra_leader
	paygrade = PAY_SHORT_COV_U2
	name = "Evocati Delegatus"
	prefix = "Evocati Delegatus"
	ranking = 6
	pay_multiplier = 4.5

// ====== ELITE RANKS ======
//
// ====== ELITE RANKS ======

// Minor, SNCO equivalent

/datum/paygrade/covenant/minor_sangheili_lesser
	paygrade = PAY_SHORT_COV_S1
	name = "Minor Novice"
	prefix = "Nov. Minor"
	ranking = 6
	pay_multiplier = 3.2

/datum/paygrade/covenant/minor_sangheili
	paygrade = PAY_SHORT_COV_S2
	name = "Minor"
	prefix = "Minor"
	ranking = 7
	pay_multiplier = 3.2

/datum/paygrade/covenant/minor_sangheili_senior
	paygrade = PAY_SHORT_COV_S3
	name = "Minor Adept"
	prefix = "Adt. Minor"
	ranking = 8
	pay_multiplier = 3.4

// Major, Lieutenant equivalent

/datum/paygrade/covenant/major_sangheili_lesser
	paygrade = PAY_SHORT_COV_S4
	name = "Major Novice"
	prefix = "Nov. Major"
	ranking = 9
	pay_multiplier = 3.6


/datum/paygrade/covenant/major_sangheili
	paygrade = PAY_SHORT_COV_S5
	name = "Major"
	prefix = "Major"
	ranking = 10
	pay_multiplier = 3.6

/datum/paygrade/covenant/major_sangheili_senior
	paygrade = PAY_SHORT_COV_S6
	name = "Major Adept"
	prefix = "Adt. Major"
	ranking = 11
	pay_multiplier = 3.8

// ====== OFFICER RANKS ======
//
// ====== OFFICER RANKS ======

/datum/paygrade/covenant/major_ordinal
	paygrade = PAY_SHORT_COV_O1
	name = "Major Ordinal"
	prefix = "Major Ordinal"
	ranking = 12
	pay_multiplier = 4.2

/datum/paygrade/covenant/half_commander
	paygrade = PAY_SHORT_COV_O2
	name = "Half-Commander"
	prefix = "Half-Commander"
	ranking = 13
	pay_multiplier = 5

/datum/paygrade/covenant/sub_commander
	paygrade = PAY_SHORT_COV_O3
	name = "Sub-Commander"
	prefix = "Sub-Commander"
	ranking = 14
	pay_multiplier = 5.5

/datum/paygrade/covenant/commander
	paygrade = PAY_SHORT_COV_O4
	name = "Commander"
	prefix = "Commander"
	ranking = 15
	pay_multiplier = 6

// ====== MASTER RANKS ======
//
// ====== MASTER RANKS ======

// Land

/datum/paygrade/covenant/fieldmaster
	paygrade = PAY_SHORT_COV_M1
	name = "Fieldmaster"
	prefix = "Fieldmaster"
	ranking = 16
	pay_multiplier = 7

/datum/paygrade/covenant/landmaster
	paygrade = PAY_SHORT_COV_M2
	name = "Landmaster"
	prefix = "Landmaster"
	ranking = 17
	pay_multiplier = 8

// Land

/datum/paygrade/covenant/shipmaster
	paygrade = PAY_SHORT_COV_M1E
	name = "Shipmaster"
	prefix = "Shipmaster"
	ranking = 16
	pay_multiplier = 7

/datum/paygrade/covenant/fleetmaster
	paygrade = PAY_SHORT_COV_M2E
	name = "Fleetmaster"
	prefix = "Fleetmaster"
	ranking = 17
	pay_multiplier = 8

// Above

/datum/paygrade/covenant/supreme_commander
	paygrade = PAY_SHORT_COV_M3
	name = "Supreme Commander"
	prefix = "Supreme Cmdr."
	ranking = 18
	pay_multiplier = 10
