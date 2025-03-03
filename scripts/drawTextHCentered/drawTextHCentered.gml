/// @description drawTextHCentered(text, fontSize, color, offsetX, posY)
/// @param text
/// @param  fontSize
/// @param  color
/// @param  offsetX
/// @param  posY
function drawTextHCentered() {

	var text = argument[0];
	var fontSize = argument[1];
	var color = argument[2];
	var offsetX = argument[3];
	var posY = argument[4];

	if (fontSize == "small") {
	    strLen = string_length(text)*global.fontSmallWidth;
	    draw_set_font(global.fontSmall);
	} else {
	    strLen = string_length(text)*global.fontLargeWidth;
	    draw_set_font(global.fontLarge);
	}

	posX = ceil((global.display_w - strLen) / 2);
	draw_set_color(color);
	draw_text(posX + offsetX, posY, string_hash_to_newline(text));



}
