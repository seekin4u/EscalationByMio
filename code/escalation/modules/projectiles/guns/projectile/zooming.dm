/*mob/living/carbon/human/Move()
	..()
	if(client && actions)
		if(client.pixel_x | client.pixel_y)
			to_world("pixel_x | pixel_y")
			for(var/obj/item/weapon/W in src.contents)
				if(W.zoom)//weapons re
					var/obj/item/weapon/Zoomed = locate(W) in src.contents
					if(Zoomed)
						to_world("----Zoomed Find!")
						Zoomed.zoom(src, FALSE)*/

/mob/proc/seek_and_unzoom()
	var/mob/living/M = src
	for(var/obj/item/W in M.contents)
		if(W.zoom)
			W.zoom(M, FALSE)//unzoom if there are

/mob/living/carbon/human/Move()//Resets zoom on movement
	..()
	if(client)
		if(client.pixel_x || client.pixel_y) //Cancel currently scoped weapons
			src.seek_and_unzoom()

//search in _helpers/mobs.dm
// called from Life()
/*mob/living/carbon/human/proc/handle_zoom_stuff(var/ghosting = FALSE)
	if (stat == UNCONSCIOUS || stat == DEAD || ghosting)
		if(client.pixel_x || client.pixel_y) //Cancel currently scoped weapons
			src.seek_and_unzoom()*/
