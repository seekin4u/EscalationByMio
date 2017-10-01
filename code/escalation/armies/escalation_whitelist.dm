/proc/init_whitelist()
	var/list/whitelist_file = file2list("config/whitelist_escalation.txt")
	var/check_roles = 0
	var/checked_key = null
	var/list/local_wl = list()
	for(var/lines in whitelist_file)
		if(findtext(lines, "}") && check_roles)
			check_roles = 0

		if(!check_roles && checked_key)
			whitelisted_escalation[checked_key] = local_wl.Copy()
			local_wl.Cut()
			checked_key = null
			continue

		if(!length(lines))
			continue

		if(copytext(lines,1,2) == "#")
			continue

		if(findtext(lines, "= {"))
			checked_key = ckey(replace_characters(lines, list("= {" = "", " " = "")))
			check_roles = 1
			continue

		if(check_roles && checked_key)
			local_wl.Add(lines)
			continue

/proc/add_player_to_escalation_whitelist(var/need_key, var/need_rank)
	var/list/whitelist_file = file2list("config/whitelist_escalation.txt")

	var/l = 0
	var/find_key = 0
	var/find_role = 0
	var/change_file = 0
	for(var/lines in whitelist_file)
		l++

		if(!length(lines))
			continue

		if(copytext(lines,1,2) == "#")
			continue

		if(findtext(lines, need_key))
			find_key = 1
			continue

		if(findtext(lines, need_rank) && find_key)
			find_role = 1
			break

		if(findtext(lines, "}") && (find_key && !find_role))
			whitelist_file.Insert(l, need_rank)
			change_file = 1
			break

	if(find_key && find_role)
		return 1

	if(!find_key)
		var/new_line = "\n[need_key] = {\n[need_rank]\n}"
		text2file(new_line, "config/whitelist_escalation.txt")
		return 1

	if(change_file)
		var/new_line = list2text(whitelist_file, "\n")
		var/F = file("config/whitelist_escalation.txt")
		fdel(F)
		text2file(new_line, "config/whitelist_escalation.txt")
		return 1

/proc/check_player_in_whitelist(var/key, var/rank)
	var/ckey = ckey(key)
	if(!ckey)
		return 0

	return 1// ~OFF FOR TESTS

	var/list/aviable_roles = whitelisted_escalation[ckey]
	if(!length(aviable_roles))
		return 0
	if("::ALL::" in aviable_roles)
		return 1

	if(rank in aviable_roles)
		return 1