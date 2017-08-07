//Old newplayer code is below this.

/mob/new_player
	var/ready = 0
	var/spawning = 0//Referenced when you want to delete the new_player later on in the code.
	var/totalPlayers = 0		 //Player counts for the Lobby tab
	var/totalPlayersReady = 0
	var/datum/browser/panel

	universal_speak = 1

	invisibility = 101

	density = 0
	stat = DEAD
	canmove = 0

	anchored = 1	//  don't get pushed around

	virtual_mob = null // Hear no evil, speak no evil

	// Escalation
	var/fireteam_view = 0
	var/team_view = 0
	var/datum/browser/escpanel

/mob/new_player/New()
	..()
//	verbs += /mob/proc/toggle_antag_pool

/mob/new_player/verb/new_player_panel()
	set src = usr
	new_player_panel_proc()

/mob/new_player/proc/new_player_panel_proc()
	var/output = ""

	output +="<hr>"
	output += "<center><p><a href='byond://?src=\ref[src];char_setup=1'>Setup Character</a></p></center>"

	if(ticker && ticker.mode && ticker.mode.admin_enabled_joining)
		output += "<center><p><a href='byond://?src=\ref[src];join=1'>Join Team!</A></p></center>"

	else
		output += "<center><p>Join Team (Waiting For Admins)</p></center>"

	output += "<center><p><a href='byond://?src=\ref[src];observe=1'>Observe</A></p></center>"

	if(src.client && src.client.holder && ticker && ticker.current_state == GAME_STATE_PREGAME) //Are they an admin?
		output += "<center><p><a href='byond://?src=\ref[src];game_setup=1'>Game Setup</A></p></center>"

	panel = new(src, "Welcome","<center>Welcome</center>", 240, 320, src)
	panel.set_window_options("can_close=0")
	panel.set_content(output)
	panel.open()
	return

/mob/new_player/proc/new_player_show_teams()
	if(!ticker || !ticker.mode) return //somehow
	if(!ticker.mode.wargames) return //Must be escalation gamemode

	var/out = "<center><p><b>[ticker.mode.name]</b></center></p>"
	var/datum/army_faction/team = null

	if(team_view)
		team = get_army(team_view)

	out += "<center>"

	for(var/datum/army_faction/T in ticker.mode.teams)
		if(!T.check_team_whitelist_for_player(src))
			out += "[T.name] (blocked for you)"

		else if(team && team == T)
			out += "[T.name]  "

		else
			out += "<a href='byond://?src=\ref[src];set_team=[T.team_num]'>[T.name]</A>  "

	out += "<br/>"

	for(var/datum/army_faction/N in ticker.mode.neutral_teams)
		if(!N.check_team_whitelist_for_player(src))
			out += "[N.name] (blocked for you)"

		else if(team && team == N)
			out += "[N.name]  "

		else
			out += "<a href='byond://?src=\ref[src];set_team=[N.team_num]'>[N.name]</A>  "

	out += "</center>"

	if(team)
		var/slot_index = 0
		out += "<hr><center>"
		for(var/J in team.slots) //Slots can either be people, or jobs. These are nonsquad jobs.
			slot_index++
			if(istype(J,/datum/job/escalation))
				var/datum/job/escalation/A = J
				out += "<P><a href='byond://?src=\ref[src];set_team_job=[slot_index]'>[A.name] - [A.english_name] (OPEN)</A></P>"

			else
				if(!ismob(J))
					continue

				var/mob/M = J
				var/admin_text = ""

				if(src.client.holder && (!ticker || ticker.current_state <= GAME_STATE_PREGAME))
					admin_text = "<a href='byond://?src=\ref[src];admin_kick_slot=\ref[M]'>ADMIN: KICK SLOT</a>"

				out += "<p>[(M.client && M.client.prefs) ? M.client.prefs.real_name : M.name] - [M.chosenSlot.name] ([M.chosenSlot.english_name]) [admin_text]</p>"

		if(team.num_fireteams > 0)
			out += "<hr><p>"
			for(var/datum/fireteam/F in team.fireteams)
				if(fireteam_view == F.num)
					out += "[F.name] "
				else
					out += "<a href='byond://?src=\ref[src];set_fireteam=[F.num]'><b>[F.name]</b></a> "
			out += "</p></center></hr>"



	if(team && fireteam_view > 0)
		var/datum/fireteam/fireteam = team.fireteams[fireteam_view]
		var/slot_index = 0
		out += "<hr><center>"
		for(var/S in fireteam.slots)
			slot_index++

			if(istype(S, /datum/job/escalation))
				var/datum/job/escalation/A = S
				out += "<p><a href='byond://?src=\ref[src];set_fireteam_job=[slot_index]'>[A.name] - [A.english_name] (OPEN)</a></p>"

			else
				if(!ismob(S))
					continue

				var/mob/P = S

				var/admin_text = ""

				if(src.client.holder && (!ticker || ticker.current_state <= GAME_STATE_PREGAME))
					admin_text = "<a href='byond://?src=\ref[src];admin_kick_slot=\ref[P]'>ADMIN: KICK SLOT</a>"

				out += "<p>[(P.client && P.client.prefs) ? P.client.prefs.real_name : P.name] - [P.chosenSlot.name] ([P.chosenSlot.english_name]) [admin_text]</P>"

		out += "</center>"
		out += "<hr>"

	out += "<p><font size=3><center><a href='byond://?src=\ref[src];exit_slot=1'><B>Exit slot</b></A></center></font></p>"

	if(src.client.holder && (!ticker || ticker.current_state <= GAME_STATE_PREGAME))
		out += "<p><font size=3><center><a href='byond://?src=\ref[src];admin_kick_all_slots=1'><B>ADMIN: KICK EVERYONE FROM SLOT!</b></A></center></font></p>"

	escpanel = new(src, "Teams","Teams", 420, 750, src)
	escpanel.set_content(out)
	escpanel.open()
	return

/mob/new_player/proc/close_team_panel()
	src << browse(null, "window=Teams")
	if(escpanel)
		escpanel.close()
		escpanel = null

/proc/update_escpanels_for_all()
	for(var/mob/new_player/player in player_list)
		if(player.escpanel)
			player.new_player_show_teams()

/mob/new_player/Stat()
	. = ..()

	if(statpanel("Lobby") && ticker)
		if(check_rights(R_INVESTIGATE, 0, src))
			stat("Game Mode:", "[ticker.mode || master_mode][ticker.hide_mode ? " (Secret)" : ""]")
		else
			stat("Game Mode:", PUBLIC_GAME_MODE)

		if(ticker.current_state == GAME_STATE_PREGAME && ticker.mode)
			stat("Time To Start:", "[ticker.pregame_timeleft][round_progressing ? "" : " (DELAYED)"]")
			if(istype(ticker.mode, /datum/game_mode/wargames)) //our cold war base gametype
				var/datum/game_mode/wargames/W = ticker.mode
				stat("Teams Selected: ")
				for(var/datum/army_faction/T in W.teams)
					if(T) stat("[T.name]")
				for(var/datum/army_faction/N in W.neutral_teams)
					if(N) stat("[N.name]")

