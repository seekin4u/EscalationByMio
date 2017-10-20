#if !defined(USING_MAP_DATUM)

	#include "../coldwar-2bunks/coldwar_areas.dm"
	#include "../coldwar-2bunks/coldwar_effects.dm"
	#include "../coldwar-2bunks/coldwar_shuttles.dm"

	#include "../shared/exodus_torch/_include.dm"

	#include "coldwar-1.dmm"

	#include "../../code/escalation/modules/lobby_music/random_lobby.dm"

	#define USING_MAP_DATUM /datum/map/coldwar

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Exodus

#endif
