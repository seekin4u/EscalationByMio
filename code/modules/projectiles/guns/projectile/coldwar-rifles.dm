/obj/item/weapon/gun/projectile/automatic/ak74
	name = "AK-74"
	desc = "A standard-issue Soviet Army combat rifle. Chambers 5.45x39 rounds."
	icon_state = "ak74"
	item_state = "ak74"
	w_class = 5
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	one_hand_penalty = 3
	accuracy = 2
	fire_delay = 2

	wielded_item_state = "ak74-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'

	var/obj/item/weapon/material/knife/bayonet/sa/knife = FALSE

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=2,    move_delay=null, one_hand_penalty=2, burst_accuracy=null,              dispersion=null,                          automatic = 0),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=3,    one_hand_penalty=4, burst_accuracy=list(1,1,0),       dispersion=list(0.0, 0.3, 0.6),           automatic = 0),
		list(mode_name="long bursts",  burst=5, fire_delay=null, move_delay=4,    one_hand_penalty=5, burst_accuracy=list(1,1,0,-1,-2), dispersion=list(0.3, 0.3, 0.6, 1.2, 1.5), automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.5,  move_delay=null, one_hand_penalty=2, burst_accuracy=null,              dispersion=list(0.2),                     automatic = 0.7),
		)

/obj/item/weapon/gun/projectile/automatic/ak74/New()
	..()
	src.verbs -= /obj/item/weapon/gun/projectile/automatic/ak74/verb/remove_bayonet

/obj/item/weapon/gun/projectile/automatic/ak74/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/sa))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/automatic/ak74/verb/remove_bayonet
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/ak74/update_icon()
	..()
	if(knife)
		var/image/I = image('icons/escalation/obj/bayonets.dmi', src, "bayonet-sa")
		I.pixel_x += 10
		I.pixel_y += 10
		overlays += I
	else
		overlays.Cut()

	if(ammo_magazine)
		icon_state = "ak74"
	else
		icon_state = "ak74-empty"

/obj/item/weapon/gun/projectile/automatic/ak74/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)


/obj/item/weapon/gun/projectile/automatic/ak74/verb/remove_bayonet()
	set name = "Detach Bayonet"
	set category = "Object"
	set popup_menu = 1
	set src in usr

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = FALSE
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		to_chat(usr, "<span class='notice'>You detach the bayonet from the [src].</span>")
		src.verbs -= /obj/item/weapon/gun/projectile/automatic/ak74/verb/remove_bayonet
		update_icon()

/obj/item/weapon/gun/projectile/automatic/ak74/black
	desc = "AK-74 with polymer kit and dim finish. Chambers 5.45x39 rounds."
	icon_state = "ak74black"

/obj/item/weapon/gun/projectile/automatic/ak74/black/update_icon()
	..()

	if(ammo_magazine)
		icon_state = "ak74black"
	else
		icon_state = "ak74black-empty"

/obj/item/weapon/gun/projectile/automatic/ak74gl
	name = "AK-74"
	desc = "A standard-issue Soviet Army combat rifle with a GP-25 launcher attached. Chambers 5.45x39 rounds."
	icon_state = "ak74gl"
	item_state = "ak74gl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	one_hand_penalty = 3
	accuracy = 2
	fire_delay = 2

	wielded_item_state = "ak74gl-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/gp25/launcher

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=2,    move_delay=null, one_hand_penalty=2, burst_accuracy=null,              dispersion=null,                          automatic = 0),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=3,    one_hand_penalty=4, burst_accuracy=list(1,1,0),       dispersion=list(0.0, 0.3, 0.6),           automatic = 0),
		list(mode_name="long bursts",  burst=5, fire_delay=null, move_delay=4,    one_hand_penalty=5, burst_accuracy=list(1,1,0,-1,-2), dispersion=list(0.3, 0.3, 0.6, 1.2, 1.5), automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.5,  move_delay=null, one_hand_penalty=2, burst_accuracy=null,              dispersion=list(0.2),                     automatic = 0.7),
		)

/obj/item/weapon/gun/projectile/automatic/ak74gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/ak74gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//load check it for it's type
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/ak74gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/ak74gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/weapon/gun/projectile/automatic/ak74gl/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ak74gl"
	else
		icon_state = "ak74gl-empty"

/obj/item/weapon/gun/projectile/automatic/ak74gl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr

	if(launcher)
		use_launcher = !use_launcher
		to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")

/obj/item/weapon/gun/projectile/automatic/ak74gl/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)

