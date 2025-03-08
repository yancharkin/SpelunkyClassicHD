function enableTouchInput() {
	scale_level = global.display_h / 240;
	vkey_size = 32 * scale_level;

	// Left
	virtual_key_add(global.touchCorrectionH, global.display_h - (2*vkey_size) - global.touchCorrectionV, vkey_size, vkey_size, global.keyLeftVal);
	// Up + Left
	virtual_key_add(global.touchCorrectionH, global.display_h - (3*vkey_size) - global.touchCorrectionV/3, vkey_size, vkey_size, global.keyLeftVal);
	virtual_key_add(global.touchCorrectionH, global.display_h - (3*vkey_size) - global.touchCorrectionV/3, vkey_size, vkey_size, global.keyUpVal);
	// Up
	virtual_key_add(vkey_size + global.touchCorrectionH, global.display_h - (3*vkey_size) - global.touchCorrectionV/3, vkey_size, vkey_size, global.keyUpVal);
	// Up + Right
	virtual_key_add(2*vkey_size + global.touchCorrectionH, global.display_h - (3*vkey_size) - global.touchCorrectionV/3, vkey_size, vkey_size, global.keyRightVal);
	virtual_key_add(2*vkey_size + global.touchCorrectionH, global.display_h - (3*vkey_size) - global.touchCorrectionV/3, vkey_size, vkey_size, global.keyUpVal);
	// Right
	virtual_key_add(2*vkey_size + global.touchCorrectionH, global.display_h - (2*vkey_size) - global.touchCorrectionV, vkey_size, vkey_size, global.keyRightVal);
	// Down + Right
	virtual_key_add(2*vkey_size + global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size, global.keyRightVal);
	virtual_key_add(2*vkey_size + global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size, global.keyDownVal);
	// Down
	virtual_key_add(vkey_size + global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size, global.keyDownVal);
	// Down + left
	virtual_key_add(global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size, global.keyLeftVal);
	virtual_key_add(global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size, global.keyDownVal);
	// Attack
	virtual_key_add(global.display_w - global.touchCorrectionH -  (2.5*vkey_size), global.display_h - global.touchCorrectionV - vkey_size, vkey_size, vkey_size, global.keyAttackVal);
	// Jump
	virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, global.display_h - global.touchCorrectionV - vkey_size, vkey_size, vkey_size, global.keyJumpVal);
	// Item
	virtual_key_add(global.display_w - global.touchCorrectionH - (2.5*vkey_size), global.display_h - global.touchCorrectionV/2 - (2.5*vkey_size), vkey_size, vkey_size, global.keyItemVal);
	// Run
	virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, global.display_h - global.touchCorrectionV/2 - (2.5*vkey_size), vkey_size, vkey_size, global.keyRunVal);
	// Pause
	virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, 0 + global.touchCorrectionV, vkey_size, vkey_size, vk_escape);
	virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, 0 + global.touchCorrectionV, vkey_size, vkey_size, global.keyStartVal);
	// Language
	virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, vkey_size + global.touchCorrectionV/2, vkey_size, vkey_size, global.keyLangVal);
	// Pay
	virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, 2*vkey_size + global.touchCorrectionV/2, vkey_size, vkey_size, global.keyPayVal);
	// Rope
	virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, 3*vkey_size + global.touchCorrectionV/3, vkey_size, vkey_size, global.keyRopeVal);
	// Bomb
	virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, 4*vkey_size + global.touchCorrectionV/4, vkey_size, vkey_size, global.keyBombVal);
	// Debug buttons
	if (global.debugBuild) {
	    virtual_key_add(global.display_w/2 - 2*vkey_size - global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size,  vk_f2);
	    virtual_key_add(global.display_w/2 - vkey_size - global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size,  vk_f3);
	    virtual_key_add(global.display_w/2 - global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size,  vk_f4);
	    virtual_key_add(global.display_w/2 + vkey_size - global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size,  vk_f5);
	}
}