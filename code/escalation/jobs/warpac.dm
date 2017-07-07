

//** CZECH ARMY **

/datum/job/escalation/csla
	title = "Csla"
	enabled = 0
	faction_tag = "csla" //The tag of the faction this job is a part of ("bund", "csla"), for lookups

/datum/job/escalation/csla/lieutenant
	title = "Cheskoslovensky Poruchik"
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
	title = "Cheskoslovensky Podporuchik"
	name = "Podporuchik"
	english_name = "Sublieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Podpor." //Podporuchik
	rank_number = 1
	position = "team"
	amount = 1

/datum/job/escalation/csla/sergeant
	title = "Cheskoslovensky Chetar"
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
	title = "Cheskoslovensky Subchetar"
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
	title = "Cheskoslovensky Kulometnik"
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
	title = "Cheskoslovensky Pancerovnik"
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
	title = "Cheskoslovensky Pomocnik Pancerovnika"
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
	title = "Cheskoslovensky Radista"
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
	title = "Cheskoslovensky Strelec"
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
	title = "Cheskoslovensky Nadstrelec"
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
	title = "Cheskoslovensky Sanitar"
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
	title = "Sovetskiy Komvzvoda"
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
	title = "Sovetskiy Zankomvzvoda"
	name = "Zamkomvzvoda"
	english_name = "Platoon Leader Deputy"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "St." //Starshina
	rank_number = 2
	position = "team"
	amount = 1

/datum/job/escalation/cccp/wo //Quartermaster basically
	title = "Sovetskiy Kapter"
	name = "Kapter"
	english_name = "Warrant Officer"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Prap." //Praporshik
	rank_number = 3
	position = "team"
	amount = 1

/datum/job/escalation/cccp/awoo //QM assistant
	title = "Sovetskiy Pomoshnik Kaptera"
	name = "Pomoshnik Kaptera"
	english_name = "WO assistant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "team"
	amount = 1

/datum/job/escalation/cccp/radiomaster //QM's assistant, in charge of radios/communication
	title = "Sovetskiy Shtabnoy Radiotelefonist"
	name = "Shtabnoy radiotelefonist"
	english_name = "HQ Radioman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefr." //Yefreytor
	rank_number = 6
	position = "team"
	amount = 1

/datum/job/escalation/cccp/squadleader
	title = "Sovetskiy Komandir Otdeleniya"
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
	title = "Sovetskiy Starshiy Strelok"
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
	title = "Sovetskiy Radiotelefonist"
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
	title = "Sovetskiy Granatometchik"
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
	title = "Sovetskiy Pomoshnik Granatometchika"
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
	title = "Sovetskiy Pulemetchik"
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
	title = "Sovetskiy Strelok"
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
	title = "Sovetskiy Snayper"
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
	title = "Sovetskiy Sanitar"
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
	title = "Sovetskiy Glavvrach"
	name = "Glavvrach"
	english_name = "Head Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ml. Leyt." //Mladshiy Leytenant
	rank_number = 1
	position = "team"
	amount = 1
