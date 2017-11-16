//This is the data structure for all game factions and subfactions. Try not to edit these.
//Global proc to initialize all the faction and faction job templates.
proc/init_factions()
	var/i = 0
	for(var/faction_type in typesof(/datum/army_faction))
		var/datum/army_faction/faction = new faction_type
		if(faction.enabled)
			all_factions += faction
			i++
			faction.team_num = i
		else
			qdel(faction)

	setup_fireteams_from_config()

	for(var/job_type in typesof(/datum/job/escalation))
		var/datum/job/escalation/J = new job_type
		if(J.enabled)
			all_army_jobs += J
		else
			qdel(J)

	for(var/datum/army_faction/F in all_factions) //Link the jobs to the armies after they're instanced.
		F.init_jobs()

//Return a faction datum by name, tag, or number
proc/get_army(var/choice)
	for(var/datum/army_faction/F in all_factions)
		if((isnum(choice) && F.team_num == choice) || (!isnum(choice) && F.name == choice) || (!isnum(choice) && F.faction_tag == choice))
			return F

	return null

proc/list_armies_by_name(var/show_disabled = 0)
	var/list/names = list()
	for(var/datum/army_faction/F in all_factions)
		if(F.enabled || (show_disabled && !F.enabled))
			names += F.name

proc/show_statistic()
	//fraction live kill in action mortality rate
	if(!ticker.mode.wargames)
		return
	var/dat = ""
	if(!all_factions.len)
		dat = "No factions in game!"
		return dat
	for(var/datum/army_faction/F in ticker.mode.teams)
		var/live = 1
		var/dead = 1
		var/mortality_rate = 1
		for(var/mob/living/carbon/human/H in F.players)
			if(H.stat == DEAD)
				dead++
			else
				live++
		mortality_rate = round(100 * (dead / live))//div by 0
		dat += "[F.name] : [live - 1] alive, [dead - 1] KIA. Mortality rate : [mortality_rate - 1]% <br>"
	return dat

proc/show_armies()
		//fraction live kill in action mortality rate
	if(!ticker.mode.wargames)
		return

	var/dat = ""
	if(!all_factions.len)
		dat = "No factions in game!Show_armyes() fucked up!"
		return dat
	for(var/datum/army_faction/F in ticker.mode.teams)
		to_world("Army : [F.faction_tag]")


//bund, usmc, csla, cccp
//охх сука отрубите мне руки за этот говнокод ~Бастард
proc/show_statistic_by_faction()
	//fraction live kill in action mortality rate
	if(!ticker.mode.wargames)
		return
	var/dat = ""
	if(!all_factions.len)
		dat = "No factions in game! HAHA SUKA BLYAD"
		return dat

	var/bund_live = 0
	var/usmc_live = 0
	var/csla_live = 0
	var/cccp_live = 0

	var/bund_dead = 0
	var/usmc_dead = 0
	var/csla_dead = 0
	var/cccp_dead = 0

	for(var/datum/army_faction/F in ticker.mode.teams)

		for(var/mob/living/carbon/human/H in F.players)
			switch(F.faction_tag)
				if("bund")
					if(H.stat == DEAD)
						bund_dead++
					else
						bund_live++
				if("usmc")
					if(H.stat == DEAD)
						usmc_dead++
					else
						usmc_live++
				if("csla")
					if(H.stat == DEAD)
						csla_dead++
					else
						csla_live++
				if("cccp")
					if(H.stat == DEAD)
						cccp_dead++
					else
						cccp_live++

	if(usmc_live || usmc_dead)
		dat += "USMC : [usmc_live > 0 ? usmc_live : "no"] alive, [usmc_dead > 0 ? usmc_dead : "no"] dead.<br>"

	if(cccp_live || cccp_dead)
		dat += "CCCP : [cccp_live > 0 ? cccp_live : "no"] alive, [cccp_dead > 0 ? cccp_dead : "no"] dead.<br>"

	if(bund_live || bund_dead)
		dat += "BUND : [bund_live > 0 ? bund_live : "no"] alive, [bund_dead > 0 ? bund_dead : "no"] dead.<br>"

	if(csla_live || csla_dead)
		dat += "CSLA : [csla_live > 0 ? csla_live : "no"] alive, [csla_dead > 0 ? csla_dead : "no"] dead.<br>"

	return dat

//Faction parent. 'army_faction' to differentiate it from the actual basic faction code for antags
/datum/army_faction
	var/name = "Base Faction (never see this)"
	var/team_num = 0 //Never set this manually, this is used in game modes
	var/enabled = 0 //Just to keep this parent out of lists, or disable factions from being selectable
	var/faction_tag = "parent" //Used for lookups. Should be small and simple text tag, ie. "bund", "clsa". AKA an ID
	var/is_neutral = 0
	var/reserve_points = 0 //Used for leaders spawning reserve troops
	var/munition_points = 0 //Used for leaders buying explosives/weapons
	var/fuel_points = 0 //Used for leaders buying vehicles
	var/win_points = 0 //Used for controlpoint maps
	var/latejoin = 1 //Can players join the faction if the round has already started?
	var/flag_icon = "icons/flags.dm" //change this later
	var/flag_state = "parent" //If different than tag, otherwise flag should be named as tag
	var/language = "English" //Main language of the army.
	var/datum/mind/leader //the connected key of the factions current main leader (can only be one)
	var/base_color = "white" //Color code for various things
	var/group_name //Name of the group this team belongs to, ie. WARPAC
	var/list/players = list()
	var/num_fireteams = 3
	var/list/datum/fireteam/fireteams = list()
	var/list/fireteam_names = list()
	var/list/slots = list()

