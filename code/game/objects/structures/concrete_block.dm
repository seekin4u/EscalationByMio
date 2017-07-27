/obj/structure/concrete_block
	name = "concrete block"
	desc = "Stronk concrete structure to cover your ass!"
	//icon = 'icons/obj/structures.dmi'
	icon_state = "concrete_block"
	density = 1
	throwpass = 1//we can throw granades despite it's density
	layer = ABOVE_HUMAN_LAYER
	plane = ABOVE_HUMAN_PLANE
	anchored = 1
	flags = OBJ_CLIMBABLE
	var/basic_chance = 40

/obj/structure/concrete_block/New()
	..()
	flags |= ON_BORDER
	set_dir(dir) // think we will add this things on map ONLY with mapping

/obj/structure/concrete_block/Destroy()
	//chance = null
	..()

/obj/structure/concrete_block/set_dir(direction)
	dir = direction
	if(dir == WEST | EAST)
		layer = ABOVE_HUMAN_LAYER + 0.2
		plane = ABOVE_HUMAN_PLANE
	if(dir == SOUTH)
		layer = ABOVE_HUMAN_LAYER + 0.4
		plane = ABOVE_HUMAN_PLANE

/obj/structure/concrete_block/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		var/obj/item/projectile/proj = mover

		if(proj.firer && Adjacent(proj.firer))
			return 1

		return check_cover(mover, target)

	if(get_dir(get_turf(src), target) == dir)//turned in front of block
		return 0
	else
		return 1

/obj/structure/concrete_block/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSTABLE))
		return 1
	if (get_dir(loc, target) == dir)
		return !density
	else
		return 1
	return 1

//checks if projectile 'P' from turf 'from' can hit whatever is behind the table. Returns 1 if it can, 0 if bullet stops.
/obj/structure/concrete_block/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover = get_turf(src)
	var/chance = basic_chance

	if(!cover)
		return 1

	//also i can't see if this thing works =|
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
		to_chat(world, "You fire in front of cpncrete block:[chance]")
		chance += 10

	if(prob(chance))
		for(var/mob/living/carbon/human/H in view(8, src))
			to_chat(H, "<span class='warning'>[P] hits \the [src]!</span>")
		return 0

	return 1

/obj/structure/concrete_block/MouseDrop_T(obj/O as obj, mob/user as mob)
	..()
	if ((!( istype(O, /obj/item/weapon) ) || user.get_active_hand() != O))
		return
	if(isrobot(user))
		return
	//user.drop_item()
	if (O.loc != user.loc)
		//add do_after or smth etc
		to_chat(user, "you start climbing onto [O]...")
		step(O, get_dir(O, src))
	return

/obj/structure/concrete_block/ex_act(severity)
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
//maybe do craft from something