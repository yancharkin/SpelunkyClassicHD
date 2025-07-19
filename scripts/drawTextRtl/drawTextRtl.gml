/// @description drawTextRtl(text, color, pY)
function drawTextRtl(text, color, pY) {
		var strLen = string_length(text)*global.fontSmallWidth;
		drawText(text, "small", color, global.display_w - strLen - 8, pY);
}