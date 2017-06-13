/obj/structure/sandbag
	name = "sandbag"
	//icon = 'icons/obj/structures.dmi'
	icon_state = "sandbag"
	density = 1
	throwpass = 1//we can throw granades despite it's density
	layer = OBJ_LAYER
	plane = OBJ_PLANE
	anchored = 1
	layer = 2.8
	flags = OBJ_CLIMBABLE
	var/chance = 30

/obj/structure/sandbag/New()
	flags |= ON_BORDER
	set_dir(dir)
	..()

/obj/structure/window/Destroy()
	//chance = null
	..()

/obj/structure/sandbag/set_dir(direction)
	dir = direction
	if(dir != NORTH)
		layer = ABOVE_HUMAN_LAYER
		plane = ABOVE_HUMAN_PLANE

/obj/structure/sandbag/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		var/obj/item/projectile/proj = mover

		if(proj.firer && Adjacent(proj.firer))
			return 1

		return check_cover(mover, target)

	if(get_dir(get_turf(src), target) == dir)//turned in front of sandbag
		return 0
	else
		return 1

/obj/structure/sandbag/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSTABLE))
		return 1
	if (get_dir(loc, target) == dir)
		return !density
	else
		return 1
	return 1

//checks if projectile 'P' from turf 'from' can hit whatever is behind the table. Returns 1 if it can, 0 if bullet stops.
/obj/structure/sandbag/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover = get_turf(src)

	if(!cover)
		return 1

	if (get_dist(P.starting, loc) <= 1)//allows to fire from 1 tile away of sandbag
		to_chat(world, "You are more than one tile from sandbag. Returns 1")
		return 1

	var/mob/living/carbon/human/M = locate(/mob/living/carbon/human, src.loc)
	if(M)
		chance += 30
		to_chat(world, "Mob located!:[chance]")

		if(M.lying)
			chance += 20

	if(get_dir(loc, from) == dir)
		to_chat(world, "You fire in front of sandbag:[chance]")
		chance += 10

	if(prob(chance))
		for(var/mob/living/carbon/human/H in view(8, src))
			to_chat(H, "<span class='warning'>[P] hits \the [src]!</span>")
		chance = 30
		return 0

	chance = 30
	return 1

/obj/structure/sandbag/MouseDrop_T(obj/O as obj, mob/user as mob)
	..()
	if ((!( istype(O, /obj/item/weapon) ) || user.get_active_hand() != O))
		return
	if(isrobot(user))
		return
	//user.drop_item()
	if (O.loc != src.loc)
		to_chat(user, "you start climbing onto [O]...")
		step(O, get_dir(O, src))
	return

/obj/structure/sandbag/ex_act(severity)
	switch(severity)
		if(1.0)
			new /obj/item/weapon/ore/glass(src.loc)
			new /obj/item/weapon/ore/glass(src.loc)
			new /obj/item/weapon/ore/glass(src.loc)
			qdel(src)
			return
		if(2.0)
			new /obj/item/weapon/ore/glass(src)
			new /obj/item/weapon/ore/glass(src)
			qdel(src)
			return
		else
	return

/obj/item/weapon/sandbag
	name = "sandbags"
	//icon = 'icons/obj/weapons.dmi'
	icon_state = "sandbag_empty"
	w_class = 1
	var/sand_amount = 4

/obj/item/weapon/sandbag/attack_self(mob/user as mob)
	if(sand_amount < 4)
		to_chat(user,  "\red You need more sand to make wall.")
		return
	if(!isturf(user.loc))
		to_chat(user, "\red Haha. Nice try.")
		return

	var/i = 0

	for(var/obj/structure/sandbag/baggy in user.loc.contents)
		i++
		if((baggy.dir == user.dir) || i > 4)
			to_chat(user, "\red There is no more space.")
			return

	var/obj/structure/sandbag/bag = new /obj/structure/sandbag/ (user.loc)//DO-AFTER NEEDED
	bag.set_dir(user.dir)
	user.drop_item()
	qdel(src)

/obj/item/weapon/sandbag/attackby(obj/O as obj, mob/user as mob)
	if(istype(O, /obj/item/weapon/ore/glass))
		if(sand_amount >= 4)
			to_chat(user, "\red [name] is full!")
			return
		user.drop_item()
		qdel(O)
		sand_amount++
		w_class++
		update_icon()
		to_chat(user, "You need [4 - sand_amount] more units.")

/obj/item/weapon/sandbag/update_icon()
	if(sand_amount >= 4)
		icon_state = "sandbag"
	else
		icon_state = "sandbag_empty"