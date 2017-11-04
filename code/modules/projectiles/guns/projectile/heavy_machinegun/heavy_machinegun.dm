/////////////////////////////
////Basic heavy MG///////////
/////////////////////////////
//this thing is portable object which will fire.

//НЕ забываем давать обьекту в свойствах значения для первого фаермода, инач еон берет значения
//простого weapon/gun и начинает палить как попало
//так что или инициализируем нужными значениями
//или при спавне пушек делаем switch_firemodes (так как времени не очень много для тестов - пока что делаем первое)

/obj/item/weapon/gun/projectile/heavy_mg
	name = "staionary machinegun"
	desc = "basic heavy machinegun."
	icon = 'icons/escalation/obj/stationary_guns.dmi'
	icon_state = "basic-mg"
	item_state = ""
	plane = ABOVE_OBJ_PLANE
	layer = ABOVE_OBJ_LAYER + 0.11
	anchored = 1
	density = 1
	w_class = ITEM_SIZE_GARGANTUAN
	load_method = SINGLE_CASING
	handle_casings = REMOVE_CASINGS//delete it's casings after fire.
	max_shells = 6000
	caliber = "9mm"
	slot_flags = 0//no flags for BIG GUNS
	ammo_type = /obj/item/ammo_casing/c9mm//9mm shots hell NO, but for tests it's OK

	burst=1
	burst_delay=0.1
	fire_delay=0.1

	fire_sound = 'sound/weapons/gunshot/heavy_mg/basic-mg.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, burst_delay=0.1, fire_delay=0.1, burst_accuracy=list(0,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="3-round bursts", burst=3, burst_delay=0.1, fire_delay=0.2, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0))
		)

	var/user_old_x = 0
	var/user_old_y = 0
	var/mob/used_by_mob = null
	var/obj/item/weapon/mg_disassembled/disassembled = null
	var/obj/item/weapon/mg_tripod/tripod = null

/obj/item/weapon/gun/projectile/heavy_mg/New(loc, var/direction)
	..()
	if(direction)
		set_dir(direction)
	if(!tripod)
		tripod = new/obj/item/weapon/mg_tripod
	if(!disassembled)
		disassembled = new/obj/item/weapon/mg_disassembled

	update_layer()

/obj/item/weapon/gun/projectile/heavy_mg/Destroy()
	if(used_by_mob)
		stopped_using(used_by_mob, 0)

	var/turf/T = get_turf(src)

	if(isturf(T))
		if(disassembled)
			disassembled.forceMove(T)
			disassembled = null

		if(tripod)
			tripod.forceMove(T)
			tripod = null
	..()


/obj/item/weapon/gun/projectile/heavy_mg/Fire(atom/A ,mob/user)
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

/obj/item/weapon/gun/projectile/heavy_mg/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		return 1
	return 0

/obj/item/weapon/gun/projectile/heavy_mg/AltClick(mob/user)
	..()
	if(used_by_mob == user)
		safety = !safety
		playsound(user, 'sound/weapons/selector.ogg', 50, 1)
		to_chat(user, "<span class='notice'>You toggle the safety [safety ? "on":"off"].</span>")

/obj/item/weapon/gun/projectile/heavy_mg/MouseDrop(over_object, src_location, over_location)
	..()
	if((over_object == usr && in_range(src, usr)) && !used_by_mob)
		unload_ammo(usr, 0)
		return

/obj/item/weapon/gun/projectile/heavy_mg/attack_hand(mob/user)
	var/grip_dir = reverse_direction(dir)
	var/turf/T = get_step(src.loc, grip_dir)
	if(user.loc == T)
		if(user.get_active_hand() == null && user.get_inactive_hand() == null)
			started_using(user)

		else
			to_chat(user, "\red Your hands are busy by holding things.")

	else
		to_chat(user, "\red You're too far from the handles.")

/obj/item/weapon/gun/projectile/heavy_mg/proc/update_layer()
	if(dir == NORTH)
		layer = initial(layer) + 0.1
		plane = initial(plane)
	else if(dir == SOUTH)
		layer = initial(layer) + 0.1
		plane = initial(plane)
	else
		layer = ABOVE_OBJ_LAYER + 0.2 //above sandbags
		plane = ABOVE_HUMAN_PLANE