/mob/new_player/Topic(href, href_list[])
	if(!client)	return 0

	if(href_list["close"])
		close_team_panel()

	if(href_list["set_team"])
		team_view = text2num(href_list["set_team"])
		fireteam_view = 0
		new_player_show_teams()

	if(href_list["set_fireteam"])
		fireteam_view = text2num(href_list["set_fireteam"])
		new_player_show_teams()

	if(href_list["set_team_job"])
		if(spawning)
			return

		var/datum/army_faction/team = get_army(team_view)

		var/slot_index = text2num(href_list["set_team_job"])

		if(team && istype(team.slots[slot_index], /mob/new_player))
			alert("Someone has already picked that job. Too slow!")
			new_player_show_teams()
			return

		//There's probably easier list tools to do all this stuff, I just don't know them. rip
		if(chosenSlot) //They already have a job set, remove it & replace job in slots
			chosenSlot.remove_mob(fireteam_picked, team_picked, src)

		if (team)
			chosenSlot = team.slots[slot_index]

			if(src.client && src.client.prefs)
				src.client.prefs.escJob = team.slots[slot_index]

			fireteam_picked = null
			team_picked = team
			team.slots[slot_index] = src
			update_escpanels_for_all()

		if(!ticker || ticker.current_state <= GAME_STATE_PREGAME)
			if(!ready)
				ready = 1

		else
			if(chosenSlot)
				close_team_panel()

				AttemptLateSpawn(chosenSlot.title, client.prefs.spawnpoint)

	if(href_list["set_fireteam_job"])
		if(spawning)
			return

		var/datum/army_faction/team = get_army(team_view)
		var/datum/fireteam/fireteam

		if(team && fireteam_view > 0)
			fireteam = team.fireteams[fireteam_view]

		var/slot_index = text2num(href_list["set_fireteam_job"])

		if(fireteam && istype(fireteam.slots[slot_index], /mob/new_player))
			alert("Someone has already picked that job. Too slow!")
			new_player_show_teams()
			return

		//There's probably easier list tools to do all this stuff, I just don't know them. rip
		if(chosenSlot) //They already have a job set, remove it & replace job in slots
			chosenSlot.remove_mob(fireteam_picked,team_picked,src)

		if(fireteam)
			chosenSlot = fireteam.slots[slot_index]
			if(src.client && src.client.prefs)
				src.client.prefs.escJob = fireteam.slots[slot_index]

			fireteam_picked = fireteam
			team_picked = team
			fireteam.slots[slot_index] = src
			update_escpanels_for_all()

		if(!ticker || ticker.current_state <= GAME_STATE_PREGAME)
			if(!ready)
				ready = 1
		else
			if(chosenSlot)
				close_team_panel()
				AttemptLateSpawn(chosenSlot.title, client.prefs.spawnpoint)
				return


	if(href_list["exit_slot"])
		if(spawning)
			return

		if(chosenSlot)
			chosenSlot.remove_mob(fireteam_picked, team_picked, src)

		if(ready)
			ready = 0

		update_escpanels_for_all()

	if(href_list["admin_kick_slot"])
		if(!check_rights(0))
			return

		var/mob/new_player/T = locate(href_list["admin_kick_slot"])
		if(!istype(T, /mob/new_player/))
			return

		if(T.chosenSlot)
			to_chat(T, "<span class='warning'>You has been removed from your slot.</span>")
			log_and_message_admins("kicked [T.ckey] from [T.chosenSlot.title] slot", usr)
			if(T.ready)
				T.ready = 0

			T.chosenSlot.remove_mob(T.fireteam_picked, T.team_picked, T)

		update_escpanels_for_all()

	if(href_list["admin_kick_all_slots"])
		if(!check_rights(0))
			return

		for(var/datum/army_faction/AF in all_factions)
			for(var/mob/new_player/NP in AF.slots)
				if(NP.chosenSlot)
					if(NP.ready)
						ready = 0
					NP.chosenSlot.remove_mob(NP.fireteam_picked, NP.team_picked, NP)
					to_chat(NP, "<span class='warning'>You has been removed from your slot.</span>")

			if(AF.num_fireteams > 0)
				for(var/datum/fireteam/FT in AF.fireteams)
					for(var/mob/new_player/NP in FT.slots)
						if(NP.chosenSlot)
							if(NP.ready)
								ready = 0

							NP.chosenSlot.remove_mob(NP.fireteam_picked, NP.team_picked, NP)
							to_chat(NP, "<span class='warning'>You has been removed from your slot.</span>")

		log_and_message_admins("removed all players from their slots", usr)
		update_escpanels_for_all()
	if(href_list["char_setup"])
		client.prefs.ShowChoices(src)

	if(href_list["game_setup"])
		if(!(initialization_stage&INITIALIZATION_COMPLETE))
			to_chat(src, "<span class='warning'>Wait for server initialization to complete.</span>")
			return
		else
			if(ticker.current_state == GAME_STATE_PLAYING)
				to_chat(src,"<span class='warning'>The round has started already, use verbs instead to change things.</span>")
				return
			if(!client.holder) //Shouldn't be possible, but better safe than sorry
				return
			client.holder.show_game_mode()

	if(href_list["start_countdown"])
		if(!(initialization_stage&INITIALIZATION_COMPLETE))
			to_chat(src, "<span class='warning'>Wait for server initialization to complete.</span>")
			return

		if(!ticker.mode.admin_enabled_joining)
			to_chat(src,"<span class='warning'>The teams must be set up and enabled first. How are you even seeing this?</span>")
			return

		if(ticker.current_state == GAME_STATE_PLAYING)
			to_chat(src,"<span class='warning'>The round has started already!</span>")
			return

		round_progressing = 1
		to_chat(src,"<B>Countdown started!</b>")

	if(href_list["join"])
		if(spawning)
			return

		if(!ticker || !ticker.mode)
			to_chat(src,"<span class='warning'>Be patient, the game mode has not been selected yet.</span>")
			return

		if(!config.enter_allowed)
			to_chat(usr, "<span class='notice'>There is an administrative lock on entering the game!</span>")
			return

		if(ticker && ticker.mode && ticker.mode.explosion_in_progress)
			to_chat(usr, "<span class='danger'>The world is currently exploding. Joining would go poorly. Just observe.</span>")
			return

		var/datum/game_mode/wargames/W = ticker.mode

		if(istype(W))
			if(W.teams.len < W.minimum_teams)
				to_chat(src,"<span class='warning'>Be patient, the teams have not been selected.</span>")
				return

			if(!W.admin_enabled_joining)
				to_chat(src,"<span class='warning'>Be patient, the admins haven't completed setting up the round.</span>")
				return

		panel.close()
		new_player_show_teams()

	if(href_list["refresh"])
		panel.close()
		new_player_panel_proc()

	if(href_list["observe"])
		if(!(initialization_stage&INITIALIZATION_COMPLETE))
			to_chat(src, "<span class='warning'>Please wait for server initialization to complete...</span>")
			return

		if(!config.respawn_delay || alert(src,"Are you sure you wish to observe? You will have to wait [config.respawn_delay] minute\s before being able to respawn, if at all.","Player Setup","Yes","No") == "Yes")
			if(!client)	return 1
			var/mob/observer/ghost/observer = new()

			spawning = 1
			sound_to(src, sound(null, repeat = 0, wait = 0, volume = 85, channel = 1))// MAD JAMS cant last forever yo


			observer.started_as_observer = 1
			close_spawn_windows()
			var/obj/O = locate("landmark*Observer-Start")
			if(istype(O))
				to_chat(src, "<span class='notice'>Now teleporting.</span>")
				observer.forceMove(O.loc)
			else
				to_chat(src, "<span class='danger'>Could not locate an observer spawn point. Use the Teleport verb to jump to the map.</span>")
			observer.timeofdeath = world.time // Set the time of death so that the respawn timer works correctly.

			announce_ghost_joinleave(src)

			var/mob/living/carbon/human/dummy/mannequin = new()
			client.prefs.dress_preview_mob(mannequin)
			observer.set_appearance(mannequin)
			qdel(mannequin)

			if(client.prefs.be_random_name)
				if(client.prefs.escJob && client.prefs.escJob.faction_tag)
					client.prefs.real_name = esc_random_name(client.prefs.gender, client.prefs.escJob.faction_tag)
				else
					client.prefs.real_name = random_name(client.prefs.gender)

			observer.real_name = client.prefs.real_name
			observer.name = observer.real_name
			if(!client.holder && !config.antag_hud_allowed)           // For new ghosts we remove the verb from even showing up if it's not allowed.
				observer.verbs -= /mob/observer/ghost/verb/toggle_antagHUD        // Poor guys, don't know what they are missing!
			observer.key = key
			qdel(src)

			return 1

	if(href_list["late_join"])

		if(!ticker || ticker.current_state != GAME_STATE_PLAYING)
			to_chat(usr, "<span class='warning'>The round is either not ready, or has already finished...</span>")
			return
		LateChoices() //show the latejoin job selection menu

	if(!ready && href_list["preference"])
		if(client)
			client.prefs.process_link(src, href_list)
	else if(!href_list["late_join"])
		new_player_panel()