/obj/item/weapon/gun/projectile/automatic/aks74
	name = "AKS-74"
	desc = "A lighter version of the standard-issue Soviet Army combat rifle. Chambers 5.45x39 rounds."
	icon_state = "aks74"
	item_state = "aks"
	w_class = 4
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = /obj/item/ammo_magazine/c545x39m
	magazine_type = /obj/item/ammo_magazine/c545x39m
	one_hand_penalty = 2
	accuracy = 2
	fire_delay = 2

	wielded_item_state = "aks-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'

	var/obj/item/weapon/material/knife/bayonet/sa/knife = FALSE

	firemodes = list(
		list(mode_name="semiauto",      burst=1, fire_delay=2,    move_delay=null, one_hand_penalty=2, burst_accuracy=null,              dispersion=null,                          automatic = 0),
		list(mode_name="short bursts",  burst=3, fire_delay=null, move_delay=1,    one_hand_penalty=3, burst_accuracy=list(1,0,-1),      dispersion=list(0.3, 0.6, 0.6) ,          automatic = 0),
		list(mode_name="long bursts",   burst=5, fire_delay=null, move_delay=2,    one_hand_penalty=4, burst_accuracy=list(1,0,0,-1,-2), dispersion=list(0.3, 0.6, 0.6, 1.2, 1.5), automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.7,  move_delay=1,    one_hand_penalty=2, burst_accuracy=null,              dispersion=list(0.1),                     automatic = 0.7),
		)

/obj/item/weapon/gun/projectile/automatic/ak74/New()
	..()
	src.verbs -= /obj/item/weapon/gun/projectile/automatic/aks74/verb/remove_bayonet

/obj/item/weapon/gun/projectile/automatic/aks74/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/sa))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/automatic/aks74/verb/remove_bayonet
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/aks74/update_icon()
	..()

	if(knife)
		var/image/I = image('icons/escalation/obj/bayonets.dmi', src, "bayonet-sa")
		I.pixel_x += 5
		I.pixel_y += 5
		overlays += I
	else
		overlays.Cut()

	if(ammo_magazine)
		icon_state = "aks74"
	else
		icon_state = "aks74-empty"

/obj/item/weapon/gun/projectile/automatic/aks74/verb/remove_bayonet()
	set name = "Detach Bayonet"
	set category = "Object"
	set popup_menu = 1

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = FALSE
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		to_chat(usr, "<span class='notice'>You detach the bayonet from \the [src].</span>")
		src.verbs -= /obj/item/weapon/gun/projectile/automatic/aks74/verb/remove_bayonet
		update_icon()

/obj/item/weapon/gun/projectile/automatic/aks74/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)

/obj/item/weapon/gun/projectile/automatic/m16a2
	name = "M16A2"
	desc = "A standard-issue USMC combat rifle. Chambers 5.56x39 rounds."
	icon_state = "m16a2"
	item_state = "m16"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = /obj/item/ammo_magazine/c556x45m
	magazine_type = null
	one_hand_penalty = 4
	accuracy = 3
	fire_delay = 3

	wielded_item_state = "m16-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'

	var/obj/item/weapon/material/knife/bayonet/usmc/knife = FALSE

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=4, burst_accuracy=null,       dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=3,    one_hand_penalty=5, burst_accuracy=list(2,1,1),dispersion=list(0.0, 0.3, 0.3)),
		)

/obj/item/weapon/gun/projectile/automatic/m16a2/New()
	..()
	src.verbs -= /obj/item/weapon/gun/projectile/automatic/m16a2/verb/remove_bayonet

/obj/item/weapon/gun/projectile/automatic/m16a2/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/usmc))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/automatic/m16a2/verb/remove_bayonet
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/m16a2/update_icon()
	..()

	if(knife)
		var/image/I = image('icons/escalation/obj/bayonets.dmi', src, "bayonet-usmc")
		I.pixel_x += 5
		I.pixel_y += 5
		overlays += I
	else
		overlays.Cut()

	if(ammo_magazine)
		icon_state = "m16a2"
	else
		icon_state = "m16a2-empty"

/obj/item/weapon/gun/projectile/automatic/m16a2/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)

/obj/item/weapon/gun/projectile/automatic/m16a2/verb/remove_bayonet()
	set name = "Detach Bayonet"
	set category = "Object"
	set popup_menu = 1
	set src in usr

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = FALSE
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		to_chat(usr, "<span class='notice'>You detach the bayonet from the [src].</span>")
		src.verbs -= /obj/item/weapon/gun/projectile/automatic/m16a2/verb/remove_bayonet
		update_icon()

