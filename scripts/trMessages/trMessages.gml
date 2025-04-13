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
		var new_message1 = []
		for (var i = 0; i < array_length(message1); i++) {
			new_message1[i] = tr(message1[i]);
		}
		global.message1 = new_message1;
	}
	if (not is_array(message2)) {
		global.message2 = tr(message2);
	} else {
		var new_message2 = []
		for (var i = 0; i < array_length(message2); i++) {
			new_message2[i] = tr(message2[i]);
		}
		global.message2 = new_message2;
	}
	global.messageHighlights = messageHighlights;
	global.message2Highlights = message2Highlights;
	global.messageTimer = messageTimer;
}