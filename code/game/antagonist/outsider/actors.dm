var/datum/antagonist/actor/actor

/datum/antagonist/actor
	id = MODE_ACTOR
	role_text = "NanoTrasen Actor"
	role_text_plural = "NanoTrasen Actors"
	welcome_text = "You've been hired to entertain people through the power of television!"
	landmark_id = "ActorSpawn"
	id_type = /obj/item/weapon/card/id/syndicate

	flags = ANTAG_OVERRIDE_JOB | ANTAG_SET_APPEARANCE | ANTAG_CHOOSE_NAME | ANTAG_RANDOM_EXCEPTED

	hard_cap = 7
	hard_cap_round = 10
	initial_spawn_req = 1
	initial_spawn_target = 1
	show_objectives_on_creation = 0 //actors are not antagonists and do not need the antagonist greet text

/datum/antagonist/actor/New()
	..()
	actor = src

/datum/antagonist/actor/greet(var/datum/mind/player)
	if(!..())
		return

	player.current.show_message("You work for [using_map.company_name], tasked with the production and broadcasting of entertainment to all of its assets.")
	player.current.show_message("Entertain the crew! Try not to disrupt them from their work too much and remind them how great [using_map.company_name] is!")

/datum/antagonist/actor/equip(var/mob/living/carbon/human/player)
	return 1