//1 - CA bunker,  2 - USMC bunker, 3 - main battleground (maybe BIG map, like 450*450), 4 - level with animated roads and lost soldiers.
/datum/map/coldwar
	name = ""
	full_name = "Escalation 1984"
	path = "coldwar-test-nomachinery"

	lobby_icon = 'maps/coldwar-2bunks/coldwar_lobby.dmi'

	load_legacy_saves = TRUE

	station_levels = list(1)
	contact_levels = list(1)
	player_levels = list(1)

	station_name  = "NSS Exodus Coldwar-test1"
	station_short = "Exodus Coldwar-test2"
	dock_name     = "NAS Crescent Coldwar-test3"
	boss_name     = "Central Command Coldwar-test4"
	boss_short    = "Centcomm Coldwar-test5"
	company_name  = "NanoTrasen Coldwar6"
	company_short = "NT Coldwar7"
	system_name   = "Nyx Coldwar8"

	evac_controller_type = /datum/evacuation_controller/shuttle

/datum/map/coldwar/perform_map_generation()
	return 1