#define FOOTSTEP_SPRITE_AMT 2

/turf/snow
	name = "snow"
	dynamic_lighting = 0
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow0"
	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = T0C - 10 //not 2 cold
	var/list/crossed_dirs = list()
	var/hasGround = 0

/turf/snow/initialize()
	icon_state = "snow[rand(0, 5)]"

/turf/snow/Entered(atom/A)
	if(ismob(A) && !isobserver(A))
		if(hasGround)
			return
		var/mdir = "[A.dir]"
		if(crossed_dirs[mdir])
			crossed_dirs[mdir] = min(crossed_dirs[mdir] + 1, FOOTSTEP_SPRITE_AMT)
		else
			crossed_dirs[mdir] = 1

		update_icon()

	. = ..()

/turf/snow/attackby(obj/item/C as obj, mob/user as mob)
	if (istype(C, /obj/item/weapon/saperka))
		if(hasGround)
			if(do_after(user, 15, src) && in_range(user, src))
				to_chat(user, "<span class='notice'>Digging ground...</span>")
				var/obj/item/weapon/ore/glass/G = new(user.loc)
			return
		to_chat(user, "<span class='notice'>Digging snow ...</span>")
	//  playsound(src, 'ADDSOMETHINGPLS', X, X)
		if(do_after(user, 15, src) && in_range(user, src))
			hasGround = 1
			name = "ground"
			crossed_dirs.Cut()
			update_icon()
			// snow-obj in future
	return

/turf/snow/update_icon()
	overlays.Cut()
	if(hasGround)
		overlays += icon(icon, "dirt")
	for(var/d in crossed_dirs)
		var/amt = crossed_dirs[d]

		for(var/i in 1 to amt)
			overlays += icon(icon, "footprint[i]", text2num(d))

/turf/snow/snow2 // delete this
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"

/turf/snow/gravsnow
	name = "frozen ground"
	icon_state = "ground_frozen"

/turf/snow/gravsnow/truck//basetype
	icon = 'icons/escalation/turf/road.dmi'
	icon_state = "1"

/turf/snow/gravsnow/truck/initialize()
	return

/turf/snow/gravsnow/truck/snow
	name = "snow"
	icon_state = "snow"

/turf/snow/gravsnow/truck/road
	name = "road"
	icon_state = "road"

/turf/snow/gravsnow/truck/road/snow_overlay

/turf/snow/gravsnow/truck/road/snow_overlay/New()
	..()
	overlays += image(icon = src.icon, icon_state = "snow_overlay", layer = src.layer + 0.1)

/turf/ground/plating
	name = "snowy plating"
	icon_state = "plating"

/turf/ground/drift
	name = "snowy plating"
	icon_state = "platingdrift"
