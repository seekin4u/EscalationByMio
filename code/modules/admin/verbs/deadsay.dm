/client/proc/dsay(msg as text)
	set category = "Server"
	set name = "Dsay" //Gave this shit a shorter name so you only have to type out "dsay" rather than "dead say" to use it --NeoFite
	set hidden = 1

	if(!src.holder)
		to_chat(src, "Only administrators may use this command.")
		return

	sanitize_and_communicate(/decl/communication_channel/dsay, src, msg, /decl/dsay_communication/admin)
	feedback_add_details("admin_verb","D") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
