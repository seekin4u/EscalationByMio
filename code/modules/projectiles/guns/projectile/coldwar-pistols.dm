/obj/item/weapon/gun/projectile/automatic/coltmodel733
	name = "Colt Model 733"
	desc = "A standard-issue USMC carbine."
	icon_state = "coltmodel733"
	item_state = "m16"
	w_class = 4
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_BACK_GUN
	magazine_type = null
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = /obj/item/ammo_magazine/c556x45m
	one_hand_penalty = 2
	accuracy = 1
	fire_delay = 2
	wielded_item_state = "m16-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=1,    one_hand_penalty=3, burst_accuracy=list(1,0,-1),       dispersion=list(0.3, 0.6, 0.6)),
		list(mode_name="long bursts",   burst=5, fire_delay=null, move_delay=2,    one_hand_penalty=4, burst_accuracy=list(1,0,0,-1,-2), dispersion=list(0.3, 0.6, 0.6, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/automatic/coltmodel733/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "coltmodel733"
	else
		icon_state = "coltmodel733-empty"
