
/area/coldwar
	name = "area"
	icon = 'icons/escalation/turf/area.dmi'
	icon_state = "hallF"
	requires_power = 0
	lighting_use_dynamic = 0//Say NO to lighting! SNEAKY BITCH
	base_turf = /turf/simulated/floor/dirt

/area/coldwar/outside
	name = "outside"
	icon_state = "outside"
	sound_env = PLAIN
	forced_ambience = list('sound/effects/wind/windloopoutdoors.ogg')
	ambience = list (
	'sound/ambience/coldwar/battle_loop1.ogg',
	'sound/ambience/coldwar/battle_loop2.ogg',
	'sound/ambience/coldwar/d_dog1.ogg',
	'sound/ambience/coldwar/d_dog2.ogg',
	'sound/ambience/coldwar/d_dog3.ogg',
	'sound/ambience/coldwar/plane1.ogg',
	'sound/ambience/coldwar/plane2.ogg',
	'sound/ambience/coldwar/hel1.ogg',
	'sound/ambience/coldwar/hel2.ogg',
	'sound/ambience/coldwar/snowstorm_outdoor_loop1.ogg'
	)
/area/coldwar/forest
	name = "forest"
	icon_state = "forest"
	sound_env = FOREST
	forced_ambience = list('sound/effects/wind/windloopoutdoors.ogg')
	ambience = list (
	'sound/ambience/coldwar/battle_loop1.ogg',
	'sound/ambience/coldwar/battle_loop2.ogg',
	'sound/ambience/coldwar/d_dog1.ogg',
	'sound/ambience/coldwar/d_dog2.ogg',
	'sound/ambience/coldwar/d_dog3.ogg',
	'sound/ambience/coldwar/plane1.ogg',
	'sound/ambience/coldwar/plane2.ogg',
	'sound/ambience/coldwar/hel1.ogg',
	'sound/ambience/coldwar/hel2.ogg',
	'sound/ambience/coldwar/snowstorm_outdoor_loop1.ogg'
	)

/area/coldwar/civdef
	name = "civil defence bunker"
	icon_state = "civildefence"
	sound_env = LARGE_ENCLOSED
	ambience = list('sound/ambience/coldwar/creepyamb1.ogg','sound/ambience/coldwar/creepyamb2.ogg','sound/ambience/coldwar/creepyamb3.ogg')
	forced_ambience = list('sound/ambience/coldwar/electrichum.ogg')

/area/coldwar/house1
	name = "house"
	icon_state = "house"
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')
	sound_env = LIVINGROOM

/area/coldwar/house2
	name = "house"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/house3
	name = "house"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/house4
	name = "house"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/house5
	name = "house"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/house6
	name = "house"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/house7
	name = "house"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/house8
	name = "house"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/house9
	name = "house"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/house10
	name = "house"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/shop
	name = "shop"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/gasoline
	name = "gasoline"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/cafe
	name = "cafe"
	icon_state = "house"
	sound_env = LIVINGROOM
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')

/area/coldwar/usmc1/usmc_fob
	name = "USMC FOB"
	icon_state = "usmcfob"
	sound_env = PLAIN
	forced_ambience = list('sound/effects/wind/windloopindoors.ogg')
	ambience = list (
	'sound/ambience/coldwar/plane1.ogg',
	'sound/ambience/coldwar/plane2.ogg',
	'sound/ambience/coldwar/hel1.ogg',
	'sound/ambience/coldwar/hel2.ogg'
	)

//////////////////////////////////
///TRUCKS STUFF, DO NOT TOUCH/////
//////////////////////////////////
/area/shuttle/truck/ural
	name = "\improper URAL BASE AREA"
	icon = 'icons/escalation/turf/area.dmi'
	icon_state = "ural1"
	base_turf = /turf/ground/gravsnow
	lighting_use_dynamic = 0

/area/shuttle/truck/ural/intertim
	name = "\improper URAL intertim"
	icon_state = "ural_intertim"

