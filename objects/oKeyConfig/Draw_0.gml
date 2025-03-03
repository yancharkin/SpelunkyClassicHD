draw_set_font(global.fontSmall);
draw_set_color(c_yellow);
strLen = string_length(tr("PRESS KEY FOR"))*global.fontSmallWidth;
n = 160 - strLen;
n = ceil(n / 2);
draw_text(n, 32, string_hash_to_newline(tr("PRESS KEY FOR")));
draw_text(8, 96, string_hash_to_newline(tr("ESC TO KEEP SAME.")));
draw_text(8, 104, string_hash_to_newline(tr("CURRENT: ")));

if (status == 0)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("UP"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("UP")));
    currVal = global.keyUpVal;
}
else if (status == 1)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("DOWN"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("DOWN")));
    currVal = global.keyDownVal;
}
else if (status == 2)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("LEFT"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("LEFT")));
    currVal = global.keyLeftVal;
}
else if (status == 3)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("RIGHT"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("RIGHT")));
    currVal = global.keyRightVal;
}
else if (status == 4)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("JUMP"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("JUMP")));
    currVal = global.keyJumpVal;
}
else if (status == 5)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("ACTION"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("ACTION")));
    currVal = global.keyAttackVal;
}
else if (status == 6)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("SWITCH"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("SWITCH")));
    currVal = global.keyItemVal;
}
else if (status == 7)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("RUN"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("RUN")));
    currVal = global.keyRunVal;
}
else if (status == 8)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("BOMB"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("BOMB")));
    currVal = global.keyBombVal;
}
else if (status == 9)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("ROPE"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("ROPE")));
    currVal = global.keyRopeVal;
}
/*
else if (status == 10)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("FLARE"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, tr("FLARE"));
    currVal = global.keyFlareVal;
}
*/
else if (status == 10)
{
    draw_set_font(global.fontLarge);
    draw_set_color(c_white);
    strLen = string_length(tr("PURCHASE"))*global.fontLargeWidth;
    n = 160 - strLen;
    n = ceil(n / 2);
    draw_text(n, 40, string_hash_to_newline(tr("PURCHASE")));
    currVal = global.keyPayVal;
}

draw_set_font(global.fontSmall);
switch (currVal)
{
    case vk_up: { draw_text(80, 104, string_hash_to_newline(tr("UP ARR"))); break; }
    case vk_down: { draw_text(80, 104, string_hash_to_newline(tr("DOWN ARR"))); break; }
    case vk_left: { draw_text(80, 104, string_hash_to_newline(tr("LEFT ARR"))); break; }
    case vk_right: { draw_text(80, 104, string_hash_to_newline(tr("RIGHT ARR"))); break; }
    case vk_shift: { draw_text(80, 104, string_hash_to_newline("SHIFT")); break; }
    case vk_control: { draw_text(80, 104, string_hash_to_newline("CTRL")); break; }
    case vk_alt: { draw_text(80, 104, string_hash_to_newline("ALT")); break; }
    case vk_space: { draw_text(80, 104, string_hash_to_newline("SPACE")); break; }
    case global.keyEnter: { draw_text(80, 104, string_hash_to_newline("ENTER")); break; }
    case ord("A"): { draw_text(80, 104, string_hash_to_newline("A")); break; }
    case ord("B"): { draw_text(80, 104, string_hash_to_newline("B")); break; }
    case ord("C"): { draw_text(80, 104, string_hash_to_newline("C")); break; }
    case ord("D"): { draw_text(80, 104, string_hash_to_newline("D")); break; }
    case ord("E"): { draw_text(80, 104, string_hash_to_newline("E")); break; }
    case ord("F"): { draw_text(80, 104, string_hash_to_newline("F")); break; }
    case ord("G"): { draw_text(80, 104, string_hash_to_newline("G")); break; }
    case ord("H"): { draw_text(80, 104, string_hash_to_newline("H")); break; }
    case ord("I"): { draw_text(80, 104, string_hash_to_newline("I")); break; }
    case ord("J"): { draw_text(80, 104, string_hash_to_newline("J")); break; }
    case ord("K"): { draw_text(80, 104, string_hash_to_newline("K")); break; }
    case ord("L"): { draw_text(80, 104, string_hash_to_newline("L")); break; }
    case ord("M"): { draw_text(80, 104, string_hash_to_newline("M")); break; }
    case ord("N"): { draw_text(80, 104, string_hash_to_newline("N")); break; }
    case ord("O"): { draw_text(80, 104, string_hash_to_newline("O")); break; }
    case ord("P"): { draw_text(80, 104, string_hash_to_newline("P")); break; }
    case ord("Q"): { draw_text(80, 104, string_hash_to_newline("Q")); break; }
    case ord("R"): { draw_text(80, 104, string_hash_to_newline("R")); break; }
    case ord("S"): { draw_text(80, 104, string_hash_to_newline("S")); break; }
    case ord("T"): { draw_text(80, 104, string_hash_to_newline("T")); break; }
    case ord("U"): { draw_text(80, 104, string_hash_to_newline("U")); break; }
    case ord("V"): { draw_text(80, 104, string_hash_to_newline("V")); break; }
    case ord("W"): { draw_text(80, 104, string_hash_to_newline("W")); break; }
    case ord("X"): { draw_text(80, 104, string_hash_to_newline("X")); break; }
    case ord("Y"): { draw_text(80, 104, string_hash_to_newline("Y")); break; }
    case ord("Z"): { draw_text(80, 104, string_hash_to_newline("Z")); break; }
    default: { draw_text(80, 104, string_hash_to_newline("KEY " + string(currVal))); break; }
}


/* */
/*  */