/*
	if(dir != SOUTH)
		layer = initial(layer) + 0.1
		plane = initial(plane)
	else
		layer = ABOVE_OBJ_LAYER + 0.1
		plane = ABOVE_HUMAN_PLANE
		*/

/obj/item/weapon/gun/projectile/heavy_mg/proc/check_direction(mob/user, atom/A)
	if(get_turf(A) == src.loc)
		return 0

	var/shot_dir = get_carginal_dir(src, A)
	if(shot_dir != dir)
		return 0

	return 1

/obj/item/weapon/gun/projectile/heavy_mg/proc/rotate_to(mob/user, atom/A)
	if(!A || !user.x || !user.y || !A.x || !A.y)
		return // code/_onclick/click.dm 312 ln
	var/dx = A.x - user.x
	var/dy = A.y - user.y
	if(!dx && !dy)
		return

	var/direction
	if(abs(dx) < abs(dy))
		if(dy > 0)
			direction = NORTH
		else
			direction = SOUTH
	else
		if(dx > 0)
			direction = EAST
		else
			direction = WEST

	if(/obj/structure/sandbag in src.loc.contents)
		var/obj/structure/sandbag/S = locate(src.loc.contents)
		if(direction == reverse_direction(S.dir))
			to_chat(user, "<span class='notice'>You can't rotate it in that way!</span>")
			return 0

	src.set_dir(direction)
	user.set_dir(direction)
	update_pixels(user)
	to_chat(user, "You rotate the [name]")

	return 0

/obj/item/weapon/gun/projectile/heavy_mg/proc/update_pixels(mob/user as mob)
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

/obj/item/weapon/gun/projectile/heavy_mg/proc/started_using(mob/user as mob, var/need_message = 1)
	if(need_message)
		user.visible_message("<span class='notice'>[user.name] handeled \the [src].</span>", \
							 "<span class='notice'>You handeled \the [src].</span>")
	used_by_mob = user
	user.using_object = src
	user.update_canmove()
	user.forceMove(src.loc)
	user.set_dir(src.dir)
	user_old_x = user.pixel_x
	user_old_y = user.pixel_y
	update_pixels(user)

/obj/item/weapon/gun/projectile/heavy_mg/proc/stopped_using(mob/user as mob, var/need_message = 1)
	if(need_message)
		user.visible_message("<span class='notice'>[user.name] released \the [src].</span>", \
							 "<span class='notice'>You released \the [src].</span>")
	used_by_mob = null
	user.using_object = null
	user.anchored = 0
	user.update_canmove()
	var/grip_dir = reverse_direction(dir)
	var/old_dir = dir
	step(user, grip_dir)
	animate(user, pixel_x=user_old_x, pixel_y=user_old_y, 4, 1)
	user_old_x = 0
	user_old_y = 0
	user.dir = old_dir // visual better

/obj/item/weapon/gun/projectile/heavy_mg/proc/detach_tripod(var/mob/user)
	if(!disassembled || !tripod || !ismob(user))
		return

	var/turf/T = get_turf(src.loc)
	tripod.forceMove(T)
	tripod.attach_to_turf(T, user, 0)
	disassembled.forceMove(T)
	user.put_in_hands(disassembled)
	tripod = null
	disassembled = null
	qdel(src)

/obj/item/weapon/gun/projectile/heavy_mg/verb/detach_from_tripod()
	set name = "Detach from tripod"
	set category = "Object"
	set src in view(1)

	if(ammo_magazine)
		to_chat(usr, "You need to unload [name] first!")
		return

	detach_tripod(usr)