//This also initializes fireteams
/datum/army_faction/New()
	..()
	slots.Cut()
	if(fireteams.len)
		for(var/datum/fireteam/V in fireteams) //Cut any previously set up fireteam
			qdel(V)

/*	for(var/i = 1 to num_fireteams)
		var/datum/fireteam/F = new /datum/fireteam(src) //Add instance of fireteam
		F.num = i
		if(fireteam_names.len && fireteam_names.len >= i)
			F.name = fireteam_names[i]
		else
			F.name = "Fireteam [i]"
		fireteams += F*/

/datum/army_faction/Destroy()
	slots.Cut()
	players.Cut()
	for(var/datum/army_faction/F in fireteams)
		qdel(F)
	return ..()

/datum/army_faction/Topic(href, href_list[])
	if(..())
		return
	if(href_list["toggle"])
		switch(href_list["toggle"])
			if("enabled")
				enabled = !enabled
			if("neutral")
				is_neutral = !is_neutral
			if("latejoin")
				latejoin= !latejoin

//			if("job_editor")

//			if("finish_up")
		message_admins("Admin [key_name_admin(usr)] toggled faction option '[href_list["toggle"]]'.")

	else if(href_list["set"])
		var/choice = ""
		switch(href_list["set"])
			if("name")
				choice = sanitize(input(usr, "Enter the new name of the army:") as null|text)
				if(!choice)
					return
				name = choice
			if("flag")
				choice = sanitize(input(usr, "Enter the icon state of the flags:") as null|text)
				if(!choice )
					return
				flag_state = choice
			if("win")
				choice = input("Enter the new number of victory points:") as num
				if(isnull(choice) || choice < 0 || choice > 100)
					return
				win_points = choice
			if("fireteams")
				choice = input("Enter the new number of fireteams:") as num
				if(isnull(choice) || choice < 1 || choice > 10)
					return
				num_fireteams = choice
			if("mun")
				choice = input("Enter the new number of munition points:") as num
				if(isnull(choice) || choice < 0 || choice > 100)
					return
				munition_points = choice
			if("res")
				choice = input("Enter the new number of reserve points:") as num
				if(isnull(choice) || choice < 0 || choice > 100)
					return
				reserve_points = choice
			if("fuel")
				choice = input("Enter the new number of fuel points:") as num
				if(isnull(choice) || choice < 0 || choice > 100)
					return
				fuel_points = choice

		message_admins("Admin [key_name_admin(usr)] set game mode option '[href_list["set"]]' to [choice].")

	if(usr.client.holder)
		usr.client.holder.show_army_edit(src)

//The way these are set up is pretty much ass for when we have like 30 armies and 300 jobs, but.. whatever. Fix later
/datum/army_faction/proc/init_jobs()
	for(var/datum/fireteam/F in fireteams)
		F.init_special_jobs()

	for(var/datum/job/escalation/J in all_army_jobs) //Add jobs to proper slots
		if(J.faction_tag == faction_tag && J.enabled)

			if (J.position == "team")
				for(var/count = 1 to J.amount)
					slots += J

/datum/army_faction/proc/check_whitelist_for_player(var/mob/new_player/NP, var/rank)
	return 1

/datum/fireteam
	var/num = 0
	var/name = "Default Fireteam Name"
	var/datum/mind/leader = null
	var/color = "white"
	var/radio_freq = 0
	var/datum/army_faction/team = null
	var/max_players = 6 //This can be expanded/reduced in gamemode settings
	var/list/slots = list()
	var/list/special_job_types = list()

/datum/fireteam/New(var/datum/army_faction/faction)
	..()
	team = faction
	radio_freq = rand(1000,2000)

/datum/fireteam/Destroy()
	leader = null
	team = null
	slots.Cut()
	return ..()

		// MAKE LOAD FROM CONFIG FILE IN FUTURE!
/datum/fireteam/proc/init_special_jobs()
	if(!special_job_types.len)
		return 0

	for(var/typespecjob in special_job_types)
		var/datum/job/escalation/escjob = new typespecjob
		slots += escjob

	return 1

/proc/setup_fireteams_from_config()
	var/list/config_lines = file2list("config/fireteams.txt")
	var/list/fireteam_names = list()
	var/check_types = 0
	var/datum/fireteam/FT = null
	var/i = 1
	var/list/typesoffireteams = list()
	var/ready_for_end = 0
	var/last_tag = null
	for(var/line in config_lines)

		if(ready_for_end)
			for(var/typeofjob in typesoffireteams)
				FT.special_job_types.Add(typeofjob)

			FT = null

			check_types = 0 // ?
			ready_for_end = 0
			fireteam_names.Cut()
			typesoffireteams.Cut()

		if(!length(line))			  	   continue
		if(copytext(line,1,2) == "#") 	   continue

		if(findtext(line, ":"))
			var/list/fireteam_lists = splittext(line, ":")
			if(!fireteam_lists.len)	  continue
			var/facname = fireteam_lists[1]
			var/factag = fireteam_lists[2]
			fireteam_names[facname] = factag

			var/datum/army_faction/AF
			AF = get_army(factag)
			FT = new /datum/fireteam(AF)
			AF.fireteams += FT
			FT.name = facname
			if(factag != last_tag)
				i = 1
			FT.num = i
			i++
			check_types = 1
			last_tag = factag
			continue

		if(check_types)

			if(findtext(line, "@END@"))
				check_types = 0
				ready_for_end = 1
				continue

			else
				typesoffireteams.Add(text2path(line))
				continue
