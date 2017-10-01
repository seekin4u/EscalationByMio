/obj/item/weapon/saperka/lopata
	name = "Spade"
	desc = "A small spade for digging, moving out dirt and close combat."
	icon = 'icons/escalation/obj/tools.dmi'
	icon_state = "showel" //change
	slot_flags = SLOT_ID
	force = 15.0
	throwforce = 10.0
	item_state = "spade" //change
	w_class = ITEM_SIZE_SMALL
	matter = list(DEFAULT_WALL_MATERIAL = 50)
	attack_verb = list("bashed", "bludgeoned", "thrashed", "whacked")
	sharp = 1
	edge = 1

/obj/item/weapon/saperka/lopata/nato
	icon_state = "showel_nato" //change

/obj/item/weapon/saperka/lopata/warpact
	icon_state = "showel_wp" //change
