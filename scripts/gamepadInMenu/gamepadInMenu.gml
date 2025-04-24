function gamepadInMenu() {
	if (!global.gamepadOn) exit;
	/////////////
	// LEFT
	/////////////
	gamepad.leftReleased = false;
	gamepad.leftPressed = false;
	if (gamepad.left) {
		gamepad.left = (gamepadButtonCheck(global.joyLeftVal) || gamepad_axis_value(global.joyid, gp_axislh) < -0.6);
	    if (not gamepad.left) gamepad.leftReleased = true;
	} else {
	    gamepad.left = (gamepadButtonCheck(global.joyLeftVal) || gamepad_axis_value(global.joyid, gp_axislh) < -0.6);
	    if (gamepad.left) gamepad.leftPressed = true;
	}
	/////////////
	// RIGHT
	/////////////
	gamepad.rightReleased = false;
	gamepad.rightPressed = false;
	if (gamepad.right) {
		gamepad.right = (gamepadButtonCheck(global.joyRightVal) || gamepad_axis_value(global.joyid, gp_axislh) > 0.6);
	    if (not gamepad.right) gamepad.rightReleased = true;
	} else {
		gamepad.right = (gamepadButtonCheck(global.joyRightVal) || gamepad_axis_value(global.joyid, gp_axislh) > 0.6);
	    if (gamepad.right) gamepad.rightPressed = true;
	}
	/////////////
	// UP
	/////////////
	gamepad.upReleased = false;
	gamepad.upPressed = false;
	if (gamepad.up) {
		gamepad.up = (gamepadButtonCheck(global.joyUpVal) || gamepad_axis_value(global.joyid, gp_axislv) < -0.6);
	    if (not gamepad.up) gamepad.upReleased = true;
	}
	else {
	    gamepad.up = (gamepadButtonCheck(global.joyUpVal) || gamepad_axis_value(global.joyid, gp_axislv) < -0.6);
	    if (gamepad.up) gamepad.upPressed = true;
	}
	/////////////
	// DOWN
	/////////////
	gamepad.downReleased = false;
	gamepad.downPressed = false;
	if (gamepad.down) {
		gamepad.down = (gamepadButtonCheck(global.joyDownVal) || gamepad_axis_value(global.joyid, gp_axislv) > 0.6);
	    if (not gamepad.down) gamepad.downReleased = true;
	} else{
	    gamepad.down = (gamepadButtonCheck(global.joyDownVal) || gamepad_axis_value(global.joyid, gp_axislv) > 0.6);
	    if (gamepad.down) gamepad.downPressed = true;
	}
	/////////////
	// JUMP
	/////////////
	gamepad.jumpReleased = false;
	gamepad.jumpPressed = false;
	if (gamepad.jump) {
		gamepad.jump = gamepadButtonCheck(global.joyJumpVal);
	    if (not gamepad.jump) gamepad.jumpReleased = true;
	} else {
		gamepad.jump = gamepadButtonCheck(global.joyJumpVal);
	    if (gamepad.jump) gamepad.jumpPressed = true;
	}
	/////////////
	// ATTACK
	/////////////
	gamepad.attackReleased = false;
	gamepad.attackPressed = false;
	if (gamepad.attack) {
	    gamepad.attack = gamepadButtonCheck(global.joyAttackVal);
	    if (not gamepad.attack) gamepad.attackReleased = true;
	} else {
	    gamepad.attack = gamepadButtonCheck(global.joyAttackVal);
	    if (gamepad.attack) gamepad.attackPressed = true;
	}
}