//heavily ak-74 version, have a little bit faster bullets and larger barrel - ~750m\sec against of ak's 715m\sec
//have bipods on bayonet's slot
/obj/item/weapon/gun/projectile/automatic/rpk74
	name = "RPK-74"
	desc = "A standard-issue Soviet Army squad support weapon. Chambers 5.45x39 rounds."
	icon_state = "rpk"
	item_state = "rpk"
	slot_flags = SLOT_BACK_GUN
	w_class = 5
	force = 10
	max_shells = 45
	caliber = "545x39"
	ammo_type = /obj/item/ammo_casing/a545x39
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	one_hand_penalty = 6
	accuracy = 3
	automatic
	wielded_item_state = "rpk-wielded"

	fire_sound = 'sound/weapons/gunshot/rpk47.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'


	firemodes = list(
		list(mode_name="semiauto",      burst=1, fire_delay=2,   move_delay=null,    one_hand_penalty=2, burst_accuracy=null,   dispersion=null,                            automatic = 0),
		list(mode_name="short bursts",  burst=5, move_delay=8,   one_hand_penalty=8, burst_accuracy = list(2,2,1,1,0),          dispersion = list(0.3, 0.3, 0.6, 1.0, 1.2), automatic = 0),
		list(mode_name="long bursts",   burst=8, move_delay=10,  one_hand_penalty=9, burst_accuracy = list(2,1,1,0,0,-1,-1,-2), dispersion = list(0.3, 0.3, 0.6, 1.0, 1.2), automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.5, move_delay=3,       one_hand_penalty=5, burst_accuracy=null,   dispersion=list(0.5, 0.8),                  automatic = 0.7),
		)

/obj/item/weapon/gun/projectile/automatic/rpk74/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)

/obj/item/weapon/gun/projectile/automatic/rpk74/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "rpk"
	else
		icon_state = "rpk-empty"

//true kalashnikov's machinegun - standart soviet lmg
//same with bayonet as RPK
/obj/item/weapon/gun/projectile/automatic/pkm
	name = "PKM"
	desc = "A standard-issue Soviet Army general purpose machine gun. Chambers 7.62x54 rounds."
	icon_state = "pkm"
	item_state = "vz59"
	w_class = 5
	force = 15
	slot_flags = SLOT_BACK_GUN
	max_shells = 200
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x54b
	one_hand_penalty = 9
	automatic = FALSE

	wielded_item_state = "vz59-wielded"
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'

	firemodes = list(
		list(mode_name="short bursts",  burst=5, move_delay=6,   one_hand_penalty=8, burst_accuracy = list(0, 0,-1,-1,-2),        dispersion = list(0.5, 0.7, 0.8, 1.0, 1.2), automatic = 0),
		list(mode_name="long bursts",   burst=8, move_delay=8,   one_hand_penalty=9, burst_accuracy = list(0, 0,-1,-1,-2,-2,-3),  dispersion = list(0.6, 0.8, 1.0, 1.0, 1.2), automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.5, move_delay=3,       one_hand_penalty = 8, burst_accuracy=null,   dispersion=list(0.5, 0.8),                  automatic = 0.7),
		)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/pkm/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/pkm/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user, "<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/pkm/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/pkm/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/pkm/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/pkm/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/pkm/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x54b))
		icon_state = "pkm[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 200)]"
	else
		icon_state = "pkm[cover_opened ? "open" : "closed"]-empty"
	..()

/obj/item/weapon/gun/projectile/automatic/pkm/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)

/obj/item/weapon/gun/projectile/automatic/m60
	name = "M60E1"
	desc = "A standard-issue USMC squad support weapon. Chambers 7.62x51 rounds."
	icon_state = "m60"
	item_state = "m60"
	w_class = 5
	force = 15
	slot_flags = SLOT_BACK_GUN
	max_shells = 200
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x51b
	one_hand_penalty = 9
	automatic = 0

	wielded_item_state = "m60-wielded"
	fire_sound = 'sound/weapons/gunshot/m60.ogg'
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'

	firemodes = list(
		list(mode_name="short bursts",  burst=5, move_delay=12,  one_hand_penalty=8, burst_accuracy = list(0, 0,-1,-1,-2),      dispersion = list(0.5, 0.7, 0.8, 1.0, 1.2), automatic = 0),
		list(mode_name="long bursts",   burst=8, move_delay=15,  one_hand_penalty=9, burst_accuracy = list(0, 0,-1,-1,-2,-3),   dispersion = list(0.7, 0.8, 1.0, 1.0, 1.2), automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.5, move_delay=3,       one_hand_penalty = 8, burst_accuracy=null, dispersion=list(0.5, 0.8),                  automatic = 0.7),
		)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/m60/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/m60/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user,"<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/m60/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/m60/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/m60/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/m60/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/m60/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x51b))
		icon_state = "m60[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 200)]"
	else
		icon_state = "m60[cover_opened ? "open" : "closed"]-empty"
	..()

