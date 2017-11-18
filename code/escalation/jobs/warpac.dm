

//** CZECH ARMY **

/datum/job/escalation/csla
	title = "CSLA"
	enabled = 0
	faction_tag = "csla" //The tag of the faction this job is a part of ("bund", "csla"), for lookups
	outfit_type = /decl/hierarchy/outfit/escalation/warpac/csla
	military_faction = WARPAC

/datum/job/escalation/csla/lieutenant
	title = "CZ Poruchik"
	name = "Poruchik"
	english_name = "Lieutenant"
	enabled = 1
	rank_prefix = "Por." //Poruchik
	rank_number = 0
	position = "team"
	amount = 1
	leading = 1
	outfit_type = /decl/hierarchy/outfit/escalation/warpac/csla/lieutenant
	also_known_languages = list(LANGUAGE_RUSSIAN = 100, LANGUAGE_ENGLISH = 25, LANGUAGE_GERMAN = 40)

/datum/job/escalation/csla/sublieutenant
	title = "CZ Podporuchik"
	name = "Podporuchik"
	english_name = "Sublieutenant"
	enabled = 1
	rank_prefix = "Podpor." //Podporuchik
	rank_number = 1
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_RUSSIAN = 100, LANGUAGE_ENGLISH = 25, LANGUAGE_GERMAN = 40)


/datum/job/escalation/csla/platradio
	title = "CZ Druzhstvo Radista"
	name = "Druzhstvo Radista"
	english_name = "Platoon Radio"
	enabled = 1
	rank_prefix = "Des." //Desiatnik
	rank_number = 1
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_RUSSIAN = 100, LANGUAGE_ENGLISH = 25, LANGUAGE_GERMAN = 40)

/datum/job/escalation/csla/sergeant
	title = "CZ Chetar"
	name = "Chetar"
	english_name = "Sergeant"
	enabled = 1
	rank_prefix = "Chet." //Chetar
	rank_number = 2
	position = "fireteam"
	amount = 1
	leading = 1
	also_known_languages = list(LANGUAGE_RUSSIAN = 40, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 25)

/datum/job/escalation/csla/subsergeant
	title = "CZ Subchetar"
	name = "Subchetar"
	english_name = "Sergeant's Deputy"
	enabled = 1
	rank_prefix = "Des." //Desiatnik
	rank_number = 3
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_RUSSIAN = 40, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 25)

/datum/job/escalation/csla/gunner
	title = "CZ Delostrelec"
	name = "Delostrelec"
	english_name = "Machinegunner"
	enabled = 1
	rank_prefix = "Svob." //Svobodnik
	rank_number = 4
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_RUSSIAN = 40, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 25)

/datum/job/escalation/csla/grenadier
	title = "CZ Pancerovnik"
	name = "Pancerovnik"
	english_name = "Grenadier"
	enabled = 1
	rank_prefix = "Svob." //Svobodnik
	rank_number = 4
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_RUSSIAN = 40, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 25)

/datum/job/escalation/csla/grenass
	title = "CZ Pomocnik Pancerovnika"
	name = "Pomocnik pancerovnika"
	english_name = "Grenadier assistant"
	enabled = 1
	rank_prefix = "Voj." //Vojin
	rank_number = 5
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_RUSSIAN = 40, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 25)

/datum/job/escalation/csla/squadradio
	title = "CZ Radista"
	name = "Radista"
	english_name = "Radioman"
	enabled = 1
	rank_prefix = "Voj." //Vojin
	rank_number = 5
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_RUSSIAN = 100, LANGUAGE_ENGLISH = 25, LANGUAGE_GERMAN = 35)

/datum/job/escalation/csla/rifleman
	title = "CZ Strelec"
	name = "Strelec"
	english_name = "Rifleman"
	enabled = 1
	rank_prefix = "Voj." //Vojin
	rank_number = 5
	position = "fireteam"
	amount = 3


//NOT in squads
/datum/job/escalation/csla/marksman
	title = "CZ Nadstrelec"
	name = "Nadstrelec"
	english_name = "Sharpshooter"
	enabled = 1
	rank_prefix = "Svob." //Svobodnik
	rank_number = 4
	position = "team"
	amount = 2
	also_known_languages = list(LANGUAGE_RUSSIAN = 40, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 25)

