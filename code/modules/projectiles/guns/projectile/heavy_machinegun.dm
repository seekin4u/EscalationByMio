/////////////////////////////
////Stationary Machinegun////
/////////////////////////////
/obj/item/weapon/gun/projectile/minigun
	name = "staionary machinegun"
	desc = "6-barreled highspeed machinegun."
	icon_state = "minigun"
	item_state = ""
	layer = FLY_LAYER
	anchored = 0
	density = 1
	w_class = 6
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	max_shells = 6000
	caliber = "4mm"
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/a4mm
	burst = 10
	burst_delay = 0.1
	fire_delay = 1
	dispersion = list(1.0)

	firemodes = list(
		list(mode_name="3000 rpm", burst=10, burst_delay=0.1, fire_delay=1, dispersion=list(1.0)),
		list(mode_name="6000 rpm", burst=20, burst_delay=0.05, fire_delay=1, dispersion=list(1.5))
		)

	var/user_old_x = 0
	var/user_old_y = 0
	var/mob/used_by_mob = null

/obj/item/weapon/gun/projectile/minigun/New()
	..()
	verbs -= /obj/item/weapon/gun/projectile/minigun/verb/detach_from_ground
/obj/item/weapon/gun/projectile/minigun/Destroy()
	if(used_by_mob)
		used_by_mob.using_object = null
		used_by_mob = null
	..()
/obj/item/weapon/gun/projectile/minigun/attack_hand(mob/user)
	var/grip_dir = reverse_direction(dir)
	var/turf/T = get_step(src.loc, grip_dir)
	if(user.loc == T)
		if(!anchored)
			user << "You need to attach [name] to the ground first!"
			return
		if(user.get_active_hand() == null && user.get_inactive_hand() == null)
			started_using(user)
		else
			user << "\red Your hands are busy by holding things."
	else
		user << "\red You're too far from the handles."

/obj/item/weapon/gun/projectile/minigun/Fire(atom/A ,mob/user)
	if(A == src)
		if(firemodes.len > 1)
			var/datum/firemode/new_mode = switch_firemodes(user)
			if(new_mode)
				to_chat(user, "<span class='notice'>\The [src] is now set to [new_mode.name].</span>")
				return
	if(check_direction(user, A))
		return ..()
	else
		rotate_to(user, A)
		update_layer()
		return

/obj/item/weapon/gun/projectile/minigun/proc/check_direction(mob/user, atom/A)
	if(get_turf(A) == src.loc)
		return 0

	var/shot_dir = get_carginal_dir(src, A)
	if(shot_dir != dir)
		return 0

	return 1

/obj/item/weapon/gun/projectile/minigun/proc/rotate_to(mob/user, atom/A)
	if(!A || !user.x || !user.y || !A.x || !A.y) return // code/_onclick/click.dm 312 ln
	var/dx = A.x - user.x
	var/dy = A.y - user.y
	if(!dx && !dy) return

	var/direction
	if(abs(dx) < abs(dy))
		if(dy > 0)	direction = NORTH
		else		direction = SOUTH
	else
		if(dx > 0)	direction = EAST
		else		direction = WEST
	src.set_dir(direction)
	user.set_dir(direction)
	update_pixels(user)
	user << "You rotate the [name]"
	return 0

/obj/item/weapon/gun/projectile/minigun/proc/update_layer()
	if(dir == NORTH)
		layer = OBJ_LAYER + 0.2
	else
		layer = FLY_LAYER - 0.1

/obj/item/weapon/gun/projectile/minigun/proc/update_pixels(mob/user as mob)
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
	animate(user, pixel_x=diff_x, pixel_y=diff_y, 4, 1)

/obj/item/weapon/gun/projectile/minigun/proc/started_using(mob/user as mob)
	user.visible_message("<span class='notice'>[user.name] handeled \the [src].</span>", \
						 "<span class='notice'>You handeled \the [src].</span>")
	used_by_mob = user
	user.using_object = src
	user.update_canmove()
	user.forceMove(src.loc)
	user.dir = src.dir
	user_old_x = user.pixel_x
	user_old_y = user.pixel_y
	update_pixels(user)

/obj/item/weapon/gun/projectile/minigun/proc/stopped_using(mob/user as mob)
	user.visible_message("<span class='notice'>[user.name] released \the [src].</span>", \
						 "<span class='notice'>You released \the [src].</span>")
	used_by_mob = null
	user.using_object = null
	user.update_canmove()
	user.anchored = 0
	var/grip_dir = reverse_direction(dir)
	var/old_dir = dir
	step(user, grip_dir)
	animate(user, pixel_x=user_old_x, pixel_y=user_old_y, 4, 1)
	user_old_x = 0
	user_old_y = 0
	user.dir = old_dir // visual better

/obj/item/weapon/gun/projectile/minigun/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		return 1
	return 0

/obj/item/weapon/gun/projectile/minigun/AltClick(mob/user)
	..()
	if(used_by_mob == user)
		safety = !safety
		playsound(user, 'sound/weapons/selector.ogg', 50, 1)
		to_chat(user, "<span class='notice'>You toggle the safety [safety ? "on":"off"].</span>")

/obj/item/weapon/gun/projectile/minigun/proc/toggle_anchored(mob/user as mob)

	if(user.stat || user.restrained())
		return

	if(used_by_mob && anchored)
		used_by_mob << "You can't detach the [name] while someone using it"
		return

	user << "You starting [anchored ? "detaching" : "attaching"] the [name] [anchored ? "from" : "to"] floor."
	if(do_after(user, 20, src))
		if(!anchored)
			anchored = 1
			verbs += /obj/item/weapon/gun/projectile/minigun/verb/detach_from_ground
			verbs -= /obj/item/weapon/gun/projectile/minigun/verb/attach_to_ground
			user << "You attach the [name] to ground"
		else
			anchored = 0
			verbs += /obj/item/weapon/gun/projectile/minigun/verb/attach_to_ground
			verbs -= /obj/item/weapon/gun/projectile/minigun/verb/detach_from_ground
			user << "You detach the [name] from ground"

/obj/item/weapon/gun/projectile/minigun/verb/attach_to_ground()
	set name = "Attach to ground"
	set category = "Object"
	set src in view(1)

	toggle_anchored(usr)

/obj/item/weapon/gun/projectile/minigun/verb/detach_from_ground()
	set name = "Detach from ground"
	set category = "Object"
	set src in view(1)

	toggle_anchored(usr)

/obj/item/weapon/gun/projectile/minigun/MouseDrop(over_object, src_location, over_location)
	..()
	if((over_object == usr && in_range(src, usr)) && !used_by_mob)
		unload_ammo(usr, 0)
		return
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