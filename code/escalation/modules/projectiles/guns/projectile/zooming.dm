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