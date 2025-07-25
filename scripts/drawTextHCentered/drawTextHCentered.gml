/// @description drawTextHCentered(text, fontSize, color, offsetX, posY)
/// @param text
/// @param  fontSize
/// @param  color
/// @param  offsetX
/// @param  posY
/// @param  isMessage
function drawTextHCentered() {
	
	var text = argument[0];
	var fontSize = argument[1];
	var color = argument[2];
	var offsetX = argument[3];
	var posY = argument[4];
	var isMessage = argument[5];
	var posX;
	var strLen;

	if (global.locale != "ar") {
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
	} else {
		if (not string_has_digits(text)) {
			text = string_replace_all(text, "<", "[");
			text = string_replace_all(text, ">", "]");
			text = string_replace_all(text, "[", ">");
			text = string_replace_all(text, "]", "<");
		};
		var textAr = scribble(text);
		strLen = textAr.get_width();
		posX = ceil((global.display_w - textAr.get_width()) / 2);
		//if ((isMessage) and (strLen != 0)) {
		//	scribble("[c_black][offset,0,1]" + text).draw(posX + offsetX, posY);
		//	scribble("[c_black][offset,0,-1]" + text).draw(posX + offsetX, posY);
		//}
		textAr.blend(color, 1);
		textAr.draw(posX + offsetX, posY);
	}
}