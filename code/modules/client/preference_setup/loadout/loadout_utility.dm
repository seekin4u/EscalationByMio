// "Useful" items - I'm guessing things that might be used at work?
/datum/gear/utility
	display_name = "briefcase"
	path = /obj/item/weapon/storage/briefcase
	sort_category = "Utility"

/datum/gear/utility/waistpack
	display_name = "waist pack"
	path = /obj/item/weapon/storage/belt/waistpack
	slot = slot_belt
	cost = 2
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/utility/folder/New()
	..()
	var/folders = list()
	folders["blue folder"] = /obj/item/weapon/folder/blue
	folders["grey folder"] = /obj/item/weapon/folder
	folders["red folder"] = /obj/item/weapon/folder/red
	folders["white folder"] = /obj/item/weapon/folder/white
	folders["yellow folder"] = /obj/item/weapon/folder/yellow
	gear_tweaks += new/datum/gear_tweak/path(folders)

/datum/gear/utility/paicard
	display_name = "personal AI device"
	path = /obj/item/device/paicard