/// @description drawTextRtl(text, fontSize color, pX, pY)
function drawTextRtl(text, fontSize, color, pX, pY) {
	var fontWidth = 8;
	if (fontSize == "large") fontWidth = 16;
	var strLen = string_length(text)*fontWidth;
	var X = pX - strLen;
	if (pX == 0) {
		X = global.display_w - strLen - 8;
	} else if (pX == -8) { // hack to solve strange issue that arabic translation for KILLS rendered on the wrong position
		X = global.display_w - strLen;
	}
	drawText(text, fontSize, color, X, pY);
}
