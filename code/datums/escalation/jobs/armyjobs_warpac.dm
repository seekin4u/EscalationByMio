

//** CZECH ARMY **

/datum/army_job/csla

	enabled = 0
	faction_tag = "csla" //The tag of the faction this job is a part of ("bund", "csla"), for lookups

/datum/army_job/csla/lieutenant
	name = "Porucik"
	english_name = "Lieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Porucik"
	rank_number = 0
	position = "team"
	amount = 1

/datum/army_job/csla/sublieutenant
	name = "Podporucik"
	english_name = "Sublieutenant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Podporucik"
	rank_number = 1 //Second in command
	position = "team"
	amount = 1

/datum/army_job/csla/sergeant
	name = "Cetar"
	english_name = "Sergeant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Cetar"
	rank_number = 2
	position = "fireteam"
	amount = 1

/datum/army_job/csla/subsergeant
	name = "Poddostojnik"
	english_name = "Subsergeant"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Desiatnik"  //"corporal"
	rank_number = 3
	position = "fireteam"
	amount = 1

/datum/army_job/csla/gunner
	name = "Delostrelec"
	english_name = "Machinegunner"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Svobodnik"
	rank_number = 4
	position = "fireteam"
	amount = 1

/datum/army_job/csla/grenadier
	name = "Granatnik"
	english_name = "Grenadier"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Granatnik" //"Trooper"
	rank_number = 4
	position = "fireteam"
	amount = 1

/datum/army_job/csla/ammotrooper
	name = "Granatnik pomoc"
	english_name = "Grenadier's Aid"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Vojak" //"Trooper"
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/army_job/csla/grunt
	name = "Vojak"
	english_name = "Rifleman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Strelek" //"Shooter"
	rank_number = 5
	position = "fireteam"
	amount = 2

//NOT in squads
/datum/army_job/csla/marksman
	name = "Ostrostrelec" //Possibly wrong, my slovak is not great
	english_name = "Sharpshooter"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Zaskodnik" //"Sniper"
	rank_number = 3
	position = "team"
	amount = 2

/datum/army_job/csla/medic
	name = "Zdravotnik"
	english_name = "Field Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Sanitar" //"Doctorguy", note: not actually a slovakian word
	rank_number = 5
	position = "team"
	amount = 4




//** SOVIET ARMY **


/datum/army_job/cccp
	enabled = 0
	faction_tag = "cccp"

/datum/army_job/cccp/leader
	name = "Leytenant"
	english_name = "Commander"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Leytenant"
	rank_number = 0
	position = "team"
	amount = 1

/datum/army_job/cccp/subleader
	name = "Starshina"
	english_name = "Lieutenant Commander"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Starshina"
	rank_number = 1 //Second in command
	position = "team"
	amount = 1

/datum/army_job/cccp/cwo //Quartermaster basically
	name = "Starsij praporsik"
	english_name = "Chief Warrant Officer"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "CWO"
	rank_number = 2
	position = "team"
	amount = 1

/datum/army_job/cccp/radiomaster //QM's assistant, in charge of radios/communication
	name = "Praporsik"
	english_name = "Warrant Officer/Radioman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "WO"
	rank_number = 3
	position = "team"
	amount = 1

/datum/army_job/cccp/squadleader
	name = "Serzhant"  				//Sergeant
	english_name = "Squad Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Serzhant"
	rank_number = 4
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/squadvice
	name = "Yefreytor"  				//Corporal
	english_name = "Ass't Squad Leader"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Yefreytor"
	rank_number = 5
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/squadradio
	name = "Radiotelefonist"
	english_name = "Radio Operator"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy" //Corporal
	rank_number = 6
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/grenadier
	name = "Granatometcik"
	english_name = "Grenadier"  //RPG specialist
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 6
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/machinegunner
	name = "Pulemetcik"
	english_name = "Machinegunner"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 6
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/ammoman
	name = "Pomosnik po boepripasam"   //This is probably horribly wrong, I am sorry
	english_name = "Ammo Carrier"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 6
	position = "fireteam"
	amount = 1

/datum/army_job/cccp/grunt
	name = "Strelok"
	english_name = "Rifleman"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 6
	position = "fireteam"
	amount = 3

/datum/army_job/cccp/sniper
	name = "Snajper"
	english_name = "Sniper"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 6
	position = "team"
	amount = 2

//Not in squads
/datum/army_job/cccp/medic
	name = "Sanitar"				//Orderly/Attendant
	english_name = "Field Medic"
	enabled = 1
	outfits = list("")
	outfit_variant_chance = 0
	rank_prefix = "Ryadovoy"
	rank_number = 6
	position = "team"
	amount = 3
