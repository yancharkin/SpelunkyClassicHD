var currVal = "";
var strLen;
var n;

//if (status == -1) {
//    draw_set_font(global.fontLarge);
//    draw_set_color(c_white);
//    strLen = string_length(tr("PRESS ANY BUTTON"))*global.fontLargeWidth;
//    n = 160 - strLen;
//    n = ceil(n / 2);
//    draw_text(n, 60, string_hash_to_newline(tr("PRESS ANY BUTTON")));
//	draw_text(72, 76, string_hash_to_newline(string(int64(alarm[0]/fps)+1)));
//} else {
if (status > -1) {
	draw_set_font(global.fontSmall);
	draw_set_color(c_yellow);
	strLen = string_length(tr("PRESS BUTTON FOR"))*global.fontSmallWidth;
	n = 160 - strLen;
	n = ceil(n / 2);
	draw_text(n, 32, string_hash_to_newline(tr("PRESS BUTTON FOR")));
	draw_text(8, 96, string_hash_to_newline(tr("WAIT TO KEEP SAME: ")));
	var strKeepLen = string_length(tr("WAIT TO KEEP SAME: "))*global.fontSmallWidth;
	draw_set_color(c_white);
	draw_text(8+strKeepLen, 96, string_hash_to_newline(string(int64(alarm[0]/fps)+1)));
	draw_set_color(c_yellow);
	draw_text(8, 104, string_hash_to_newline(tr("CURRENT: ")));

	if ((!gamepad_is_connected(global.joyid)) and 
		    (string_length(gamepad_get_description(global.joyid)) < 1)) {
		draw_set_color(c_red);
		draw_text(8, 88, string_hash_to_newline(tr("NO GAMEPAD FOUND!")));
	}
};

if (status == 0) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("JUMP"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("JUMP")));
    currVal = global.joyJumpVal;
} else if (status == 1) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("ACTION"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("ACTION")));
    currVal = global.joyAttackVal;
} else if (status == 2) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("SWITCH"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("SWITCH")));
    currVal = global.joyItemVal;
} else if (status == 3) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("RUN"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("RUN")));
    currVal = global.joyRunVal;
} else if (status == 4) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("BOMB"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("BOMB")));
    currVal = global.joyBombVal;
} else if (status == 5) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("ROPE"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("ROPE")));
    currVal = global.joyRopeVal;
} else if (status == 6) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("PURCHASE"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("PURCHASE")));
    currVal = global.joyPayVal;
} else if (status == 7) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("START"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("START")));
    currVal = global.joyStartVal;
} else if (status == 8) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("LANGUAGE"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("LANGUAGE")));
    currVal = global.joyLangVal;
} else if (status == 9) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("LEFT"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("LEFT")));
    currVal = global.joyLeftVal;
} else if (status == 10) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("RIGHT"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("RIGHT")));
    currVal = global.joyRightVal;
} else if (status == 11) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("UP"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("UP")));
    currVal = global.joyUpVal;
} else if (status == 12) {
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("DOWN"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("DOWN")));
    currVal = global.joyDownVal;
}

if ((status != -1) and (currVal != "")) {
	draw_set_font(global.fontSmall);
	//draw_text(80, 104, string_hash_to_newline(scrGetJoy(currVal)));
	var strCurrLen = string_length(tr("CURRENT: "))*global.fontSmallWidth;
	draw_text(8+strCurrLen, 104, string_hash_to_newline(string_upper(scrGetJoy(currVal))));
}