

//** CZECH ARMY **

/datum/army_job/csla

	enabled = 0
	faction_tag = "csla" //The tag of the faction this job is a part of ("bund", "csla"), for lookups

/datum/army_job/csla/lieutenant
	name = "Poruchik"
	english_name = "Lieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Poruchik"
	rank_number = 0
	position = "team"
	amount = 1

/datum/army_job/csla/sublieutenant
	name = "Podporuchik"
	english_name = "Sublieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Podporuchik"
	rank_number = 1 
	position = "team"
	amount = 1

/datum/army_job/csla/sergeant
	name = "Chetar"
	english_name = "Sergeant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Chetar"
	rank_number = 2
	position = "fireteam"
	amount = 1

/datum/army_job/csla/subsergeant
	name = "Subchetar"
	english_name = "Sergeant deputy"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Desiatnik"
	rank_number = 3
	position = "fireteam"
	amount = 1

/datum/army_job/csla/gunner
	name = "Kulometnik"
	english_name = "Machinegunner"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Svobodnik" //"Corporal"
	rank_number = 4
	position = "fireteam"
	amount = 1

/datum/army_job/csla/grenadier
	name = "Pancerovnik"
	english_name = "Grenadier"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Svobodnik" //"Corporal"
	rank_number = 4
	position = "fireteam"
	amount = 1

/datum/army_job/csla/grenass
	name = "Pomocnik pancerovnika"
	english_name = "Grenadier assistant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Vojin" //"Private"
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/army_job/csla/squadradio
	name = "Radista"
	english_name = "Radioman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Vojin" //"Private"
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/army_job/csla/rifleman
	name = "Strelec"
	english_name = "Rifleman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Vojin" //"Private"
	rank_number = 5
	position = "fireteam"
	amount = 3


//NOT in squads
/datum/army_job/csla/marksman
	name = "Nadstrelec"
	english_name = "Sharpshooter"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Svobodnik"
	rank_number = 4
	position = "team"
	amount = 2

/datum/army_job/csla/medic
	name = "Sanitar"
	english_name = "Field Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Desiatnik"
	rank_number = 3
	position = "team"
	amount = 4




//** SOVIET ARMY **


/datum/army_job/cccp
	enabled = 0
	faction_tag = "cccp"

/datum/army_job/cccp/leader
	name = "Komvzvoda"
	english_name = "Platoon Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Leytenant"
	rank_number = 0
	position = "team"
	amount = 1

/datum/army_job/cccp/subleader
	name = "Zamkomvzvoda"
	english_name = "Platoon Leader Deputy"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Starshina"
	rank_number = 2 
	position = "team"
	amount = 1

/datum/army_job/cccp/wo //Quartermaster basically
	name = "Starshiy kapter"
	english_name = "Warrant Officer"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Prarorshik"
	rank_number = 3
	position = "team"
	amount = 1

/datum/army_job/cccp/awoo //QM assistant
	name = "Pomoshnik Praporshika"
	english_name = "WO assistant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "team"
	amount = 1

/datum/army_job/cccp/radiomaster //QM's assistant, in charge of radios/communication
	name = "Shtabnoy radist"
	english_name = "HQ Radioman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefreytor"
	rank_number = 6
	position = "team"
	amount = 1

/datum/army_job/cccp/squadleader
	name = "Komandir Otdeleniya"
	english_name = "Squad Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Serzhant"
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/squadvice
	name = "Starshiy strelok"
	english_name = "Squad Leader Deputy"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefreytor" //corporal
	rank_number = 6
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/squadradio
	name = "Radiotelefonist"
	english_name = "Radioman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/grenadier
	name = "Granatometchik"
	english_name = "Grenadier"  //RPG specialist
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/grenass
	name = "Pomoshnik granatometchika"
	english_name = "Grenadier assistant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/machinegunner
	name = "Pulemetchik"
	english_name = "Machinegunner"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/fifleman
	name = "Strelok"
	english_name = "Rifleman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "fireteam"
	amount = 3

/datum/army_job/cccp/sniper
	name = "Snayper"
	english_name = "Sniper"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefreytor"
	rank_number = 6
	position = "team"
	amount = 2

//Not in squads
/datum/army_job/cccp/medic
	name = "Sanitar"
	english_name = "Field Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefreytor"
	rank_number = 6
	position = "team"
	amount = 3

/datum/army_job/cccp/headmedic
	name = "Glavvrach"
	english_name = "Head Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Mladshiy leytenant"
	rank_number = 1
	position = "team"
	amount = 1
