function enableTouchInput() {
	
	if (array_length(global.touchButtons) > 0) {
		for (var i = 0; i < array_length(global.touchButtons);  i += 1) {
			virtual_key_delete(global.touchButtons[i]);
		};
	};
	
	var vkey_size = global.vkeySize  * global.display_h / 240;
	var touchOffsetH = global.touchOffsetH * vkey_size;
	var touchDebug = false;
	
	// Left
	array_push(global.touchButtons, virtual_key_add(touchOffsetH , global.display_h - 2.5*vkey_size, vkey_size, vkey_size, global.keyLeftVal));
	// Up + Left
	array_push(global.touchButtons, virtual_key_add(touchOffsetH, global.display_h - 3.5*vkey_size, vkey_size, vkey_size, global.keyLeftVal));
	array_push(global.touchButtons, virtual_key_add(touchOffsetH, global.display_h - 3.5*vkey_size, vkey_size, vkey_size, global.keyUpVal));
	// Up
	array_push(global.touchButtons, virtual_key_add(touchOffsetH + vkey_size, global.display_h - 3.5*vkey_size, vkey_size, vkey_size, global.keyUpVal));
	// Up + Right
	array_push(global.touchButtons, virtual_key_add(touchOffsetH + 2*vkey_size, global.display_h - 3.5*vkey_size, vkey_size, vkey_size, global.keyRightVal));
	array_push(global.touchButtons, virtual_key_add(touchOffsetH + 2*vkey_size, global.display_h - 3.5*vkey_size, vkey_size, vkey_size, global.keyUpVal));
	// Right
	array_push(global.touchButtons, virtual_key_add(touchOffsetH + 2*vkey_size, global.display_h - 2.5*vkey_size, vkey_size, vkey_size, global.keyRightVal));
	// Down + Right
	array_push(global.touchButtons, virtual_key_add(touchOffsetH + 2*vkey_size, global.display_h - 1.5*vkey_size, vkey_size, vkey_size, global.keyRightVal))
	array_push(global.touchButtons, virtual_key_add(touchOffsetH + 2*vkey_size, global.display_h - 1.5*vkey_size, vkey_size, vkey_size, global.keyDownVal));
	// Down
	array_push(global.touchButtons, virtual_key_add(touchOffsetH + vkey_size, global.display_h - 1.5*vkey_size, vkey_size, vkey_size, global.keyDownVal));
	// Down + left
	array_push(global.touchButtons, virtual_key_add(touchOffsetH, global.display_h - 1.5*vkey_size, vkey_size, vkey_size, global.keyLeftVal));
	array_push(global.touchButtons, virtual_key_add(touchOffsetH, global.display_h - 1.5*vkey_size, vkey_size, vkey_size, global.keyDownVal));
	// Attack
	array_push(global.touchButtons, virtual_key_add(global.display_w -  touchOffsetH - 2*vkey_size, global.display_h - 1.5*vkey_size, vkey_size, vkey_size, global.keyAttackVal));
	// Jump
	array_push(global.touchButtons, virtual_key_add(global.display_w - touchOffsetH - 3*vkey_size, global.display_h - 2.5*vkey_size, vkey_size, vkey_size, global.keyJumpVal));
	// Item
	array_push(global.touchButtons, virtual_key_add(global.display_w - touchOffsetH - vkey_size, global.display_h - 2.5*vkey_size, vkey_size, vkey_size, global.keyItemVal));
	// Run
	array_push(global.touchButtons, virtual_key_add(global.display_w - touchOffsetH - 2*vkey_size, global.display_h - 3.5*vkey_size, vkey_size, vkey_size, global.keyRunVal));
	// Pause
	array_push(global.touchButtons, virtual_key_add(touchOffsetH, global.display_h - 4.5*vkey_size, vkey_size, vkey_size, vk_escape));
	array_push(global.touchButtons, virtual_key_add(touchOffsetH, global.display_h - 4.5*vkey_size, vkey_size, vkey_size,  global.keyStartVal));
	// Language
	array_push(global.touchButtons, virtual_key_add(touchOffsetH + 2*vkey_size, global.display_h - 4.5*vkey_size, vkey_size, vkey_size, global.keyLangVal));
	// Pay
	array_push(global.touchButtons, virtual_key_add(global.display_w - touchOffsetH - 2*vkey_size, global.display_h - 2.5*vkey_size, vkey_size, vkey_size, global.keyPayVal));
	// Rope
	array_push(global.touchButtons, virtual_key_add(global.display_w - touchOffsetH - 4*vkey_size, global.display_h - 1.5*vkey_size, vkey_size, vkey_size, global.keyRopeVal));
	// Bomb
	array_push(global.touchButtons, virtual_key_add(global.display_w - touchOffsetH - 4*vkey_size, global.display_h - 3.5*vkey_size, vkey_size, vkey_size, global.keyBombVal));
	// Debug buttons
	if (global.debugBuild) {
	    array_push(global.touchButtons, virtual_key_add(global.display_w - 4.5*vkey_size, 0.5*vkey_size, vkey_size, vkey_size,  vk_f2));
	    array_push(global.touchButtons, virtual_key_add(global.display_w - 3.5*vkey_size, 0.5*vkey_size, vkey_size, vkey_size,  vk_f3));
	    array_push(global.touchButtons, virtual_key_add(global.display_w - 2.5*vkey_size, 0.5*vkey_size, vkey_size, vkey_size,  vk_f4));
	    array_push(global.touchButtons, virtual_key_add(global.display_w - 1.5*vkey_size, 0.5*vkey_size, vkey_size, vkey_size,  vk_f5));
	}
	if (touchDebug) {
		if (array_length(global.touchButtons) > 0) {
			for (var i = 0; i < array_length(global.touchButtons);  i += 1) {
				virtual_key_show(global.touchButtons[i]);
			}
		}
	}
}