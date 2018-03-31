//1 - CA bunker,  2 - USMC bunker, 3 - main battleground (maybe BIG map, like 450*450), 4 - level with animated roads and lost soldiers.
/datum/map/coldwar
	name = ""
	full_name = "Escalation by lokiki"
	path = "coldwar-poligon"

	lobby_icon = 'maps/coldwar-2bunks/coldwar_lobby.dmi'

	load_legacy_saves = TRUE

	station_levels = list(1)
	admin_levels = list()
	contact_levels = list()
	player_levels = list(1)
	//sealed_levels = list(5) //don't need this for now
	//empty_levels = list(5) //and this for some reason.

	station_name  = "NSS Exodus Coldwar1"
	station_short = "Exodus Coldwar2"
	dock_name     = "NAS Crescent Coldwar3"
	boss_name     = "Central Command Coldwar4"
	boss_short    = "Centcomm Coldwar5"
	company_name  = "NanoTrasen Coldwar6"
	company_short = "NT Coldwar7"
	system_name = "Nyx Coldwar8"

	evac_controller_type = /datum/evacuation_controller/shuttle

/datum/map/coldwar/perform_map_generation()
	return 1