//than higher blend
/turf/unsimulated/escalation
	name = "escalation_unsimulated"
	dynamic_lighting = FALSE
	icon = 'icons/escalation/turf/Turfs.dmi'
	icon_state = "dirt"
	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = T0C - 10 //not 2 cold
	blend_with_neighbors = 4

/turf/unsimulated/escalation/road
	name = "road"
	//icon = 'icons/escalation/turf/road.dmi'
	icon_state = "greyroad"
	blend_with_neighbors = 6

/turf/unsimulated/escalation/pavement
	name = "pavement"
	//icon = 'icons/escalation/turf/road.dmi'
	icon_state = "pavement"
	blend_with_neighbors = 7

/*turf/unsimulated/escalation/pavement/New()
	if(prob(5))
		icon_state += "_rand"*/
/turf/unsimulated/escalation/rock
	name = "Mountain"
	icon = 'icons/escalation/turf/rock.dmi'
	icon_state = "esc_rock"
	blocks_air = 1
	density = 1
	opacity = 1
	blend_with_neighbors = 1