/obj/item/weapon/gun/projectile/automatic/m60/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)

/obj/item/weapon/gun/projectile/automatic/mg3
	name = "MG3"
	desc = "A standard-issue Bundeswehr squad support weapon. Chambers 7.62x51 rounds."
	icon_state = "MG3"
	item_state = "m60"
	w_class = 5
	force = 15
	slot_flags = SLOT_BACK_GUN
	max_shells = 100
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x51b/bdw
	one_hand_penalty = 9
	wielded_item_state = "m60-wielded" //change
	fire_sound = 'sound/weapons/gunshot/m60.ogg'
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'

	firemodes = list(
		list(mode_name="short bursts",  burst=6,  move_delay=9,   one_hand_penalty=8, burst_accuracy = list(1,1,1,0,-1),          dispersion = list(0.8, 1.2, 1.2, 1.2, 1.4), automatic = 0),
		list(mode_name="long bursts",   burst=12, move_delay=13,  one_hand_penalty=9, burst_accuracy = list(1,1,0,0,-1,-2,-3),    dispersion = list(1.2, 1.2, 1.2, 1.2, 1.4), automatic = 0),
		list(mode_name="automatic",     burst=1,  fire_delay=0.2, move_delay=3,       one_hand_penalty=9, burst_accuracy = null,  dispersion=list(0.5, 0.8),                  automatic = 0.2),
	)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/mg3/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/mg3/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user, "<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/mg3/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/mg3/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/mg3/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/mg3/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/mg3/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x51b/bdw))
		icon_state = "mg3[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 100)]"
	else
		icon_state = "mg3[cover_opened ? "open" : "closed"]-empty"
	..()

/obj/item/weapon/gun/projectile/automatic/mg3/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)

//DO NOT USE
/obj/item/weapon/gun/projectile/automatic/m14
	name = "M14"
	desc = "A former standard-issue USMC combat rifle. Chambers 7.62x51 rounds."
	icon_state = "m14"
	item_state = "m14"
	slot_flags = SLOT_BACK_GUN
	w_class = 5
	force = 10
	max_shells = 20
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x51s
	one_hand_penalty = 4
	accuracy = 3
	fire_delay = 2

	fire_sound = 'sound/weapons/gunshot/m14.ogg'
	wielded_item_state = "m14-wielded"
	unload_sound = 'sound/weapons/gunporn/m14_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m14_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m14_charge.ogg'

	var/obj/item/weapon/material/knife/bayonet/usmc/knife = FALSE

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=2, move_delay=null, one_hand_penalty=3, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/m14/New()
	..()
	src.verbs -= /obj/item/weapon/gun/projectile/automatic/m14/verb/remove_bayonet

/obj/item/weapon/gun/projectile/automatic/m14/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/usmc))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/automatic/m14/verb/remove_bayonet
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/m14/update_icon()
	..()

	if(knife)
		var/image/I = image('icons/escalation/obj/bayonets.dmi', src, "bayonet-usmc")
		I.pixel_x += 5
		I.pixel_y += 5
		overlays += I
	else
		overlays.Cut()

	if(ammo_magazine)
		icon_state = "m14"
	else
		icon_state = "m14-empty"

/obj/item/weapon/gun/projectile/automatic/m14/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr

	src.toggle_scope(usr, 1.2)

/obj/item/weapon/gun/projectile/automatic/m14/verb/remove_bayonet()
	set name = "Detach Bayonet"
	set category = "Object"
	set src in usr

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = FALSE
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		to_chat(usr, "<span class='notice'>You detach the bayonet from the [src].</span>")
		src.verbs -= /obj/item/weapon/gun/projectile/automatic/m14/verb/remove_bayonet
		update_icon()

