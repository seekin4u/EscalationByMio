/obj/effect/mine
	name = "Mine"
	desc = "I Better stay away from that thing."
	density = 1
	anchored = 1
	plane = OBJ_PLANE
	layer = OBJ_LAYER
	icon = 'icons/obj/weapons.dmi'
	icon_state = "uglymine"
	var/triggerproc = "explode" //name of the proc thats called when the mine is triggered
	var/triggere = FALSE

/obj/effect/mine/New()
	icon_state = "uglyminearmed"

/obj/effect/mine/Crossed(AM as mob|obj)
	Bumped(AM)

/obj/effect/mine/Bumped(mob/M as mob|obj)

	if(triggered) return

	if(istype(M, /mob/living/carbon/human))
		for(var/mob/O in viewers(world.view, src.loc))
			to_chat(O, "<span class='warning'>\The [M] triggered the \icon[src] [src]</span>")
		triggered = TRUE
		call(src,triggerproc)(M)

/obj/effect/mine/proc/explode(obj)
	explosion(loc, 0, 2, 3, 4)
	spawn(0)
		qdel(src)