/obj/item/clothing/suit/armor/escalation/soviet
	name = "6B2 Armor Vest"
	desc = "Light fabric vest with titanium plates. Good for keeping your organs inside."
	icon_state = "6b2"
//	allowed = list(/obj/item/weapon/gun/energy,/obj/item/device/radio,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 30, bullet = 35, laser = 20, energy = 10, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/escalation/flakvest
	name = "M69 Flak Vest"
	desc = "A lightweight vest designed mostly to stop shrapnel. WONT BE USED INGAME MOST LIKELY DO NOT PLACE IT IN MAP"
	icon_state = "usmc_flakvest"
//	allowed = list(/obj/item/weapon/gun/energy,/obj/item/device/radio,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 30, bullet = 10, laser = 20, energy = 10, bomb = 25, bio = 0, rad = 0)
	allowed = list(
		/obj/item/weapon/storage/belt/suit
		)

/obj/item/clothing/suit/armor/escalation/pasgt
	name = "PASGT Vest"
	desc = "A protective kevlar vest."
	icon_state = "pasgt_olive"
//	allowed = list(/obj/item/weapon/gun/energy,/obj/item/device/radio,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 30, bullet = 35, laser = 20, energy = 10, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/escalation/pasgt/woodland
	name = "PASGT Vest"
	desc = "A protective kevlar vest."
	icon_state = "pasgt_woodland"
	allowed = list(/obj/item/weapon/storage/belt/suit)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 30, bullet = 35, laser = 20, energy = 10, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/vest/escalation/soviet_heavy
	name = "6B3 Heavy Armor Vest"
	desc = "Heavy armored vest with several pouches. Good for keeping your organs inside."
	icon_state = "6b3"
	allowed = list(/obj/item/weapon/gun/projectile,/obj/item/device/radio,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/handcuffs)
	armor = list(melee = 40, bullet = 55, laser = 20, energy = 10, bomb = 40, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO
	heat_protection = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/suit/storage/vest/escalation/usmc_harness
	name = "USMC Harness"
	desc = "A set of straps, pouches, and attachment points for carrying equipment."
	icon_state = "usmc_harness"
	item_state = "usmc_harness"
	armor = list(melee = 10, bullet = 5, laser = 20, energy = 20, bomb = 5, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO
	cold_protection = UPPER_TORSO
	heat_protection = UPPER_TORSO
	allowed = list(/obj/item/weapon/storage/belt/suit)

/obj/item/clothing/suit/storage/vest/escalation/bdw_harness
	name = "BDW Harness"
	desc = "A set of straps, pouches, and attachment points for carrying equipment."
	icon_state = "bdw_harness"
	item_state = "bdw_harness"
	armor = list(melee = 10, bullet = 5, laser = 20, energy = 20, bomb = 5, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO
	cold_protection = UPPER_TORSO
	heat_protection = UPPER_TORSO
	allowed = list(/obj/item/weapon/storage/belt/suit)

/obj/item/clothing/suit/storage/vest/escalation/sa_harness
	name = "SA Harness"
	desc = "A set of straps, pouches, and attachment points for carrying equipment."
	icon_state = "sa_harness"
	item_state = "sa_harness"
	armor = list(melee = 10, bullet = 5, laser = 20, energy = 20, bomb = 5, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO
	cold_protection = UPPER_TORSO
	heat_protection = UPPER_TORSO
	allowed = list(/obj/item/weapon/storage/belt/suit)

/obj/item/clothing/suit/storage/vest/escalation/csla_harness
	name = "CSLA Harness"
	desc = "A set of straps, pouches, and attachment points for carrying equipment."
	icon_state = "csla_harness"
	item_state = "csla_harness"
	armor = list(melee = 10, bullet = 5, laser = 20, energy = 20, bomb = 5, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO
	cold_protection = UPPER_TORSO
	heat_protection = UPPER_TORSO
	allowed = list(/obj/item/weapon/storage/belt/suit)