/datum/job/escalation/csla/medic
	title = "CZ Sanitar"
	name = "Sanitar"
	english_name = "Field Medic"
	enabled = 1
	rank_prefix = "Des." //Desiatnik
	rank_number = 3
	position = "team"
	amount = 3
	also_known_languages = list(LANGUAGE_RUSSIAN = 100, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 25)



//** SOVIET ARMY **


/datum/job/escalation/cccp
	title = "cccp"
	enabled = 0
	faction_tag = "cccp"
	outfit_type = /decl/hierarchy/outfit/escalation/warpac/cccp
	military_faction = WARPAC

/datum/job/escalation/cccp/leader
	title = "CCCP Komandir Vzvoda"
	name = "Komandir Vzvoda"
	english_name = "Platoon Leader"
	enabled = 1
	rank_prefix = "Leyt." //Leytenant
	rank_number = 0
	position = "team"
	amount = 1
	leading = 1
	outfit_type = /decl/hierarchy/outfit/escalation/warpac/cccp/leader
	also_known_languages = list(LANGUAGE_CZECH = 100, LANGUAGE_ENGLISH = 40, LANGUAGE_GERMAN = 30)

/datum/job/escalation/cccp/subleader
	title = "CCCP Zam Komandira"
	name = "Zamkomvzvoda"
	english_name = "Platoon Leader's Deputy"
	enabled = 1
	rank_prefix = "Starsh." //Starshina
	rank_number = 2
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 100, LANGUAGE_ENGLISH = 40, LANGUAGE_GERMAN = 30)

/datum/job/escalation/cccp/qm //Quartermaster basically
	title = "CCCP Kapter"
	name = "Kapter"
	english_name = "Quartermaster"
	enabled = 1
	rank_prefix = "Prap." //Praporshik
	rank_number = 3
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 100, LANGUAGE_ENGLISH = 30, LANGUAGE_GERMAN = 30)

/datum/job/escalation/cccp/komissar
	title = "CCCP Zampolit"
	name = "Zampolit"
	english_name = "Komissar"
	enabled = 1
	rank_prefix = "Leyt."
	rank_number = 1
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 100, LANGUAGE_ENGLISH = 30, LANGUAGE_GERMAN = 30)

/datum/job/escalation/cccp/aqm //QM assistant
	title = "CCCP Pomoshnik Kaptera"
	name = "Pomoshnik Kaptera"
	english_name = "QM assistant"
	enabled = 0
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/radiomaster
	title = "CCCP Shtabnoy Radist"
	name = "Vzvodny Radist"
	english_name = "HQ Radioman"
	enabled = 1
	rank_prefix = "Yefr." //Yefreytor
	rank_number = 6
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 100, LANGUAGE_ENGLISH = 35, LANGUAGE_GERMAN = 35)

/datum/job/escalation/cccp/squadleader
	title = "CCCP Komandir Otdeleniya"
	name = "Komandir Otdeleniya"
	english_name = "Squad Leader"
	enabled = 1
	rank_prefix = "Serzh." //Serzhant
	rank_number = 5
	position = "fireteam"
	amount = 1
	leading = 1
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/squadvice
	title = "CCCP Starshiy Strelok"
	name = "Starshiy Strelok"
	english_name = "Squad Leader Deputy"
	enabled = 1
	rank_prefix = "Yefr." //Yefreytor
	rank_number = 6
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/squadradio
	title = "CCCP Radiotelefonist"
	name = "Radiotelefonist"
	english_name = "Radioman"
	enabled = 1
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/grenadier
	title = "CCCP Granatometchik"
	name = "Granatometchik"
	english_name = "Grenadier"  //RPG specialist
	enabled = 1
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/grenass
	title = "CCCP Pomoshnik Granatometchika"
	name = "Pomoshnik granatometchika"
	english_name = "Grenadier assistant"
	enabled = 1
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/machinegunner
	title = "CCCP Pulemetchik"
	name = "Pulemetchik"
	english_name = "Machinegunner"
	enabled = 1
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/rifleman
	title = "CCCP Strelok"
	name = "Strelok"
	english_name = "Rifleman"
	enabled = 1
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "fireteam"
	amount = 3
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/marksman
	title = "CCCP Snayper"
	name = "Snayper"
	english_name = "Designater Marksman"
	enabled = 1
	rank_prefix = "Yefr." //Yefreytor
	rank_number = 6
	position = "team"
	amount = 2
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

