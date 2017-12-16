//This is the data structure for all game factions and subfactions. Try not to edit these.
//Global proc to initialize all the faction and faction job templates.

proc/init_factions()
	var/i = 1

	for(var/faction_type in typesof(/datum/army_faction))
		var/datum/army_faction/faction = new faction_type

		if(faction.enabled)
			all_factions += faction
			faction.team_num = i
			i++

		else
			qdel(faction)

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

proc/show_statistic()
	//fraction live kill in action mortality rate

	var/dat = ""

	if(!length(all_factions))
		dat = "No factions in game!"
		return dat

	for(var/datum/army_faction/F in all_factions)
		var/total = length(F.players)
		var/live  = total
		var/dead  = 0
		var/mortality_rate = 0

		if(!total)
			continue

		for(var/mob/living/carbon/human/H in F.players)
			if(H.stat == DEAD)
				dead++
				live--

		mortality_rate = (dead / total) * 100
		dat += "[F.name] : [live] alive, [dead ? dead : "nobody"] KIA. Mortality rate: [round(mortality_rate)]% <br>"

	to_world(dat)
	return

proc/show_armies()
	// Are we need this?? ~JamsMor

	if(!length(all_factions))
		to_world("No factions in game!")
		return

	for(var/datum/army_faction/F in all_factions)
		to_world("Army : [F.faction_tag]")

	return

//Faction parent. 'army_faction' to differentiate it from the actual basic faction code for antags
/datum/army_faction
	var/name = "Base Faction"
	var/team_num = 0 //Never set this manually, this is used in game modes
	var/enabled = 0 //Just to keep this parent out of lists, or disable factions from being selectable
	var/faction_tag = "parent" //Used for lookups. Should be small and simple text tag, ie. "bund", "clsa". AKA an ID
	var/latejoin = 1 //Can players join the faction if the round has already started?
	var/language = "English" //Main language of the army.
	var/datum/mind/leader //the connected key of the factions current main leader (can only be one)
	var/list/players = list()
	var/list/datum/fireteam/fireteams = list()
	var/list/slots = list()

//This also initializes fireteams
/datum/army_faction/New()
	. = ..()

	fireteams = setup_fireteams_for_faction(src)

/datum/army_faction/Destroy()
	slots.Cut()
	players.Cut()
	leader = null

	for(var/datum/army_faction/F in fireteams)
		fireteams.Remove(F)
		qdel(F)

	. = ..()

//The way these are set up is pretty much ass for when we have like 30 armies and 300 jobs, but.. whatever. Fix later
/datum/army_faction/proc/init_jobs()
	for(var/datum/job/escalation/J in all_army_jobs) //Add jobs to proper slots
		if(J.faction_tag == faction_tag && J.position == "team")
			for(var/i = 1 in 1 to J.amount)
				slots.Add(J)

/datum/fireteam
	var/name = "Default Fireteam Name"
	var/num = 0
	var/datum/mind/leader = null
	var/datum/army_faction/team = null
	var/list/slots = list()

/datum/fireteam/Destroy()
	leader = null
	team = null
	slots.Cut()

	. = ..()

/proc/setup_fireteams_for_faction(var/datum/army_faction/faction_team)
	if(!istype(faction_team))
		return

	var/team_tag = faction_team.faction_tag
	var/list/config_lines = file2list("config/fireteams.txt")

	var/list/ready_fireteams = list()
	var/ready_to_create = FALSE

	var/fireteam_name = ""
	var/list/fireteam_slots = list()

	var/making_fireteam = FALSE

	var/i = 1

	for(var/line in config_lines)
		if(ready_to_create)
			var/datum/fireteam/new_fireteam = new
			new_fireteam.name  = fireteam_name
			new_fireteam.slots = fireteam_slots
			new_fireteam.num = i
			i++
			ready_fireteams.Add(new_fireteam)

			fireteam_name = ""
			fireteam_slots.Cut()
			ready_to_create = TRUE

		if(!length(line))
			continue

		if(copytext(line, 1, 2) == "#")
			continue

		if(findtext(line, "@END@"))
			ready_to_create = TRUE
			making_fireteam = FALSE
			continue

		if(making_fireteam)
			var/esc_Type = text2path(line)

			if(istype(esc_Type))
				fireteam_slots.Add(locate(esc_Type) in all_army_jobs)

			continue

		if(findtext(line, team_tag))
			fireteam_name = copytext(line, 6)
			making_fireteam = TRUE
			continue

	return ready_fireteams

