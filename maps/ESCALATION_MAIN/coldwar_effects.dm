//В переездах между локациями можно выйти из урала и проебаться. Для каждой фракции своя комнатка для потерянных долбаебов
/obj/effect/step_trigger/teleporter/random/Crossed(A as mob|obj)
	if(isghost(A))
		return
	Trigger(A)

/obj/effect/step_trigger/teleporter/random/trucks_ural
	icon = 'icons/escalation/effects/effect.dmi'
	icon_state = "rantom_tele_ural"
	teleport_x = 2
	teleport_y = 2
	teleport_z = 4
//howtouse : rand(teleport, teleport_offset)
	teleport_x_offset = 10
	teleport_y_offset = 10
	teleport_z_offset = 4

/obj/effect/step_trigger/teleporter/random/trucks_m35
	icon = 'icons/escalation/effects/effect.dmi'
	icon_state = "rantom_tele_m35"
	teleport_x = 12
	teleport_y = 2
	teleport_z = 4

	teleport_x_offset = 20
	teleport_y_offset = 10
	teleport_z_offset = 4