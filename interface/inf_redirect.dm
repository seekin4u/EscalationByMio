/*
This is created so we can call procs via command, which is very necessary for calling a proc inside of a button/interface
I made it this way intentionally to prevent the ability to call any proc, which could be chaotic
*/

/client/verb/panel(flag as text)
	set hidden = 1
	if(!holder|!flag) return //if the user isnt an admin or doesn't have a flag for the command, u lil shit

	switch(flag)
		if("newplayerpanel")
			src.player_panel_new()
		if("playerpanel")
			src.player_panel()
		if("gamepanel")
			src.game_panel()
		if("buildmode")
			src.togglebuildmodeself()
		if("adminlog")
			winshow(src, "adminlog", 1)
		if("extras")
			winshow(src,"adminverbs", 1)
		if("aghost")
			src.admin_ghost()
		if("bans")
			src.unban_panel()
		if("jobbans")
			src.jobbans()