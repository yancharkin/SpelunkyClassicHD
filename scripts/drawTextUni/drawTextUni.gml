/// @description drawTextUni(text, fontSize color, pX, pY)
function drawTextUni(text, fontSize, color, pX, pY) {
	if (global.locale != "ar") {
			drawText(text, fontSize, color, pX, pY);
	} else {
			drawTextRtl(text, fontSize, color, pX, pY);
	}
}