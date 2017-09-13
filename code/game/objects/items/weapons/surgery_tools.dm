/* Surgery Tools
 * Contains:
 *		Retractor
 *		Hemostat
 *		Needle
 *		Surgical Drill
 *		Scalpel
 *		Circular Saw
 */

/*
 * Retractor
 */
/obj/item/weapon/retractor
	name = "retractor"
	desc = "Retracts stuff."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "retractor"
	matter = list(DEFAULT_WALL_MATERIAL = 10000, "glass" = 5000)
	flags = CONDUCT
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)

/*
 * Hemostat
 */
/obj/item/weapon/hemostat
	name = "hemostat"
	desc = "You think you have seen this before."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "hemostat"
	matter = list(DEFAULT_WALL_MATERIAL = 5000, "glass" = 2500)
	flags = CONDUCT
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	attack_verb = list("attacked", "pinched")

/*
 * Needle
 */
/obj/item/weapon/needle
	name = "surgical needle"
	desc = "This stops bleeding."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "needle"
	matter = list(DEFAULT_WALL_MATERIAL = 5000, "glass" = 2500)
	flags = CONDUCT
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	attack_verb = list("punctured")

/*
 * Surgical Drill
 */
/obj/item/weapon/surgicaldrill
	name = "surgical drill"
	desc = "You can drill using this item. You dig?"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "drill"
	hitsound = 'sound/weapons/circsawhit.ogg'
	matter = list(DEFAULT_WALL_MATERIAL = 15000, "glass" = 10000)
	flags = CONDUCT
	force = 15.0
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	attack_verb = list("drilled")

/*
 * Scalpel
 */
/obj/item/weapon/scalpel
	name = "scalpel"
	desc = "Cut, cut, and once more cut."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "scalpel"
	flags = CONDUCT
	force = 10.0
	sharp = 1
	edge = 1
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	throwforce = 5.0
	throw_speed = 3
	throw_range = 5
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 10000, "glass" = 5000)
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/*
 * Researchable Scalpels
 */
/obj/item/weapon/scalpel/laser1
	name = "laser scalpel"
	desc = "A scalpel augmented with a directed laser, for more precise cutting without blood entering the field.  This one looks basic and could be improved."
	icon_state = "scalpel_laser1_on"
	damtype = "fire"

/obj/item/weapon/scalpel/laser2
	name = "laser scalpel"
	desc = "A scalpel augmented with a directed laser, for more precise cutting without blood entering the field.  This one looks somewhat advanced."
	icon_state = "scalpel_laser2_on"
	damtype = "fire"
	force = 12.0

/obj/item/weapon/scalpel/laser3
	name = "laser scalpel"
	desc = "A scalpel augmented with a directed laser, for more precise cutting without blood entering the field.  This one looks to be the pinnacle of precision energy cutlery!"
	icon_state = "scalpel_laser3_on"
	damtype = "fire"
	force = 15.0

/obj/item/weapon/scalpel/manager
	name = "incision management system"
	desc = "A true extension of the surgeon's body, this marvel instantly and completely prepares an incision allowing for the immediate commencement of therapeutic steps."
	icon_state = "scalpel_manager_on"
	force = 7.5

/*
 * Circular Saw
 */
/obj/item/weapon/circular_saw
	name = "circular saw"
	desc = "For heavy duty cutting."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "saw3"
	hitsound = 'sound/weapons/circsawhit.ogg'
	flags = CONDUCT
	force = 15.0
	w_class = ITEM_SIZE_NORMAL
	throwforce = 9.0
	throw_speed = 3
	throw_range = 5
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 20000,"glass" = 10000)
	attack_verb = list("attacked", "slashed", "sawed", "cut")
	sharp = 1
	edge = 1

//misc, formerly from code/defines/weapons.dm

/obj/item/weapon/setofplates
	name = "set of plates"
	desc = "Set of plates and pins of different sizes and forms."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "setofplates"
	force = 0
	w_class = ITEM_SIZE_NORMAL
	throwforce = 1.0

/obj/item/weapon/setofplates/attack_hand(mob/user as mob)
	if(!ishuman(user))
		return
	if(user.get_inactive_hand() != src)
		return ..()
	var/mob/living/carbon/human/H = user
	var/obj/item/organ/external/temp = H.organs_by_name[BP_R_HAND]
	if (H.hand)
		temp = H.organs_by_name[BP_L_HAND]
	if(temp && !temp.is_usable())
		to_chat(user, "<span class='notice'>You try to move your [temp.name], but cannot!</span>")
		return

	var/obj/item/weapon/plate/P
	P = new /obj/item/weapon/plate
	P.loc = user.loc
	user.put_in_hands(P)
	to_chat(user, "<span class='notice'>You took \the [P.name] out of the case.</span>")

/obj/item/weapon/plate
	name = "plate"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "plate0"
	force = 0
	w_class = ITEM_SIZE_TINY
	throwforce = 1.0

/obj/item/weapon/plate/New()
	..()
	icon_state = "plate[rand(0, 4)]"

/obj/item/weapon/FixOVein
	name = "cautery"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "cautery"
	force = 0
	throwforce = 1.0
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 3)
	w_class = ITEM_SIZE_SMALL
	var/usage_amount = 10

/obj/item/weapon/bonesetter
	name = "bone setter"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "bone setter"
	force = 8.0
	throwforce = 9.0
	throw_speed = 3
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("attacked", "hit", "bludgeoned")
