
/decl/hierarchy/outfit/escalation
	name = "Escalation outfit"
	hierarchy_type = /decl/hierarchy/outfit/escalation

///////////////////////////////////////////////////////////////////////////////////////////

/decl/hierarchy/outfit/escalation/nato
	shoes = /obj/item/clothing/shoes/escalation/military/nato

///////////////////////USMC///////////////////////////////

/decl/hierarchy/outfit/escalation/nato/usmc
	uniform = /obj/item/clothing/under/escalation/usmc
	suit = /obj/item/clothing/suit/storage/vest/escalation/usmc_flakvest
	head = /obj/item/clothing/head/helmet/escalation/usmc
	belt = /obj/item/weapon/storage/belt/usmc
	suit_store = /obj/item/weapon/storage/belt/suit/ammo/usmc
	gloves = /obj/item/clothing/gloves/escalation/usmc
	shoes = /obj/item/clothing/shoes/escalation/military/usmc
	l_pocket = /obj/item/clothing/mask/usmc

/decl/hierarchy/outfit/escalation/nato/usmc/lieu
	name = "USMC Leader"
	id = /obj/item/weapon/storage/belt/holster/usmc
	id_pda_assignment = "Lieutenant"
	l_hand = /obj/item/weapon/gun/projectile/automatic/m16a1

/decl/hierarchy/outfit/escalation/nato/usmc/lieu2
	name = "USMC Leader Deputy"
	id = /obj/item/weapon/storage/belt/holster/usmc
	l_hand = /obj/item/weapon/gun/projectile/automatic/m16a1

/decl/hierarchy/outfit/escalation/nato/usmc/capter
	name = "USMC QM"
	id = /obj/item/weapon/storage/belt/holster/usmc
	l_hand = /obj/item/weapon/gun/projectile/automatic/m16a1

/decl/hierarchy/outfit/escalation/nato/usmc/squadleader
	name = "USMC Squad Leader"
	id = /obj/item/weapon/storage/belt/holster/usmc
	back = /obj/item/device/radio/escalation/command/nato
	l_hand = /obj/item/weapon/gun/projectile/automatic/m16a1

/decl/hierarchy/outfit/escalation/nato/usmc/fireteamleader
	name = "USMC Fireteam Leader"
	back = /obj/item/device/radio/escalation/command/nato
	l_hand = /obj/item/weapon/gun/projectile/automatic/m16a1

/decl/hierarchy/outfit/escalation/nato/usmc/squadradio
	name = "USMC Squad Radio"
	back = /obj/item/device/radio/escalation/command/nato
	l_hand = /obj/item/weapon/gun/projectile/automatic/m16a1

/decl/hierarchy/outfit/escalation/nato/usmc/machinegunner
	name = "USMC MG"
	l_hand = /obj/item/weapon/gun/projectile/automatic/m60

/decl/hierarchy/outfit/escalation/nato/usmc/grunt
	name = "USMC Riflemen"
	l_hand = /obj/item/weapon/gun/projectile/automatic/m16a1

/decl/hierarchy/outfit/escalation/nato/usmc/medic
	name = "USMC Medic"
	belt = /obj/item/weapon/storage/belt/usmc/medical
	suit_store = /obj/item/weapon/storage/belt/suit/surgery
	back = /obj/item/weapon/storage/backpack/medical
	l_hand = /obj/item/weapon/gun/projectile/automatic/m16a1

/decl/hierarchy/outfit/escalation/nato/usmc/marksman
	name = "USMC Marksman"
	l_hand = /obj/item/weapon/gun/projectile/automatic/m14/scoped

/decl/hierarchy/outfit/escalation/nato/usmc/headmedic
	name = "USMC Head Medic"
	belt = /obj/item/weapon/storage/belt/usmc/medical
	suit = null
	id = /obj/item/weapon/storage/belt/holster/usmc
	head = null
	suit_store = null

/decl/hierarchy/outfit/escalation/nato/usmc/hwscom
	name = "USMC HWS Commander"
	l_hand = /obj/item/weapon/gun/projectile/automatic/m16a1

/decl/hierarchy/outfit/escalation/nato/usmc/hwsgun
	name = "USMC HWS Gunner"
	l_hand = /obj/item/weapon/gun/projectile/automatic/m16a1

