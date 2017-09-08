//За не такие ебанутые атачменты можно сказать спасибо Авабилду и тем кто анписал этот код. Спасибо.

#define ATTACH_IRONSIGHTS 1
#define ATTACH_SCOPE 2
#define ATTACH_STOCK 4
#define ATTACH_BARREL 8
#define ATTACH_UNDER 16

/obj/item/attachment
	var/attachable = TRUE
	var/attachment_type //Use the 'ATTACH_' defines above (should only use one for this)
	var/A_attached = FALSE //Is attached

/obj/item/attachment/proc/attached(mob/user, obj/item/weapon/gun/G)
	to_chat(user,"<span class = 'notice'>You start to attach [src] to the [G].</span>")
	if(do_after(user, 15, user))
		user.unEquip(src)
		A_attached = TRUE
		G.attachment_slots -= attachment_type
		loc = G
		G.actions += actions
		G.verbs += verbs
		G.attachments += src
		G.update_attachment_actions(user)
		to_chat(user, "<span class = 'notice'>You attach [src] to the [G].</span>")
	else
		to_chat(user, "<span class = 'notice'>You decided to don't attach [src] to the [G].</span>")
	return

/obj/item/attachment/proc/removed(mob/user, obj/item/weapon/gun/G)
	if(do_after(user, 15, user))
		G.attachments -= src
		G.actions -= actions
		G.verbs -= verbs
		G.attachment_slots += attachment_type
		dropped(user)
		A_attached = FALSE
		loc = get_turf(src)
		to_chat(user, "<span class = 'notice'>You remove [src] from the [G].</span>")
	else
		return

/obj/item/weapon/gun
	var/list/attachments = list()
	var/attachment_slots = null //Use the 'ATTACH_' defines above; can ise in combination Ex. ATTACH_SCOPE|ATTACH_BARREL

/obj/item/weapon/gun/examine(mob/user)
	..()
	if(attachments.len)
		for(var/obj/item/attachment/A in attachments)
			to_chat(user, "<span class='notice'>It has [A] attached.</span>")

/obj/item/weapon/gun/dropped(mob/user)
	if(attachments.len)
		for(var/obj/item/attachment/A in attachments)
			A.dropped(user)

/obj/item/weapon/gun/pickup(mob/user)
	if(attachments.len)
		for(var/obj/item/attachment/A in attachments)
			A.pickup(user)

/obj/item/weapon/gun/verb/field_strip()
	set name = "Field Strip"
	set desc = "Removes any attachments."
	set category = "Object"
	var/mob/living/carbon/human/user = usr

	for(var/obj/item/attachment/A in attachments)
		A.removed(user, src)

//Use this under /New() of weapons if they spawn with attachments
/obj/item/weapon/gun/proc/spawn_add_attachment(obj/item/attachment/A)
	A.A_attached = TRUE
	attachment_slots -= A.attachment_type
	attachments += A
	actions += A.actions

/obj/item/weapon/gun/proc/update_attachment_actions(mob/user)
	for(var/datum/action/action in actions)
		action.Grant(user)

/obj/item/weapon/gun/proc/try_attach(obj/item/attachment/A, mob/user)
	if(!A || !user)
		return
	if(user.get_inactive_hand() != src)
		to_chat(user, "You must be holding the [src] to add attachments.")
		return
	attach_A(A, user)

//Do not use this; use try_attach instead
/obj/item/weapon/gun/proc/attach_A(obj/item/attachment/A, mob/user)
	switch(A.attachment_type)
		if(ATTACH_IRONSIGHTS)
			if(attachment_slots & ATTACH_IRONSIGHTS)
				A.attached(user, src)
			else
				to_chat(user, "You already have iron sights.")
		if(ATTACH_SCOPE)
			if(attachment_slots & ATTACH_SCOPE)
				A.attached(user, src)
			else
				to_chat(user, "You fumble around with the attachment.")
		if(ATTACH_STOCK)
			if(attachment_slots & ATTACH_STOCK)
				A.attached(user, src)
			else
				to_chat(user, "You fumble around with the attachment.")
		if(ATTACH_BARREL)
			if(attachment_slots & ATTACH_BARREL)
				A.attached(user, src)
			else
				to_chat(user, "You fumble around with the attachment.")
		if(ATTACH_UNDER)
			if(attachment_slots & ATTACH_UNDER)
				A.attached(user, src)
			else
				to_chat(user, "You fumble around with the attachment.")
		else
			to_chat(user, "[A] cannot be attached to the [src].")

//ATTACHMENTS

/obj/item/attachment/bayonet
	name = "bayonet"
	icon = 'icons/escalation/obj/items.dmi'
	icon_state = "bayonet"
	item_state = "knife"
	flags = CONDUCT
	sharp = 1
	edge = 1
	force = 50
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	attachment_type = ATTACH_BARREL
	var/attack_sound = 'sound/weapons/slice.ogg'
	//var/datum/action/bayonet/amelee

/obj/item/attachment/bayonet/attached(mob/user, obj/item/weapon/gun/G)
	..()
	G.bayonet = src

/obj/item/attachment/bayonet/removed(mob/user, obj/item/weapon/gun/G)
	..()
	G.bayonet = null