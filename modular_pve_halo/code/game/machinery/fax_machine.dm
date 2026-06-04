
//==============================SUBTYPES
#define DEPARTMENT_UNSC "UNSCDF Local Command Link"
/obj/structure/machinery/faxmachine/unsc
	name = "UNSCDF Fax Machine"
	desc = "While considerably long in the tooth by the current century, fax machines remain hooked to human telecomms through increasingly arcane methods."
	//not sure if need to rename everything else like dept etc.
	network = "UNSCDF Auxiliary Compatibility Protocol"
	department = "UNSC Common Compatibility Tunnel"
	//idea being this is outdated but sort of mashed into a catch all interpreter that puts it into the network
	target_department = DEPARTMENT_UNSC
	//someone will need to implement the proc from the fax machine to switch departments or whatever. just dont change it.

