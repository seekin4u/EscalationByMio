/obj/effect/border_effect
	name = "snow"
	desc = "A layer of snow"
	icon = 'icons/escalation/turf/Turfs.dmi'
	icon_state = "Snow1"
	var/overlay_icon_state = "snow_overlay"
	var/borders = 0
	var/border_start = 0
	anchored = 1
/obj/effect/border_effect/proc/update_overlays()
	var/turf/parent_turf=get_turf(src)
	parent_turf.overlays.Cut(border_start,borders+border_start)
	border_start = parent_turf.overlays.len//store the position in the list
	borders = 0
	WARNING(WEST)
	WARNING(SOUTH)
	WARNING(NORTH)
	WARNING(EAST)
	for(var/i = 0, i <= 3, i++)
		var/overlay_dir = 2 ** i
		var/turf/target_turf = get_turf(get_step(src,overlay_dir))
		if(!locate(src.type) in target_turf && target_turf)
			borders ++
			var/image/overlay
			switch(i)
				if(0)

					overlay=image(icon, icon_state = overlay_icon_state, dir = 1)
					overlay.pixel_y = 32
				if(1)

					overlay=image(icon, icon_state = overlay_icon_state, dir = 2)
					overlay.pixel_y = -32
				if(2)

					overlay=image(icon, icon_state = overlay_icon_state, dir = 4)
					overlay.pixel_x = 32
				if(3)

					overlay=image(icon, icon_state = overlay_icon_state, dir = 8)
					overlay.pixel_x = -32
			overlay.plane = ABOVE_TURF_PLANE
			overlay.layer = DECAL_LAYER
			parent_turf.overlays += overlay


/obj/effect/border_effect/snow/New()
	..()
	icon_state = "Snow[rand(1,10)]"
	update_overlays()
	for(var/i = 0, i < 3, i++)
		var/turf/target_turf = get_turf(get_step(src,2**i))
		var/obj/effect/border_effect/be = locate(src.type) in target_turf
		if(be)
			be.update_overlays()


/obj/effect/border_effect/snow/Destroy()
	var/turf/parent_turf=get_turf(src)
	parent_turf.overlays.Cut(border_start,border_start+borders)
	for(var/i = 0, i < 3, i++)
		var/turf/target_turf = get_turf(get_step(src,2**i))
		var/obj/effect/border_effect/be = locate(src.type) in target_turf
		if(be)
			be.update_overlays()
