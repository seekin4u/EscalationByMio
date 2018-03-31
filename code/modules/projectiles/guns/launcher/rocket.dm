/obj/item/weapon/gun/launcher/rocket
	name = "rocket launcher"
	desc = "MAGGOT."
	icon_state = "rocket"
	item_state = "rocket"
	w_class = 5
	throw_speed = 2
	throw_range = 10
	force = 5.0
	flags =  CONDUCT
	slot_flags = 0
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	fire_sound = 'sound/weapons/gunshot/rocketfire1.ogg'

	release_force = 15
	throw_distance = 30
	var/max_rockets = 1
	var/is_used = FALSE
	var/list/rockets = new/list()

/obj/item/weapon/gun/launcher/rocket/examine(mob/user)
	if(!..(user, 2))
		return
	to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")

/obj/item/weapon/gun/launcher/rocket/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rpg_missile))
		if(rockets.len < max_rockets)
			user.drop_item()
			I.loc = src
			rockets += I
			to_chat(user, "\blue You put the rocket in [src].")
			to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")
		else
			to_chat(user, "\red [src] cannot hold more rockets.")


/obj/item/weapon/gun/launcher/rocket/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rpg_missile/I = rockets[1]
		var/obj/item/projectile/bullet/rgprocket/M = new (src)
		//M.primed = TRUE
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/launcher/rocket/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired a rocket from a rocket launcher ([src.name]) at [target].")
	log_game("[key_name_admin(user)] used a rocket launcher ([src.name]) at [target].")
	..()

///////////////////////////////////////////////////////////////////////////////////
//////////////////
//////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/gun/launcher/rpg7
	name = "RPG7"
	desc = "A grenade launcher, standard-issued by soviet and czech army."
	icon_state = "rpg" ///change
	item_state = "rpg1" ///change
	w_class = 5
	throw_speed = 3
	throw_range = 40
	force = 5.0
	flags =  CONDUCT
	slot_flags = 0
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	fire_sound = 'sound/weapons/gunshot/rocketfire1.ogg'

	release_force = 40
	throw_distance = 30
	var/max_rockets = 1
	var/is_used = FALSE
	var/list/rockets = new/list(/obj/item/ammo_casing/rpg_missile)

/obj/item/weapon/gun/launcher/rpg7/New()
	..()
	update_icon()

/obj/item/weapon/gun/launcher/rpg7/update_icon()
	..()
	if(rockets.len)
		icon_state = "rpg"
		item_state = "rpg1"
	else
		icon_state = "rpg-empty"
		item_state = "rpg1-empty"
	update_held_icon()

/obj/item/weapon/gun/launcher/rpg7/examine(mob/user)
	if(!..(user, 2))
		return
	to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")

/obj/item/weapon/gun/launcher/rpg7/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rpg_missile))
		if(rockets.len < max_rockets)
			user.drop_item()
			I.loc = src
			rockets += I
			to_chat(user, "\blue You put the rocket in [src].")
			to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")
			update_icon()
		else
			to_chat(user, "\red [src] cannot hold more rockets.")
			update_icon()


/obj/item/weapon/gun/launcher/rpg7/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rpg_missile/I = rockets[1]
		var/obj/item/projectile/bullet/rgprocket/M = new (src)
		//M.primed = TRUE
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/launcher/rpg7/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired a rocket from an RPG7 ([src.name]) at [target].")
	log_game("[key_name_admin(user)] used an RPG7 ([src.name]) at [target].")
	update_icon()
	..()

///////////////////Not ours///////////////////////////////////////////////

/obj/item/weapon/gun/launcher/rpg18
	name = "RPG-18"
	desc = "Also known as 'Mukha'."
	icon_state = "rpg18"
	item_state = "smaw-wielded"
	w_class = 4
	throw_speed = 2
	throw_range = 10
	force = 5.0
	flags =  CONDUCT
	slot_flags = 0
	fire_sound = 'sound/weapons/gunshot/rocketfire1.ogg'
	slot_flags = SLOT_BACK
	release_force = 25
	throw_distance = 40
	var/max_rockets = 1
	var/is_used = FALSE
	var/list/rockets = new/list(/obj/item/ammo_casing/rpg_missile)

/obj/item/weapon/gun/launcher/rpg18/New()
	..()
	rockets += new /obj/item/ammo_casing/rpg_missile(src)

/obj/item/weapon/gun/launcher/rpg18/handle_post_fire(mob/user, atom/target)
	..()
	name += " (Used)"
	is_used = TRUE

/obj/item/weapon/gun/launcher/rpg18/examine(mob/user)
	if(!..(user, 2))
		return
	to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")

/obj/item/weapon/gun/launcher/rpg18/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rpg_missile))
		if(!is_used)
			if(rockets.len < max_rockets)
				user.drop_item()
				I.loc = src
				rockets += I
				to_chat(user, "\blue You put the rocket in [src].")
				to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")
			else
				to_chat(user, "\red [src] cannot hold more rockets.")
		else
			to_chat(user, "\red This thing is one-use! It's already fired.")

/obj/item/weapon/gun/launcher/rpg18/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rpg_missile/I = rockets[1]
		var/obj/item/projectile/bullet/rgprocket/M = new (src)
		//M.primed = TRUE
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/launcher/rpg18/attack_self(mob/user)
	return


/obj/item/weapon/gun/launcher/rpg18/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired a rocket from a rocket launcher ([src.name]) at [target].")
	log_game("[key_name_admin(user)] used a rocket launcher ([src.name]) at [target].")
	..()


/obj/item/weapon/gun/launcher/m72
	name = "M72 LAW"
	desc = "That's the one-use RPG used by US army."
	icon_state = "m72law"
	item_state = "smaw-wielded"
	w_class = 4
	throw_speed = 2
	throw_range = 10
	force = 5.0
	flags =  CONDUCT
	slot_flags = 0
	fire_sound = 'sound/weapons/gunshot/rocketfire1.ogg'
	slot_flags = SLOT_BACK
	release_force = 25
	throw_distance = 40
	var/max_rockets = 1
	var/is_used = FALSE
	var/list/rockets = new/list(/obj/item/ammo_casing/rpg_missile)

/obj/item/weapon/gun/launcher/m72/New()
	..()
	rockets += new /obj/item/ammo_casing/rpg_missile(src)

/obj/item/weapon/gun/launcher/m72/handle_post_fire(mob/user, atom/target)
	..()
	name += " (Used)"
	is_used = TRUE

/obj/item/weapon/gun/launcher/m72/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rpg_missile))
		if(!is_used)
			if(rockets.len < max_rockets)
				user.drop_item()
				I.loc = src
				rockets += I
				to_chat(user, "\blue You put the rocket in [src].")
				to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")
			else
				to_chat(user, "\red [src] cannot hold more rockets.")
		else
			to_chat(user, "This one is already used. Now it's useless if you are not lonely gay")

/obj/item/weapon/gun/launcher/m72/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rpg_missile/I = rockets[1]
		var/obj/item/projectile/bullet/rgprocket/M = new (src)
		//M.primed = TRUE
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/launcher/m72/attack_self(mob/user)
	return


/obj/item/weapon/gun/launcher/m72/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired a rocket from a rocket launcher ([src.name]) at [target].")
	log_game("[key_name_admin(user)] used an M72 ([src.name]) at [target].")
	..()
