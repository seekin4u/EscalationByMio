/obj/structure/chezh_hangehog
	name = "Tank trap"
	desc = "Land structure to protect your from enemyes vehicles!"
	icon = 'icons/escalation/obj/structures.dmi'
	icon_state = "tank_trap"
	anchored = 0
	density = 1
	throwpass = 1
	layer = ABOVE_OBJ_LAYER + 0.1
	plane = OBJ_PLANE
	flags = OBJ_CLIMBABLE


/obj/structure/chezh_hangehog/New()
	..()
	flags |= ON_BORDER

/obj/structure/chezh_hangehog/Destroy()
	..()

/obj/structure/chezh_hangehog/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/wrench))
		if (!locate(/obj/structure/sandbag) in src.loc.contents || \
			!locate(/obj/structure/brutswehr) in src.loc.contents || \
			!locate(/obj/structure/concrete_block) in src.loc.contents \
			)
			if(!anchored)
				to_chat(user, "<span class='notice'>You start wrenching the [src].</span>")
				if(do_after(user, 20, src))
					playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
					anchored = 1
					to_chat(user, "<span class='notice'>You wrenched the [src].</span>")
			else
				to_chat(user, "<span class='notice'>You start unwrenching the [src].</span>")
				if(do_after(user, 20, src))
					playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
					anchored = 0
					to_chat(user, "<span class='notice'>You unwrenched the [src].</span>")

/obj/structure/chezh_hangehog/ex_act(severity)
	switch(severity)
		if(1.0)
			new /obj/item/stack/rods(src.loc)
			new /obj/item/stack/rods(src.loc)
			new /obj/item/stack/rods(src.loc)
			qdel(src)
			return
		if(2.0)
			new /obj/item/stack/rods(src)
			new /obj/item/stack/rods(src)
			qdel(src)
			return
		else
	return