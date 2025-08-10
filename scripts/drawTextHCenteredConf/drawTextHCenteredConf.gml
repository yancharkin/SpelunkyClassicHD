/// @description drawTextHCenteredConf(text, fontSize, color, offsetX, posY)
function drawTextHCenteredConf(text, fontSize, color, offsetX, posY) {
	var strLen;
	strLen = string_length(text)*global.fontSmallWidth;
	if (fontSize == "large") strLen = string_length(text)*global.fontLargeWidth;
	var n = ceil((160 - strLen)/2);
	drawText(text, fontSize, color, n+offsetX, posY);
}