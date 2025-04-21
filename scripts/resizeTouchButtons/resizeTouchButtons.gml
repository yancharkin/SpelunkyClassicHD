function resizeTouchButtons() {
	var newVkeySize = global.vkeySize + global.vkeySizeChangeBy;
	if (!(newVkeySize < 32) and !(newVkeySize > 48)) {
		global.vkeySize = newVkeySize;
		enableTouchInput();
		changeTouchOffset();
	}
}