//Don't need any of this shit down here.
/*
	if(href_list["SelectedJob"])
		if(!config.enter_allowed)
			to_chat(usr, "<span class='notice'>There is an administrative lock on entering the game!</span>")
			return
		else if(ticker && ticker.mode && ticker.mode.explosion_in_progress)
			to_chat(usr, "<span class='danger'>The [station_name()] is currently exploding. Joining would go poorly.</span>")
			return

		AttemptLateSpawn(href_list["SelectedJob"],client.prefs.spawnpoint)
		return

	if(href_list["privacy_poll"])
		establish_db_connection()
		if(!dbcon.IsConnected())
			return
		var/voted = 0

		//First check if the person has not voted yet.
		var/DBQuery/query = dbcon.NewQuery("SELECT * FROM erro_privacy WHERE ckey='[src.ckey]'")
		query.Execute()
		while(query.NextRow())
			voted = 1
			break

		//This is a safety switch, so only valid options pass through
		var/option = "UNKNOWN"
		switch(href_list["privacy_poll"])
			if("signed")
				option = "SIGNED"
			if("anonymous")
				option = "ANONYMOUS"
			if("nostats")
				option = "NOSTATS"
			if("later")
				usr << browse(null,"window=privacypoll")
				return
			if("abstain")
				option = "ABSTAIN"

		if(option == "UNKNOWN")
			return

		if(!voted)
			var/sql = "INSERT INTO erro_privacy VALUES (null, Now(), '[src.ckey]', '[option]')"
			var/DBQuery/query_insert = dbcon.NewQuery(sql)
			query_insert.Execute()
			to_chat(usr, "<b>Thank you for your vote!</b>")
			usr << browse(null,"window=privacypoll")
*/


/*
	if(href_list["showpoll"])

		handle_player_polling()
		return

	if(href_list["pollid"])

		var/pollid = href_list["pollid"]
		if(istext(pollid))
			pollid = text2num(pollid)
		if(isnum(pollid))
			src.poll_player(pollid)
		return

	if(href_list["votepollid"] && href_list["votetype"])
		var/pollid = text2num(href_list["votepollid"])
		var/votetype = href_list["votetype"]
		switch(votetype)
			if("OPTION")
				var/optionid = text2num(href_list["voteoptionid"])
				vote_on_poll(pollid, optionid)
			if("TEXT")
				var/replytext = href_list["replytext"]
				log_text_poll_reply(pollid, replytext)
			if("NUMVAL")
				var/id_min = text2num(href_list["minid"])
				var/id_max = text2num(href_list["maxid"])

				if( (id_max - id_min) > 100 )	//Basic exploit prevention
					to_chat(usr, "The option ID difference is too big. Please contact administration or the database admin.")
					return

				for(var/optionid = id_min; optionid <= id_max; optionid++)
					if(!isnull(href_list["o[optionid]"]))	//Test if this optionid was replied to
						var/rating
						if(href_list["o[optionid]"] == "abstain")
							rating = null
						else
							rating = text2num(href_list["o[optionid]"])
							if(!isnum(rating))
								return

						vote_on_numval_poll(pollid, optionid, rating)
			if("MULTICHOICE")
				var/id_min = text2num(href_list["minoptionid"])
				var/id_max = text2num(href_list["maxoptionid"])

				if( (id_max - id_min) > 100 )	//Basic exploit prevention
					to_chat(usr, "The option ID difference is too big. Please contact administration or the database admin.")
					return

				for(var/optionid = id_min; optionid <= id_max; optionid++)
					if(!isnull(href_list["option_[optionid]"]))	//Test if this optionid was selected
						vote_on_poll(pollid, optionid, 1)
*/





/mob/new_player/proc/IsJobAvailable(var/datum/job/job)
	if(!job)	return 0
	if(!job.is_position_available()) return 0
	if(jobban_isbanned(src, job.title))	return 0
	if(!job.player_old_enough(src.client))	return 0

	return 1

/mob/new_player/proc/IsJobRestricted(var/datum/job/job, var/branch_pref, var/rank_pref)
	if(!job.is_branch_allowed(branch_pref))
		return 1
	if(!job.is_rank_allowed(branch_pref, rank_pref))
		return 1
	return 0