//you are not so stupid to attach bayonet to marksman riffles, aren't you? -- close quarters sniping
/obj/item/weapon/gun/projectile/automatic/m14/scoped
	name = "M21"
	desc = "A standard-issue USMC marksman rifle. "
	icon_state = "m14scoped"
	item_state = "m14"
	accuracy = 5
	fire_delay = 3
	wielded_item_state = "m14-wielded"

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=3,    move_delay=null, one_hand_penalty=3, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/m14/scoped/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m14scoped"
	else
		icon_state = "m14scoped-empty"

/obj/item/weapon/gun/projectile/automatic/m14/scoped/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 2)

/obj/item/weapon/gun/projectile/automatic/m16a1 // Delete this later
	name = "M16A1"
	desc = "A standard-issue USMC combat rifle. Chambers 5.56x45 rounds."
	icon_state = "m16a1"
	item_state = "m16"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = /obj/item/ammo_magazine/c556x45m
	magazine_type = null
	one_hand_penalty = 4
	accuracy = 3
	fire_delay = 1.7
	automatic = 0

	wielded_item_state = "m16-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'

	var/obj/item/weapon/material/knife/bayonet/usmc/knife = FALSE

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=1.7,  move_delay=null, one_hand_penalty=4, burst_accuracy=null,              dispersion=null,                          automatic = 0),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=1,    one_hand_penalty=3, burst_accuracy=list(1,1,-1),      dispersion=list(0.3, 0.3, 0.6),           automatic = 0),
		list(mode_name="long bursts",  burst=5, fire_delay=null, move_delay=2,    one_hand_penalty=4, burst_accuracy=list(1,1,0,-1,-1), dispersion=list(0.3, 0.3, 0.6, 1.2, 1.5), automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.5,  move_delay=1,    one_hand_penalty=3, burst_accuracy = null,            dispersion=list(0.3, 0.5),                automatic = 0.7),
		)

/obj/item/weapon/gun/projectile/automatic/m16a1/New()
	..()
	src.verbs -= /obj/item/weapon/gun/projectile/automatic/m16a1/verb/remove_bayonet

/obj/item/weapon/gun/projectile/automatic/m16a1/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/usmc))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/automatic/m16a1/verb/remove_bayonet
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/m16a1/update_icon()
	..()

	if(knife)
		var/image/I = image('icons/escalation/obj/bayonets.dmi', src, "bayonet-usmc")
		I.pixel_x += 7
		I.pixel_y += 9
		overlays += I
	else
		overlays.Cut()

	if(ammo_magazine)
		icon_state = "m16a1"
	else
		icon_state = "m16a1-empty"

/obj/item/weapon/gun/projectile/automatic/m16a1/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)

/obj/item/weapon/gun/projectile/automatic/m16a1/verb/remove_bayonet()
	set name = "Detach Bayonet"
	set category = "Object"
	set src in usr
	set popup_menu = 1

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = FALSE
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		to_chat(usr, "<span class='notice'>You detach the bayonet from the [src].</span>")
		src.verbs -= /obj/item/weapon/gun/projectile/automatic/m16a1/verb/remove_bayonet
		update_icon()

/obj/item/weapon/gun/projectile/automatic/m16a1gl
	name = "M16A1"
	desc = "A standard-issue USMC combat rifle with a M203 launcher attached. Chambers 5.56x45 rounds."
	icon_state = "m16a1gl"
	item_state = "m16gl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = /obj/item/ammo_magazine/c556x45m
	magazine_type = null
	one_hand_penalty = 4
	accuracy = 3
	fire_delay = 1.7

	wielded_item_state = "m16gl-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/m203/launcher

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=1.7,  move_delay=null, one_hand_penalty=4, burst_accuracy=null,              dispersion=null,                          automatic = 0),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=1,    one_hand_penalty=3, burst_accuracy=list(1,1,-1),      dispersion=list(0.3, 0.3, 0.6),           automatic = 0),
		list(mode_name="long bursts",  burst=5, fire_delay=null, move_delay=2,    one_hand_penalty=4, burst_accuracy=list(1,1,0,-1,-1), dispersion=list(0.3, 0.3, 0.6, 1.2, 1.5), automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.5,  move_delay=1,    one_hand_penalty=3, burst_accuracy = null,            dispersion=list(0.3, 0.5),                automatic = 0.7),
		)

/obj/item/weapon/gun/projectile/automatic/m16a1gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/m16a1gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//launcher.load check it for it's type and handles all another things so don't worry
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16a1gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16a1gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //do we need it? :wha:
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16a1gl/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m16a1gl"
	else
		icon_state = "m16a1gl-empty"

/obj/item/weapon/gun/projectile/automatic/m16a1gl/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)

