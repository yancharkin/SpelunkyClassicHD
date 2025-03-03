draw_set_font(global.fontSmall);
draw_set_color(c_yellow);
strLen = string_length(tr("PRESS BUTTON FOR"))*global.fontSmallWidth;
n = 160 - strLen;
n = ceil(n / 2);
draw_text(n, 32, string_hash_to_newline(tr("PRESS BUTTON FOR")));
draw_text(8, 96, string_hash_to_newline(tr("ESC TO KEEP SAME.")));
draw_text(8, 104, string_hash_to_newline(tr("CURRENT: ")));

if (!html5_gamepad_connected()) {
    draw_set_color(c_red);
    draw_text(8, 88, string_hash_to_newline(tr("NO GAMEPAD FOUND!")));
}

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
}

draw_set_font(global.fontSmall);
draw_text(80, 104, string_hash_to_newline(scrGetJoy(currVal)));