/mob/new_player/proc/get_branch_pref()
	if(client)
		return client.prefs.char_branch

/mob/new_player/proc/get_rank_pref()
	if(client)
		return client.prefs.char_rank

/mob/new_player/proc/AttemptLateSpawn(rank,var/spawning_at)
	if(src != usr)
		return 0
	if(!ticker || ticker.current_state != GAME_STATE_PLAYING)
		to_chat(usr, "<span class='warning'>The round is either not ready, or has already finished...</span>")
		return 0
	if(!config.enter_allowed)
		to_chat(usr, "<span class='notice'>There is an administrative lock on entering the game!</span>")
		return 0
	var/datum/job/job = job_master.GetJob(rank)
	if(!IsJobAvailable(job))
		alert("[rank] is not available. Please try another.")
		return 0
	if(!job.is_branch_allowed(client.prefs.char_branch))
		alert("Wrong branch of service for [rank]. Valid branches are: [job.get_branches()].")
		return 0
	if(!job.is_rank_allowed(client.prefs.char_branch, client.prefs.char_rank))
		alert("Wrong rank for [rank]. Valid ranks in [client.prefs.char_branch] are: [job.get_ranks(client.prefs.char_branch)].")
		return 0

	var/datum/spawnpoint/spawnpoint = null
	var/turf/spawn_turf = null

	var/obj/S = null
	var/list/loc_list = new()

	for(var/obj/effect/landmark/start/sloc in landmarks_list)
		if(sloc.name != rank)	continue

		if(locate(/mob/living) in sloc.loc)	continue

		loc_list += sloc

	if(loc_list.len)
		S = pick(loc_list)

	if(istype(S, /obj/effect/landmark/start) && istype(S.loc, /turf))
		spawn_turf = S.loc

	else
		spawnpoint = job_master.get_spawnpoint_for(client, rank)
		spawn_turf = pick(spawnpoint.turfs)


	job_master.AssignRole(src, rank, 1)

	var/mob/living/character = create_character(spawn_turf)	//creates the human and transfers vars and mind
	if(!character)
		return 0

	character = job_master.EquipRank(character, rank, 1)					//equips the human
	UpdateFactionList(character)
	equip_custom_items(character)

	// AIs don't need a spawnpoint, they must spawn at an empty core
	if(character.mind.assigned_role == "AI")

		character = character.AIize(move=0) // AIize the character, but don't move them yet

			// IsJobAvailable for AI checks that there is an empty core available in this list
		var/obj/structure/AIcore/deactivated/C = empty_playable_ai_cores[1]
		empty_playable_ai_cores -= C

		character.forceMove(C.loc)
		var/mob/living/silicon/ai/A = character
		A.on_mob_init()

		AnnounceCyborg(character, rank, "has been downloaded to the empty core in \the [character.loc.loc]")
		ticker.mode.handle_latejoin(character)

		qdel(C)
		qdel(src)
		return

	ticker.mode.handle_latejoin(character)
	universe.OnPlayerLatejoin(character)
	if(job_master.ShouldCreateRecords(rank))
		if(character.mind.assigned_role != "Cyborg")
			data_core.manifest_inject(character)
			ticker.minds += character.mind//Cyborgs and AIs handle this in the transform proc.	//TODO!!!!! ~Carn

			if(job.announced && spawnpoint)
				AnnounceArrival(character, rank, spawnpoint.msg)
		matchmaker.do_matchmaking()
	log_and_message_admins("has joined the round as [character.mind.assigned_role].", character)
	qdel(src)


/mob/new_player/proc/AnnounceCyborg(var/mob/living/character, var/rank, var/join_message)
	if (ticker.current_state == GAME_STATE_PLAYING)
		if(character.mind.role_alt_title)
			rank = character.mind.role_alt_title
		// can't use their name here, since cyborg namepicking is done post-spawn, so we'll just say "A new Cyborg has arrived"/"A new Android has arrived"/etc.
		global_announcer.autosay("A new[rank ? " [rank]" : " visitor" ] [join_message ? join_message : "has arrived"].", "Arrivals Announcement Computer")
		log_and_message_admins("has joined the round as [character.mind.assigned_role].", character)

/mob/new_player/proc/LateChoices()
	var/name = client.prefs.be_random_name ? "friend" : client.prefs.real_name

	var/list/dat = list("<html><body><center>")
	dat += "<b>Welcome, [name].<br></b>"
	dat += "Round Duration: [roundduration2text()]<br>"

	if(evacuation_controller.has_evacuated())
		dat += "<font color='red'><b>The [station_name()] has been evacuated.</b></font><br>"
	else if(evacuation_controller.is_evacuating())
		if(evacuation_controller.emergency_evacuation) // Emergency shuttle is past the point of no recall
			dat += "<font color='red'>The [station_name()] is currently undergoing evacuation procedures.</font><br>"
		else                                           // Crew transfer initiated
			dat += "<font color='red'>The [station_name()] is currently undergoing crew transfer procedures.</font><br>"

	dat += "Choose from the following open/valid positions:<br>"
	for(var/datum/job/job in job_master.occupations)
		if(job && IsJobAvailable(job))
			if(job.minimum_character_age && (client.prefs.age < job.minimum_character_age))
				continue

			var/active = 0
			// Only players with the job assigned and AFK for less than 10 minutes count as active
			for(var/mob/M in player_list) if(M.mind && M.client && M.mind.assigned_role == job.title && M.client.inactivity <= 10 * 60 * 10)
				active++

			if(IsJobRestricted(job, client.prefs.char_branch, client.prefs.char_rank))
				dat += "<a style='text-decoration: line-through' href='byond://?src=\ref[src];SelectedJob=[job.title]'>[job.title] ([job.current_positions]) (Active: [active])</a><br>"
			else
				dat += "<a href='byond://?src=\ref[src];SelectedJob=[job.title]'>[job.title] ([job.current_positions]) (Active: [active])</a><br>"

	dat += "</center>"
	src << browse(jointext(dat, null), "window=latechoices;size=300x640;can_close=1")

