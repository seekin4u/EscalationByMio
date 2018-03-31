#define FOOTSTEP_SPRITE_AMT 2
#define GROUND 0
#define SNOW   1

/turf/ground
	name = "ground"
	dynamic_lighting = FALSE
	icon = 'icons/turf/snow.dmi'
	icon_state = "dirt"
	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = T0C - 10 //not 2 cold
	blend_with_neighbors = 2

	path_to_smoothing = 'icons/escalation/turf/smoothing/snow.dmi'
	multiple_smooth_states = list(1, 2, 3, 4, 5)

	var/list/crossed_dirs = list()
	var/hasSnow = FALSE

	var/wasDug = FALSE
	var/dugIcon = 'icons/escalation/effects/effect.dmi'

	var/default_hasSnow = TRUE

/turf/ground/New()
	..()
	if(default_hasSnow)
		change_turf_to(SNOW)

/turf/ground/attackby(obj/item/C as obj, mob/user as mob)
	if (istype(C, /obj/item/weapon/saperka) || istype(C, /obj/item/weapon/shovel))
		to_world("attackby")

		to_chat(user, "<span class='notice'>Digging [name]...</span>")

		if(do_after(user, 15, src) && in_range(user, src))
			if(hasSnow)
				change_turf_to(GROUND)
				to_world("change_turf_to")

			else
				new /obj/item/weapon/ore/glass(user.loc)
				if(!wasDug)
					wasDug = TRUE
				to_world("update_icon")
				update_icon()
			/*
			else
				new snowtypeherepls(user.loc)
			*/

	//  playsound(src, 'ADDSOMETHINGPLS', X, X)

	return

/turf/ground/proc/add_hole_overlay()
	overlays.Cut()
	var/image/I = image(icon = src.icon, icon_state = "dug", layer = src.layer)
	overlays += I

/turf/ground/update_icon()
	overlays.Cut()//this is shit, make this proc work without it

	if(hasSnow)
		for(var/d in crossed_dirs)
			var/amt = crossed_dirs[d]

			for(var/i in 1 to amt)
				overlays += icon(icon, "footprint[i]", text2num(d))

	if(wasDug)
		add_hole_overlay()

	..()

/turf/ground/Entered(atom/A)
	if(ismob(A) && !isobserver(A))
		if(!hasSnow)
			return
		var/mdir = "[A.dir]"
		if(crossed_dirs[mdir])
			crossed_dirs[mdir] = min(crossed_dirs[mdir] + 1, FOOTSTEP_SPRITE_AMT)
		else
			crossed_dirs[mdir] = 1

		update_icon(TRUE)

	. = ..()

/turf/ground/proc/change_turf_to(var/trigger = GROUND)
	if(trigger)
		hasSnow = TRUE
		name = "snow"
		icon_state = "snow[rand(0, 5)]"
		blend_with_neighbors = 5

	else
		hasSnow = FALSE
		name = "ground"
		icon_state = "dirt"
		blend_with_neighbors = 4

	update_icon()
	return

/turf/ground/no_flora
	//just for the flora code

/turf/ground/snow2 // delete this
	name = "snow"
	icon_state = "snow"

/turf/ground/gravsnow
	name = "frozen ground"
	icon_state = "ground_frozen"
	blend_with_neighbors = null

/turf/ground/gravsnow/update_icon()
	return

/turf/ground/gravsnow/truck //basetype
	icon = 'icons/escalation/turf/road.dmi'
	icon_state = "1"

/*turf/ground/gravsnow/truck/initialize()
	return*/

/turf/ground/gravsnow/truck/snow
	name = "snow"
	icon_state = "snow"

/turf/ground/gravsnow/truck/road
	name = "road"
	icon_state = "road"

/turf/ground/gravsnow/truck/road/snow_overlay
	var/snow_overlay_state = "snow_overlay"

/turf/ground/gravsnow/truck/road/snow_overlay/New()
	..()
	overlays.Cut()
	var/image/I = image(icon = src.icon, icon_state = snow_overlay_state, layer = src.layer)
	overlays += I

/turf/ground/plating
	name = "snowy plating"
	icon_state = "plating"

/turf/ground/drift
	name = "snowy plating"
	icon_state = "platingdrift"