/decl/hierarchy/outfit/escalation/nato/usmc/hwsass
	name = "USMC HWS Assistant"
	l_hand = /obj/item/weapon/gun/projectile/automatic/m16a1

/datum/job/escalation/usmc/assaultcom
	name = "USMC AS Commander"

/datum/job/escalation/usmc/assaultgunner
	name = "USMC Grenadier"

/datum/job/escalation/usmc/assaultass
	name = "USMC Grenadier Assistant"

///////////////////////BUNDESWEHR////////////////////////

/decl/hierarchy/outfit/escalation/nato/bundes
	uniform = /obj/item/clothing/under/escalation/bundes
	head = /obj/item/clothing/head/helmet/escalation/bund
	gloves = /obj/item/clothing/gloves/escalation/bundesgloves
	suit = /obj/item/clothing/suit/storage/vest/escalation/bdw_harness
	belt = /obj/item/weapon/storage/belt/bdw
	gloves = /obj/item/clothing/gloves/escalation/bundesgloves

/decl/hierarchy/outfit/escalation/nato/bundes/platoonleader
	name = "Bundeswehr Leader"
	r_hand = /obj/item/weapon/gun/projectile/walther
	id_pda_assignment = "Zugfuhrer"
	l_hand = /obj/item/weapon/gun/projectile/automatic/g3a3

/decl/hierarchy/outfit/escalation/nato/bundes/subleader
	name = "Bundeswehr Leader Deputy"
	r_hand = /obj/item/weapon/gun/projectile/walther
	l_hand = /obj/item/weapon/gun/projectile/automatic/g3a3
	id_pda_assignment = "Zugfuhrer"

/decl/hierarchy/outfit/escalation/nato/bundes/platradio
	name = "Bundeswehr Platoon Radio"
	back = /obj/item/device/radio/escalation/command/nato
	l_hand = /obj/item/weapon/gun/projectile/automatic/g3a3

/decl/hierarchy/outfit/escalation/nato/bundes/squadleader
	name = "Bundeswehr Squad Leader"
	r_hand = /obj/item/weapon/gun/projectile/walther
	l_hand = /obj/item/weapon/gun/projectile/automatic/g3a3

/decl/hierarchy/outfit/escalation/nato/bundes/subsergeant
	name = "Bundeswehr Squad Leader Deputy"
	l_hand = /obj/item/weapon/gun/projectile/automatic/g3tgs

/decl/hierarchy/outfit/escalation/nato/bundes/machinegunner
	name = "Bundeswehr MG"
	l_hand = /obj/item/weapon/gun/projectile/automatic/mg3

/decl/hierarchy/outfit/escalation/nato/bundes/grunt
	name = "Bundeswehr Riflemen"
	l_hand = /obj/item/weapon/gun/projectile/automatic/g3a3

/decl/hierarchy/outfit/escalation/nato/bundes/fielddoctor
	name = "Bundeswehr Head Medic"
	belt = /obj/item/weapon/storage/belt/bdw/medical

/decl/hierarchy/outfit/escalation/nato/bundes/fieldmedic
	name = "Bundeswehr Medic"
	belt = /obj/item/weapon/storage/belt/bdw/medical
	l_hand = /obj/item/weapon/gun/projectile/automatic/g3a3

/decl/hierarchy/outfit/escalation/nato/bundes/sniper
	name = "Bundeswehr Marksmen"
	l_hand = /obj/item/weapon/gun/projectile/automatic/g3sg1

/decl/hierarchy/outfit/escalation/nato/bundes/radio
	name = "Bundeswehr Squad Radiomen"
	l_hand = /obj/item/weapon/gun/projectile/automatic/g3a3
	back = /obj/item/device/radio/escalation/command/nato

/decl/hierarchy/outfit/escalation/nato/bundes/grenadier
	name = "Bundeswehr Grenadier"
	r_hand = /obj/item/weapon/gun/launcher/grenade/hk69
	l_hand = /obj/item/weapon/gun/projectile/automatic/g3a3
	back = /obj/item/weapon/storage/backpack/gl/bdw

/decl/hierarchy/outfit/escalation/nato/bundes/grenadierass
	name = "Bundeswehr Grenadier Assistant"
	r_hand = /obj/item/weapon/gun/launcher/grenade/hk69
	l_hand = /obj/item/weapon/gun/projectile/automatic/g3a3
	back = /obj/item/weapon/storage/backpack/gl/bdw/big