/mob/new_player/proc/create_character(var/turf/spawn_turf)
	spawning = 1
	close_spawn_windows()

	close_team_panel()

	var/mob/living/carbon/human/new_character

	var/datum/species/chosen_species
	if(client.prefs.species)
		chosen_species = all_species[client.prefs.species]

	if(!spawn_turf)
		var/datum/spawnpoint/spawnpoint = job_master.get_spawnpoint_for(client, get_rank_pref())
		spawn_turf = pick(spawnpoint.turfs)

	if(chosen_species)
		if(!check_species_allowed(chosen_species))
			spawning = 0 //abort
			return null
		new_character = new(spawn_turf, chosen_species.name)

	if(!new_character)
		new_character = new(spawn_turf)

	new_character.lastarea = get_area(spawn_turf)

	for(var/lang in client.prefs.alternate_languages)
		var/datum/language/chosen_language = all_languages[lang]
		if(chosen_language)
			var/is_species_lang = (chosen_language.name in new_character.species.secondary_langs)
			if(is_species_lang || ((!(chosen_language.flags & RESTRICTED) || has_admin_rights()) && is_alien_whitelisted(src, chosen_language)))
				new_character.add_language(lang)

	if(ticker.random_players)
		new_character.gender = pick(MALE, FEMALE)
		client.prefs.real_name = random_name(new_character.gender)
		client.prefs.randomize_appearance_and_body_for(new_character)
	else
		client.prefs.copy_to(new_character)

	sound_to(src, sound(null, repeat = 0, wait = 0, volume = 85, channel = 1))// MAD JAMS cant last forever yo

	if(mind)
		mind.active = 0					//we wish to transfer the key manually
		mind.original = new_character
		if(client.prefs.relations.len)
			for(var/T in client.prefs.relations)
				var/TT = matchmaker.relation_types[T]
				var/datum/relation/R = new TT
				R.holder = mind
				R.info = client.prefs.relations_info[T]
			mind.gen_relations_info = client.prefs.relations_info["general"]
		mind.transfer_to(new_character)					//won't transfer key since the mind is not active

	new_character.name = real_name
	new_character.dna.ready_dna(new_character)
	new_character.dna.b_type = client.prefs.b_type
	new_character.sync_organ_dna()

	if(chosenSlot)
		new_character.chosenSlot = chosenSlot
		new_character.team_picked = team_picked
		new_character.fireteam_picked = fireteam_picked

		var/i = 0

		if(chosenSlot.position == "team" && team_picked)
			for(var/M in team_picked.slots)
				i++
				if(M == src)
					team_picked.slots[i] = new_character
					break

		else if(chosenSlot.position == "fireteam" && fireteam_picked)
			for(var/M in fireteam_picked.slots)
				i++
				if(M == src)
					fireteam_picked.slots[i] = new_character
					break

	if(client.prefs.disabilities)
		// Set defer to 1 if you add more crap here so it only recalculates struc_enzymes once. - N3X
		new_character.dna.SetSEState(GLASSESBLOCK,1,0)
		new_character.disabilities |= NEARSIGHTED

	// Give them their cortical stack if we're using them.
	// Do the initial caching of the player's body icons.
	new_character.force_update_limbs()
	new_character.update_eyes()
	new_character.regenerate_icons()
	add_team_language(new_character)
	add_other_languages(new_character)
	new_character.key = key		//Manually transfer the key to log them in
	return new_character

/mob/new_player/proc/ViewManifest()
	var/dat = "<div align='center'>"
	dat += data_core.get_manifest(OOC = 1)
	//src << browse(dat, "window=manifest;size=370x420;can_close=1")
	var/datum/browser/popup = new(src, "Crew Manifest", "Crew Manifest", 370, 420, src)
	popup.set_content(dat)
	popup.open()

/mob/new_player/Move()
	return 0

/mob/new_player/proc/close_spawn_windows()
	src << browse(null, "window=latechoices") //closes late choices window
	panel.close()

/mob/new_player/proc/has_admin_rights()
	return check_rights(R_ADMIN, 0, src)

/mob/new_player/proc/check_species_allowed(datum/species/S, var/show_alert=1)
	if(!(S.spawn_flags & SPECIES_CAN_JOIN) && !has_admin_rights())
		if(show_alert)
			to_chat(src, alert("Your current species, [client.prefs.species], is not available for play."))
		return 0
	if(!is_alien_whitelisted(src, S))
		if(show_alert)
			to_chat(src, alert("You are currently not whitelisted to play [client.prefs.species]."))
		return 0
	return 1

/mob/new_player/get_species()
	var/datum/species/chosen_species
	if(client.prefs.species)
		chosen_species = all_species[client.prefs.species]

	if(!chosen_species || !check_species_allowed(chosen_species, 0))
		return SPECIES_HUMAN

	return chosen_species.name

/mob/new_player/get_gender()
	if(!client || !client.prefs) ..()
	return client.prefs.gender

/mob/new_player/is_ready()
	return ready && ..()

/mob/new_player/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "",var/italics = 0, var/mob/speaker = null)
	return

/mob/new_player/hear_radio(var/message, var/verb="says", var/datum/language/language=null, var/part_a, var/part_b, var/part_c, var/mob/speaker = null, var/hard_to_hear = 0)
	return

/mob/new_player/show_message(msg, type, alt, alt_type)
	return

mob/new_player/MayRespawn()
	return 1

/mob/new_player/touch_map_edge()
	return

/mob/new_player/say(var/message)
	sanitize_and_communicate(/decl/communication_channel/ooc, client, message)


































