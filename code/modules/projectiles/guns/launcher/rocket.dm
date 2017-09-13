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
	var/list/rockets = new/list()

/obj/item/weapon/gun/launcher/rocket/examine(mob/user)
	if(!..(user, 2))
		return
	user << "\blue [rockets.len] / [max_rockets] rockets."

/obj/item/weapon/gun/launcher/rocket/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rocket))
		if(rockets.len < max_rockets)
			user.drop_item()
			I.loc = src
			rockets += I
			user << "\blue You put the rocket in [src]."
			user << "\blue [rockets.len] / [max_rockets] rockets."
		else
			usr << "\red [src] cannot hold more rockets."

/obj/item/weapon/gun/launcher/rocket/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rocket/I = rockets[1]
		var/obj/item/missile/M = new (src)
		M.primed = 1
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/launcher/rocket/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired a rocket from a rocket launcher ([src.name]) at [target].")
	log_game("[key_name_admin(user)] used a rocket launcher ([src.name]) at [target].")
	..()

/obj/item/weapon/gun/launcher/rpg7
	name = "RPG7"
	desc = "A grenade launcher, standard-issued by soviet and czech army."
	icon_state = "rocket" ///change
	item_state = "rocket" ///change
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
	var/list/rockets = new/list()

/obj/item/weapon/gun/launcher/rocket/examine(mob/user)
	if(!..(user, 2))
		return
	user << "\blue [rockets.len] / [max_rockets] rockets."

/obj/item/weapon/gun/launcher/rocket/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rocket))
		if(rockets.len < max_rockets)
			user.drop_item()
			I.loc = src
			rockets += I
			user << "\blue You put the rocket in [src]."
			user << "\blue [rockets.len] / [max_rockets] rockets."
		else
			usr << "\red [src] cannot hold more rockets."

/obj/item/weapon/gun/launcher/rocket/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rocket/I = rockets[1]
		var/obj/item/missile/M = new (src)
		M.primed = 1
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/launcher/rocket/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired a rocket from an RPG ([src.name]) at [target].")
	log_game("[key_name_admin(user)] used an RPG ([src.name]) at [target].")
	..()

///////////////////Not ours///////////////////////////////////////////////

/obj/item/weapon/gun/launcher/rpg18
	name = "RPG-18"
	desc = "Also known as 'Mukha'."
	icon_state = "rpg18"
	item_state = "rpg"
	w_class = 4
	throw_speed = 2
	throw_range = 10
	force = 5.0
	flags =  CONDUCT
	slot_flags = 0
	fire_sound = 'sound/weapons/gunshot/rocketfire1.ogg'
	slot_flags = SLOT_BACK

	New()
		..()
		rockets += new /obj/item/ammo_casing/rocket(src)

	release_force = 25
	throw_distance = 40
	var/max_rockets = 1
	var/list/rockets = new/list(/obj/item/ammo_casing/rocket)

/obj/item/weapon/gun/launcher/rpg18/handle_post_fire(mob/user, atom/target)
	..()
	name += " (Used)"

/obj/item/weapon/gun/launcher/rpg18/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rocket))
		if(rockets.len < max_rockets)
			user.drop_item()
			I.loc = src
			rockets += I
			user << "\blue You put the rocket in [src]."
			user << "\blue [rockets.len] / [max_rockets] rockets."
		else
			usr << "\red [src] cannot hold more rockets."

/obj/item/weapon/gun/launcher/rpg18/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rocket/I = rockets[1]
		var/obj/item/missile/M = new (src)
		M.primed = 1
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
	item_state = "rpg"
	w_class = 4
	throw_speed = 2
	throw_range = 10
	force = 5.0
	flags =  CONDUCT
	slot_flags = 0
	fire_sound = 'sound/weapons/gunshot/rocketfire1.ogg'
	slot_flags = SLOT_BACK

	New()
		..()
		rockets += new /obj/item/ammo_casing/rocket(src)

	release_force = 25
	throw_distance = 40
	var/max_rockets = 1
	var/list/rockets = new/list(/obj/item/ammo_casing/rocket)


/obj/item/weapon/gun/launcher/m72/handle_post_fire(mob/user, atom/target)
	..()
	name += " (Used)"

/obj/item/weapon/gun/launcher/m72/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rocket))
		if(rockets.len < max_rockets)
			user.drop_item()
			I.loc = src
			rockets += I
			user << "\blue You put the rocket in [src]."
			user << "\blue [rockets.len] / [max_rockets] rockets."
		else
			usr << "\red [src] cannot hold more rockets."

/obj/item/weapon/gun/launcher/m72/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rocket/I = rockets[1]
		var/obj/item/missile/M = new (src)
		M.primed = 1
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/launcher/m72/attack_self(mob/user)
	return


/obj/item/weapon/gun/launcher/m72/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired a rocket from a rocket launcher ([src.name]) at [target].")
	log_game("[key_name_admin(user)] used a rocket launcher ([src.name]) at [target].")
	..()
