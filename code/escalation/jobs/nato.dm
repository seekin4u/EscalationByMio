

//** BUND ARMY **

/datum/job/escalation/bund
	title = "Bundeswehr"
	enabled = 0
	faction_tag = "bund" //The tag of the faction this job is a part of, for lookups
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes

/datum/job/escalation/bund/platoonleader
	title = "DE Zugfuhrer"
	name = "Zugfuhrer"
	english_name = "Platoon Leader"
	enabled = 1
	rank_prefix = "Hauptmann"  //Captain
	rank_number = 0
	position = "team"
	amount = 1
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/platoonleader
	leading = 1
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 40, LANGUAGE_CZECH = 20)

/datum/job/escalation/bund/subleader
	title = "DE Zugfuhrer Stellvertretender"
	name = "Zugfuhrer stellvertretender"
	english_name = "Platoon Leader's Deputy"
	enabled = 1
	rank_prefix = "Oberleutnant" //1st lieutenant
	rank_number = 1
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 40, LANGUAGE_CZECH = 20)

/datum/job/escalation/bund/squadleader
	title = "DE Gruppenfuhrer"
	name = "Gruppenfuhrer"
	english_name = "Squad Leader"
	enabled = 1
	rank_prefix = "Hauptfeldwebel"
	rank_number = 2
	position = "fireteam"
	amount = 1
	leading = 1
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)	

/datum/job/escalation/bund/subsergeant
	title = "DE Gruppenfuhrer Stellvertreter"
	name = "Gruppenfuhrer stellvertreter"
	english_name = "Fireteam Leader"
	enabled = 1
	rank_prefix = "Unteroffizier"  //"sergeant"
	rank_number = 3
	position = "fireteam"
	amount = 2
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)

/datum/job/escalation/bund/machinegunner
	title = "DE Maschinengewehrschutze"
	name = "Maschinengewehrschutze"
	english_name = "Machinegunner"
	enabled = 1
	rank_prefix = "Oberstabsgefreiter"
	rank_number = 4
	position = "fireteam"
	amount = 2
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)

/datum/job/escalation/bund/grunt
	title = "DE Schutze"
	name = "Schutze"
	english_name = "Soldier"
	enabled = 1
	rank_prefix = "Soldat"
	rank_number = 6
	position = "fireteam"
	amount = 6
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)

/datum/job/escalation/bund/fielddoctor
	title = "DE Chef-Sanitater"
	name = "Chef-Sanitater"			//"Chief Medic"
	english_name = "Head Medic"
	enabled = 1
	rank_prefix = "Feldwebel"
	rank_number = 3
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 35, LANGUAGE_CZECH = 15)

/datum/job/escalation/bund/fieldmedic
	title = "DE Sanitater"
	name = "Sanitater"		//Lit. "paramedic"
	english_name = "Field Paramedic"
	enabled = 1
	rank_prefix = "Stabsgefreiter"
	rank_number = 4
	position = "team"
	amount = 3
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)

/datum/job/escalation/bund/sniper
	title = "DE Scharfschutze"
	name = "Scharfschutze"
	english_name = "Sniper"
	enabled = 1
	rank_prefix = "Gefreiter"
	rank_number = 5
	position = "team"
	amount = 2
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)



//** USMC ARMY **


/datum/job/escalation/usmc
	title = "US"
	enabled = 0
	faction_tag = "usmc"

/datum/job/escalation/usmc/lieu
	title = "US Lieutenant"
	name = "Platoon Leader"
	english_name = "Lieutenant"
	enabled = 1
	rank_prefix = "LT."
	rank_number = 0
	position = "team"
	amount = 1
	leading = 1
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 40, LANGUAGE_CZECH = 10)

/datum/job/escalation/usmc/lieu2
	title = "US Staff Sergeant"
	name = "Platoon Leader's Deputy"
	english_name = "Staff Sergeant"
	rank_prefix = "SSgt."
	rank_number = 1 //Second in command
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 40, LANGUAGE_CZECH = 10)

/datum/job/escalation/usmc/radioman
	title = "US Radio Telegraph Operator"
	name = "Radio Telegraph Operator"
	english_name = "Corporal"
	enabled = 1
	rank_prefix = "Cpl."
	rank_number = 2
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 20, LANGUAGE_CZECH = 10)

/datum/job/escalation/usmc/squadleader
	title = "US Sergeant"
	name = "Squad Leader"
	english_name = "Sergeant"
	enabled = 1
	rank_prefix = "Sgt."
	rank_number = 3
	position = "fireteam"
	amount = 1
	leading = 1
	also_known_languages = list(LANGUAGE_GERMAN = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)

/datum/job/escalation/usmc/fireteamleader
	title = "US Corporal"
	name = "Fireteam Leader"
	english_name = "Corporal"
	enabled = 3
	rank_prefix = "Sgt."
	rank_number = 3
	position = "fireteam"
	amount = 2
	also_known_languages = list(LANGUAGE_GERMAN = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)

/datum/job/escalation/usmc/squadradio
	title = "US Radio Operator"
	name = "Radio Operator"
	english_name = "Lance-Corporal"
	enabled = 1
	rank_prefix = "LCpl."
	rank_number = 4
	position = "fireteam"
	amount = 2
	also_known_languages = list(LANGUAGE_GERMAN = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)

/datum/job/escalation/usmc/machinegunner
	title = "US Machinegunner"
	name = "Machinegunner"
	english_name = "PFC."
	enabled = 1
	rank_prefix = "Pfc."
	rank_number = 5
	position = "fireteam"
	amount = 2
	also_known_languages = list(LANGUAGE_GERMAN = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)

/datum/job/escalation/usmc/grunt
	title = "US Rifleman"
	name = "Rifleman"
	english_name = "PFC."
	enabled = 1
	rank_prefix = "Pfc."
	rank_number = 6
	position = "fireteam"
	amount = 6
	also_known_languages = list(LANGUAGE_GERMAN = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)

//Not in squads - "attachments" in the marines
/datum/job/escalation/usmc/medic
	title = "US Corpsman"
	name = "Corpsman"
	english_name = "Medic"
	enabled = 1
	rank_prefix = "HM3"
	position = "team"
	amount = 3
	also_known_languages = list(LANGUAGE_GERMAN = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)

/datum/job/escalation/usmc/marksman
	title = "US Designated Marksman"
	name = "Designated Marksman"
	english_name = "Designated Marksman"
	enabled = 1
	rank_prefix = "Pfc."
	position = "team"
	amount = 2
	also_known_languages = list(LANGUAGE_GERMAN = 30, LANGUAGE_RUSSIAN = 15, LANGUAGE_CZECH = 10)

/datum/job/escalation/usmc/surgeon
	title = "US Surgeon"
	name = "Surgeon"
	english_name = "Surgeon"
	enabled = 0
	rank_prefix = "LT."
	position = "team"
	amount = 1


/datum/job/escalation/usmc/headmedic
	title = "US Head Medic"
	name = "Head Medic"
	english_name = "Second Lieutenant"
	enabled = 1
	rank_prefix = "2ndLT"
	position = "team"
	amount = 1
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 30, LANGUAGE_CZECH = 15)