/obj/item/weapon/gun/projectile/automatic/m16a1gl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr
	set popup_menu = 1

	if(launcher)
		use_launcher = !use_launcher
		to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")

/obj/item/weapon/gun/projectile/automatic/svd
	name = "SVD"
	desc = "A standard-issue Soviet Army and CSLA marksman rifle. Chambers 7.62x54 rounds."
	icon_state = "svd"
	item_state = "m14"
	slot_flags = SLOT_BACK_GUN
	w_class = 5
	force = 10
	max_shells = 10
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x54s
	one_hand_penalty = 10
	accuracy = 5
	fire_delay = 3
	fire_sound = 'sound/weapons/gunshot/svd.ogg'
	wielded_item_state = "svd-wielded"
	unload_sound = 'sound/weapons/gunporn/svd_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/svd_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/svd_boltback.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=2,    move_delay=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/svd/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "svd"
	else
		icon_state = "svd-empty"

/obj/item/weapon/gun/projectile/automatic/svd/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.9)

/obj/item/weapon/gun/projectile/automatic/wa2000
	name = "WA2000"
	desc = "A specialized Bundeswehr sniper rifle. Chambers 7.62x54 rounds."
	icon_state = "svd" //fix
	item_state = "m14"
	slot_flags = SLOT_BACK_GUN
	w_class = 5
	force = 10
	max_shells = 6
	caliber = "762x54" //fix
	ammo_type = /obj/item/ammo_casing/a762x54 //fix
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x54s //fix
	one_hand_penalty = 10
	accuracy = 5
	fire_delay = 2
	fire_sound = 'sound/weapons/gunshot/svd.ogg'
	wielded_item_state = "m14-wielded" //fix
	unload_sound = 'sound/weapons/gunporn/svd_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/svd_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/svd_boltback.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=2,    move_delay=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/wa2000/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "svd" //fix
	else
		icon_state = "svd-empty" //fix

/obj/item/weapon/gun/projectile/automatic/wa2000/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.9)


/obj/item/weapon/gun/projectile/automatic/g3a3
	name = "G3A3"
	desc = "A standard-issue Bundeswehr combat rifle. Chambers 7.62x51 rounds."
	icon_state = "g3a3"
	item_state = "g3a3"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x51"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a762x51
	allowed_magazines = /obj/item/ammo_magazine/c762x51s
	magazine_type = null
	one_hand_penalty = 5
	accuracy = 3
	fire_delay = 4
	automatic = 0

	wielded_item_state = "g3a3-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'

	var/obj/item/weapon/material/knife/bayonet/bdw/knife = FALSE

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=4,    move_delay=null, one_hand_penalty=4, burst_accuracy=null,          dispersion=null,           automatic = 0),
		list(mode_name="short bursts", burst=2, fire_delay=null, move_delay=1,    one_hand_penalty=6, burst_accuracy=list(1,0),     dispersion=list(0.3, 0.6), automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.4,  move_delay=3,    one_hand_penalty=8, burst_accuracy=null, dispersion=list(0.3, 0.6 ),         automatic = 0.4)
		)

/obj/item/weapon/gun/projectile/automatic/g3a3/New()
	..()
	src.verbs -= /obj/item/weapon/gun/projectile/automatic/g3a3/verb/remove_bayonet

/obj/item/weapon/gun/projectile/automatic/g3a3/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/bdw))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/automatic/g3a3/verb/remove_bayonet
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/g3a3/update_icon()
	..()

	if(knife)
		var/image/I = image('icons/escalation/obj/bayonets.dmi', src, "bayonet-bwd")
		I.pixel_x += 6
		I.pixel_y += 13
		overlays += I
	else
		overlays.Cut()

	if(ammo_magazine)
		icon_state = "g3a3"
		item_state = "g3a3"
	else
		icon_state = "g3a3-empty"
		item_state = "g3a3-empty"

/obj/item/weapon/gun/projectile/automatic/g3a3/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)

/obj/item/weapon/gun/projectile/automatic/g3a3/verb/remove_bayonet()
	set name = "Detach Bayonet"
	set category = "Object"
	set src in usr
	set popup_menu = 1

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = FALSE
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		to_chat(usr, "<span class='notice'>You detach the bayonet from the [src].</span>")
		src.verbs -= /obj/item/weapon/gun/projectile/automatic/g3a3/verb/remove_bayonet
		update_icon()