/////////////////////////////
////Minigun//////////////////
/////////////////////////////
/obj/item/weapon/gun/projectile/heavy_mg/minigun
	name = "staionary machinegun"
	desc = "6-barreled highspeed machinegun."
	icon_state = "minigun"
	load_method = MAGAZINE
	handle_casings = REMOVE_CASINGS//replace in EJECT later after tests and balancing
	caliber = "4mm"
	ammo_type = /obj/item/ammo_casing/a4mm

	burst=10
	burst_delay=0.1
	fire_delay=1
	dispersion=list(1.0)

	fire_sound = 'sound/weapons/minigun_1sec.ogg'

	firemodes = list(
		list(mode_name="3000 rpm", burst=10, burst_delay=0.1, fire_delay=1, dispersion=list(1.0), burst_accuracy=list(0,-1)),
		list(mode_name="6000 rpm", burst=20, burst_delay=0.05, fire_delay=1.5, dispersion=list(1.5), burst_accuracy=list(0,-1,-1))
		)

//////////////////////
///UTES///////////////
//////////////////////
/obj/item/weapon/gun/projectile/heavy_mg/utes
	name = "NSV Utes"
	desc = "Heavy machinegun"
	icon_state = "utes"
	load_method = MAGAZINE//we do not have ammo box for it
	handle_casings = REMOVE_CASINGS//replace in EJECT later after tests and balancing
	caliber = "127x99mm"//fix caliber to
	ammo_type = /obj/item/ammo_casing/a127x99mm
//	magazine_type = /obj/item/ammo_magazine/c127x99b
	max_shells = 0

	burst = 1
	burst_delay = 0.1
	fire_delay = 0.1

	fire_sound = 'sound/weapons/gunshot/heavy_mg/kord1.ogg'
	//i know it's kords sounds, but it is to booring to find and copy-paste URTES' sounds

	firemodes = list(
		list(mode_name = "semiauto", 		burst = 1,  burst_delay = 0.1, fire_delay = 0.1, burst_accuracy=list(0,-1),       dispersion=list(0.0, 0.3, 1.0)),
		list(mode_name = "2-round bursts",  burst = 2,  burst_delay = 0.1, fire_delay = 0.3, burst_accuracy=list(0,-1),       dispersion=list(0.1, 0.3, 0.6)),
		list(mode_name = "3-round bursts",  burst = 3,  burst_delay = 0.1, fire_delay = 0.5, burst_accuracy=list(0,-1),       dispersion=list(0.1, 0.4, 0.8)),
		list(mode_name = "5-round bursts",  burst = 5,  burst_delay = 0.2, fire_delay = 0.7, burst_accuracy=list(0,-1, -1),   dispersion=list(0.2, 0.5, 1.0)),
		list(mode_name = "10-round bursts", burst = 10, burst_delay = 0.3, fire_delay = 1.2, burst_accuracy=list(0,-1, -1.5), dispersion=list(0.2, 0.5, 1.1))
		)

/obj/item/weapon/gun/projectile/heavy_mg/utes/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "utes"
	else
		icon_state = "utes-empty"

///////////////////////
////Stationary KORD////
///////////////////////
//98 year. NOT FOR US! ONLY TEST PURPOSES
/obj/item/weapon/gun/projectile/heavy_mg/kord
	name = "KORD"
	desc = "Heavy machinegun"
	icon_state = "pkms"
	load_method = MAGAZINE//we do not have ammo box for it yet, so we use UTES' box
	handle_casings = REMOVE_CASINGS//replace in EJECT later after tests and balancing
	caliber = "127x99mm"//cal of ammo box
	ammo_type = /obj/item/ammo_casing/a127x99mm
//	magazine_type = /obj/item/ammo_magazine/c127x99b//if we want mg be pre-loaded with this ammo box
	max_shells = 0

	burst = 3
	burst_delay = 0.5
	fire_delay = 1.5
	dispersion = list(0)
	accuracy = list(2)

	fire_sound = 'sound/weapons/gunshot/heavy_mg/kord1.ogg'

	firemodes = list(
		list(name="3-round bursts", burst=3, burst_delay=0.5, fire_delay=1.5, dispersion=list(0), accuracy=list(2))
		)


