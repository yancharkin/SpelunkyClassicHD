	/// @description drawTouchControls
function drawTouchControls() {
	scale_level = global.display_h / 240;
	vkey_size = 32 * scale_level;

	if (instance_exists(oGame) and (oGame.paused)) {
	    posX = 0;
	    posY = 0;
	} else {
	    if (global.html5Build) {
	        posX = __view_get( e__VW.XView, 0 );
	        posY = __view_get( e__VW.YView, 0 );
	    } else {
	        posX = 0;
	        posY = 0;
	    }
	}

	if (global.touchControlsVisibility == 1) {
	    draw_sprite(TouchArrowsSemiTr, -1, posX, posY + global.display_h - (3*vkey_size));
	    draw_sprite(TouchButtons1SemiTr, -1, posX + global.display_w - (2.5*vkey_size), posY + global.display_h - (2.5*vkey_size));
	    if ((instance_exists(oGame)) and (!oGame.paused)) {
	        draw_sprite(TouchButtons2SemiTr0, -1, posX + global.display_w - vkey_size, posY);
	    } else {
	        draw_sprite(TouchButtons2SemiTr1, -1, posX + global.display_w - vkey_size, posY);
	    }
	    if (global.debugBuild) {
			draw_sprite(TouchButtonsCheatSemiTr, -1,  posX + global.display_w/2 - 2*vkey_size, posY + global.display_h - vkey_size);
	    }
	} else if (global.touchControlsVisibility == 2) {
	    draw_sprite(TouchArrowsOp, -1, posX, posY + global.display_h - (3*vkey_size));
	    draw_sprite(TouchButtons1Op, -1, posX + global.display_w - (2.5*vkey_size), posY + global.display_h - (2.5*vkey_size));
	    if ((instance_exists(oGame)) and (!oGame.paused)) {
	        draw_sprite(TouchButtons2Op0, -1, posX + global.display_w - vkey_size, posY);
	    } else {
	        draw_sprite(TouchButtons2Op1, -1, posX + global.display_w - vkey_size, posY);
	    }
	    if (global.debugBuild) {
			draw_sprite(TouchButtonsCheatOp, -1,  posX + global.display_w/2 - 2*vkey_size, posY + global.display_h - vkey_size);
	    }
	}
}