/area/shuttle/truck/ural/start
	name = "\improper URAL's start area"
	icon_state = "ural_start"

/area/shuttle/truck/ural/finish
	name = "\improper URAL's finish ares"
	icon_state = "ural_finish"

/*
	requires_power = 0
	sound_env = SMALL_ENCLOSED
	base_turf = /turf/space*/

//////////////////////////////////
//////////////////////////////////
//////////////////////////////////

/area/coldwar/stuff
	icon = 'icons/escalation/turf/area.dmi'
	icon_state = "unknown"
	requires_power = 0

/area/coldwar/stuff/use_lights
	lighting_use_dynamic = 1

/area/coldwar/stuff/town
	icon_state = "town"

/area/coldwar/stuff/roads
	icon_state = "roads"

/area/coldwar/stuff/hospital
	icon_state = "hospital"
	lighting_use_dynamic = 1

/area/coldwar/stuff/church
	icon_state = "church"

/area/coldwar/stuff/cantine
	icon_state = "cantine"

/area/coldwar/stuff/quarters
	icon_state = "quarters"
	//lighting_use_dynamic = 1

/area/coldwar/sa
	icon = 'icons/escalation/turf/area.dmi'
	icon_state = "sa"
	requires_power = 0

/area/coldwar/sa/sa_fob
	name = "SA fob"
	icon_state = "sa_fob"

/area/coldwar/sa/sa_bunk
	name = "SA bunker"
	icon_state = "sa_bunk"

/area/coldwar/sa/sa_kapter
	name = "SA kapterka"
	icon_state = "sa_kapter"

/area/coldwar/sa/sa_med
	name = "SA medbay"
	icon_state = "sa_med"

/area/coldwar/sa/sa_cant
	name = "SA cantine"
	icon_state = "sa_cant"

/area/coldwar/sa/spawn_area/sa_soldiers
	name = "SA soldiers barracks"
	icon_state = "sa_sold_spawn"

/area/coldwar/sa/spawn_area/sa_officers
	name = "SA officers barracks"
	icon_state = "sa_officers_spawn"

/area/coldwar/sa/spawn_area/cz_soldiers
	name = "CZ soldiers barracks"
	icon_state = "cz_sold_spawn"

/area/coldwar/sa/spawn_area/cz_officers
	name = "CZ officers barracks"
	icon_state = "cz_officers_spawn"

/area/coldwar/usmc
	icon = 'icons/escalation/turf/area.dmi'
	icon_state = "usmc"
	requires_power = 0

//TODO - sprites for it and replace another spsrites from icons/turf/area.dmi
/area/coldwar/usmc/usmc_fob
	name = "USMC fob"
	icon_state = "usmc_fob"

/area/coldwar/usmc/usmc_bace
	name = "USMC bace"
	icon_state = "usmc_bace"
	lighting_use_dynamic = 1

/*
/area/coldwar/usmc/usmc_tents

/area/coldwar/usmc/spawn_area/usmc_soldiers

/area/coldwar/usmc/spawn_area/usmc_officers

/area/coldwar/usmc/spawn_area/bund_soldiers

/area/coldwar/usmc/spawn_area/bund_officers*/

/area/coldwar/trucks
	name = ""
	icon = 'icons/escalation/turf/area.dmi'
	icon_state = "default"
	requires_power = 0


/area/coldwar/trucks/ural
	name = "ural_base"
	icon_state = "ural1"

/area/coldwar/trucks/ural/ural_home
	name = "ural_home"
	icon_state = "ural_start"

/area/coldwar/trucks/ural/ural_fob
	name = "ural_fob"
	icon_state = "ural_finish"

/area/coldwar/trucks/m35
	name = "m35_base"
	icon_state = "m35_1"

/area/coldwar/trucks/lost //for lost during traveling soldiers
	name = "lost"
	icon_state = "lost"