/// @description showMessages
function showMessages() {
	if (global.messageTimer > 0) {
	    if (global.html5Build) {
	        y1 = __view_get( e__VW.YView, 0 ) + 216 + 8 - global.fontSmallHeight;
	        y2 = y1 + global.fontSmallHeight;
	        if (is_array(global.message)) {
	            drawHighlightedMessage(global.message, __view_get( e__VW.XView, 0 ), y1, 1);
	        } else {
	            drawMessage(global.message, "small", c_white, __view_get( e__VW.XView, 0 ), y1, 1);
	        }
	        if (is_array(global.message2)) {
	            drawHighlightedMessage(global.message2, __view_get( e__VW.XView, 0 ), y2, 2);
	        } else {
	            drawMessage(global.message2, "small", c_white, __view_get( e__VW.XView, 0 ), y2, 2);
	        }
	    } else {
	        y1 = 216 + 8 - global.fontSmallHeight;
	        y2 = y1 + global.fontSmallHeight;
	        if (is_array(global.message)) {
	            drawHighlightedMessage(global.message, 0, y1, 1);
	        } else {
	            drawMessage(global.message, "small", c_white, 0, y1, 1);
	        }
	        if (is_array(global.message2)) {
	            drawHighlightedMessage(global.message2, 0, y2, 2);
	        } else {
	            drawMessage(global.message2, "small", c_white, 0, y2, 2);
	        }
	    }
	    global.messageTimer -= 1;
	}
}
