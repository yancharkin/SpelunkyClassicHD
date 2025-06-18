/// @description showMessages
function showMessages() {
	if (global.messageTimer > 0) {
		y1 = 216 - global.fontSmallHeight;
		y2 = y1 + 2*global.fontSmallHeight;
		if (is_array(global.message1)) {
		    drawHighlightedMessage(global.message1, 0, y1, 1);
		} else {
		    drawMessage(global.message1, "small", c_white, 0, y1, 1);
		}
		if (is_array(global.message2)) {
		    drawHighlightedMessage(global.message2, 0, y2, 2);
		} else {
		    drawMessage(global.message2, "small", c_white, 0, y2, 2);
		}
	    global.messageTimer -= 1;
	}
}