//Not in squads
/datum/job/escalation/cccp/medic
	title = "CCCP Sanitar"
	name = "Sanitar"
	english_name = "Field Medic"
	enabled = 1
	rank_prefix = "Yefr." //Yefreytor
	rank_number = 6
	position = "team"
	amount = 3
	also_known_languages = list(LANGUAGE_CZECH = 100, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/headmedic
	title = "CCCP Glavvrach"
	name = "Glavvrach"
	english_name = "Head Medic"
	enabled = 1
	rank_prefix = "Ml. Leyt." //Mladshiy Leytenant
	rank_number = 1
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 100, LANGUAGE_ENGLISH = 35, LANGUAGE_GERMAN = 35)

/datum/job/escalation/cccp/hwscom
	title = "CCCP HWS Leader"
	name = "Komandir rascheta"
	english_name = "HWS Leader"
	enabled = 1
	rank_prefix = "Serzh."
	rank_number = 5
	position = "fireteam"
	amount = 2
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/hwsgun
	title = "CCCP HWS Gunner"
	name = "Strelok Rascheta"
	english_name = "HWS Gunner"
	enabled = 1
	rank_prefix = "Ryad."
	rank_number = 7
	position = "fireteam"
	amount = 2
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/hwsass
	title = "CCCP HWS Assistant"
	name = "Assistent Rascheta"
	english_name = "HWS Assistant"
	enabled = 1
	rank_prefix = "Ryad."
	rank_number = 7
	position = "fireteam"
	amount = 2
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/vzmachinegunner
	title = "CCCP Vzvodny Pulemetchik"
	name = "Vzvodny Pulemetchik"
	english_name = "Platoon machinegunner"
	enabled = 1
	rank_prefix = "Ryad." //Ryadovoy
	rank_number = 7
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

/datum/job/escalation/cccp/reconcom
	title = "CCCP Comandir Razvedotdeleniya"
	name = "Komandir Razvedotdeleniya"
	english_name = "Scout Team Commander"
	enabled = 1
	rank_prefix = "Serzh." //Ryadovoy
	rank_number = 5
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 50, LANGUAGE_ENGLISH = 50, LANGUAGE_GERMAN = 50)

/datum/job/escalation/cccp/reconcomdep
	title = "CCCP Zamkomandira Razvedotdeleniya"
	name = "Zamkomandira Razvedotdeleniya"
	english_name = "Scout Team Deputy Commander"
	enabled = 1
	rank_prefix = "Yefr."
	rank_number = 6
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 30, LANGUAGE_GERMAN = 30)

/datum/job/escalation/cccp/reconradio
	title = "CCCP Razvedchik-Radist"
	name = "Razvedchik-Radist"
	english_name = "Scout-Radiomen"
	enabled = 1
	rank_prefix = "Ryad."
	rank_number = 7
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 50, LANGUAGE_ENGLISH = 50, LANGUAGE_GERMAN = 50)

/datum/job/escalation/cccp/reconmarks
	title = "CCCP Razvedchik-Snayper"
	name = "Razvedchik-Snayper"
	english_name = "Scout-Marksmen"
	enabled = 1
	rank_prefix = "Yefr."
	rank_number = 6
	position = "fireteam"
	amount = 1
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 30, LANGUAGE_GERMAN = 30)

/datum/job/escalation/cccp/recon
	title = "CCCP Razvedchik"
	name = "Razvedchik"
	english_name = "Scout"
	enabled = 1
	rank_prefix = "Ryad."
	rank_number = 7
	position = "fireteam"
	amount = 2
	also_known_languages = list(LANGUAGE_CZECH = 30, LANGUAGE_ENGLISH = 30, LANGUAGE_GERMAN = 30)