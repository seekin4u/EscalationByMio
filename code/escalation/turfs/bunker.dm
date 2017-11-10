//turfs and stuff used in the bunker

/turf/simulated/floor/bunker
	name = "concrete floor"
	icon = 'icons/escalation/turf/concrete_floor.dmi'
	icon_state = "Concrete_floor"

/turf/simulated/floor/bunker/damaged/New()
	icon_state = "Concrete_floor[rand(1,15)]"
	..()



/turf/unsimulated/rock
	name = "Mountain"
	icon = 'icons/escalation/turf/rock.dmi'
	icon_state = "esc_rock"
	blocks_air = 1
	density = 1
	opacity = 1
	blend_with_neighbors = 9

/obj/effect/decal/warning_stripes/bunker
	icon = 'icons/escalation/turf/concrete_floor.dmi'
	icon_state = "striped_border"

/obj/effect/decal/warning_stripes/road_line
	icon = 'icons/escalation/turf/road.dmi'
	icon_state = "Yellow_line"

/obj/effect/decal/warning_stripes/road_line/outer_corner
	icon_state = "Yellow_line_outer_corner"

/obj/effect/decal/warning_stripes/road_line/inner_corner
	icon_state = "Yellow_line_inner_corner"


/turf/simulated/floor/dirt
	name = "dirt"
	icon = 'icons/escalation/turf/Turfs.dmi'
	icon_state = "Ground"

/turf/simulated/floor/road
	name = "road"
	icon = 'icons/escalation/turf/road.dmi'
	icon_state = "Road_grey"
	blend_with_neighbors = 6

/turf/simulated/floor/road/update_icon()
	..()

/turf/simulated/floor/pavement
	name = "pavement"
	icon = 'icons/escalation/turf/road.dmi'
	icon_state = "pavement"
	blend_with_neighbors = 1

/turf/simulated/floor/pavement/corner/outer
	icon_state = "Corner"

/turf/simulated/floor/pavement/corner/inner
	icon_state = "Inner_corner"


/turf/simulated/wall/concrete
	name = "bunker wall"
	icon = 'icons/escalation/turf/Walls.dmi'
	icon_state = "Concrete_wall"

/turf/simulated/wall/concrete/reinforced
	icon_state = "Reinforced_cw"

/turf/simulated/wall/brck
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

/turf/simulated/wall/house
	name = "wooden wall"
	icon = 'icons/escalation/turf/Walls.dmi'
	icon_state = "wood"

/turf/simulated/wall/german
	name = "german house wall"
	icon = 'icons/escalation/turf/Walls.dmi'
	icon_state = "German_wall1"

/turf/simulated/wall/german2
	name = "german house wall"
	icon = 'icons/escalation/turf/Walls.dmi'
	icon_state = "German_wall2"

/turf/simulated/wall/german3
	name = "german house wall"
	icon = 'icons/escalation/turf/Walls.dmi'
	icon_state = "German_wall3"

/turf/simulated/wall/house/pillar
	name = "wooden wall"
	icon = 'icons/escalation/turf/Walls.dmi'
	icon_state = "wood_pillar"

/turf/simulated/wall/house/end
	name = "wooden wall"
	icon = 'icons/escalation/turf/Walls.dmi'
	icon_state = "wood_ends"

/turf/simulated/wall/house/tjunction
	name = "wooden wall"
	icon = 'icons/escalation/turf/Walls.dmi'
	icon_state = "wood_T"

/turf/simulated/wall/house/xjunction
	name = "wooden wall"
	icon = 'icons/escalation/turf/Walls.dmi'
	icon_state = "wood_4"