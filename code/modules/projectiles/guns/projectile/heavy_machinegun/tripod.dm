///////////////////////////////
////TRIPODS FOR MACHINEGUNS////
///////////////////////////////

/obj/item/weapon/mg_tripod
	name = "stationary machinegun tripod"
	icon = 'icons/escalation/obj/stationary_guns.dmi'
	icon_state = "basic-mg-tripod"
	anchored = 0
	density = 0
	var/id_g = "bmg"
	var/need_type = /obj/item/weapon/gun/projectile/heavy_mg

/obj/item/weapon/mg_tripod/attackby(var/obj/item/A, var/mob/user)
	..()
	if(istype(A, /obj/item/weapon/mg_disassembled))
		var/obj/item/weapon/mg_disassembled/MG = A
		make_machinegun(MG, user)

/obj/item/weapon/mg_tripod/afterattack(var/atom/A, var/mob/user, proximity)
	..()
	if(isturf(A) && ismob(user))
		var/turf/T = A
		var/mob/M = user
		if(in_range(T, user) && do_after(user, 20, src))
			attach_to_turf(T, M, 1)

/obj/item/weapon/mg_tripod/MouseDrop(over_object, src_location, over_location)
	..()

	if(over_object == usr)
		if(in_range(src.loc, usr) && do_after(usr, 20, src))
			detach_from_turf(usr, 1)

		return

/obj/item/weapon/mg_tripod/attack_hand(mob/user)
	if(anchored)
		return

	return ..()

/obj/item/weapon/mg_tripod/proc/attach_to_turf(var/turf/T, var/mob/M, var/show_message = 0)
	if(!isturf(T) || !ismob(M))
		return

	M.drop_from_inventory(src)
	forceMove(T)
	set_dir(M.dir)
	anchored = 1
	density = 1
	icon_state = "[initial(icon_state)]-turf"
	if(show_message)
		M.visible_message("<span class='notice'>[M.name] attached to ground \the tripod.</span>", \
						  "<span class='notice'>You attached to ground \the tripod.</span>")


/obj/item/weapon/mg_tripod/proc/detach_from_turf(var/mob/M, var/show_message = 0)
	if(!ismob(M))
		return

	anchored = 0
	density = 0
	icon_state = initial(icon_state)
	if(show_message)
		M.visible_message("<span class='notice'>[M.name] detached from ground \the tripod.</span>", \
						  "<span class='notice'>You detached from ground \the tripod.</span>")

/obj/item/weapon/mg_tripod/proc/make_machinegun(var/obj/item/weapon/mg_disassembled/MG, var/mob/user)
	if(!MG || !istype(MG) || !ismob(user))
		return

	if(src.id_g != MG.id_g)
		to_chat(user, "You can't attach [MG.name] to [src.name].")
		return

	if(!anchored)
		return

	var/obj/item/weapon/gun/projectile/heavy_mg/machinegun = new need_type(src.loc, src.dir)
	machinegun.disassembled = MG
	machinegun.tripod = src
	user.drop_from_inventory(MG)
	MG.forceMove(machinegun)
	src.forceMove(machinegun)

/obj/item/weapon/mg_tripod/minigun
	name = "stationary machinegun tripod"
	icon_state = "minigun-tripod"
	id_g = "mng"
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/minigun

/obj/item/weapon/mg_tripod/utes
	name = "NSV Utes tripod"
	icon_state = "utes-tripod"
	id_g = "uts"
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/utes

/obj/item/weapon/mg_tripod/kord
	name = "KORD tripod"
	icon_state = "pkms-tripod"
	id_g = "krd"
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/kord

/obj/item/weapon/mg_tripod/ags_17
	name = "AGS-17 Plamya tripod"
	icon_state = "ags17-tripod"
	id_g = "ags"
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/ags_17

/obj/item/weapon/mg_tripod/m2
	name = "M2 Browning tripod"
	icon_state = "nato-tripod" //  fix //FIX! ~JTB
	id_g = "mbr"
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/m2

/obj/item/weapon/mg_tripod/mk19
	name = "MK 19 tripod"
	icon_state = "nato-tripod" // fix //FIXXXXX ~~~JTB
	id_g = "m19"
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/mk19