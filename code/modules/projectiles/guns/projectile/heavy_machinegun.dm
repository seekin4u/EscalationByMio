/////////////////////////////
////Stationary Machinegun////
/////////////////////////////
/obj/item/weapon/gun/projectile/minigun
	name = "minigun"
	desc = "6-barreled highspeed machinegun."
	icon_state = "minigun"
	item_state = ""
	layer = FLY_LAYER
	anchored = 1
	density = 1
	w_class = 6
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	max_shells = 6000
	caliber = "4mm"
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/a4mm

	firemodes = list(
		list(name="3000 rpm", burst=10, burst_delay=0.1, fire_delay=1, dispersion=list(1.0), accuracy=list(0)),
		list(name="6000 rpm", burst=20, burst_delay=0.05, fire_delay=1, dispersion=list(1.5), accuracy=list(0))
		)

	var/user_old_x = 0
	var/user_old_y = 0

/obj/item/weapon/gun/projectile/minigun/attack_hand(mob/user)
	if(user.using_object == src)
		if(firemodes.len > 1)
			switch_firemodes(user)
	else
		var/grip_dir = reverse_direction(dir)
		var/turf/T = get_step(src.loc, grip_dir)
		if(user.loc == T)
			if(user.get_active_hand() == null && user.get_inactive_hand() == null)
				user.use_object(src)
			else
				user << "\red Your hands are busy by holding things."
		else
			user << "\red You're too far from the handles."

/obj/item/weapon/gun/projectile/minigun/usedby(mob/user, atom/A, params)
	if(A == src)
		switch_firemodes(user)

	if(check_direction(user, A))
		afterattack(A, user, 0, params)
	else
		rotate_to(user, A)
		update_layer()

/obj/item/weapon/gun/projectile/minigun/proc/check_direction(mob/user, atom/A)
	if(get_turf(A) == src.loc)
		return 0

	var/shot_dir = get_carginal_dir(src, A)
	if(shot_dir != dir)
		return 0

	return 1

/obj/item/weapon/gun/projectile/minigun/proc/rotate_to(mob/user, atom/A)
	user << "<span class='warning'>You can't turn the [name] there.</span>"
	return 0

/obj/item/weapon/gun/projectile/minigun/proc/update_layer()
	if(dir == NORTH)
		layer = OBJ_LAYER
	else
		layer = FLY_LAYER

/obj/item/weapon/gun/projectile/minigun/started_using(mob/user as mob)
	..()
	var/diff_x = 0
	var/diff_y = 0
	if(dir == EAST)
		diff_x = -16 + user.pixel_x
	if(dir == WEST)
		diff_x = 16 + user.pixel_x
	if(dir == NORTH)
		diff_y = -16 + user.pixel_y
	if(dir == SOUTH)
		diff_y = 16 + user.pixel_y

	user_old_x = user.pixel_x
	user_old_y = user.pixel_y

	user.forceMove(src.loc)
	user.dir = src.dir
	animate(user, pixel_x=diff_x, pixel_y=diff_y, 4, 1)

/obj/item/weapon/gun/projectile/minigun/stopped_using(mob/user as mob)
	..()
	var/grip_dir = reverse_direction(dir)
	step(user, grip_dir)
	animate(user, pixel_x=user_old_x, pixel_y=user_old_y, 4, 1)

/obj/item/weapon/gun/projectile/minigun/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0)) return 1
	if(istype(mover, /obj/item/projectile))
		return 1
	return 0

///////////////////////
////Stationary KORD////
///////////////////////
/obj/item/weapon/gun/projectile/minigun/kord
	name = "KORD"
	desc = "Heavy machinegun"
	icon_state = "pkms"
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	caliber = "a127x108"
	magazine_type = /obj/item/ammo_casing/a127x99mm
	max_shells = 0

	//fire_sound = 'sound/weapons/kord1.ogg'

	firemodes = list(
		list(name="default", burst=3, burst_delay=0.5, fire_delay=1.5, dispersion=list(0), accuracy=list(2))
		)

/obj/item/weapon/gun/projectile/minigun/kord/rotate_to(mob/user, atom/A)
	var/shot_dir = get_carginal_dir(src, A)
	dir = shot_dir

	var/diff_x = 0
	var/diff_y = 0
	if(dir == EAST)
		diff_x = -16 + user_old_x
	if(dir == WEST)
		diff_x = 16 + user_old_x
	if(dir == NORTH)
		diff_y = -16 + user_old_y
	if(dir == SOUTH)
		diff_y = 16 + user_old_y

	user.forceMove(src.loc)
	user.dir = src.dir
	animate(user, pixel_x=diff_x, pixel_y=diff_y, 4, 1)