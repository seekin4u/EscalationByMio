

//** BUND ARMY **

/datum/job/escalation/bund
	title = "Bundeswehr"
	enabled = 0
	faction_tag = "bund" //The tag of the faction this job is a part of, for lookups

/datum/job/escalation/bund/platoonleader
	title = "Deutscher Zugfuhrer"
	name = "Zugfuhrer"
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
	title = "Deutscher Zugfuhrer Stellvertretender"
	name = "Zugfuhrer stellvertretender"
	english_name = "Vice Platoon Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Oberleutnant" //1st lieutenant
	rank_number = 1
	position = "team"
	amount = 1

/datum/job/escalation/bund/squadleader
	title = "Deutscher Gruppenfuhrer"
	name = "Gruppenfuhrer"
	english_name = "Squad Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Feldwebel"
	rank_number = 2
	position = "fireteam"
	amount = 1

/datum/job/escalation/bund/subsergeant
	title = "Deutscher Gruppenfuhrer stellvertreter"
	name = "Gruppenfuhrer stellvertreter"
	english_name = "Fireteam Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Unteroffizier"  //"sergeant"
	rank_number = 3
	position = "fireteam"
	amount = 2

/datum/job/escalation/bund/machinegunner
	title = "Deutscher Maschingewehrshutze"
	name = "Maschinengewehrschutze"
	english_name = "Machinegunner"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Stabsgefreiter"
	rank_number = 4
	position = "fireteam"
	amount = 2

/datum/job/escalation/bund/grunt
	title = "Deutscher Schutze"
	name = "Schutze"
	english_name = "Soldier"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Soldat"
	rank_number = 5
	position = "fireteam"
	amount = 6


/datum/job/escalation/bund/fielddoctor
	title = "Deutscher Chef-Sanitater"
	name = "Chef-Sanitater"			//"chief paramedic"
	english_name = "Head Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Feldwebel"
	rank_number = 3
	position = "team"
	amount = 1

/datum/job/escalation/bund/fieldmedic
	title = "Deutscher Sanitater"
	name = "Sanitater"		//Lit. "paramedic"
	english_name = "Field Paramedic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Stabsgefreiter"
	rank_number = 4
	position = "team"
	amount = 3


/datum/job/escalation/bund/marksman
	title = "Deutscher Scharfschutze"
	name = "Scharfschutze"
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
	title = "US Platoon Commander"
	name = "Platoon Commander"
	english_name = "First Lieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "1stLT"
	rank_number = 0
	position = "team"
	amount = 1

/datum/job/escalation/usmc/lieu2
	title = "US Platoon Sergeant"
	name = "Platoon Sergeant"
	english_name = "Staff Sergeant"
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "SSGT"
	rank_number = 1 //Second in command
	position = "team"
	amount = 1

/datum/job/escalation/usmc/radioman
	title = "US Radio Telegraph Operator"
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
	title = "US Fireteam Leader"
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
	title = "US Radio Operator"
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
	title = "US Machinegunner"
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
	title = "US Rifleman"
	name = "Rifleman"
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
	title = "US Corpsman"
	name = "Corpsman"
	english_name = "Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "PFC"
	position = "team"
	amount = 3


/datum/job/escalation/usmc/marksman
	title = "US Designated Marksman"
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
	english_name = "Second Lieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "2ndLT"
	position = "team"
	amount = 1
