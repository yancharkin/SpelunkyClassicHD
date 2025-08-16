var currVal = "";
var strCurrLen = string_length(tr("CURRENT: "))*global.fontSmallWidth;

if (status == -3) and  (gamepads_n > 1) {
	drawTextHCenteredConf(tr("SELECT GAMEPAD"), "small", c_yellow, 0, 32);
	//drawTextHCenteredConf(string_upper(string_remove_redundant_spaces(gamepads[gamepad_i][1])), "small", c_white, 0, 56);
	drawTextHCenteredConf("<" + string_upper(string_remove_redundant_spaces(gamepads[global.gamepad_i][1])) + ">", "large", c_white, 0, 48);
}

if (status > -1) {
	drawTextHCenteredConf(tr("PRESS BUTTON FOR"), "small", c_yellow, 0, 32);
	var strKeepLen = string_length(tr("WAIT TO KEEP SAME: "))*global.fontSmallWidth;
	if (global.locale != "ar") {
		drawText(tr("WAIT TO KEEP SAME: "), "small", c_yellow, 8, 96);
		drawText(string(int64(alarm[0]/fps)+1), "small", c_white, 8+strKeepLen, 96);
		drawText(tr("CURRENT: "), "small", c_yellow, 8, 104);
	} else {
		drawText(tr("WAIT TO KEEP SAME: "), "small", c_yellow, 184 - strKeepLen, 96);
		drawText(string(int64(alarm[0]/fps)+1), "small", c_white, 184 - strKeepLen - 16, 96);
		drawText(tr("CURRENT: "), "small", c_yellow, 176 -  strCurrLen, 104);
	}
	if ((!gamepad_is_connected(global.joyid)) and 
		    (string_length(gamepad_get_description(global.joyid)) < 1)) {
		drawTextHCenteredConf(tr("NO GAMEPAD FOUND!"), "small", c_red, 0, 80);
	}
};

if (status == 0) {
	drawTextHCenteredConf(tr("JUMP"), "large", c_white, 0, 48);
    currVal = global.joyJumpVal;
} else if (status == 1) {
	drawTextHCenteredConf(tr("ACTION"), "large", c_white, 0, 48);
    currVal = global.joyAttackVal;
} else if (status == 2) {
	drawTextHCenteredConf(tr("SWITCH"), "large", c_white, 0, 48);
    currVal = global.joyItemVal;
} else if (status == 3) {
	drawTextHCenteredConf(tr("RUN"), "large", c_white, 0, 48);
    currVal = global.joyRunVal;
} else if (status == 4) {
	drawTextHCenteredConf(tr("BOMB"), "large", c_white, 0, 48);
    currVal = global.joyBombVal;
} else if (status == 5) {
	drawTextHCenteredConf(tr("ROPE"), "large", c_white, 0, 48);
    currVal = global.joyRopeVal;
} else if (status == 6) {
	drawTextHCenteredConf(tr("PURCHASE"), "large", c_white, 0, 48);
    currVal = global.joyPayVal;
} else if (status == 7) {
	drawTextHCenteredConf(tr("START"), "large", c_white, 0, 48);
    currVal = global.joyStartVal;
} else if (status == 8) {
	drawTextHCenteredConf(tr("LANGUAGE"), "large", c_white, 0, 48);
    currVal = global.joyLangVal;
} else if (status == 9) {
	drawTextHCenteredConf(tr("LEFT"), "large", c_white, 0, 48);
    currVal = global.joyLeftVal;
} else if (status == 10) {
	drawTextHCenteredConf(tr("RIGHT"), "large", c_white, 0, 48);
    currVal = global.joyRightVal;
} else if (status == 11) {
	drawTextHCenteredConf(tr("UP"), "large", c_white, 0, 48);
    currVal = global.joyUpVal;
} else if (status == 12) {
	drawTextHCenteredConf(tr("DOWN"), "large", c_white, 0, 48);
    currVal = global.joyDownVal;
} else if (status == 13) {
	drawTextHCenteredConf(tr("RESTART"), "large", c_white, 0, 48);
    currVal = global.joyRestartVal;
}

if ((status != -1) and (currVal != "")) {
	if (global.locale != "ar") {
		drawText(string_upper(scrGetJoy(currVal)), "small", c_white, 8+strCurrLen, 104);
	} else {
		var strBtnLen = string_length(scrGetJoy(currVal))*global.fontSmallWidth;
		drawText(string_upper(scrGetJoy(currVal)), "small", c_white, 176 -  strCurrLen - strBtnLen - 8, 104);
	}
}