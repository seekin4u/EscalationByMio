//Torch ID Cards (they have to be here to make the outfits work, no way around it)

/obj/item/weapon/card/id/torch
	name = "identification card"
	desc = "An identification card issued to personnel aboard the SEV Torch."
	icon_state = "id"
	item_state = "card-id"
	job_access_type = /datum/job/escalation/assistant

/obj/item/weapon/card/id/torch/silver
	desc = "A silver identification card belonging to heads of staff."
	icon_state = "silver"
	item_state = "silver_id"
	job_access_type = /datum/job/escalation/hop

/obj/item/weapon/card/id/torch/gold
	desc = "A golden identification card belonging to the Commanding Officer."
	icon_state = "gold"
	item_state = "gold_id"
	job_access_type = /datum/job/escalation/captain

/obj/item/weapon/card/id/torch/captains_spare
	name = "commanding officer's spare ID"
	desc = "The skipper's spare ID."
	icon_state = "gold"
	item_state = "gold_id"
	registered_name = "Commanding Officer"
	assignment = "Commanding Officer"
/obj/item/weapon/card/id/torch/captains_spare/New()
	access = get_all_station_access()
	..()


// SolGov Crew and Contractors
/obj/item/weapon/card/id/torch/crew
	desc = "An identification card issued to SolGov crewmembers aboard the SEV Torch."
	icon_state = "solgov"
	job_access_type = /datum/job/escalation/crew


/obj/item/weapon/card/id/torch/contractor
	desc = "An identification card issued to private contractors aboard the SEV Torch."
	icon_state = "civ"
	job_access_type = /datum/job/escalation/assistant


/obj/item/weapon/card/id/torch/silver/medical
	job_access_type = /datum/job/escalation/cmo

/obj/item/weapon/card/id/torch/crew/medical
	job_access_type = /datum/job/escalation/doctor

/obj/item/weapon/card/id/torch/crew/medical/senior
	job_access_type = /datum/job/escalation/senior_doctor

/obj/item/weapon/card/id/torch/contractor/medical
	job_access_type = /datum/job/escalation/doctor_contractor

/obj/item/weapon/card/id/torch/contractor/medical/chemist
	job_access_type = /datum/job/escalation/chemist

/obj/item/weapon/card/id/torch/contractor/medical/counselor
	job_access_type = /datum/job/escalation/psychiatrist


/obj/item/weapon/card/id/torch/silver/security
	job_access_type = /datum/job/escalation/hos

/obj/item/weapon/card/id/torch/crew/security
	job_access_type = /datum/job/escalation/officer

/obj/item/weapon/card/id/torch/crew/security/brigofficer
	job_access_type = /datum/job/escalation/warden

/obj/item/weapon/card/id/torch/crew/security/forensic
	job_access_type = /datum/job/escalation/detective


/obj/item/weapon/card/id/torch/silver/engineering
	job_access_type = /datum/job/escalation/chief_engineer

/obj/item/weapon/card/id/torch/crew/engineering
	job_access_type = /datum/job/escalation/engineer

/obj/item/weapon/card/id/torch/crew/engineering/senior
	job_access_type = /datum/job/escalation/senior_engineer

/obj/item/weapon/card/id/torch/contractor/engineering
	job_access_type = /datum/job/escalation/engineer_contractor

/obj/item/weapon/card/id/torch/contractor/engineering/roboticist
	job_access_type = /datum/job/escalation/roboticist


/obj/item/weapon/card/id/torch/crew/supply/deckofficer
	job_access_type = /datum/job/escalation/qm

/obj/item/weapon/card/id/torch/crew/supply
	job_access_type = /datum/job/escalation/cargo_tech

/obj/item/weapon/card/id/torch/contractor/supply
	job_access_type = /datum/job/escalation/cargo_contractor


/obj/item/weapon/card/id/torch/crew/service //unused
	job_access_type = /datum/job/escalation/assistant

/obj/item/weapon/card/id/torch/crew/service/janitor
	job_access_type = /datum/job/escalation/janitor

/obj/item/weapon/card/id/torch/crew/service/chef
	job_access_type = /datum/job/escalation/chef

/obj/item/weapon/card/id/torch/crew/solgov_pilot
	job_access_type = /datum/job/escalation/solgov_pilot

/obj/item/weapon/card/id/torch/contractor/service //unused
	job_access_type = /datum/job/escalation/assistant

/obj/item/weapon/card/id/torch/contractor/service/bartender
	job_access_type = /datum/job/escalation/bartender


/obj/item/weapon/card/id/torch/crew/representative
	job_access_type = /datum/job/escalation/representative

/obj/item/weapon/card/id/torch/crew/sea
	job_access_type = /datum/job/escalation/sea

/obj/item/weapon/card/id/torch/crew/bridgeofficer
	job_access_type = /datum/job/escalation/bridgeofficer

//NanoTrasen and Passengers

/obj/item/weapon/card/id/torch/passenger
	desc = "A card issued to passengers and off-duty personnel aboard the SEV Torch."
	icon_state = "id"
	job_access_type = /datum/job/escalation/assistant

/obj/item/weapon/card/id/torch/passenger/research
	desc = "A card issued to NanoTrasen personnel aboard the SEV Torch."
	icon_state = "corporate"
	job_access_type = /datum/job/escalation/scientist_assistant

/obj/item/weapon/card/id/torch/silver/research
	job_access_type = /datum/job/escalation/rd

/obj/item/weapon/card/id/torch/passenger/research/senior_scientist
	job_access_type = /datum/job/escalation/senior_scientist

/obj/item/weapon/card/id/torch/passenger/research/nt_pilot
	job_access_type = /datum/job/escalation/nt_pilot

/obj/item/weapon/card/id/torch/passenger/research/scientist
	job_access_type = /datum/job/escalation/scientist

/obj/item/weapon/card/id/torch/passenger/research/mining
	job_access_type = /datum/job/escalation/mining

/obj/item/weapon/card/id/torch/passenger/research/guard
	job_access_type = /datum/job/escalation/guard

/obj/item/weapon/card/id/torch/passenger/research/liaison
	job_access_type = /datum/job/escalation/liaison


//Merchant
/obj/item/weapon/card/id/torch/merchant
	desc = "An identification card issued to Merchants, indicating their right to sell and buy goods."
	icon_state = "trader"
	job_access_type = /datum/job/escalation/merchant