/*
/mob/new_player
	var/ready = 0
	var/spawning = 0//Referenced when you want to delete the new_player later on in the code.
	var/totalPlayers = 0		 //Player counts for the Lobby tab
	var/totalPlayersReady = 0
	var/datum/browser/panel
	universal_speak = 1

	invisibility = 101

	density = 0
	stat = DEAD
	canmove = 0

	anchored = 1	//  don't get pushed around

	virtual_mob = null // Hear no evil, speak no evil

/mob/new_player/New()
	..()
	verbs += /mob/proc/toggle_antag_pool

/mob/new_player/verb/new_player_panel()
	set src = usr
	new_player_panel_proc()

/mob/new_player/proc/new_player_panel_proc()
	var/output = "<div align='center'>"
	output +="<hr>"
	output += "<p><a href='byond://?src=\ref[src];show_preferences=1'>Setup Character</A></p>"

	if(!ticker || ticker.current_state <= GAME_STATE_PREGAME)
		if(ready)
			output += "<p>\[ <span class='linkOn'><b>Ready</b></span> | <a href='byond://?src=\ref[src];ready=0'>Not Ready</a> \]</p>"
		else
			output += "<p>\[ <a href='byond://?src=\ref[src];ready=1'>Ready</a> | <span class='linkOn'><b>Not Ready</b></span> \]</p>"

	else
		output += "<a href='byond://?src=\ref[src];manifest=1'>View the Crew Manifest</A><br><br>"
		output += "<p><a href='byond://?src=\ref[src];late_join=1'>Join Game!</A></p>"

	output += "<p><a href='byond://?src=\ref[src];observe=1'>Observe</A></p>"

	if(!IsGuestKey(src.key))
		establish_db_connection()
		if(dbcon.IsConnected())
			var/isadmin = 0
			if(src.client && src.client.holder)
				isadmin = 1
			var/DBQuery/query = dbcon.NewQuery("SELECT id FROM erro_poll_question WHERE [(isadmin ? "" : "adminonly = false AND")] Now() BETWEEN starttime AND endtime AND id NOT IN (SELECT pollid FROM erro_poll_vote WHERE ckey = \"[ckey]\") AND id NOT IN (SELECT pollid FROM erro_poll_textreply WHERE ckey = \"[ckey]\")")
			query.Execute()
			var/newpoll = 0
			while(query.NextRow())
				newpoll = 1
				break

			if(newpoll)
				output += "<p><b><a href='byond://?src=\ref[src];showpoll=1'>Show Player Polls</A> (NEW!)</b></p>"
			else
				output += "<p><a href='byond://?src=\ref[src];showpoll=1'>Show Player Polls</A></p>"

	output += "</div>"

	panel = new(src, "Welcome","Welcome", 210, 280, src)
	panel.set_window_options("can_close=0")
	panel.set_content(output)
	panel.open()
	return

/mob/new_player/Stat()
	. = ..()

	if(statpanel("Lobby") && ticker)
		if(check_rights(R_INVESTIGATE, 0, src))
			stat("Game Mode:", "[ticker.mode || master_mode][ticker.hide_mode ? " (Secret)" : ""]")
		else
			stat("Game Mode:", PUBLIC_GAME_MODE)
		var/extra_antags = list2params(additional_antag_types)
		stat("Added Antagonists:", extra_antags ? extra_antags : "None")

		if(ticker.current_state == GAME_STATE_PREGAME)
			stat("Time To Start:", "[ticker.pregame_timeleft][round_progressing ? "" : " (DELAYED)"]")
			stat("Players: [totalPlayers]", "Players Ready: [totalPlayersReady]")
			totalPlayers = 0
			totalPlayersReady = 0
			for(var/mob/new_player/player in player_list)
				var/highjob
				if(player.client && player.client.prefs && player.client.prefs.job_high)
					highjob = " as [player.client.prefs.job_high]"
				stat("[player.key]", (player.ready)?("(Playing[highjob])"):(null))
				totalPlayers++
				if(player.ready)totalPlayersReady++

/mob/new_player/Topic(href, href_list[])
	if(!client)	return 0

	if(href_list["show_preferences"])
		client.prefs.ShowChoices(src)
		return 1

	if(href_list["ready"])
		if(!ticker || ticker.current_state <= GAME_STATE_PREGAME) // Make sure we don't ready up after the round has started
			ready = text2num(href_list["ready"])
		else
			ready = 0

	if(href_list["refresh"])
		panel.close()
		new_player_panel_proc()

	if(href_list["observe"])
		if(!(initialization_stage&INITIALIZATION_COMPLETE))
			to_chat(src, "<span class='warning'>Please wait for server initialization to complete...</span>")
			return

		if(!config.respawn_delay || alert(src,"Are you sure you wish to observe? You will have to wait [config.respawn_delay] minute\s before being able to respawn!","Player Setup","Yes","No") == "Yes")
			if(!client)	return 1
			var/mob/observer/ghost/observer = new()

			spawning = 1
			sound_to(src, sound(null, repeat = 0, wait = 0, volume = 85, channel = 1))// MAD JAMS cant last forever yo


			observer.started_as_observer = 1
			close_spawn_windows()
			var/obj/O = locate("landmark*Observer-Start")
			if(istype(O))
				to_chat(src, "<span class='notice'>Now teleporting.</span>")
				observer.forceMove(O.loc)
			else
				to_chat(src, "<span class='danger'>Could not locate an observer spawn point. Use the Teleport verb to jump to the map.</span>")
			observer.timeofdeath = world.time // Set the time of death so that the respawn timer works correctly.

			announce_ghost_joinleave(src)

			var/mob/living/carbon/human/dummy/mannequin = new()
			client.prefs.dress_preview_mob(mannequin)
			observer.set_appearance(mannequin)
			qdel(mannequin)

			if(client.prefs.be_random_name)
				client.prefs.real_name = random_name(client.prefs.gender)
			observer.real_name = client.prefs.real_name
			observer.name = observer.real_name
			if(!client.holder && !config.antag_hud_allowed)           // For new ghosts we remove the verb from even showing up if it's not allowed.
				observer.verbs -= /mob/observer/ghost/verb/toggle_antagHUD        // Poor guys, don't know what they are missing!
			observer.key = key
			qdel(src)

			return 1

	if(href_list["late_join"])

		if(!ticker || ticker.current_state != GAME_STATE_PLAYING)
			to_chat(usr, "<span class='warning'>The round is either not ready, or has already finished...</span>")
			return
		LateChoices() //show the latejoin job selection menu

	if(href_list["manifest"])
		ViewManifest()

	if(href_list["SelectedJob"])

		if(!config.enter_allowed)
			to_chat(usr, "<span class='notice'>There is an administrative lock on entering the game!</span>")
			return
		else if(ticker && ticker.mode && ticker.mode.explosion_in_progress)
			to_chat(usr, "<span class='danger'>The [station_name()] is currently exploding. Joining would go poorly.</span>")
			return

		var/datum/species/S = all_species[client.prefs.species]
		if(!check_species_allowed(S))
			return 0

		AttemptLateSpawn(href_list["SelectedJob"],client.prefs.spawnpoint)
		return

	if(href_list["privacy_poll"])
		establish_db_connection()
		if(!dbcon.IsConnected())
			return
		var/voted = 0

		//First check if the person has not voted yet.
		var/DBQuery/query = dbcon.NewQuery("SELECT * FROM erro_privacy WHERE ckey='[src.ckey]'")
		query.Execute()
		while(query.NextRow())
			voted = 1
			break

		//This is a safety switch, so only valid options pass through
		var/option = "UNKNOWN"
		switch(href_list["privacy_poll"])
			if("signed")
				option = "SIGNED"
			if("anonymous")
				option = "ANONYMOUS"
			if("nostats")
				option = "NOSTATS"
			if("later")
				usr << browse(null,"window=privacypoll")
				return
			if("abstain")
				option = "ABSTAIN"

		if(option == "UNKNOWN")
			return

		if(!voted)
			var/sql = "INSERT INTO erro_privacy VALUES (null, Now(), '[src.ckey]', '[option]')"
			var/DBQuery/query_insert = dbcon.NewQuery(sql)
			query_insert.Execute()
			to_chat(usr, "<b>Thank you for your vote!</b>")
			usr << browse(null,"window=privacypoll")

	if(!ready && href_list["preference"])
		if(client)
			client.prefs.process_link(src, href_list)
	else if(!href_list["late_join"])
		new_player_panel()

	if(href_list["showpoll"])

		handle_player_polling()
		return

	if(href_list["pollid"])

		var/pollid = href_list["pollid"]
		if(istext(pollid))
			pollid = text2num(pollid)
		if(isnum(pollid))
			src.poll_player(pollid)
		return

	if(href_list["votepollid"] && href_list["votetype"])
		var/pollid = text2num(href_list["votepollid"])
		var/votetype = href_list["votetype"]
		switch(votetype)
			if("OPTION")
				var/optionid = text2num(href_list["voteoptionid"])
				vote_on_poll(pollid, optionid)
			if("TEXT")
				var/replytext = href_list["replytext"]
				log_text_poll_reply(pollid, replytext)
			if("NUMVAL")
				var/id_min = text2num(href_list["minid"])
				var/id_max = text2num(href_list["maxid"])

				if( (id_max - id_min) > 100 )	//Basic exploit prevention
					to_chat(usr, "The option ID difference is too big. Please contact administration or the database admin.")
					return

				for(var/optionid = id_min; optionid <= id_max; optionid++)
					if(!isnull(href_list["o[optionid]"]))	//Test if this optionid was replied to
						var/rating
						if(href_list["o[optionid]"] == "abstain")
							rating = null
						else
							rating = text2num(href_list["o[optionid]"])
							if(!isnum(rating))
								return

						vote_on_numval_poll(pollid, optionid, rating)
			if("MULTICHOICE")
				var/id_min = text2num(href_list["minoptionid"])
				var/id_max = text2num(href_list["maxoptionid"])

				if( (id_max - id_min) > 100 )	//Basic exploit prevention
					to_chat(usr, "The option ID difference is too big. Please contact administration or the database admin.")
					return

				for(var/optionid = id_min; optionid <= id_max; optionid++)
					if(!isnull(href_list["option_[optionid]"]))	//Test if this optionid was selected
						vote_on_poll(pollid, optionid, 1)

/mob/new_player/proc/IsJobAvailable(var/datum/job/job)
	if(!job)	return 0
	if(!job.is_position_available()) return 0
	if(jobban_isbanned(src, job.title))	return 0
	if(!job.player_old_enough(src.client))	return 0

	return 1

/mob/new_player/proc/IsJobRestricted(var/datum/job/job, var/branch_pref, var/rank_pref)
	if(!job.is_branch_allowed(branch_pref))
		return 1
	if(!job.is_rank_allowed(branch_pref, rank_pref))
		return 1
	return 0

/mob/new_player/proc/get_branch_pref()
	if(client)
		return client.prefs.char_branch

/mob/new_player/proc/get_rank_pref()
	if(client)
		return client.prefs.char_rank

/mob/new_player/proc/AttemptLateSpawn(rank,var/spawning_at)
	if(src != usr)
		return 0
	if(!ticker || ticker.current_state != GAME_STATE_PLAYING)
		to_chat(usr, "<span class='warning'>The round is either not ready, or has already finished...</span>")
		return 0
	if(!config.enter_allowed)
		to_chat(usr, "<span class='notice'>There is an administrative lock on entering the game!</span>")
		return 0
	var/datum/job/job = job_master.GetJob(rank)
	if(!IsJobAvailable(job))
		alert("[rank] is not available. Please try another.")
		return 0
	if(!job.is_branch_allowed(client.prefs.char_branch))
		alert("Wrong branch of service for [rank]. Valid branches are: [job.get_branches()].")
		return 0
	if(!job.is_rank_allowed(client.prefs.char_branch, client.prefs.char_rank))
		alert("Wrong rank for [rank]. Valid ranks in [client.prefs.char_branch] are: [job.get_ranks(client.prefs.char_branch)].")
		return 0


	var/datum/spawnpoint/spawnpoint = job_master.get_spawnpoint_for(client, rank)
	var/turf/spawn_turf = pick(spawnpoint.turfs)
	var/airstatus = IsTurfAtmosUnsafe(spawn_turf)
	if(airstatus)
		var/reply = alert(usr, "Warning. Your selected spawn location seems to have unfavorable atmospheric conditions. \
		You may die shortly after spawning. It is possible to select different spawn point via character preferences. \
		Spawn anyway? More information: [airstatus]", "Atmosphere warning", "Abort", "Spawn anyway")
		if(reply == "Abort")
			return 0
		else
			// Let the staff know, in case the person complains about dying due to this later. They've been warned.
			log_and_message_admins("User [src] spawned at spawn point with dangerous atmosphere.")

		// Just in case someone stole our position while we were waiting for input from alert() proc
		if(!IsJobAvailable(job))
			to_chat(src, alert("[rank] is not available. Please try another."))
			return 0

	job_master.AssignRole(src, rank, 1)

	var/mob/living/character = create_character(spawn_turf)	//creates the human and transfers vars and mind
	if(!character)
		return 0

	character = job_master.EquipRank(character, rank, 1)					//equips the human
	UpdateFactionList(character)
	equip_custom_items(character)

	// AIs don't need a spawnpoint, they must spawn at an empty core
	if(character.mind.assigned_role == "AI")

		character = character.AIize(move=0) // AIize the character, but don't move them yet

			// IsJobAvailable for AI checks that there is an empty core available in this list
		var/obj/structure/AIcore/deactivated/C = empty_playable_ai_cores[1]
		empty_playable_ai_cores -= C

		character.forceMove(C.loc)
		var/mob/living/silicon/ai/A = character
		A.on_mob_init()

		AnnounceCyborg(character, rank, "has been downloaded to the empty core in \the [character.loc.loc]")
		ticker.mode.handle_latejoin(character)

		qdel(C)
		qdel(src)
		return

	ticker.mode.handle_latejoin(character)
	universe.OnPlayerLatejoin(character)
	if(job_master.ShouldCreateRecords(rank))
		if(character.mind.assigned_role != "Cyborg")
			data_core.manifest_inject(character)
			ticker.minds += character.mind//Cyborgs and AIs handle this in the transform proc.	//TODO!!!!! ~Carn

			if(job.announced)
				AnnounceArrival(character, rank, spawnpoint.msg)
		matchmaker.do_matchmaking()
	log_and_message_admins("has joined the round as [character.mind.assigned_role].", character)
	qdel(src)


/mob/new_player/proc/AnnounceCyborg(var/mob/living/character, var/rank, var/join_message)
	if (ticker.current_state == GAME_STATE_PLAYING)
		if(character.mind.role_alt_title)
			rank = character.mind.role_alt_title
		// can't use their name here, since cyborg namepicking is done post-spawn, so we'll just say "A new Cyborg has arrived"/"A new Android has arrived"/etc.
		global_announcer.autosay("A new[rank ? " [rank]" : " visitor" ] [join_message ? join_message : "has arrived"].", "Arrivals Announcement Computer")
		log_and_message_admins("has joined the round as [character.mind.assigned_role].", character)

/mob/new_player/proc/LateChoices()
	var/name = client.prefs.be_random_name ? "friend" : client.prefs.real_name

	var/list/dat = list("<html><body><center>")
	dat += "<b>Welcome, [name].<br></b>"
	dat += "Round Duration: [roundduration2text()]<br>"

	if(evacuation_controller.has_evacuated())
		dat += "<font color='red'><b>The [station_name()] has been evacuated.</b></font><br>"
	else if(evacuation_controller.is_evacuating())
		if(evacuation_controller.emergency_evacuation) // Emergency shuttle is past the point of no recall
			dat += "<font color='red'>The [station_name()] is currently undergoing evacuation procedures.</font><br>"
		else                                           // Crew transfer initiated
			dat += "<font color='red'>The [station_name()] is currently undergoing crew transfer procedures.</font><br>"

	dat += "Choose from the following open/valid positions:<br>"
	for(var/datum/job/job in job_master.occupations)
		if(job && IsJobAvailable(job))
			if(job.minimum_character_age && (client.prefs.age < job.minimum_character_age))
				continue

			var/active = 0
			// Only players with the job assigned and AFK for less than 10 minutes count as active
			for(var/mob/M in player_list) if(M.mind && M.client && M.mind.assigned_role == job.title && M.client.inactivity <= 10 * 60 * 10)
				active++

			if(IsJobRestricted(job, client.prefs.char_branch, client.prefs.char_rank))
				dat += "<a style='text-decoration: line-through' href='byond://?src=\ref[src];SelectedJob=[job.title]'>[job.title] ([job.current_positions]) (Active: [active])</a><br>"
			else
				dat += "<a href='byond://?src=\ref[src];SelectedJob=[job.title]'>[job.title] ([job.current_positions]) (Active: [active])</a><br>"

	dat += "</center>"
	src << browse(jointext(dat, null), "window=latechoices;size=300x640;can_close=1")

/mob/new_player/proc/create_character(var/turf/spawn_turf)
	spawning = 1
	close_spawn_windows()

	var/mob/living/carbon/human/new_character

	var/datum/species/chosen_species
	if(client.prefs.species)
		chosen_species = all_species[client.prefs.species]

	if(!spawn_turf)
		var/datum/spawnpoint/spawnpoint = job_master.get_spawnpoint_for(client, get_rank_pref())
		spawn_turf = pick(spawnpoint.turfs)

	if(chosen_species)
		if(!check_species_allowed(chosen_species))
			spawning = 0 //abort
			return null
		new_character = new(spawn_turf, chosen_species.name)

	if(!new_character)
		new_character = new(spawn_turf)

	new_character.lastarea = get_area(spawn_turf)

	for(var/lang in client.prefs.alternate_languages)
		var/datum/language/chosen_language = all_languages[lang]
		if(chosen_language)
			var/is_species_lang = (chosen_language.name in new_character.species.secondary_langs)
			if(is_species_lang || ((!(chosen_language.flags & RESTRICTED) || has_admin_rights()) && is_alien_whitelisted(src, chosen_language)))
				new_character.add_language(lang)

	if(ticker.random_players)
		new_character.gender = pick(MALE, FEMALE)
		client.prefs.real_name = random_name(new_character.gender)
		client.prefs.randomize_appearance_and_body_for(new_character)
	else
		client.prefs.copy_to(new_character)

	sound_to(src, sound(null, repeat = 0, wait = 0, volume = 85, channel = 1))// MAD JAMS cant last forever yo

	if(mind)
		mind.active = 0					//we wish to transfer the key manually
		mind.original = new_character
		if(client.prefs.relations.len)
			for(var/T in client.prefs.relations)
				var/TT = matchmaker.relation_types[T]
				var/datum/relation/R = new TT
				R.holder = mind
				R.info = client.prefs.relations_info[T]
			mind.gen_relations_info = client.prefs.relations_info["general"]
		mind.transfer_to(new_character)					//won't transfer key since the mind is not active

	new_character.name = real_name
	new_character.dna.ready_dna(new_character)
	new_character.dna.b_type = client.prefs.b_type
	new_character.sync_organ_dna()
	if(client.prefs.disabilities)
		// Set defer to 1 if you add more crap here so it only recalculates struc_enzymes once. - N3X
		new_character.dna.SetSEState(GLASSESBLOCK,1,0)
		new_character.disabilities |= NEARSIGHTED

	// Give them their cortical stack if we're using them.
	if(config && config.use_cortical_stacks && client && client.prefs.has_cortical_stack /*&& new_character.should_have_organ(BP_BRAIN)*/)
		new_character.create_stack()

	// Do the initial caching of the player's body icons.
	new_character.force_update_limbs()
	new_character.update_eyes()
	new_character.regenerate_icons()

	new_character.key = key		//Manually transfer the key to log them in
	return new_character

