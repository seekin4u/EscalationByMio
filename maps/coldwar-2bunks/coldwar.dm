#if !defined(USING_MAP_DATUM)

	#include "coldwar_areas.dm"
	#include "coldwar_effects.dm"
	#include "coldwar_shuttles.dm"

	#include "soviet.dmm"
	#include "nato.dmm"
	#include "battleground.dmm"
	#include "shuttles-intertim.dmm"

	#include "../../code/escalation/modules/lobby_music/random_lobby.dm"

	#define USING_MAP_DATUM /datum/map/coldwar

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring exists one

#endif