//////////////////////
///AGS-17/////////////
//////////////////////
/obj/item/weapon/gun/projectile/heavy_mg/ags_17
	name = "AGS-17 Plamya"
	desc = "Automatic grenade launcher."
	icon_state = "ags17"
	load_method = MAGAZINE
	handle_casings = REMOVE_CASINGS//replace in EJECT later after tests and balancing
	caliber = "30x29mm"//cal of ammo box
	ammo_type = /obj/item/ammo_casing/ags30x29mm

	burst = 1
	burst_delay = 1.5
	fire_delay = 0.4

	fire_sound = 'sound/weapons/gunshot/ags_17_1_shot_real.ogg'
	//i know it's kords sounds, but it is to booring to find and copy-paste URTES' sounds

	firemodes = list(
		list(mode_name = "semiauto", burst = 1, burst_delay = 1.5, fire_delay = 0.4),
		list(mode_name = "2-round bursts", burst = 2, burst_delay = 1.5, fire_delay = 0.7),
		list(mode_name = "3-round bursts", burst = 3, burst_delay = 1.5, fire_delay = 1.0),
		list(mode_name = "5-round bursts", burst = 5, burst_delay = 1.5, fire_delay = 1.6),
		)

/obj/item/weapon/gun/projectile/heavy_mg/ags_17/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ags17"
	else
		icon_state = "ags17-empty"

//////////////////////////////
////////////M2BROWNING/////////
//////////////////////////////

/obj/item/weapon/gun/projectile/heavy_mg/m2
	name = "M2 Browning"
	desc = "Heavy machinegun, standard-issued by USMC"
	icon_state = "m2"
	load_method = MAGAZINE//we do not have ammo box for it
	handle_casings = REMOVE_CASINGS//replace in EJECT later after tests and balancing
	caliber = "127x99mm"//fix caliber
	ammo_type = /obj/item/ammo_casing/a127x99mm //fix
	max_shells = 0

	burst = 1
	burst_delay = 0.1
	fire_delay = 0.1

	fire_sound = 'sound/weapons/gunshot/heavy_mg/kord1.ogg'
	//fixfixfix
	//////basically that's Utes for now. Must be fixed
	firemodes = list(
		list(mode_name = "semiauto", burst = 1, burst_delay = 0.1, fire_delay = 0.1),
		list(mode_name = "2-round bursts", burst = 2, burst_delay = 0.1, fire_delay = 0.3),
		list(mode_name = "3-round bursts", burst = 3, burst_delay = 0.1, fire_delay = 0.5),
		list(mode_name = "5-round bursts", burst = 5, burst_delay = 0.2, fire_delay = 0.7),
		list(mode_name = "10-round bursts", burst = 10, burst_delay = 0.3, fire_delay = 1.2)
		)

/obj/item/weapon/gun/projectile/heavy_mg/m2/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m2"
	else
		icon_state = "m2-empty"

///////////////////////////////////////
////////////MK19//////////////////////
///////////////////////////////////////

/obj/item/weapon/gun/projectile/heavy_mg/mk19
	name = "MK 19"
	desc = "Automatic grenade launcher, standard-issued by USMC."
	icon_state = "mk19"
	load_method = MAGAZINE
	handle_casings = REMOVE_CASINGS//replace in EJECT later after tests and balancing
	caliber = "40x53mm"
	ammo_type = /obj/item/ammo_casing/mk19_40x53mm

	burst = 1
	burst_delay = 1.5
	fire_delay = 0.6

	fire_sound = 'sound/weapons/gunshot/ags_17_1_shot_real.ogg'
	//fixfixfix

	firemodes = list(
		list(mode_name = "semiauto", burst = 1, burst_delay = 1.5, fire_delay = 0.6),
		list(mode_name = "2-round bursts", burst = 2, burst_delay = 1.5, fire_delay = 0.9),
		list(mode_name = "3-round bursts", burst = 3, burst_delay = 1.5, fire_delay = 1.2),
		list(mode_name = "5-round bursts", burst = 5, burst_delay = 1.5, fire_delay = 2.0),
		)


/obj/item/weapon/gun/projectile/heavy_mg/mk19/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "mk19"
	else
		icon_state = "mk19-empty"