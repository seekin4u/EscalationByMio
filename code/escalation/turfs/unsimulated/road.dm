//than higher blend
/turf/unsimulated/escalation
	name = "escalation_unsimulated"
	dynamic_lighting = FALSE
	icon = 'icons/escalation/turf/Turfs.dmi'
	icon_state = "dirt"
	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15
	temperature = T0C - 10
	path_to_smoothing = 'icons/turf/escalation/smoothing/new_blandings.dmi'

/turf/unsimulated/escalation/road
	name = "road"
	icon_state = "greyroad"
	blend_with_neighbors = 7

/turf/unsimulated/escalation/pavement
	name = "pavement"
	icon_state = "pavement"
	blend_with_neighbors = 6
	multiple_smooth_states = list(1, 2, 3, 4, 5)

/turf/unsimulated/escalation/rock
	name = "Mountain"
	icon = 'icons/escalation/turf/rock.dmi'
	icon_state = "esc_rock"
	blocks_air = 1
	density = 1
	opacity = 1
	blend_with_neighbors = 1
