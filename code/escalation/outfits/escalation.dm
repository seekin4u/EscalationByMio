/decl/hierarchy/outfit/job/escalation
	name = "Standard Escalation Gear"
	hierarchy_type = /decl/hierarchy/outfit/job

	uniform = /obj/item/clothing/under/color/grey
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black

	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/civilian
	pda_slot = slot_belt
	pda_type = /obj/item/device/pda

/decl/hierarchy/outfit/nato
	hierarchy_type = /decl/hierarchy/outfit/nato

	shoes = /obj/item/clothing/shoes/military/nato
	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/dogtags

/decl/hierarchy/outfit/nato/bundes
	uniform = /obj/item/clothing/under/bundes
	head = /obj/item/clothing/head/helmet/bund

/decl/hierarchy/outfit/nato/bundes/platoonleader
	name = "Bundeswehr Leader"

	l_ear = /obj/item/device/radio/headset/heads/captain  //Obviously replace this with a proper walkie-talkie
	l_hand = /obj/item/device/megaphone //Why the hell not

	id_pda_assignment = "Zugführer"

