//1 - CA bunker,  2 - USMC bunker, 3 - main battleground (maybe BIG map, like 450*450), 4 - level with animated roads and lost soldiers.
/datum/map/coldwar
	name = ""
	full_name = "Escalation by lokiki"
	path = "coldwar-2bunks"

	lobby_icon = 'maps/coldwar-2bunks/coldwar_lobby.dmi'

	load_legacy_saves = TRUE

	station_levels = list(1) //1, 2 - USMC and CA armies bunkers if gamemode isn't company
	//admin_levels = list(3)
	contact_levels = list(1) //the third level is main battleground| levels which can be reached for e.g. announsments
	player_levels = list(1) //levels which character can reach
	//sealed_levels = list(5) //don't ned this
	//empty_levels = list(5) //and this for some reason.
	//accessible_z_levels = list("1" = 5, "2" = 5, "4" = 10, "5" = 15, "7" = 60) we don't need this
	//base_turf_by_z = list("6" = /turf/snow/gravsnow) // and this

	station_name  = "NSS Exodus Coldwar1"
	station_short = "Exodus Coldwar2"
	dock_name     = "NAS Crescent Coldwar3"
	boss_name     = "Central Command Coldwar4"
	boss_short    = "Centcomm Coldwar5"
	company_name  = "NanoTrasen Coldwar6"
	company_short = "NT Coldwar7"
	system_name = "Nyx Coldwar8"

	//shuttle_docked_message = "The scheduled Crew Transfer Shuttle to %Dock_name% has docked with the station. It will depart in approximately %ETD%"
	//shuttle_leaving_dock = "The Crew Transfer Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	//shuttle_called_message = "A crew transfer to %Dock_name% has been scheduled. The shuttle has been called. It will arrive in approximately %ETA%"
	//shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	//emergency_shuttle_docked_message = "The Emergency Shuttle has docked with the station. You have approximately %ETD% to board the Emergency Shuttle."
	//emergency_shuttle_leaving_dock = "The Emergency Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	//emergency_shuttle_called_message = "An emergency evacuation shuttle has been called. It will arrive in approximately %ETA%"
	//emergency_shuttle_recall_message = "The emergency shuttle has been recalled."

	evac_controller_type = /datum/evacuation_controller/shuttle

/datum/map/coldwar/perform_map_generation()
	return 1