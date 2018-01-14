/obj/effect/decl/escalation/light
	icon = 'icons/escalation/effects/effect.dmi'

/obj/effect/decl/escalation/light/smallest_light_source
	name = "very small light source"
	desc = "you shouldn't see this"

/obj/effect/decl/escalation/light/smallest_light_source/New()
#if ESC_DEBUG
	world.log << "Set light to [src.name]/New()"
#endif
	set_light(3, 3, COLOR_WHITE)

/obj/effect/decl/escalation/light/small_light_source
	name = "small light source"
	desc = "you shouldn't see this"

/obj/effect/decl/escalation/light/small_light_source/New()
#if ESC_DEBUG
	world.log << "Set light to [src.name]/New()"
#endif
	set_light(5, 5, COLOR_WHITE)

/obj/effect/decl/escalation/light/medium_light_source
	name = "medium light source"
	desc = "you shouldn't see this"

/obj/effect/decl/escalation/light/medium_light_source/New()
#if ESC_DEBUG
	world.log << "Set light to [src.name]/New()"
#endif
	set_light(10, 10, COLOR_WHITE)

/obj/effect/decl/escalation/light/big_light_source
	name = "big light source"
	desc = "you shouldn't see this"

/obj/effect/decl/escalation/light/big_light_source/New()
#if ESC_DEBUG
	world.log << "Set light to [src.name]/New()"
#endif
	set_light(20, 20, COLOR_WHITE)