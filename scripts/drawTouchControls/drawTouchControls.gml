/// @description drawTouchControls
function drawTouchControls() {
	var img_scale  = global.vkeySize / 32;
	var vkey_size = global.vkeySize  * global.display_h / 240;
	var touchOffsetH = global.touchOffsetH * vkey_size;
	if (global.touchControlsVisibility != 0) {
		draw_sprite_ext(sTouchRight, 0, global.display_w - touchOffsetH - 4*vkey_size, global.display_h - 3.5*vkey_size, img_scale, img_scale, 0, -1, global.touchControlsVisibility);
	    if ((instance_exists(oGame)) and (!oGame.paused)) {
			draw_sprite_ext(sTouchLeftPause, 0, touchOffsetH, global.display_h - 4.5*vkey_size, img_scale, img_scale, 0, -1, global.touchControlsVisibility);
	    } else {
			draw_sprite_ext(sTouchLeftResume, 0, touchOffsetH, global.display_h - 4.5*vkey_size, img_scale, img_scale, 0, -1, global.touchControlsVisibility);
	    }
		if ( global.touchControlsVisibility == 1) {
			draw_sprite_ext(sTouchOpaque, 0, touchOffsetH + vkey_size, global.display_h - 2.5*vkey_size, img_scale, img_scale, 0, -1, global.touchControlsVisibility);
		} else {
			draw_sprite_ext(sTouchTransparent, 0, touchOffsetH + vkey_size, global.display_h - 2.5*vkey_size, img_scale, img_scale, 0, -1, global.touchControlsVisibility);
		}
	    if (global.debugBuild) {
			draw_sprite_ext(sTouchCheat, 0, global.display_w - 4.5*vkey_size, 0.5*vkey_size, img_scale, img_scale, 0, -1, global.touchControlsVisibility);
	    }
	}
}