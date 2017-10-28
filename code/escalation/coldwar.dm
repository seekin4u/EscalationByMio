//#define GENERATE_BUSHIES 1

var/roundstart_time = 0

/hook/roundstart/proc/game_start()
	roundstart_time = world.time
	return 1

var/wlg_total = 0
var/wlg_rejected = 0
var/wlg_selected_none = 0
var/wlg_selected_grass = 0
var/wlg_selected_bush = 0
var/wlg_selected_pine = 0
var/wlg_selected_deadtree = 0

#ifdef GENERATE_BUSHES
/hook/startup/proc/spawn_bushes()
	to_world("<b>Generating wildlife.</b>")
	wlg_total = 0
	wlg_rejected = 0
	wlg_selected_none = 0
	wlg_selected_grass = 0
	wlg_selected_bush = 0
	wlg_selected_pine = 0
	wlg_selected_deadtree = 0
	spawn(100)
		for(var/turf/T in world)
			if(T.z != 1)
				continue
			if(!istype(T, /turf/ground) || !istype(T, /turf/ground/no_flora))
				continue

			wlg_total++
			if(T.contents.len > 1)
				wlg_rejected++
				continue

			var/rn = rand(1, 100)
			switch(rn)
				if(1 to 83)
					wlg_selected_none++
					continue
				if(84 to 87)
					wlg_selected_grass++
					var/grass = pick(/obj/structure/flora/grass/green,
									/obj/structure/flora/grass/brown,
									/obj/structure/flora/grass/both,
									/obj/structure/flora/bush)
					new grass(T)
				if(87 to 89)
					wlg_selected_pine++
					var/pine = /obj/structure/flora/tree/pine
					new pine(T)
				if(90 to 91)
					wlg_selected_deadtree++
					var/deadtree = /obj/structure/flora/tree/dead_big_96x96
					new deadtree(T)
				if(93 to 94)
					wlg_selected_deadtree++
					var/deadtree = /obj/structure/flora/tree/dead_big_64x128
					new deadtree(T)
				//if(95 to 96) - one free slot
				if(97 to 98)
					wlg_selected_deadtree++
					var/deadtree = /obj/structure/flora/tree/dead
					new deadtree(T)
				else
					wlg_selected_bush++
					var/bushes = /obj/structure/flora/bush
					new bushes(T)
	return 1
#endif