/// @description trMessages(message1, message2, messageHighlights, message2Highlights)
/// @param message1
/// @param message2
/// @param messageHighlights
/// @param message2Highlights
/// @param messageTimer

function trMessages(){
	var message1 = argument[0];
	var message2 = argument[1];
	var messageHighlights = argument[2];
	var message2Highlights = argument[3];
	var messageTimer = argument[4];
	
	global.message1_src = message1;
	global.message2_src = message2;
	
	if (not is_array(message1)) {
		global.message1 = tr(message1);
	} else {
		if (global.locale == "ar") message1 = array_reverse(message1)
		var new_message1 = []
		for (var i = 0; i < array_length(message1); i++) {
			new_message1[i] = tr(message1[i]);
		}
		global.message1 = new_message1;
	}
	if (not is_array(message2)) {
		global.message2 = tr(message2);
	} else {
		if (global.locale == "ar") message2 = array_reverse(message2)
		var new_message2 = []
		for (var i = 0; i < array_length(message2); i++) {
			new_message2[i] = tr(message2[i]);
		}
		global.message2 = new_message2;
	}
	if (global.locale == "ar") {
		if (is_array(messageHighlights)) {
			for (var i = 0; i < array_length(messageHighlights); i++) {
				if (messageHighlights[i] == 0) {
					messageHighlights[i] = array_length(message1) - 1;
				} else if (messageHighlights[i] == (array_length(message1) - 1)) {
					messageHighlights[i] = 0;
				}
			}
		} else {
			if (messageHighlights == 0) {
				messageHighlights = array_length(message1) - 1;
			} else if (messageHighlights == (array_length(message1) - 1)) {
				messageHighlights = 0;
			}
		}
		if (is_array(message2Highlights)) {
			for (var i = 0; i < array_length(message2Highlights); i++) {
				if (message2Highlights[i] == 0) {
					message2Highlights[i] = array_length(message2) - 1;
				} else if (message2Highlights[i] == (array_length(message2) - 1)) {
					message2Highlights[i] = 0;
				}
			}
		} else {
			if (message2Highlights == 0) {
				message2Highlights = array_length(message2) - 1;
			} else if (message2Highlights == (array_length(message2) - 1)) {
				message2Highlights = 0;
			}
		}
	}
	global.messageHighlights = messageHighlights;
	global.message2Highlights = message2Highlights;
	global.messageTimer = messageTimer;
}