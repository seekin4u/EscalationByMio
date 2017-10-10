/obj/item/weapon/storage/belt
	name = "belt"
	desc = "Can hold various things."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "utilitybelt"
	item_state = "utility"
	storage_slots = 7
	max_w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	attack_verb = list("whipped", "lashed", "disciplined")
	sprite_sheets = list(SPECIES_RESOMI = 'icons/mob/species/resomi/belt.dmi')
	var/show_above_suit = 0

/obj/item/weapon/storage/belt/verb/toggle_layer()
	set name = "Switch Belt Layer"
	set category = "Object"

	if(show_above_suit == -1)
		to_chat(usr, "<span class='notice'>\The [src] cannot be worn above your suit!</span>")
		return
	show_above_suit = !show_above_suit
	update_icon()

/obj/item/weapon/storage/update_icon()
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_belt()


/obj/item/weapon/storage/belt/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(slot == slot_belt_str && contents.len)
		for(var/obj/item/I in contents)
			ret.overlays += image("icon" = 'icons/mob/belt.dmi', "icon_state" = "[I.item_state ? I.item_state : I.icon_state]")
	return ret

/obj/item/weapon/storage/belt/utility
	name = "tool-belt" //Carn: utility belt is nicer, but it bamboozles the text parsing.
	desc = "Can hold various tools."
	icon_state = "utilitybelt"
	item_state = "utility"
	can_hold = list(
		///obj/item/weapon/combitool,
		/obj/item/weapon/crowbar,
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/weldingtool,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/wrench,
		/obj/item/device/multitool,
		/obj/item/device/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/device/t_scanner,
		/obj/item/device/analyzer,
		/obj/item/taperoll/engineering,
		/obj/item/device/robotanalyzer,
		/obj/item/weapon/material/minihoe,
		/obj/item/weapon/material/hatchet,
		/obj/item/device/analyzer/plant_analyzer,
		/obj/item/taperoll,
		/obj/item/weapon/extinguisher/mini
		)


/obj/item/weapon/storage/belt/utility/full/New()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/stack/cable_coil(src,30,pick("red","yellow","orange"))


/obj/item/weapon/storage/belt/utility/atmostech/New()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/device/t_scanner(src)



/obj/item/weapon/storage/belt/medical
	name = "medical belt"
	desc = "Can hold various medical equipment."
	icon_state = "medicalbelt"
	item_state = "medical"
	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/weapon/dnainjector,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/glass/bottle,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/flame/lighter/zippo,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/device/flashlight/pen,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/weapon/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/weapon/crowbar,
		/obj/item/device/flashlight,
		/obj/item/taperoll,
		/obj/item/weapon/extinguisher/mini
		)

/obj/item/weapon/storage/belt/medical/emt
	name = "EMT utility belt"
	desc = "A sturdy black webbing belt with attached pouches."
	icon_state = "emsbelt"
	item_state = "emsbelt"

/obj/item/weapon/storage/belt/security
	name = "security belt"
	desc = "Can hold security gear like handcuffs and flashes."
	icon_state = "securitybelt"
	item_state = "security"
	can_hold = list(
		/obj/item/weapon/grenade,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/weapon/handcuffs,
		/obj/item/device/flash,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_magazine,
		/obj/item/weapon/reagent_containers/food/snacks/donut/,
		/obj/item/weapon/melee/baton,
		/obj/item/weapon/gun/energy/taser,
		/obj/item/weapon/gun/energy/stunrevolver,
		/obj/item/weapon/flame/lighter,
		/obj/item/clothing/glasses/hud/security,
		/obj/item/device/flashlight,
		/obj/item/device/pda,
		/obj/item/device/radio/headset,
		/obj/item/device/hailer,
		/obj/item/device/megaphone,
		/obj/item/weapon/melee,
		/obj/item/weapon/gun/projectile/sec,
		/obj/item/taperoll
		)

/obj/item/weapon/storage/belt/soulstone
	name = "soul stone belt"
	desc = "Designed for ease of access to the shards during a fight, as to not let a single enemy spirit slip away."
	icon_state = "soulstonebelt"
	item_state = "soulstonebelt"
	storage_slots = 6
	can_hold = list(
		/obj/item/device/soulstone
		)

/obj/item/weapon/storage/belt/soulstone/full/New()
	..()
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)


/obj/item/weapon/storage/belt/champion
	name = "championship belt"
	desc = "Proves to the world that you are the strongest!"
	icon_state = "championbelt"
	item_state = "champion"
	storage_slots = 1
	can_hold = list(
		/obj/item/clothing/mask/luchador
		)

/obj/item/weapon/storage/belt/security/tactical
	name = "combat belt"
	desc = "Can hold security gear like handcuffs and flashes, with more pouches for more storage."
	icon_state = "swatbelt"
	item_state = "swatbelt"
	storage_slots = 9

/obj/item/weapon/storage/belt/waistpack
	name = "waist pack"
	desc = "A small bag designed to be worn on the waist. May make your butt look big."
	icon_state = "fannypack_white"
	item_state = "fannypack_white"
	storage_slots = null
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = ITEM_SIZE_SMALL * 4
	slot_flags = SLOT_BELT | SLOT_BACK

