#if !defined(USING_MAP_DATUM)

	#include "coldwar_areas.dm"
	#include "coldwar_effects.dm"
	#include "coldwar_shuttles.dm"

	//#include "coldwar_unit_testing.dm"
	//#include "coldwar_zas_tests.dm"

	/*#include "loadout/loadout_accessories.dm"
	#include "loadout/loadout_eyes.dm"
	#include "loadout/loadout_head.dm"
	#include "loadout/loadout_shoes.dm"
	#include "loadout/loadout_suit.dm"
	#include "loadout/loadout_uniform.dm"
	#include "loadout/loadout_xeno.dm"*/

	#include "../shared/exodus_torch/_include.dm"

	#include "main_bg_under.dmm"//nato underground - 1
	#include "main_bg.dmm"//nato base - 2
	#include "sukablyat.dmm"//soviet base - 3
	#include "coldwar-4.dmm"//transition level
	#include "coldwar-1.dmm"//tests

	//to add new sounds - go by this path and add new 'path' to list.
	#include "../../code/escalation/modules/lobby_music/random_lobby.dm"

	#define USING_MAP_DATUM /datum/map/coldwar

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Exodus

#endif
