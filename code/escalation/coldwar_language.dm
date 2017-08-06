//coldwar languages

/proc/add_team_language(var/mob/living/carbon/human/target)
	if(!ishuman(target))
		return

	var/mob/living/carbon/human/H = target

	if(!H.chosenSlot || !H.chosenSlot.faction_tag)
		return

	H.remove_language(LANGUAGE_GALCOM)

	var/datum/language/L = null
	switch(H.chosenSlot.faction_tag)
		if("usmc")
			H.add_language(LANGUAGE_ENGLISH)
			L = all_languages[LANGUAGE_ENGLISH]

		if("cccp")
			H.add_language(LANGUAGE_RUSSIAN)
			L = all_languages[LANGUAGE_RUSSIAN]

		if("csla")
			H.add_language(LANGUAGE_CZECH)
			L = all_languages[LANGUAGE_CZECH]

		if("bund")
			H.add_language(LANGUAGE_GERMAN)
			L = all_languages[LANGUAGE_GERMAN]

	if(L)
		H.default_language = L

	return 1

/proc/add_other_languages(var/mob/living/carbon/human/target)

	if(!ishuman(target))
		return

	var/mob/living/carbon/human/H = target

	if(!H.chosenSlot || !H.chosenSlot.also_known_languages.len)
		return

	var/i

	for(i in H.chosenSlot.also_known_languages)
		if(prob(H.chosenSlot.also_known_languages[i]))
			H.add_language(i)

/datum/language/escalation
	name = "Escalation language"
	desc = "Nothing. Just code stuff"
	speech_verb = "says"
	whisper_verb = "whispers"
	flags = RESTRICTED

/datum/language/escalation/get_spoken_verb(var/msg_end)
	switch(msg_end)
		if("!")
			return pick("exclaims", "shouts", "yells") //TODO: make the basic proc handle lists of verbs.
		if("?")
			return ask_verb
	return speech_verb

/datum/language/escalation/russian
	name = "Russian"
	desc = "This is the languaged used by the Soviet Army."
	colour = "russian"
	key = "r"
	syllables = list("ал", "ан", "бы", "ве", "во", "го", "де", "ел", "ен", "ер", "ет", "ка", "ко", "ла", "ли", "ло", "ль", "на", "не", "ни", "но", "ов", "ол", "он", "ор", "слог", "от", "по", "пр", "ра", "ре", "ро", "ст", "та", "те", "то", "ть", "ать", "был", "вер", "его", "ени", "енн", "ест", "как", "льн", "ова", "ого", "оль", "оро", "ост", "ото", "при", "про", "ста", "ств", "тор", "что", "это")


/datum/language/escalation/english
	name = "English"
	desc = "This is the languaged used by the American Army."
	colour = "english"
	key = "e"
	syllables = list("al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it", "le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to", "ve", "wa", "all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin", "his", "ing", "ion", "ith", "not", "ome", "oul", "our", "sho", "ted", "ter", "tha", "the", "thi", "tio", "uld", "ver", "was", "wit", "you")

/datum/language/escalation/czech
	name = "Czech"
	desc = "This is the languaged used by the CSLA."
	colour = "czech"
	key = "cz"
	syllables = list("byt", "ten", "ze", "ktery", "pan", "hlava", "zem", "lide", "doba", "dobry", "cely", "maly", "mozny", "pevny", "trvanlivy", "odolny", "solidni", "bytelny", "nezdolny", "silny", "tuhy", "hutny", "prurazny", "tvrdy", "rozhodny", "nezlomny", "staly", "scvrnkly", "energicky", "nezmenitelnэ", "Юi", "ved", "dur", "pec", "dбt", "bэt", "ten", "on", "na", "Юe", "kterэ", "pбn", "Юivot", "clo", "vek", "prб", "zeme", "lidй", "dob", "hlav", "mнt", "moci", "muse", "vedet", "chtнt", "jнt", "rнci", "celэ", "Юivэ", "trvanlivэ", "houЮevnatэ", "dobrэ")