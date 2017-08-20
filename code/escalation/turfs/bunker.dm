//turfs and stuff used in the bunker

/turf/simulated/floor/bunker
	name = "concrete floor"
	icon = 'icons/escalation/turf/concrete_floor.dmi'
	icon_state = "Concrete_floor"

/turf/simulated/floor/bunker/damaged/New()
	icon_state = "Concrete_floor[rand(1,15)]"
	..()



/turf/simulated/rock
	name = "Mountain"
	icon = 'icons/escalation/turf/Rock.dmi'
	icon_state = "Rock"
	blocks_air = 1
	density = 1
/turf/simulated/rock/edge
	icon_state = "Rock_outline"

/obj/effect/decal/warning_stripes/bunker
	icon = 'icons/escalation/turf/concrete_floor.dmi'
	icon_state = "striped_border"



/turf/simulated/floor/dirt
	name = "dirt"
	icon = 'icons/escalation/turf/Turfs.dmi'
	icon_state = "Ground"



/turf/simulated/floor/road
	name = "road"
	icon = 'icons/escalation/turf/Turfs.dmi'
	icon_state = "Road"

/turf/simulated/floor/road/New()
	if(prob(10))
		new /obj/effect/border_effect/snow(src)


/turf/snow/no_flora
	//just for the flora code



/turf/simulated/wall/concrete
	name = "bunker wall"
	icon = 'icons/escalation/turf/Walls.dmi'
	icon_state = "Concrete_wall"

/turf/simulated/wall/concrete/reinforced
	icon_state = "Reinforced_cw"

/turf/simulated/wall/brick
	name = "brick wall"
	icon = 'icons/escalation/turf/Walls.dmi'
	icon_state = "Wall_brick"


//structures and machines
/obj/structure/window/fence
	name = "metal fence"
	desc = "A metal fence."
	icon = 'icons/escalation/obj/structures.dmi'	// Maximal heat before this window begins taking damage from fire
	damage_per_fire_tick = 0		// Amount of damage per fire tick. Regular windows are not fireproof so they might as well break quickly.
	icon_state = "fence"
	shardtype = /obj/item/stack/rods
	glasstype = /obj/item/stack/rods

/obj/structure/window/fence/update_icon()
	//
/obj/structure/window/fence/take_damage(var/damage = 0,  var/sound_effect = 1)

	health = max(0, health - damage)

	if(health <= 0)
		shatter()
	else
		playsound(loc, 'sound/effects/grillehit.ogg', 100, 1)

/obj/structure/window/fence/shatter(var/display_message = 1)
	new /obj/item/stack/rods(loc)
	playsound(loc, 'sound/effects/grillehit.ogg', 100, 1)
	qdel(src)



/obj/machinery/floodlight/bunker
	name = "bunker floodlight"
	icon = 'icons/obj/machines/floodlight.dmi'
	icon_state = "flood00"
	density = 1
	on = 1
	use = 0
	anchored = 1