/obj/item/weapon/storage/belt/waistpack/big
	name = "large waist pack"
	desc = "An bag designed to be worn on the waist. Definitely makes your butt look big."
	icon_state = "fannypack_big_white"
	item_state = "fannypack_big_white"
	w_class = ITEM_SIZE_LARGE
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = ITEM_SIZE_NORMAL * 4

/obj/item/weapon/storage/belt/waistpack/big/New()
	..()
	slowdown_per_slot[slot_belt] = 3

// SATCHELS //

/obj/item/weapon/storage/belt/bdw
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "BDW Field Pack"
	desc = "Standart satchel of the Bundeswehr infantry."
	icon_state = "bdw"
	item_state = "bdw"
	storage_slots = 5

/obj/item/weapon/storage/belt/bdw/medical
	name = "BDW Medical Satchel"
	max_w_class = ITEM_SIZE_NORMAL
	desc = "Standart satchel of the Bundeswehr medics."
	icon_state = "bdw_med"
	item_state = "bdw_med"
	storage_slots = 7
	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/weapon/dnainjector,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/glass/bottle,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/flame/lighter/zippo,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/device/flashlight/pen,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/weapon/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/weapon/crowbar,
		/obj/item/device/flashlight,
		/obj/item/taperoll,
		/obj/item/weapon/extinguisher/mini
		)

/obj/item/weapon/storage/belt/usmc
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "USMC Field Pack"
	desc = "Standart satchel of the USMC infantry. Reffered to as Butt Pack."
	icon_state = "usmc"
	item_state = "usmc"
	storage_slots = 5

/obj/item/weapon/storage/belt/usmc/medical
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "USMC Medical Pack"
	desc = "Standart satchel of the USMC medics."
	icon_state = "usmc_med"
	item_state = "usmc_med"
	storage_slots = 7
	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/weapon/dnainjector,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/glass/bottle,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/flame/lighter/zippo,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/device/flashlight/pen,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/weapon/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/weapon/crowbar,
		/obj/item/device/flashlight,
		/obj/item/taperoll,
		/obj/item/weapon/extinguisher/mini
		)

/obj/item/weapon/storage/belt/sa
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "SA Field Pack"
	desc = "Standart satchel of the SA infantry."
	icon_state = "sa"
	item_state = "sa"
	storage_slots = 5

/obj/item/weapon/storage/belt/sa/medical
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "SA Medical Pack"
	desc = "Standart satchel of the SA medics."
	icon_state = "sa_med"
	item_state = "sa_med"
	storage_slots = 7
	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/weapon/dnainjector,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/glass/bottle,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/flame/lighter/zippo,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/device/flashlight/pen,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/weapon/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/weapon/crowbar,
		/obj/item/device/flashlight,
		/obj/item/taperoll,
		/obj/item/weapon/extinguisher/mini
		)

/obj/item/weapon/storage/belt/csla
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "CSLA Field Pack"
	desc = "Standart satchel of the CSLA infantry."
	icon_state = "csla"
	item_state = "csla"
	storage_slots = 5

/obj/item/weapon/storage/belt/csla/medical
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "CSLA Medical Pack"
	desc = "Standart satchel of the CSLA medics."
	icon_state = "csla_med"
	item_state = "csla_med"
	storage_slots = 7
	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/weapon/dnainjector,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/glass/bottle,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/flame/lighter/zippo,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/device/flashlight/pen,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/weapon/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/weapon/crowbar,
		/obj/item/device/flashlight,
		/obj/item/taperoll,
		/obj/item/weapon/extinguisher/mini
		)

// POUCHES //

/obj/item/weapon/storage/belt/suit/ammo/bdw
	w_class = ITEM_SIZE_HUGE
	name = "BDW Ammo Pouch"
	desc = "Have enough space to hold 4 magazines."
	icon_state = "bdw_ammo"
	item_state = "bdw_ammo"
	storage_slots = 4
	slot_flags = SLOT_BELT
	can_hold = list(
		/obj/item/ammo_magazine/c762x51s,
		/obj/item/ammo_magazine/a9x19
		)

/obj/item/weapon/storage/belt/suit/ammo/bdw/lmg
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "MG3 Ammo Pouch"
	desc = "Have enough space to hold 2 boxes."
	icon_state = "bdw_ammo_lmg"
	storage_slots = 2
	can_hold = list(
		/obj/item/ammo_magazine/c762x51b/bdw
		)

/obj/item/weapon/storage/belt/suit/ammo/usmc
	w_class = ITEM_SIZE_HUGE
	name = "USMC Ammo Pouch"
	desc = "Have enough space to hold 4 magazines."
	icon_state = "usmc_ammo"
	item_state = "usmc_ammo"
	storage_slots = 4
	slot_flags = SLOT_BELT
	can_hold = list(
		/obj/item/ammo_magazine/c556x45m,
		/obj/item/ammo_magazine/c762x51s,
		/obj/item/ammo_magazine/c45m
		)

