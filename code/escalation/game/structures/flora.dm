/obj/structure/flora/tree
	var/chops = 0
	var/small = FALSE

/obj/structure/flora/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if(prob(50))
				new /obj/structure/log(src.loc)
				qdel(src)
				return
		if(3.0)
			new /obj/structure/log(src.loc)
			density = TRUE//прострелили нахуй так что оно теперь просвечивается, но исчо не удалено
			return


/obj/structure/flora/tree/attackby(var/obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/carpentry/axe))
		to_chat(user, "<span class='notice'>You chop [src] with [I].</span>")

		playsound(src.loc, 'sound/effects/chopchop.ogg', 100, 1)

		sleep(10)//replace on do_after


		chops ++

		if(chops == 3 && small)
			to_chat(user, "<span class='notice'>[src] comes crashing down!</span>")

			sleep(15)

			playsound(src.loc, 'sound/effects/treefalling.ogg', 100, 1)
			new /obj/structure/log(src.loc)

			qdel(src)

		else if(chops == 5)
			to_chat(user, "<span class='notice'>[src] comes crashing down!</span>")

			sleep(15)

			playsound(src.loc, 'sound/effects/treefalling.ogg', 100, 1)

			new /obj/structure/log(get_step(src, NORTH))
			new /obj/structure/log(src.loc)
			var/obj/structure/log/L = new /obj/structure/log(get_step(src, NORTH))

			L.y ++

			qdel(src)
	return

/obj/structure/log
	name = "Log"
	desc = "Usual log."
	icon = 'icons/escalation/obj/wood.dmi'
	icon_state = "log"
	density = TRUE
	anchored = FALSE

/*obj/structure/log/attackby(/obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/carpentry/saw))
		to_chat(user, "<span class='notice'>You saw the [src] with [I].</span>")

		if(do_after(user, 20))

			var/obj/item/stack/material/wood/W = new /obj/item/stack/material/wood(src.loc)

			W.pixel_y = src.pixel_y
			W.amount = rand(2,4) //going to mess with this value for a while, we'll see

			qdel(src)

	return*/

/obj/structure/flora/tree/dead_big_96x96
	name = "dead tree"
	icon = 'icons/escalation/obj/flora/trees_96x96.dmi'
	icon_state = "tree_winter_96x96_1"
	pixel_x = -32

/obj/structure/flora/tree/dead_big_96x96/New()
	..()
	icon_state = "tree_winter_96x96_1"//replace end of string to rand(1,*) if we sprite enough trees

/obj/structure/flora/tree/dead_big_64x128
	name = "dead tree"
	icon = 'icons/escalation/obj/flora/trees_64x128.dmi'
	icon_state = "tree_winter_64x128_1"

/obj/structure/flora/tree/dead_big_64x128/New()
	..()
	icon_state = "tree_winter_64x128_1"//replace end of string to rand(1,*) if we sprite enough trees