//taken from avabuild.
//Thanks, Ava
/client/proc/removeEmptyCases()

	set category = "Debug"
	set name = "Remove empty bullet casings"
	set desc = "Removes ALL empty bullet casings from the map"

	if(!check_rights(R_DEBUG|R_ADMIN))
		return

	for(var/A in spent_casings)
		var/obj/item/ammo_casing/B = A
		if(B.BB)//BB - ammo_casing's field for show it is ~spent or not
			continue
		qdel(B)
	log_admin("[key_name(usr)] has removed all empty bullet casings.")
	message_admins("<span class='notice'>[key_name_admin(usr)] has removed all spent bullet casings.</span>", 1)

/client/proc/removeHalfEmptyCases()

	set category = "Debug"
	set name = "Remove half of empty bullet casings"
	set desc = "Removes half of the empty bullet casings from the map"

	if(!check_rights(R_DEBUG|R_ADMIN))
		return

	var/limit = spent_casings.len/2
	var/counter = 0
	for(var/A in spent_casings)
		var/obj/item/ammo_casing/B = A
		if(B.BB || counter > limit)
			continue
		counter ++
		qdel(B)
	log_admin("[key_name(usr)] has removed half of all empty bullet casings.")
	message_admins("<span class='notice'>[key_name_admin(usr)] has removed half of all spent bullet casings.</span>", 1)