/obj/item/weapon/gun/projectile/automatic/g3a3/old
	desc = "G3A3 Battle Rifle. This one has a wooden kit and shows signs of extended use. Chambers 7.62x51 rounds."
	icon_state = "g3a3-old"

/obj/item/weapon/gun/projectile/automatic/g3a3/old/update_icon()
	..()

	if(ammo_magazine)
		icon_state = "g3a3-old"
	else
		icon_state = "g3a3-old-empty"

/obj/item/weapon/gun/projectile/automatic/g3tgs
	name = "G3TGS"
	desc = "A standard-issue Bundeswehr combat rifle with an HK79 launcher attached. Chambers 7.62x51 rounds."
	icon_state = "g3tgs"
	item_state = "g3tgs"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x51"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a762x51
	allowed_magazines = /obj/item/ammo_magazine/c762x51s
	magazine_type = null
	one_hand_penalty = 5
	accuracy = 3
	fire_delay = 4

	wielded_item_state = "g3tgs-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/m203/launcher//m203 underslug uses 40mm shells  like hk69

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=4,    move_delay=null, one_hand_penalty=4, burst_accuracy=null,       dispersion=null,automatic = 0),
		list(mode_name="short bursts", burst=2, fire_delay=null, move_delay=1,    one_hand_penalty=3, burst_accuracy=list(1,-1), dispersion=list(0.3, 0.6),automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.4,  move_delay=3,    one_hand_penalty=5, burst_accuracy=null,       dispersion=list(0.3, 0.6, 0.9), automatic = 0.4),
		)

/obj/item/weapon/gun/projectile/automatic/g3tgs/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/g3tgs/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//launcher.load check it for it's type and handles all another things so don't worry
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/g3tgs/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/g3tgs/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //do we need it? :wha:
	else
		..()

/obj/item/weapon/gun/projectile/automatic/g3tgs/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "g3tgs"
	else
		icon_state = "g3tgs-empty"

/obj/item/weapon/gun/projectile/automatic/g3tgs/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)
/obj/item/weapon/gun/projectile/automatic/g3tgs/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	if(launcher)
		use_launcher = !use_launcher
		to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")

/obj/item/weapon/gun/projectile/automatic/g3sg1
	name = "G3SG1"
	desc = "A scoped Bundeswehr combat rifle. Chambers 7.62x51 rounds."
	icon_state = "g3sg1"
	item_state = "g3sg1"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x51"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a762x51
	allowed_magazines = /obj/item/ammo_magazine/c762x51s
	magazine_type = null
	one_hand_penalty = 5
	accuracy = 3
	fire_delay = 5
	wielded_item_state = "g3sg1-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=2,    move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/g3sg1/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "g3sg1"
	else
		icon_state = "g3sg1-empty"

/obj/item/weapon/gun/projectile/automatic/g3sg1/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.9)

/obj/item/weapon/gun/projectile/automatic/vz58
	name = "Vz.58"
	desc = "A standard-issue CSLA combat rifle. Chambers 7.62x39 rounds."
	icon_state = "vz58"
	item_state = "vz58"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = /obj/item/ammo_magazine/c762x39m
	magazine_type = null
	one_hand_penalty = 3
	accuracy = 2
	fire_delay = 3

	wielded_item_state = "vz58-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'

	var/obj/item/weapon/material/knife/bayonet/csla/knife = FALSE

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=1, move_delay=null, one_hand_penalty=4, burst_accuracy=null,              dispersion=null, automatic = 0),
		list(mode_name="short bursts", burst=3, fire_delay=4, move_delay=3,    one_hand_penalty=5, burst_accuracy=list(1,1,0),       dispersion=list(0.0, 0.3, 0.6), automatic = 0),
		list(mode_name="long bursts",  burst=5, fire_delay=5, move_delay=4,    one_hand_penalty=6, burst_accuracy=list(1,1,0,-1,-2), dispersion=list(0.3, 0.3, 0.6, 1.2, 1.5), automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=1, move_delay=1,   one_hand_penalty=3,  burst_accuracy=null,              dispersion=list(0.3, 0.6), automatic = 0,7),
		)

/obj/item/weapon/gun/projectile/automatic/vz58/New()
	src.verbs -= /obj/item/weapon/gun/projectile/automatic/vz58/verb/remove_bayonet
	..()

/obj/item/weapon/gun/projectile/automatic/vz58/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/csla))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/automatic/vz58/verb/remove_bayonet
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/vz58/update_icon()
	..()

	if(knife)
		var/image/I = image('icons/escalation/obj/bayonets.dmi', src, "bayonet-csla")
		I.pixel_x += 10
		I.pixel_y += 8
		overlays += I
	else
		overlays.Cut()

	if(ammo_magazine)
		icon_state = "vz58"
	else
		icon_state = "vz58-empty"

