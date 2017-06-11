/obj/structure/sandbag
	name = "sandbag"
	//icon = 'icons/obj/structures.dmi'
	icon_state = "sandbag"
	layer = OBJ_LAYER
	plane = OBJ_PLANE
	anchored = 1
	layer = 2.8

/obj/structure/sandbag/New()
	flags |= ON_BORDER
	set_dir(dir)
	..()

/obj/structure/sandbag/set_dir(direction)
	dir = direction
	if(dir == NORTH)
		layer = ABOVE_HUMAN_LAYER
		plane = ABOVE_HUMAN_PLANE

/obj/structure/sandbag/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		return check_cover(mover, target)//catches bullets

	if(get_dir(get_turf(mover), target) == dir)
		return 0

	return 1

/obj/structure/sandbag/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover = get_turf(src)
	if(!cover)
		return 1
	if (get_dist(P.starting, loc) <= 1) //Tables won't help you if people are THIS close
		return 1
	if (get_turf(P.original) == cover)
		var/chance = 20
		if (ismob(P.original))
			var/mob/M = P.original
			if (M.lying)
				chance += 40//Lying down lets you catch less bullets
		if(get_dir(loc, from) == dir) //
			chance += 30
		else
			return 1//But only from one side
		if(prob(chance))
			for(var/mob/living/carbon/human/H in view(8, src))
				to_chat(H, "<span class='warning'>[P] hits \the [src]!</span>")
			return 0
	return 1

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
	for(var/obj/structure/sandbag/baggy in src.loc)
		if(baggy.dir == user.dir)
			to_chat(user, "\red There is no more space.")
			return

	var/obj/structure/sandbag/bag = new(user.loc)
	bag.set_dir(user.dir)
	user.drop_item()
	qdel(src)

/obj/item/weapon/sandbag/attackby(obj/O as obj, mob/user as mob)
	if(istype(O, /obj/item/weapon/ore/glass)) //fill sandbags with not melted sand. Replace obj to smth else.
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