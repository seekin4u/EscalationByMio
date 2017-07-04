

//** CZECH ARMY **

/datum/job/escalation/csla
	title = "Csla"
	enabled = 0
	faction_tag = "csla" //The tag of the faction this job is a part of ("bund", "csla"), for lookups

/datum/job/escalation/csla/lieutenant
	title = "Czechs Lieutenant"
	name = "Poruchik"
	english_name = "Lieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Por." //Poruchik
	rank_number = 0
	position = "team"
	amount = 1

/datum/job/escalation/csla/sublieutenant
	title = "Czechs Sublieutenant"
	name = "Podporuchik"
	english_name = "Sublieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
<<<<<<< HEAD:code/escalation/jobs/warpac.dm
	rank_prefix = "Podporuchik"
	rank_number = 1
=======
	rank_prefix = "Podpor." //Podporuchik
	rank_number = 1 
>>>>>>> master:code/datums/escalation/jobs/armyjobs_warpac.dm
	position = "team"
	amount = 1

/datum/job/escalation/csla/sergeant
	title = "Czechs Sergeant"
	name = "Chetar"
	english_name = "Sergeant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Chet." //Chetar
	rank_number = 2
	position = "fireteam"
	amount = 1

/datum/job/escalation/csla/subsergeant
	title = "Czechs Sergeant deputy"
	name = "Subchetar"
	english_name = "Sergeant deputy"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Des." //Desiatnik
	rank_number = 3
	position = "fireteam"
	amount = 1

/datum/job/escalation/csla/gunner
	title = "Czechs Machinegunner"
	name = "Kulometnik"
	english_name = "Machinegunner"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Svob." //Svobodnik
	rank_number = 4
	position = "fireteam"
	amount = 1

/datum/job/escalation/csla/grenadier
	title = "Czechs Grenadier"
	name = "Pancerovnik"
	english_name = "Grenadier"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Svob." //Svobodnik
	rank_number = 4
	position = "fireteam"
	amount = 1

/datum/job/escalation/csla/grenass
	title = "Czechs Grenadier assistant"
	name = "Pomocnik pancerovnika"
	english_name = "Grenadier assistant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Voj." //Vojin
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/job/escalation/csla/squadradio
	title = "Czechs Radioman"
	name = "Radista"
	english_name = "Radioman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Voj." //Vojin
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/job/escalation/csla/rifleman
	title = "Czechs Rifleman"
	name = "Strelec"
	english_name = "Rifleman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Voj." //Vojin
	rank_number = 5
	position = "fireteam"
	amount = 3


//NOT in squads
/datum/job/escalation/csla/marksman
	title = "Czechs Sharpshooter"
	name = "Nadstrelec"
	english_name = "Sharpshooter"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Svob." //Svobodnik
	rank_number = 4
	position = "team"
	amount = 2

/datum/job/escalation/csla/medic
	title = "Czechs Field Medic"
	name = "Sanitar"
	english_name = "Field Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Des." //Desiatnik
	rank_number = 3
	position = "team"
	amount = 4




//** SOVIET ARMY **


/datum/job/escalation/cccp
	title = "cccp"
	enabled = 0
	faction_tag = "cccp"

/datum/job/escalation/cccp/leader
	title = "Soviet Platoon Leader"
	name = "Komvzvoda"
	english_name = "Platoon Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Leyt." //Leytenant
	rank_number = 0
	position = "team"
	amount = 1

/datum/job/escalation/cccp/subleader
	title = "Soviet Platoon Leader Deputy"
	name = "Zamkomvzvoda"
	english_name = "Platoon Leader Deputy"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
<<<<<<< HEAD:code/escalation/jobs/warpac.dm
	rank_prefix = "Starshina"
	rank_number = 2
=======
	rank_prefix = "St." //Starshina
	rank_number = 2 
>>>>>>> master:code/datums/escalation/jobs/armyjobs_warpac.dm
	position = "team"
	amount = 1

/datum/job/escalation/cccp/wo //Quartermaster basically
	title = "Soviet Warrant Officer"
	name = "Starshiy kapter"
	english_name = "Warrant Officer"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Prap." //Praporshik
	rank_number = 3
	position = "team"
	amount = 1

/datum/job/escalation/cccp/awoo //QM assistant
	title = "Soviet WO assistant"
	name = "Pomoshnik Praporshika"
	english_name = "WO assistant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "team"
	amount = 1

/datum/job/escalation/cccp/radiomaster //QM's assistant, in charge of radios/communication
	title = "Soviet HQ Radioman"
	name = "Shtabnoy radist"
	english_name = "HQ Radioman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefr." //Yefreytor
	rank_number = 6
	position = "team"
	amount = 1

/datum/job/escalation/cccp/squadleader
	title = "Soviet Squad Leader"
	name = "Komandir Otdeleniya"
	english_name = "Squad Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Serzh." //Serzhant
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/job/escalation/cccp/squadvice
	title = "Soviet Squad Leader Deputy"
	name = "Starshiy strelok"
	english_name = "Squad Leader Deputy"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefr." //Yefreytor
	rank_number = 6
	position = "fireteam"
	amount = 1

/datum/job/escalation/cccp/squadradio
	title = "Soviet Radioman"
	name = "Radiotelefonist"
	english_name = "Radioman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/job/escalation/cccp/grenadier
	title = "Soviet Grenadier"
	name = "Granatometchik"
	english_name = "Grenadier"  //RPG specialist
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/job/escalation/cccp/grenass
	title = "Soviet Grenadier assistant"
	name = "Pomoshnik granatometchika"
	english_name = "Grenadier assistant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/job/escalation/cccp/machinegunner
	title = "Soviet Machinegunner"
	name = "Pulemetchik"
	english_name = "Machinegunner"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "fireteam"
	amount = 1

/datum/job/escalation/cccp/fifleman
	title = "Soviet Rifleman"
	name = "Strelok"
	english_name = "Rifleman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "fireteam"
	amount = 3

/datum/job/escalation/cccp/sniper
	title = "Soviet Sniper"
	name = "Snayper"
	english_name = "Sniper"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefr." //Yefreytor
	rank_number = 6
	position = "team"
	amount = 2

//Not in squads
/datum/job/escalation/cccp/medic
	title = "Soviet Field Medic"
	name = "Sanitar"
	english_name = "Field Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefr." //Yefreytor
	rank_number = 6
	position = "team"
	amount = 3

/datum/job/escalation/cccp/headmedic
	title = "Soviet Head Medic"
	name = "Glavvrach"
	english_name = "Head Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ml. Leyt." //Mladshiy Leytenant
	rank_number = 1
	position = "team"
	amount = 1
