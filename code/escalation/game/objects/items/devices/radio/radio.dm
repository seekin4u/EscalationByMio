var/global/list/warpac_internal_channels = list(
	num2text(CA_ARMY_FREQ) = list(),
	num2text(CZ_ARMY_FREQ) = list()
)

var/global/list/nato_internal_channels = list(
	num2text(USMC_ARMY_FREQ) = list(),
	num2text(BUND_ARMY_FREQ) = list()
)

var/global/list/warpac_internal_channels_protected = list(
	num2text(CA_ARMY_FREQ_PROTECTED) = list(),
	num2text(CZ_ARMY_FREQ_PROTECTED) = list()
)

var/global/list/nato_internal_channels_protected = list(
	num2text(USMC_ARMY_FREQ_PROTECTED) = list(),
	num2text(BUND_ARMY_FREQ_PROTECTED) = list()
)

/obj/item/device/radio/command
	icon = 'icons/escalation/obj/radios.dmi'
	name = "basic comand radio"
	icon_state = "warpac_radio_item"
	item_state = "warpac_radio_item"

	subspace_transmission = 1
	flags = CONDUCT
	slot_flags = SLOT_BACK
	throw_speed = 2
	throw_range = 9
	w_class = ITEM_SIZE_HUGE


/obj/item/device/radio/command/New()
	..()
	internal_channels += warpac_internal_channels_protected
	internal_channels += nato_internal_channels_protected


/obj/item/device/radio/command/warpac
	name = "warpac comand radio"

/obj/item/device/radio/command/New()
	..()
	internal_channels = warpac_internal_channels.Copy()
	internal_channels += warpac_internal_channels_protected


/obj/item/device/radio/command/nato
	name = "nato comand radio"
	icon_state = "nato_radio_item"
	item_state = "nato_radio_item"

/obj/item/device/radio/command/New()
	..()
	internal_channels = nato_internal_channels.Copy()
	internal_channels += nato_internal_channels_protected