/obj/item/weapon/storage/belt/suit/ammo/usmc/lmg
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "M60 Ammo Pouch"
	desc = "Have enough space to hold one box."
	icon_state = "usmc_ammo_lmg"
	storage_slots = 1
	can_hold = list(
		/obj/item/ammo_magazine/c762x51b
		)

/obj/item/weapon/storage/belt/suit/ammo/sa
	w_class = ITEM_SIZE_HUGE
	name = "SA Ammo Pouch"
	desc = "Have enough space to hold 4 magazines."
	icon_state = "sa_ammo"
	item_state = "sa_ammo"
	storage_slots = 4
	slot_flags = SLOT_BELT
	can_hold = list(
		/obj/item/ammo_magazine/c545x39m,
		/obj/item/ammo_magazine/c545x39b,
		/obj/item/ammo_magazine/c762x54s,
		/obj/item/ammo_magazine/a9x18
		)

/obj/item/weapon/storage/belt/suit/ammo/sa/lmg
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "PKM Ammo Pouch"
	desc = "Have enough space to hold one box."
	icon_state = "sa_ammo_lmg"
	storage_slots = 1
	can_hold = list(
		/obj/item/ammo_magazine/c762x54b
		)

/obj/item/weapon/storage/belt/suit/ammo/csla
	w_class = ITEM_SIZE_HUGE
	name = "CSLA Ammo Pouch"
	desc = "Have enough space to hold 4 magazines."
	icon_state = "csla_ammo"
	item_state = "csla_ammo"
	storage_slots = 4
	slot_flags = SLOT_BELT
	can_hold = list(
		/obj/item/ammo_magazine/c762x39m,
		/obj/item/ammo_magazine/c762x54s,
		/obj/item/ammo_magazine/a9x18
		)

/obj/item/weapon/storage/belt/suit/ammo/csla/lmg
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "VZ.59 Ammo Pouch"
	desc = "Have enough space to hold one box."
	icon_state = "csla_ammo_lmg"
	storage_slots = 1
	can_hold = list(
		/obj/item/ammo_magazine/c762x54b/csla
		)


/obj/item/weapon/storage/belt/suit/surgery
	w_class = ITEM_SIZE_HUGE
	name = "Field Surgery Kit"
	desc = "Saves lifes."
	icon_state = "surgical"
	item_state = null
	storage_slots = 7
	slot_flags = SLOT_BELT
	can_hold = list(
		/obj/item/weapon/retractor,
		/obj/item/weapon/hemostat,
		/obj/item/weapon/needle,
		/obj/item/weapon/scalpel,
		/obj/item/weapon/setofplates,
		/obj/item/weapon/bonesetter,
		/obj/item/weapon/FixOVein
		)
	startswith = list(
		/obj/item/weapon/retractor,
		/obj/item/weapon/hemostat,
		/obj/item/weapon/needle,
		/obj/item/weapon/scalpel,
		/obj/item/weapon/setofplates,
		/obj/item/weapon/bonesetter,
		/obj/item/weapon/FixOVein
		)

/obj/item/weapon/storage/belt/holster
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	name = "Sidearm Holster"
	desc = "This holster can hold pistol and one magazine."
	icon_state = "holster"
	item_state = null
	slot_flags = SLOT_ID
	max_storage_space = 3
	storage_slots = null

/obj/item/weapon/storage/belt/holster/sa
	name = "SA Sidearm Holster"
	desc = "This holster can hold Makarov pistol and one magazine."
	startswith = list(
		/obj/item/weapon/gun/projectile/makarov,
		/obj/item/ammo_magazine/a9x18
		)
	can_hold = list(
		/obj/item/weapon/gun/projectile/makarov,
		/obj/item/ammo_magazine/a9x18
		)

/obj/item/weapon/storage/belt/holster/csla
	name = "CSLA Sidearm Holster"
	desc = "This holster can hold CZ82 pistol and one magazine."
	startswith = list(
		/obj/item/weapon/gun/projectile/cz82,
		/obj/item/ammo_magazine/a9x18
		)
	can_hold = list(
		/obj/item/weapon/gun/projectile/cz82,
		/obj/item/ammo_magazine/a9x18
		)

/obj/item/weapon/storage/belt/holster/usmc
	name = "USMC Sidearm Holster"
	desc = "This holster can hold M1911A1 and one magazine."
	startswith = list(
		/obj/item/weapon/gun/projectile/colt911,
		/obj/item/ammo_magazine/c45m
		)
	can_hold = list(
		/obj/item/weapon/gun/projectile/colt911,
		/obj/item/ammo_magazine/c45m
		)

/obj/item/weapon/storage/belt/holster/bdw
	name = "BDW Sidearm Holster"
	desc = "This holster can hold Walter P1 and one magazine."
	startswith = list(
		/obj/item/weapon/gun/projectile/walther,
		/obj/item/ammo_magazine/a9x19
		)
	can_hold = list(
		/obj/item/weapon/gun/projectile/walther,
		/obj/item/ammo_magazine/a9x19
		)