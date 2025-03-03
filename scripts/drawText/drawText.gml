/// @description drawText(text, fontSize, color, posX, posY)
/// @param text
/// @param  fontSize
/// @param  color
/// @param  posX
/// @param  posY
function drawText() {

	var text = argument[0];
	var fontSize = argument[1];
	var color = argument[2];
	var posX = argument[3];
	var posY = argument[4];

	if (fontSize == "small") {
	    draw_set_font(global.fontSmall);
	} else {
	    draw_set_font(global.fontLarge);
	}

	draw_set_color(color);
	draw_text(posX, posY, string_hash_to_newline(text));



}
