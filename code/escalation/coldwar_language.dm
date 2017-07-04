//coldwar languages

/datum/language/russian
	name = "Russian"
	desc = "This is the languaged used by the Warsaw Pact forces."
	speech_verb = "says"
	whisper_verb = "whispers"
	colour = "russian"
	key = "r"
	flags = RESTRICTED
	syllables = list("ал", "ан", "бы", "ве", "во", "го", "де", "ел", "ен", "ер", "ет", "ка", "ко", "ла", "ли", "ло", "ль", "на", "не", "ни", "но", "ов", "ол", "он", "ор", "слог", "от", "по", "пр", "ра", "ре", "ро", "ст", "та", "те", "то", "ть", "ать", "был", "вер", "его", "ени", "енн", "ест", "как", "льн", "ова", "ого", "оль", "оро", "ост", "ото", "при", "про", "ста", "ств", "тор", "что", "это")


/datum/language/english
	name = "English"
	desc = "This is the languaged used by the NATO forces."
	speech_verb = "says"
	whisper_verb = "whispers"
	colour = "english"
	key = "e"
	flags = RESTRICTED
	syllables = list("al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it", "le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to", "ve", "wa", "all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin", "his", "ing", "ion", "ith", "not", "ome", "oul", "our", "sho", "ted", "ter", "tha", "the", "thi", "tio", "uld", "ver", "was", "wit", "you")

/datum/language/english/get_spoken_verb(var/msg_end)
	switch(msg_end)
		if("!")
			return pick("exclaims", "shouts", "yells") //TODO: make the basic proc handle lists of verbs.
		if("?")
			return ask_verb
	return speech_verb