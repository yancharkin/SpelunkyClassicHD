/// @description drawHighlightedMessage (message, offsetX, posY, messageN)
/// @param message
/// @param  offsetX
/// @param  posY
/// @param  messageN
function drawHighlightedMessage() {

	var message = argument[0];
	var offsetX = argument[1];
	var posY = argument[2];
	var messageN = argument[3];
	var text = "";

	for (var i = 0; i < array_length_1d(message); i++) {
	    text += message[i];
	}

	if (global.messageBackground) {
	    strLen = string_length(text)*global.fontSmallWidth;
	    posX = ceil((global.display_w - strLen) / 2);
	    if (strLen != 0) {
	        bx1 = posX + offsetX - (global.fontSmallWidth/4);
	        if (messageN == 1) {
	            posY = posY - int64(global.fontSmallHeight/2);
	        }
	        by1 = posY;
	        bx2 = bx1 + strLen;
	        by2 = by1 + global.fontSmallHeight;
	        draw_set_color(c_black);
	        draw_rectangle(bx1, by1, bx2, by2, false);
	    }
	}

	fullStrLen = string_length(text)*global.fontSmallWidth;
	posX = ceil((global.display_w - fullStrLen) / 2);

	draw_set_font(global.fontSmall);
	var previousStrLen = 0;
	for (var i = 0; i < array_length_1d(message); i++) {
	    draw_set_color(c_white);
	    if (messageN == 1) {
	        if (is_array(global.messageHighlights)) {
	            for (var j = 0; j < array_length_1d(global.messageHighlights); j++) {
	                if (i == global.messageHighlights[j]) {
	                    draw_set_color(c_yellow);
	                }
	            }
	        }
	    } else if (messageN == 2) {
	        if (is_array(global.message2Highlights)) {
	            for (var j = 0; j < array_length_1d(global.message2Highlights); j++) {
	                if (i == global.message2Highlights[j]) {
	                    draw_set_color(c_yellow);
	                }
	            }
	        }
	    }
	    draw_text(posX + offsetX + previousStrLen, posY, string_hash_to_newline(message[i]));
	    previousStrLen += string_length(message[i])*global.fontSmallWidth;
	}



}
