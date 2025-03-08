/// @description drawMessage (text, fontSize, color, offsetX, posY, messageN)
/// @param text
/// @param  fontSize
/// @param  color
/// @param  offsetX
/// @param  posY
/// @param  messageN
function drawMessage() {

	var text = argument[0];
	var fontSize = argument[1];
	var color = argument[2];
	var offsetX = argument[3];
	var posY = argument[4];
	var messageN = argument[5];

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

	drawTextHCentered(text, fontSize, color, offsetX, posY);

}
