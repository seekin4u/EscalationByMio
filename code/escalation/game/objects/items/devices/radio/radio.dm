var/global/list/warpac_internal_channels = list(
	num2text(CA_ARMY_FREQ) = list(),
	num2text(CZ_ARMY_FREQ) = list()
                                               )

var/global/list/nato_internal_channels = list(
	num2text(USMC_ARMY_FREQ) = list(),
	num2text(BUND_ARMY_FREQ) = list()
                                               )

/obj/item/device/radio/command
	icon = 'icons/obj/radio.dmi'
	name = "basic comand radio"
	icon_state = "walkietalkie"
	item_state = "walkietalkie"

	subspace_transmission = 1
	flags = CONDUCT
	slot_flags = SLOT_BELT
	throw_speed = 2
	throw_range = 9
	w_class = ITEM_SIZE_SMALL


/obj/item/device/radio/command/New()
	..()



/obj/item/device/radio/command/warpac
	icon = 'icons/obj/radio.dmi'
	name = "warpac comand radio"
	icon_state = "walkietalkie"
	item_state = "walkietalkie"

	subspace_transmission = 1
	flags = CONDUCT
	slot_flags = SLOT_BELT
	throw_speed = 2
	throw_range = 9
	w_class = ITEM_SIZE_SMALL


/obj/item/device/radio/command/New()
	..()
	internal_channels = warpac_internal_channels.Copy()

/obj/item/device/radio/command/nato
	icon = 'icons/obj/radio.dmi'
	name = "nato comand radio"
	icon_state = "walkietalkie"
	item_state = "walkietalkie"

	subspace_transmission = 1
	flags = CONDUCT
	slot_flags = SLOT_BELT
	throw_speed = 2
	throw_range = 9
	w_class = ITEM_SIZE_SMALL


/obj/item/device/radio/command/New()
	..()
	internal_channels = warpac_internal_channels.Copy()