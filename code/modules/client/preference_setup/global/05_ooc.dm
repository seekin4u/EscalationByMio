/datum/category_item/player_setup_item/player_global/ooc
	name = "OOC"
	sort_order = 5

/datum/category_item/player_setup_item/player_global/ooc/load_preferences(var/savefile/S)
	S["ignored_players"]	>> pref.ignored_players
	S["ooc_languages"]		>> pref.ooc_languages

/datum/category_item/player_setup_item/player_global/ooc/save_preferences(var/savefile/S)
	S["ignored_players"]	<< pref.ignored_players
	S["ooc_languages"]		<< pref.ooc_languages

/datum/category_item/player_setup_item/player_global/ooc/sanitize_preferences()
	if(!islist(pref.ignored_players))
		pref.ignored_players = list()

/datum/category_item/player_setup_item/player_global/ooc/content(var/mob/user)
	. += "<b>OOC:</b><br>"
	. += "RL Spoken Languages: <br>"
	for(var/language in pref.ooc_languages)
		. += "[language] (<a href='?src=\ref[src];remove_language=[language]'> Remove)</a>)<br>"
	. += "(<a href='?src=\ref[src];add_language=1'>Add Language</a>)"

//	. += "Ignored Players<br>"
//	for(var/ignored_player in pref.ignored_players)
//		. += "[ignored_player] (<a href='?src=\ref[src];unignore_player=[ignored_player]'>Unignore</a>)<br>"
//	. += "(<a href='?src=\ref[src];ignore_player=1'>Ignore Player</a>)"

/datum/category_item/player_setup_item/player_global/ooc/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["unignore_player"])
		pref.ignored_players -= href_list["unignore_player"]
		return TOPIC_REFRESH

	if(href_list["ignore_player"])
		var/player_to_ignore = sanitize(ckey(input(user, "Who do you want to ignore?","Ignore") as null|text))
		//input() sleeps while waiting for the user to respond, so we need to check CanUseTopic() again here
		if(player_to_ignore && CanUseTopic(user))
			pref.ignored_players |= player_to_ignore
		return TOPIC_REFRESH

	if(href_list["remove_language"])
		pref.ooc_languages -= href_list["remove_language"]
		if(!pref.ooc_languages.len)
			if(user.client) user.client.chosen_languages = 0
		return TOPIC_REFRESH

	if(href_list["add_language"])
		var/list/langs = list("Eng","Rus") //Can add more later
		for(var/L in langs)
			if(L in pref.ooc_languages)
				langs -= L
		var/choice = input(user,"Add which language?") as null|anything in langs
		if(choice)
			pref.ooc_languages |= choice

		if(pref.ooc_languages.len) //Set their language var
			if(user.client) user.client.chosen_languages = 1


		return TOPIC_REFRESH

	return ..()
