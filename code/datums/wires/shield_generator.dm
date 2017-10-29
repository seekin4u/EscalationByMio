/datum/wires/shield_generator
	wire_count = 1

var/const/SHIELDGEN_WIRE_POWER = 1			// Cut to disable power input into the generator. Pulse does nothing. Mend to restore.
var/const/SHIELDGEN_WIRE_HACK = 2			// Pulse to hack the generator, enabling hacked modes. Cut to unhack. Mend does nothing.
var/const/SHIELDGEN_WIRE_CONTROL = 4		// Cut to lock most shield controls. Mend to unlock them. Pulse does nothing.
var/const/SHIELDGEN_WIRE_AICONTROL = 8		// Cut to disable AI control. Mend to restore.
var/const/SHIELDGEN_WIRE_NOTHING = 16		// A blank wire that doesn't have any specific function

/datum/wires/shield_generator/CanUse()
	return 0

/datum/wires/shield_generator/UpdateCut(index, mended)
	return

/datum/wires/shield_generator/UpdatePulsed(var/index)
	return

/datum/wires/shield_generator/GetInteractWindow()
	return