/mob/new_player/proc/ViewManifest()
	var/dat = "<div align='center'>"
	dat += data_core.get_manifest(OOC = 1)
	//src << browse(dat, "window=manifest;size=370x420;can_close=1")
	var/datum/browser/popup = new(src, "Crew Manifest", "Crew Manifest", 370, 420, src)
	popup.set_content(dat)
	popup.open()

/mob/new_player/Move()
	return 0

/mob/new_player/proc/close_spawn_windows()
	src << browse(null, "window=latechoices") //closes late choices window
	panel.close()

/mob/new_player/proc/has_admin_rights()
	return check_rights(R_ADMIN, 0, src)

/mob/new_player/proc/check_species_allowed(datum/species/S, var/show_alert=1)
	if(!(S.spawn_flags & SPECIES_CAN_JOIN) && !has_admin_rights())
		if(show_alert)
			to_chat(src, alert("Your current species, [client.prefs.species], is not available for play."))
		return 0
	if(!is_alien_whitelisted(src, S))
		if(show_alert)
			to_chat(src, alert("You are currently not whitelisted to play [client.prefs.species]."))
		return 0
	return 1

/mob/new_player/get_species()
	var/datum/species/chosen_species
	if(client.prefs.species)
		chosen_species = all_species[client.prefs.species]

	if(!chosen_species || !check_species_allowed(chosen_species, 0))
		return SPECIES_HUMAN

	return chosen_species.name

/mob/new_player/get_gender()
	if(!client || !client.prefs) ..()
	return client.prefs.gender

/mob/new_player/is_ready()
	return ready && ..()

/mob/new_player/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "",var/italics = 0, var/mob/speaker = null)
	return

/mob/new_player/hear_radio(var/message, var/verb="says", var/datum/language/language=null, var/part_a, var/part_b, var/part_c, var/mob/speaker = null, var/hard_to_hear = 0)
	return

/mob/new_player/show_message(msg, type, alt, alt_type)
	return

mob/new_player/MayRespawn()
	return 1

/mob/new_player/touch_map_edge()
	return

/mob/new_player/say(var/message)
	sanitize_and_communicate(/decl/communication_channel/ooc, client, message)
*/