//////////////////////////////////////////////////////////////////////////////////////////////////

/decl/hierarchy/outfit/escalation/warpac
	shoes = /obj/item/clothing/shoes/escalation/military/warpac

///////////////////////////////////SA//////////////////////////////////////////

/decl/hierarchy/outfit/escalation/warpac/cccp
	uniform = /obj/item/clothing/under/escalation/soviet
	head = /obj/item/clothing/head/helmet/escalation/sa/ush
	suit = /obj/item/clothing/suit/storage/vest/escalation/sa_harness
	belt = /obj/item/weapon/storage/belt/sa
	gloves = /obj/item/clothing/gloves/escalation/sa

/decl/hierarchy/outfit/escalation/warpac/cccp/leader
	name = "Soviet Leader"
	uniform = /obj/item/clothing/under/escalation/soviet_officer
	head = /obj/item/clothing/head/helmet/escalation/sa/ushofficer
	r_hand = /obj/item/weapon/gun/projectile/makarov
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

	id_pda_assignment = "Leytenant"

/decl/hierarchy/outfit/escalation/warpac/cccp/subleader
	name = "Soviet Leader Deputy"
	uniform = /obj/item/clothing/under/escalation/soviet_officer
	head = /obj/item/clothing/head/helmet/escalation/sa/ushofficer
	r_hand = /obj/item/weapon/gun/projectile/makarov
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/qm
	name = "Soviet QM"
	uniform = /obj/item/clothing/under/escalation/soviet_officer
	head = /obj/item/clothing/head/helmet/escalation/sa/ushofficer
	r_hand = /obj/item/weapon/gun/projectile/makarov
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/squadleader
	name = "Soviet Squad Leader"
	uniform = /obj/item/clothing/under/escalation/soviet_officer
	r_hand = /obj/item/weapon/gun/projectile/makarov
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/radiomaster
	name = "Soviet Platoon Radiomen"
	back = /obj/item/device/radio/escalation/command/warpac
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/vzmachinegunner
	name = "Soviet Platoon MG"

/decl/hierarchy/outfit/escalation/warpac/cccp/squadvice
	name = "Soviet Squad Leader Deputy"

/decl/hierarchy/outfit/escalation/warpac/cccp/squadradio
	name = "Soviet Squad Radiomen"
	back = /obj/item/device/radio/escalation/command/warpac
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/grenadier
	name = "Soviet Grenadier"
	back = /obj/item/weapon/storage/backpack/rpgsa
	r_hand = /obj/item/weapon/gun/launcher/rpg7
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/grenass
	name = "Soviet Grenadier Assistant"
	back = /obj/item/weapon/storage/backpack/rpgsa/assistant
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/machinegunner
	name = "Soviet MG"
	l_hand = /obj/item/weapon/gun/projectile/automatic/pkm

/decl/hierarchy/outfit/escalation/warpac/cccp/rifleman
	name = "Soviet Riflemen"
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/marksman
	name = "Soviet Marksmen"
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/medic
	name = "Soviet Medic"
	belt = /obj/item/weapon/storage/belt/sa/medical
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/headmedic
	name = "Soviet Head Medic"
	belt = /obj/item/weapon/storage/belt/sa/medical

/decl/hierarchy/outfit/escalation/warpac/cccp/hwscom
	name = "Soviet HWS Commander"
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/hwsgun
	name = "Soviet HWS Gunner"
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/hwsass
	name = "Soviet HWS Assistant"
	l_hand = /obj/item/weapon/gun/projectile/automatic/ak74

/decl/hierarchy/outfit/escalation/warpac/cccp/reconcom
	name = "Soviet Scout Commander"
	uniform = /obj/item/clothing/under/escalation/berezka

/decl/hierarchy/outfit/escalation/warpac/cccp/reconcomdep
	name = "Soviet Scout Deputy Commander"
	uniform = /obj/item/clothing/under/escalation/berezka

/decl/hierarchy/outfit/escalation/warpac/cccp/reconradio
	name = "Soviet Scout Radist"
	uniform = /obj/item/clothing/under/escalation/berezka
	back = /obj/item/device/radio/escalation/command/warpac

