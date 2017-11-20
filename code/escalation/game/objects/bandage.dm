/obj/item/weapon/bandage
	name = "bandage"
	desc = "sign something there"
	icon = 'icons/escalation/obj/bandage.dmi'
	icon_state = "bandage"
	force = 0
	w_class = ITEM_SIZE_NORMAL
	throwforce = 1.0
	var/list/bandages = list()
	var/max_bandages = 5
	var/open = 0

/obj/item/weapon/bandage/New()
	..()
	for(var/i in 1 to max_bandages)
		var/obj/item/stack/medical/bruise_pack/BP = new /obj/item/stack/medical/bruise_pack(contents)
		bandages.Add(BP)
		i++

/obj/item/weapon/bandage/update_icon()
	..()

	if(!length(bandages))
		icon_state = initial(icon_state) + "_empty"

	else if(open)
		icon_state = initial(icon_state) + "_open"

	else
		icon_state = initial(icon_state)

/obj/item/weapon/bandage/attack_hand(mob/user as mob)
	if(!ishuman(user))
		return ..()

	if(user.get_inactive_hand() != src)
		return ..()

	if(isnull(user.get_active_hand()) && length(bandages))
		var/obj/item/stack/medical/bruise_pack/BP = bandages[length(bandages)]

		BP.forceMove(user.loc)

		bandages.Remove(BP)
		if(!open)
			open = 1

		user.put_in_hands(BP)

		update_icon()
		to_chat(user, "<span class='notice'>You opened a pack and took a gauze from it.</span>") //same as below

/obj/item/weapon/bandage/attackby(var/obj/item/A, var/mob/user)
	if(!ishuman(user))
		return ..()

	if(istype(A, /obj/item/stack/medical/bruise_pack) && length(bandages) < max_bandages)
		var/obj/item/stack/medical/bruise_pack/BP = A
		user.drop_from_inventory(BP)
		BP.forceMove(src)
		bandages.Add(BP)
		update_icon()
		to_chat(user, "<span class='notice'>You put a gauze back to the opened pack.</span>") //maybe not correct but maybe yes

/obj/item/weapon/bandage/nato
	name = "Pack of gauze"
	desc = "Contains sterile gauze"
	icon_state = "nato"

/obj/item/weapon/bandage/warpac
	name = "Pack of gauze"
	desc = "Contains sterile gauze"
	icon_state = "warpac"