/obj/machinery/computer/shuttle_control/multi/vox
	name = "skipjack control console"
	req_access = list(access_syndicate)
	shuttle_tag = "Skipjack"

/obj/machinery/computer/shuttle_control/multi/syndicate
	name = "mercenary shuttle control console"
	req_access = list(access_syndicate)
	shuttle_tag = "Mercenary"

/obj/machinery/computer/shuttle_control/multi/rescue
	name = "rescue shuttle control console"
	req_access = list(access_cent_specops)
	shuttle_tag = "Rescue"

/obj/machinery/computer/shuttle_control/multi/ninja
	name = "stealth shuttle control console"
	req_access = list(access_syndicate)
	shuttle_tag = "Ninja"

/*obj/machinery/computer/shuttle_control/multi/ural
	name = "URAL's control console"
	icon = 'icons/escalation/turf/ural.dmi'
	icon_state = "panel"
	density = 0
	req_access = list(access_cent_specops)
	shuttle_tag = "Ural"*/

/obj/machinery/computer/shuttle_control/ural
	name = "mining shuttle control console"
	icon = 'icons/escalation/turf/ural.dmi'
	icon_state = "panel"
	shuttle_tag = "Ural1"
	density = 0
	//req_access = list(access_mining)
	circuit = /obj/item/weapon/circuitboard/ural_shuttle