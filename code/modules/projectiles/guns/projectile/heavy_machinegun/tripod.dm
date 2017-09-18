///////////////////////////////
////TRIPODS FOR MACHINEGUNS////
///////////////////////////////

/obj/item/weapon/mg_tripod
	name = "stationary machinegun tripod"
	icon = 'icons/escalation/obj/stationary_guns.dmi'
	icon_state = "basic-mg-tripod"
	anchored = 0
	density = 0
	var/need_type = /obj/item/weapon/gun/projectile/heavy_mg

/obj/item/weapon/mg_tripod/attackby(var/obj/item/A, var/mob/user)
	..()
	if(istype(A, need_type))
		var/obj/item/weapon/gun/projectile/heavy_mg/HM = A
		HM.attach_tripod(src)

/obj/item/weapon/mg_tripod/afterattack(var/atom/A, var/mob/user, proximity)
	..()
	if(isturf(A) && ismob(user))
		var/turf/T = A
		var/mob/M = user
		if(do_after(user, 20, src))
			attach_to_turf(T, M, 1)

/obj/item/weapon/mg_tripod/MouseDrop(over_object, src_location, over_location)
	..()

	if(over_object == usr && in_range(src, usr))
		if(do_after(usr, 20, src))
			detach_from_turf(usr, 1)
		return

/obj/item/weapon/mg_tripod/proc/attach_to_turf(var/turf/T, var/mob/M, var/show_message = 0)
	if(!isturf(T) || !ismob(M))
		return

	var/turf/TR = T
	var/mob/MB = M
	forceMove(TR)
	set_dir(MB.dir)
	anchored = 1
	density = 1
	icon_state = "[icon_state]-turf"
	if(show_message)
		MB.visible_message("<span class='notice'>[MB.name] detached from ground \the tripod.</span>", \
						  "<span class='notice'>You detached from ground \the tripod.</span>")

/obj/item/weapon/mg_tripod/proc/detach_from_turf(var/mob/M, var/show_message = 0)
	if(!ismob(M))
		return

	var/mob/MB = M
	anchored = 0
	density = 0
	icon_state = initial(icon_state)
	if(show_message)
		MB.visible_message("<span class='notice'>[MB.name] attached to ground \the tripod.</span>", \
						  "<span class='notice'>You attached to ground \the tripod.</span>")

/obj/item/weapon/mg_tripod/minigun
	name = "stationary machinegun tripod"
	icon_state = "minigun-tripod"
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/minigun

/obj/item/weapon/mg_tripod/utes
	name = "NSV Utes tripod"
	icon_state = "utes-tripod"
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/utes

/obj/item/weapon/mg_tripod/kord
	name = "KORD tripod"
	icon_state = "pkms-tripod"
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/kord

/obj/item/weapon/mg_tripod/ags_17
	name = "AGS-17 Plamya tripod"
	icon_state = "ags17-tripod"
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/ags_17

/obj/item/weapon/mg_tripod/m2
	name = "M2 Browning tripod"
	icon_state = "utes-tripod" //  fix
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/m2

/obj/item/weapon/mg_tripod/minigun
	name = "MK 19 tripod"
	icon_state = "ags17-tripod" // fix
	need_type = /obj/item/weapon/gun/projectile/heavy_mg/mk19