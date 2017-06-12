

//** BUND ARMY **

/datum/army_job/bund
	enabled = 0
	faction_tag = "bund" //The tag of the faction this job is a part of, for lookups

/datum/army_job/bund/platoonleader
	name = "Zugführer"
	english_name = "Platoon Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Hauptmann"  //Captain
	rank_number = 0
	position = "team"
	amount = 1

/datum/army_job/bund/subleader
	name = "Zugführer stellvertretender"
	english_name = "Vice Platoon Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Oberleutnant" //1st lieutenant
	rank_number = 1
	position = "team"
	amount = 1

/datum/army_job/bund/squadleader
	name = "Gruppenführer"
	english_name = "Squad Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Feldwebel"  
	rank_number = 2
	position = "fireteam"
	amount = 1

/datum/army_job/bund/subsergeant
	name = "Gruppenführer stellvertreter"
	english_name = "Fireteam Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Unteroffizier"  //"sergeant"
	rank_number = 3
	position = "fireteam"
	amount = 2

/datum/army_job/bund/machinegunner
	name = "Maschinengewehrschütze"
	english_name = "Machinegunner"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Stabsgefreiter" 
	rank_number = 4
	position = "fireteam"
	amount = 2

/datum/army_job/bund/grunt
	name = "Schütze"
	english_name = "Soldier"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Soldat"
	rank_number = 5
	position = "fireteam"
	amount = 5


/datum/army_job/bund/fielddoctor
	name = "Chef-Sanitäter"			//"chief paramedic"
	english_name = "Chief Doctor"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Feldwebel" 
	rank_number = 3
	position = "team"
	amount = 1

/datum/army_job/bund/fieldmedic
	name = "Sanitäter"		//Lit. "paramedic"
	english_name = "Field Paramedic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Stabsgefreiter" 
	rank_number = 4
	position = "team"
	amount = 3




//** USMC ARMY **


/datum/army_job/usmc
	enabled = 0
	faction_tag = "usmc"

/datum/army_job/usmc/lieu
	name = "Platoon Commander"
	english_name = "First Lieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "LT"
	rank_number = 0
	position = "team"
	amount = 1

/datum/army_job/usmc/lieu2
	name = "Platoon Sergeant"
	english_name = "Staff Sergeant"
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "SSGT"
	rank_number = 1 //Second in command
	position = "team"
	amount = 1

/datum/army_job/usmc/radioman
	name = "Radio Telegraph Operator"
	english_name = "Warrant Officer"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "WO"
	rank_number = 2
	position = "team"
	amount = 1

/datum/army_job/usmc/squadleader
	name = "Fireteam Leader"
	english_name = "Sergeant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "SGT"
	rank_number = 3
	position = "fireteam"
	amount = 1

/datum/army_job/usmc/squadradio
	name = "Radio Operator"
	english_name = "Lance-Corporal"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "LCPL"
	rank_number = 4
	position = "fireteam"
	amount = 1

/datum/army_job/usmc/machinegunner
	name = "Machinegunner"
	english_name = "Private 1st class"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "PFC"
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/army_job/usmc/agunner
	name = "Assistant Gunner"
	english_name = "Private"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Pvt"
	rank_number = 6
	position = "fireteam"
	amount = 1

/datum/army_job/usmc/grunt
	name = "Marine Rifleman"
	english_name = "Private"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Pvt"
	rank_number = 6
	position = "fireteam"
	amount = 2


//Not in squads - "attachments" in the marines
/datum/army_job/usmc/medic
	name = "Corpsman"
	english_name = "Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "MED"
	position = "team"
	amount = 3

/datum/army_job/usmc/marksman
	name = "Designated Marksman"
	english_name = "Sniper"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "PFC"
	position = "team"
	amount = 2

/datum/army_job/usmc/engineer
	name = "Combat Engineer"
	english_name = "Private 1st class"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "PFC"
	rank_number = 5
	position = "team"
	amount = 1
