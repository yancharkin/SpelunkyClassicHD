function changeTouchOffset() {
	var newOffset = (global.touchOffsetH + global.touchOffsetChangeBy);
	if !(newOffset < 0.5) {
		var maxOffset = (global.display_w/2 - 4*global.vkeySize)/global.vkeySize;
		var maxOffsetInt = floor(maxOffset);
		var maxOffsetDec = maxOffset - maxOffsetInt;
		maxOffset = maxOffsetInt;
		if (maxOffsetDec >= 0.5) maxOffset += 0.5;
		global.touchOffsetH = newOffset;
		if (newOffset >= maxOffset) global.touchOffsetH = maxOffset;
		enableTouchInput();
	}
}