/decl/hierarchy/outfit/escalation/warpac/cccp/reconmarks
	name = "Soviet Scout Marksmen"
	uniform = /obj/item/clothing/under/escalation/berezka

/decl/hierarchy/outfit/escalation/warpac/cccp/recon
	name = "Soviet Scout"
	uniform = /obj/item/clothing/under/escalation/berezka

//////////////////////////CSLA/////////////////////////////////////////

/decl/hierarchy/outfit/escalation/warpac/csla
	uniform = /obj/item/clothing/under/escalation/czech
	head = /obj/item/clothing/head/helmet/escalation/sa/ush
	suit = /obj/item/clothing/suit/storage/vest/escalation/csla_harness
	belt = /obj/item/weapon/storage/belt/csla
	gloves = /obj/item/clothing/gloves/escalation/csla

/decl/hierarchy/outfit/escalation/warpac/csla/lieutenant
	name = "Czechoslovak Leader"
	uniform = /obj/item/clothing/under/escalation/czech_officer
	head = /obj/item/clothing/head/helmet/escalation/sa/ushofficer
	r_hand = /obj/item/weapon/gun/projectile/cz82
	l_hand = /obj/item/weapon/gun/projectile/automatic/vz58
	id_pda_assignment = "Poruchik"

/decl/hierarchy/outfit/escalation/warpac/csla/sublieutenant
	name = "Czechoslovak Deputy Leader"
	uniform = /obj/item/clothing/under/escalation/czech_officer
	head = /obj/item/clothing/head/helmet/escalation/sa/ushofficer
	r_hand = /obj/item/weapon/gun/projectile/cz82
	l_hand = /obj/item/weapon/gun/projectile/automatic/vz58

/decl/hierarchy/outfit/escalation/warpac/csla/sergeant
	name = "Czechoslovak Squad Leader"
	uniform = /obj/item/clothing/under/escalation/czech_officer
	r_hand = /obj/item/weapon/gun/projectile/cz82
	l_hand = /obj/item/weapon/gun/projectile/automatic/vz58

/decl/hierarchy/outfit/escalation/warpac/csla/platradio
	name = "Czechoslovak Platoon Radiomen"
	back = /obj/item/device/radio/escalation/command/warpac
	l_hand = /obj/item/weapon/gun/projectile/automatic/vz58

/decl/hierarchy/outfit/escalation/warpac/csla/subsergeant
	name = "Czechoslovak Squad Leader Deputy"
	l_hand = /obj/item/weapon/gun/projectile/automatic/vz58gl

/decl/hierarchy/outfit/escalation/warpac/csla/gunner
	name = "Czechoslovak MG"
	l_hand = /obj/item/weapon/gun/projectile/automatic/vz59

/decl/hierarchy/outfit/escalation/warpac/csla/grenadier
	name = "Czechoslovak Grenadier"
	back = /obj/item/weapon/storage/backpack/rpgcsla
	r_hand = /obj/item/weapon/gun/launcher/rpg7
	l_hand = /obj/item/weapon/gun/projectile/automatic/vz58

/decl/hierarchy/outfit/escalation/warpac/csla/grenass
	name = "Czechoslovak Grenadier Assistant"
	back = /obj/item/weapon/storage/backpack/rpgcsla/assistant
	l_hand = /obj/item/weapon/gun/projectile/automatic/vz58

/decl/hierarchy/outfit/escalation/warpac/csla/squadradio
	name = "Czechoslovak Radiomen"
	back = /obj/item/device/radio/escalation/command/warpac
	l_hand = /obj/item/weapon/gun/projectile/automatic/vz58

/decl/hierarchy/outfit/escalation/warpac/csla/rifleman
	name = "Czechoslovak Squad Riflemen"
	l_hand = /obj/item/weapon/gun/projectile/automatic/vz58

/decl/hierarchy/outfit/escalation/warpac/csla/marksman
	name = "Czechoslovak Marksmen"
	l_hand = /obj/item/weapon/gun/projectile/automatic/svd

/decl/hierarchy/outfit/escalation/warpac/csla/medic
	name = "Czechoslovak Medic"
	belt = /obj/item/weapon/storage/belt/csla/medical
	l_hand = /obj/item/weapon/gun/projectile/automatic/vz58