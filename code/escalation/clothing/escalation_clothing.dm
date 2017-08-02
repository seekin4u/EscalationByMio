#define USE_WINTER_CLOTHES 1

/obj/item/clothing/under/escalation
	var/winter_name
	var/winter_desc
	var/winter_icon_state
	var/winter_worn_state

/obj/item/clothing/under/escalation/New()
	..()
	if(USE_WINTER_CLOTHES)
		if(winter_name)          name = winter_name
		if(winter_desc)          desc = winter_desc
		if(winter_icon_state)    icon_state = winter_icon_state
		if(winter_worn_state)    worn_state = winter_worn_state

/obj/item/clothing/suit/armor/escalation
	var/winter_name
	var/winter_desc
	var/winter_icon_state

/obj/item/clothing/suit/armor/escalation/New()
	..()
	if(USE_WINTER_CLOTHES)
		if(winter_name)          name = winter_name
		if(winter_desc)          desc = winter_desc
		if(winter_icon_state)    icon_state = winter_icon_state

/obj/item/clothing/suit/storage/vest/escalation
	var/winter_name
	var/winter_desc
	var/winter_icon_state

/obj/item/clothing/suit/storage/vest/escalation/New()
	..()
	if(USE_WINTER_CLOTHES)
		if(winter_name)          name = winter_name
		if(winter_desc)          desc = winter_desc
		if(winter_icon_state)    icon_state = winter_icon_state

/obj/item/clothing/shoes/escalation
	var/winter_name
	var/winter_desc
	var/winter_icon_state

/obj/item/clothing/shoes/escalation/New()
	..()
	if(USE_WINTER_CLOTHES)
		if(winter_name)          name = winter_name
		if(winter_desc)          desc = winter_desc
		if(winter_icon_state)    icon_state = winter_icon_state

/obj/item/clothing/head/helmet/escalation
	var/winter_name
	var/winter_desc
	var/winter_icon_state

/obj/item/clothing/head/helmet/escalation/New()
	..()
	if(USE_WINTER_CLOTHES)
		if(winter_name)          name = winter_name
		if(winter_desc)          desc = winter_desc
		if(winter_icon_state)    icon_state = winter_icon_state

/obj/item/clothing/gloves/escalation
	var/winter_name
	var/winter_desc
	var/winter_icon_state

/obj/item/clothing/gloves/escalation/New()
	..()
	if(USE_WINTER_CLOTHES)
		if(winter_name)          name = winter_name
		if(winter_desc)          desc = winter_desc
		if(winter_icon_state)    icon_state = winter_icon_state