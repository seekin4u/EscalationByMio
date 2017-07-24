/obj/item/weapon/mine
	name = "basic mine"
	throw_speed = 2
	throw_range = 1
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "mine-not-deployed-basic"
	randpixel = 0
	desc = "Desc for basic mine. BOOM BOOM BITCH!"
	anchored = 0
	throwforce = 0
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 1000)
	can_buckle = 0 //disallow manual un/buckling //TODO - DELETE THIS UNUSED SHIT
	var/deployed = 0
	var/triggered = 0
	var/mine_type = "basic"

/obj/item/weapon/mine/proc/can_use(mob/user)
	return (user.IsAdvancedToolUser() && !issilicon(user) && !user.stat && !user.restrained())

/obj/item/weapon/mine/attack_self(mob/user as mob)//deploying
	..()
	if(!deployed && can_use(user))
		user.visible_message(
			"<span class='danger'>[user] starts to deploy \the [src].</span>",
			"<span class='danger'>You begin deploying \the [src]!</span>",
			"You hear the slow creaking of a spring."
		)

		if(do_after(user, 60, user))//we need progress bar upon user, not upon mine in your hands
			user.visible_message(
				"<span class='danger'>\The [user] has deployed \the [src].</span>",
				"<span class='danger'>You have deployed \the [src]!</span>",
				"You hear a latch click loudly."
			)

			deployed = 1
			user.drop_from_inventory(src)
			update_icon()
			anchored = 1

/obj/item/weapon/mine/attack_hand(mob/user as mob)//defusing
	if(deployed && can_use(user))
		user.visible_message(
			"<span class='danger'>[user] starts to disarm \the [src].</span>",
			"<span class='notice'>You begin disarming \the [src]!</span>",
			"You hear a latch click followed by the slow creaking of a spring."
		)
		if(do_after(user, 60, src))
			user.visible_message(
				"<span class='danger'>[user] has disarmed \the [src].</span>",
				"<span class='notice'>You have disarmed \the [src]!</span>"
			)
			deployed = 0
			anchored = 0
			update_icon()
	else
		..()

/obj/item/weapon/mine/Crossed(AM as mob|obj)
	if(triggered)//already used but not destroyed mine
		return

	if(deployed)
		var/mob/living/L = AM
		L.visible_message(
			"<span class='danger'>[L] steps on \the [src].</span>",
			"<span class='danger'>You triggered \the [src]!</span>",
			"<b>You hear a loud metallic snap!</b>"
			)
		triggered = 1
		explosion(loc, 0, 1, 2, 3)
	else
		to_chat(AM, "<b>Thanks to god mine wasn't deployed!</b>")

/obj/item/weapon/mine/update_icon()
	..()

	icon_state = "mine[deployed ? "" : "-not"]-deployed-[mine_type]"

/obj/item/weapon/mine/soviet
	name = "CA mine"
	icon_state = "mine-not-deployed-ca"
	desc = "Desc for CA mine. BOOM BOOM BITCH!"
	mine_type = "ca"//see update_icon, DO NOT TOUCH

/obj/item/weapon/mine/usmc
	name = "USMC mine"
	icon_state = "mine-not-deployed-usmc"
	desc = "Desc for USMC mine. BOOM BOOM BITCH!"
	mine_type = "usmc"//see update_icon