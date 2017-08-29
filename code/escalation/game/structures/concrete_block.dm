/obj/structure/sandbag/concrete_block
	name = "concrete block"
	desc = "A concrete block you can take cover behind."
	//icon = 'icons/obj/structures.dmi'
	icon_state = "concrete_block"
	basic_chance = 40

/obj/structure/sandbag/concrete_block/update_layers()
	if(dir != SOUTH)
		layer = initial(layer) + 0.4
		plane = initial(plane)
	else
		layer = ABOVE_OBJ_LAYER + 0.4
		plane = ABOVE_HUMAN_PLANE


/obj/structure/sandnag/concrete_block/MouseDrop_T(obj/O as obj, mob/user as mob)
	..()
	if ((!( istype(O, /obj/item/weapon) ) || user.get_active_hand() != O))
		return
	if(isrobot(user))
		return
	//user.drop_item()
	if (O.loc != user.loc)
		to_chat(user, "you start climbing onto [O]...")
		step(O, get_dir(O, src))
	return

/obj/structure/sandbag/concrete_block/ex_act(severity)
	switch(severity)
		if(1.0)
			new /obj/item/stack/material/concrete(src.loc)
			new /obj/item/stack/material/concrete(src.loc)
			new /obj/item/stack/material/concrete(src.loc)
			qdel(src)
			return
		if(2.0)
			new /obj/item/stack/material/concrete(src)
			new /obj/item/stack/material/concrete(src)
			qdel(src)
			return
		else
	return