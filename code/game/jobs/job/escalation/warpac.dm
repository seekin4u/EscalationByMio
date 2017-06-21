

//** CZECH ARMY **

/datum/job/escalation/escalation/csla
	title = "Csla"
	enabled = 0
	faction_tag = "csla" //The tag of the faction this job is a part of ("bund", "csla"), for lookups

/datum/job/escalation/escalation/csla/lieutenant
	title = "Czech's Lieutenant"
	name = "Poruchik"
	english_name = "Lieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Poruchik"
	rank_number = 0
	position = "team"
	amount = 1

/datum/job/escalation/escalation/csla/sublieutenant
	title = "Czech's Sublieutenant"
	name = "Podporuchik"
	english_name = "Sublieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Podporuchik"
	rank_number = 1
	position = "team"
	amount = 1

/datum/job/escalation/escalation/csla/sergeant
	title = "Czech's Sergeant"
	name = "Chetar"
	english_name = "Sergeant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Chetar"
	rank_number = 2
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/csla/subsergeant
	title = "Czech's Sergeant deputy"
	name = "Subchetar"
	english_name = "Sergeant deputy"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Desiatnik"
	rank_number = 3
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/csla/gunner
	title = "Czech's Machinegunner"
	name = "Kulometnik"
	english_name = "Machinegunner"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Svobodnik" //"Corporal"
	rank_number = 4
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/csla/grenadier
	title = "Czech's Grenadier"
	name = "Pancerovnik"
	english_name = "Grenadier"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Svobodnik" //"Corporal"
	rank_number = 4
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/csla/grenass
	title = "Czech's Grenadier assistant"
	name = "Pomocnik pancerovnika"
	english_name = "Grenadier assistant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Vojin" //"Private"
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/csla/squadradio
	title = "Czech's Radioman"
	name = "Radista"
	english_name = "Radioman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Vojin" //"Private"
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/csla/rifleman
	title = "Czech's Rifleman"
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
/datum/job/escalation/escalation/csla/marksman
	title = "Czech's Sharpshooter"
	name = "Nadstrelec"
	english_name = "Sharpshooter"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Svobodnik"
	rank_number = 4
	position = "team"
	amount = 2

/datum/job/escalation/escalation/csla/medic
	title = "Czech's Field Medic"
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


/datum/job/escalation/escalation/cccp
	title = "cccp"
	enabled = 0
	faction_tag = "cccp"

/datum/job/escalation/escalation/cccp/leader
	title = "Soviet Platoon Leader"
	name = "Komvzvoda"
	english_name = "Platoon Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Leytenant"
	rank_number = 0
	position = "team"
	amount = 1

/datum/job/escalation/escalation/cccp/subleader
	title = "Soviet Platoon Leader Deputy"
	name = "Zamkomvzvoda"
	english_name = "Platoon Leader Deputy"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Starshina"
	rank_number = 2
	position = "team"
	amount = 1

/datum/job/escalation/escalation/cccp/wo //Quartermaster basically
	title = "Soviet Warrant Officer"
	name = "Starshiy kapter"
	english_name = "Warrant Officer"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Prarorshik"
	rank_number = 3
	position = "team"
	amount = 1

/datum/job/escalation/escalation/cccp/awoo //QM assistant
	title = "Soviet WO assistant"
	name = "Pomoshnik Praporshika"
	english_name = "WO assistant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "team"
	amount = 1

/datum/job/escalation/escalation/cccp/radiomaster //QM's assistant, in charge of radios/communication
	title = "Soviet HQ Radioman"
	name = "Shtabnoy radist"
	english_name = "HQ Radioman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefreytor"
	rank_number = 6
	position = "team"
	amount = 1

/datum/job/escalation/escalation/cccp/squadleader
	title = "Soviet Squad Leader"
	name = "Komandir Otdeleniya"
	english_name = "Squad Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Serzhant"
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/cccp/squadvice
	title = "Soviet Squad Leader Deputy"
	name = "Starshiy strelok"
	english_name = "Squad Leader Deputy"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefreytor" //corporal
	rank_number = 6
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/cccp/squadradio
	title = "Soviet Radioman"
	name = "Radiotelefonist"
	english_name = "Radioman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/cccp/grenadier
	title = "Soviet Grenadier"
	name = "Granatometchik"
	english_name = "Grenadier"  //RPG specialist
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/cccp/grenass
	title = "Soviet Grenadier assistant"
	name = "Pomoshnik granatometchika"
	english_name = "Grenadier assistant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/cccp/machinegunner
	title = "Soviet Machinegunner"
	name = "Pulemetchik"
	english_name = "Machinegunner"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/job/escalation/escalation/cccp/fifleman
	title = "Soviet Rifleman"
	name = "Strelok"
	english_name = "Rifleman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 7
	position = "fireteam"
	amount = 3

/datum/job/escalation/escalation/cccp/sniper
	title = "Soviet Sniper"
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
/datum/job/escalation/escalation/cccp/medic
	title = "Soviet Field Medic"
	name = "Sanitar"
	english_name = "Field Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefreytor"
	rank_number = 6
	position = "team"
	amount = 3

/datum/job/escalation/escalation/cccp/headmedic
	title = "Soviet Head Medic"
	name = "Glavvrach"
	english_name = "Head Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Mladshiy leytenant"
	rank_number = 1
	position = "team"
	amount = 1
