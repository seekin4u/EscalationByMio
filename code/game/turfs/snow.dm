/turf/snow
    name = "snow"

    dynamic_lighting = 1
    icon = 'icons/turf/snow_new.dmi'
    icon_state = "snow"

    oxygen = MOLES_O2STANDARD * 1.15
    nitrogen = MOLES_N2STANDARD * 1.15

    temperature = T0C - 35
    var/list/crossed_dirs = list()

#define FOOTSTEP_SPRITE_AMT 2

/turf/snow/Entered(atom/A)
    if(ismob(A))
        var/mdir = "[A.dir]"
        if(crossed_dirs[mdir])
            crossed_dirs[mdir] = min(crossed_dirs[mdir] + 1, FOOTSTEP_SPRITE_AMT)
        else
            crossed_dirs[mdir] = 1

        update_icon()

    . = ..()

/turf/snow/attackby(obj/item/C as obj, mob/user as mob)

	if (istype(C, /obj/item/stack/rods))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			return
		var/obj/item/stack/rods/R = C
		if (R.use(1))
			to_chat(user, "<span class='notice'>Constructing support lattice ...</span>")
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			ReplaceWithLattice()
		return

	if (istype(C, /obj/item/stack/tile/floor))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			var/obj/item/stack/tile/floor/S = C
			if (S.get_amount() < 1)
				return
			qdel(L)
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			S.use(1)
			return
		else
			to_chat(user, "<span class='warning'>The plating is going to need some support.</span>")
	return


/turf/snow/update_icon()
	overlays.Cut()
	for(var/d in crossed_dirs)
		var/amt = crossed_dirs[d]

		for(var/i in 1 to amt)
			var/mob/M = usr
			if(istype(M, /mob/observer)) return
			else overlays += icon(icon, "footprint[i]", text2num(d))
//			overlays += icon(icon, "footprint[i]", text2num(d))



/turf/snow/snow2
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"

/turf/ice
	name = "thin ice"

	icon = 'icons/turf/snow_new.dmi'
	icon_state = "ice1"

	density = 1
	dynamic_lighting = 1

	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = T0C - 35

/turf/ice/New()
	icon_state = "ice[rand(1,6)]"
	..()

/turf/snow/gravsnow
	name = "frozen ground"
	icon_state = "ground_frozen"

/turf/snow/plating
	name = "snowy plating"
	icon_state = "plating"

/turf/snow/drift
	name = "snowy plating"
	icon_state = "platingdrift"