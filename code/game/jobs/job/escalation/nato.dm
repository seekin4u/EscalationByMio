

//** BUND ARMY **

/datum/job/escalation/bund
	title = "Bundeswehr"
	enabled = 0
	faction_tag = "bund" //The tag of the faction this job is a part of, for lookups

/datum/job/escalation/bund/platoonleader
	title = "Bundeswehr's Platoon Leader"
	name = "Zugführer"
	english_name = "Platoon Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Hauptmann"  //Captain
	rank_number = 0
	position = "team"
	amount = 1
	outfit_type = /decl/hierarchy/outfit/nato/bundes/platoonleader

/datum/job/escalation/bund/subleader
	title = "Bundeswehr's Vice Platoon Leader"
	name = "Zugführer stellvertretender"
	english_name = "Vice Platoon Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Oberleutnant" //1st lieutenant
	rank_number = 1
	position = "team"
	amount = 1

/datum/job/escalation/bund/squadleader
	title = "Bundeswehr's Squad Leader"
	name = "Gruppenführer"
	english_name = "Squad Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Feldwebel"
	rank_number = 2
	position = "fireteam"
	amount = 1

/datum/job/escalation/bund/subsergeant
	title = "Bundeswehr's Fireteam Leader"
	name = "Gruppenführer stellvertreter"
	english_name = "Fireteam Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Unteroffizier"  //"sergeant"
	rank_number = 3
	position = "fireteam"
	amount = 2

/datum/job/escalation/bund/machinegunner
	title = "Bundeswehr's Machinegunner"
	name = "Maschinengewehrschütze"
	english_name = "Machinegunner"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Stabsgefreiter"
	rank_number = 4
	position = "fireteam"
	amount = 2

/datum/job/escalation/bund/grunt
	title = "Bundeswehr's Soldier"
	name = "Schütze"
	english_name = "Soldier"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Soldat"
	rank_number = 5
	position = "fireteam"
	amount = 6


/datum/job/escalation/bund/fielddoctor
	title = "Bundeswehr's Head Medic"
	name = "Chef-Sanitäter"			//"chief paramedic"
	english_name = "Head Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Feldwebel"
	rank_number = 3
	position = "team"
	amount = 1

/datum/job/escalation/bund/fieldmedic
	title = "Bundeswehr's Field Paramedic"
	name = "Sanitäter"		//Lit. "paramedic"
	english_name = "Field Paramedic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Stabsgefreiter"
	rank_number = 4
	position = "team"
	amount = 3


/datum/job/escalation/bund/marksman
	title = "Bundeswehr's Designated Marksman"
	name = "Scharfshutze"
	english_name = "Designated Marksman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Stabsgefreiter"
	rank_number = 4
	position = "team"
	amount = 2



//** USMC ARMY **


/datum/job/escalation/usmc
	title = "US"
	enabled = 0
	faction_tag = "usmc"

/datum/job/escalation/usmc/lieu
	title = "US First Lieutenant"
	name = "Platoon Commander"
	english_name = "First Lieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "LT"
	rank_number = 0
	position = "team"
	amount = 1

/datum/job/escalation/usmc/lieu2
	title = "US Staff Sergeant"
	name = "Platoon Sergeant"
	english_name = "Staff Sergeant"
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "SSGT"
	rank_number = 1 //Second in command
	position = "team"
	amount = 1

/datum/job/escalation/usmc/radioman
	title = "US Warrant Officer"
	name = "Radio Telegraph Operator"
	english_name = "Warrant Officer"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "WO"
	rank_number = 2
	position = "team"
	amount = 1

/datum/job/escalation/usmc/squadleader
	title = "US Sergeant"
	name = "Fireteam Leader"
	english_name = "Sergeant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "SGT"
	rank_number = 3
	position = "fireteam"
	amount = 2

/datum/job/escalation/usmc/squadradio
	title = "US Lance-Corporal"
	name = "Radio Operator"
	english_name = "Lance-Corporal"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "LCPL"
	rank_number = 4
	position = "fireteam"
	amount = 2

/datum/job/escalation/usmc/machinegunner
	title = "US Private 1st class"
	name = "Machinegunner"
	english_name = "Private 1st class"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "PFC"
	rank_number = 5
	position = "fireteam"
	amount = 2


/datum/job/escalation/usmc/grunt
	title = "US Private"
	name = "Marine Rifleman"
	english_name = "Private"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Pvt"
	rank_number = 6
	position = "fireteam"
	amount = 4


//Not in squads - "attachments" in the marines
/datum/job/escalation/usmc/medic
	title = "US Medic"
	name = "Corpsman"
	english_name = "Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "MED"
	position = "team"
	amount = 3


/datum/job/escalation/usmc/marksman
	title = "US Sniper"
	name = "Designated Marksman"
	english_name = "Sniper"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "PFC"
	position = "team"
	amount = 2


/datum/job/escalation/usmc/headmedic
	title = "US Head Medic"
	name = "Head Medic"
	english_name = "Head Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "HMED"
	position = "team"
	amount = 1