/obj/item/weapon/gun/projectile/automatic/vz58/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)
/obj/item/weapon/gun/projectile/automatic/vz58/verb/remove_bayonet()
	set name = "Detach Bayonet"
	set category = "Object"
	set src in usr
	set popup_menu = 1

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = FALSE
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		to_chat(usr, "<span class='notice'>You detach bayonet from the [src].</span>")
		src.verbs -= /obj/item/weapon/gun/projectile/automatic/vz58/verb/remove_bayonet
		update_icon()

/obj/item/weapon/gun/projectile/automatic/vz58/black
	desc = "A standard-issue CSLA combat rifle with a black kit and folding stock. Chambers 7.62x39"
	icon_state = "vz_black_stock"

/obj/item/weapon/gun/projectile/automatic/vz58/black/update_icon()
	..()

	if(ammo_magazine)
		icon_state = "vz_black_stock"
	else
		icon_state = "vz_black_stock-empty"


/obj/item/weapon/gun/projectile/automatic/vz58gl
	name = "Vz.58"
	desc = "A standard-issue CSLA combat rifle with a GP-25 attached."
	icon_state = "vz58gl"
	item_state = "vz58gl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = /obj/item/ammo_magazine/c762x39m
	magazine_type = null
	one_hand_penalty = 3
	accuracy = 2
	fire_delay = 3

	wielded_item_state = "vz58gl-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/gp25/launcher//19.09.17 replace with so retarded gp-70

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=1, move_delay=null, one_hand_penalty=4, burst_accuracy=null,              dispersion=null, automatic = 0),
		list(mode_name="short bursts", burst=3, fire_delay=4, move_delay=3,    one_hand_penalty=5, burst_accuracy=list(1,1,0),       dispersion=list(0.0, 0.3, 0.6), automatic = 0),
		list(mode_name="long bursts",  burst=5, fire_delay=5, move_delay=4,    one_hand_penalty=6, burst_accuracy=list(1,1,0,-1,-2), dispersion=list(0.3, 0.3, 0.6, 1.2, 1.5), automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=1, move_delay=1,   one_hand_penalty=3,  burst_accuracy=null,              dispersion=list(0.3, 0.6), automatic = 0,7),
		)

/obj/item/weapon/gun/projectile/automatic/vz58gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/vz58gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//launcher.load check it for it's type and handles all another things so don't worry
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/vz58gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/vz58gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //do we need it? :wha:
	else
		..()

/obj/item/weapon/gun/projectile/automatic/vz58gl/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "vz58gl"
	else
		icon_state = "vz58gl-empty"

/obj/item/weapon/gun/projectile/automatic/vz58gl/verb/set_gp()
	set name = "Granade launcher"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	if(launcher)
		use_launcher = !use_launcher
		to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")

/obj/item/weapon/gun/projectile/automatic/vz58gl/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)

/obj/item/weapon/gun/projectile/automatic/vz59
	name = "Vz. 59"
	desc = "A standard-issue CSLA squad support weapon. Chambers 7.62x54 rounds."
	icon_state = "vz59"
	item_state = "vz59"
	w_class = 5
	force = 15
	slot_flags = SLOT_BACK_GUN
	max_shells = 200
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x54b/csla
	one_hand_penalty = 9
	wielded_item_state = "vz59-wielded"
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'
	automatic = 0

	firemodes = list(
		list(mode_name="short bursts", burst=5, move_delay=12,  one_hand_penalty=8, burst_accuracy = list(0,-1,-1,-2,-2),          dispersion = list(0.4, 0.8, 0.8, 0.8, 1.0), automatic = 0),
		list(mode_name="long bursts",  burst=8, move_delay=15,  one_hand_penalty=9, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2), automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.5, move_delay=3,       one_hand_penalty = 8, burst_accuracy=null,     dispersion=list(0.5, 0.8),                  automatic = 0.7),
		)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/vz59/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/vz59/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user, "<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/vz59/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/vz59/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/vz59/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/vz59/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/vz59/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x54b/csla))
		icon_state = "vz59[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 200)]"
	else
		icon_state = "vz59[cover_opened ? "open" : "closed"]-empty"

/obj/item/weapon/gun/projectile/automatic/vz59/verb/ironsights()
	set name = "Use Iron Sights"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 1.2)