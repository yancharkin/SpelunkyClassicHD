function enableTouchInput() {
	scale_level = global.display_h / 240;
	vkey_size = 32 * scale_level;
	
	var touchDebug = false;
	var keys = [];
	
	// Left
	array_push(keys, virtual_key_add(global.touchCorrectionH, global.display_h - (2*vkey_size) - global.touchCorrectionV, vkey_size, vkey_size, global.keyLeftVal));
	// Up + Left
	array_push(keys, virtual_key_add(global.touchCorrectionH, global.display_h - (3*vkey_size) - global.touchCorrectionV/3, vkey_size, vkey_size, global.keyLeftVal));
	virtual_key_add(global.touchCorrectionH, global.display_h - (3*vkey_size) - global.touchCorrectionV/3, vkey_size, vkey_size, global.keyUpVal);
	// Up
	array_push(keys, virtual_key_add(vkey_size + global.touchCorrectionH, global.display_h - (3*vkey_size) - global.touchCorrectionV/3, vkey_size, vkey_size, global.keyUpVal));
	// Up + Right
	array_push(keys, virtual_key_add(2*vkey_size + global.touchCorrectionH, global.display_h - (3*vkey_size) - global.touchCorrectionV/3, vkey_size, vkey_size, global.keyRightVal));
	virtual_key_add(2*vkey_size + global.touchCorrectionH, global.display_h - (3*vkey_size) - global.touchCorrectionV/3, vkey_size, vkey_size, global.keyUpVal);
	// Right
	array_push(keys, virtual_key_add(2*vkey_size + global.touchCorrectionH, global.display_h - (2*vkey_size) - global.touchCorrectionV, vkey_size, vkey_size, global.keyRightVal));
	// Down + Right
	array_push(keys, virtual_key_add(2*vkey_size + global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size, global.keyRightVal))
	virtual_key_add(2*vkey_size + global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size, global.keyDownVal);
	// Down
	array_push(keys, virtual_key_add(vkey_size + global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size, global.keyDownVal));
	// Down + left
	array_push(keys, virtual_key_add(global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size, global.keyLeftVal));
	virtual_key_add(global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size, global.keyDownVal);
	// Attack
	array_push(keys, virtual_key_add(global.display_w - global.touchCorrectionH -  (2.5*vkey_size), global.display_h - global.touchCorrectionV - vkey_size, vkey_size, vkey_size, global.keyAttackVal));
	// Jump
	array_push(keys, virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, global.display_h - global.touchCorrectionV - vkey_size, vkey_size, vkey_size, global.keyJumpVal));
	// Item
	array_push(keys, virtual_key_add(global.display_w - global.touchCorrectionH - (2.5*vkey_size), global.display_h - global.touchCorrectionV/2 - (2.5*vkey_size), vkey_size, vkey_size, global.keyItemVal));
	// Run
	array_push(keys, virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, global.display_h - global.touchCorrectionV/2 - (2.5*vkey_size), vkey_size, vkey_size, global.keyRunVal));
	// Pause
	array_push(keys, virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, 0 + global.touchCorrectionV, vkey_size, vkey_size, vk_escape));
	virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, 0 + global.touchCorrectionV, vkey_size, vkey_size, global.keyStartVal);
	// Language
	array_push(keys, virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, vkey_size + global.touchCorrectionV/2, vkey_size, vkey_size, global.keyLangVal));
	// Pay
	array_push(keys, virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, 2*vkey_size + global.touchCorrectionV/2, vkey_size, vkey_size, global.keyPayVal));
	// Rope
	array_push(keys, virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, 3*vkey_size + global.touchCorrectionV/3, vkey_size, vkey_size, global.keyRopeVal));
	// Bomb
	array_push(keys, virtual_key_add(global.display_w - global.touchCorrectionH - vkey_size, 4*vkey_size + global.touchCorrectionV/4, vkey_size, vkey_size, global.keyBombVal));
	// Debug buttons
	if (global.debugBuild) {
	    array_push(keys, virtual_key_add(global.display_w/2 - 2*vkey_size - global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size,  vk_f2));
	    array_push(keys, virtual_key_add(global.display_w/2 - vkey_size - global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size,  vk_f3));
	    array_push(keys, virtual_key_add(global.display_w/2 - global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size,  vk_f4));
	    array_push(keys, virtual_key_add(global.display_w/2 + vkey_size - global.touchCorrectionH, global.display_h - vkey_size - global.touchCorrectionV, vkey_size, vkey_size,  vk_f5));
	}
	if (touchDebug) {
		for (var i = 0; i < array_length(keys);  i += 1) {
			virtual_key_show(keys[i]);
		};
	}
}