var currVal = "";
var strCurrLen = string_length(tr("CURRENT: "))*global.fontSmallWidth;

drawTextHCenteredConf(tr("PRESS KEY FOR"), "small", c_yellow, 0, 32);
var strKeepLen = string_length(tr("ESC TO KEEP SAME"))*global.fontSmallWidth;
if (global.locale != "ar") {
	drawText(tr("ESC TO KEEP SAME"), "small", c_yellow, 8, 96);
	drawText(string(int64(alarm[0]/fps)+1), "small", c_white, 16+strKeepLen, 96);
	drawText(tr("CURRENT: "), "small", c_yellow, 8, 104);
} else {
	drawText(tr("ESC TO KEEP SAME"), "small", c_yellow, 184 - strKeepLen, 96);
	drawText(string(int64(alarm[0]/fps)+1), "small", c_white, 184 - strKeepLen - 16, 96);
	drawText(tr("CURRENT: "), "small", c_yellow, 176 -  strCurrLen, 104);
}

if (status == 0) {
	drawTextHCenteredConf(tr("UP"), "large", c_white, 0, 48);
    currVal = global.keyUpVal;
} else if (status == 1) {
	drawTextHCenteredConf(tr("DOWN"), "large", c_white, 0, 48);
    currVal = global.keyDownVal;
} else if (status == 2) {
	drawTextHCenteredConf(tr("LEFT"), "large", c_white, 0, 48);
    currVal = global.keyLeftVal;
} else if (status == 3) {
	drawTextHCenteredConf(tr("RIGHT"), "large", c_white, 0, 48);
    currVal = global.keyRightVal;
} else if (status == 4) {
	drawTextHCenteredConf(tr("JUMP"), "large", c_white, 0, 48);
    currVal = global.keyJumpVal;
} else if (status == 5) {
	drawTextHCenteredConf(tr("ACTION"), "large", c_white, 0, 48);
    currVal = global.keyAttackVal;
} else if (status == 6) {
	drawTextHCenteredConf(tr("SWITCH"), "large", c_white, 0, 48);
    currVal = global.keyItemVal;
} else if (status == 7) {
	drawTextHCenteredConf(tr("RUN"), "large", c_white, 0, 48);
    currVal = global.keyRunVal;
} else if (status == 8) {
	drawTextHCenteredConf(tr("BOMB"), "large", c_white, 0, 48);
    currVal = global.keyBombVal;
} else if (status == 9) {
	drawTextHCenteredConf(tr("ROPE"), "large", c_white, 0, 48);
    currVal = global.keyRopeVal;
} else if (status == 10) {
	drawTextHCenteredConf(tr("PURCHASE"), "large", c_white, 0, 48);
    currVal = global.keyPayVal;
} else if (status == 11) {
	drawTextHCenteredConf(tr("LANGUAGE"), "large", c_white, 0, 48);
    currVal = global.keyLangVal;
} else if (status == 12) {
	drawTextHCenteredConf(tr("RESTART"), "large", c_white, 0, 48);
    currVal = global.keyRestartVal;
}

var keyName = "";
switch (currVal) {
    case vk_up: { keyName = tr("UP ARR"); break; }
    case vk_down: { keyName = tr("DOWN ARR"); break; }
    case vk_left: { keyName = tr("LEFT ARR"); break; }
    case vk_right: { keyName = tr("RIGHT ARR"); break; }
    case vk_shift: { keyName = tr("SHIFT"); break; }
    case vk_control: { keyName = tr("CTRL"); break; }
    case vk_alt: { keyName = tr("ALT"); break; }
    case vk_space: { keyName = tr("SPACE"); break; }
	 case vk_f1: { keyName = "F1"; break; }
	 case vk_f2: { keyName = "F2"; break; }
	 case vk_f3: { keyName = "F3"; break; }
	 case vk_f4: { keyName = "F4"; break; }
	 case vk_f5: { keyName = "F5"; break; }
	 case vk_f6: { keyName = "F6"; break; }
	 case vk_f7: { keyName = "F7"; break; }
	 case vk_f8: { keyName = "F8"; break; }
	 case vk_f9: { keyName = "F8"; break; }
	 case vk_f10: { keyName = "F10"; break; }
	 case vk_f11: { keyName = "F11"; break; }
	 case vk_f12: { keyName = "F12"; break; }
    case global.keyEnter: { keyName = tr("ENTER"); break; }
    case ord("A"): { keyName = "A"; break; }
    case ord("B"): { keyName = "B"; break; }
    case ord("C"): { keyName = "C"; break; }
	case ord("D"): { keyName = "D"; break; }
    case ord("E"): { keyName = "E"; break; }
    case ord("F"): { keyName = "F"; break; }
    case ord("G"): { keyName = "G"; break; }
    case ord("H"): { keyName = "H"; break; }
    case ord("I"): { keyName = "I"; break; }
    case ord("J"): { keyName = "J"; break; }
    case ord("K"): { keyName = "K"; break; }
    case ord("L"): { keyName = "L"; break; }
    case ord("M"): { keyName = "M"; break; }
    case ord("N"): { keyName = "N"; break; }
    case ord("O"): { keyName = "O"; break; }
    case ord("P"): { keyName = "P"; break; }
    case ord("Q"): { keyName = "Q"; break; }
    case ord("R"): { keyName = "R"; break; }
    case ord("S"): { keyName = "S"; break; }
    case ord("T"): { keyName = "T"; break; }
    case ord("U"): { keyName = "U"; break; }
    case ord("V"): { keyName = "V"; break; }
    case ord("W"): { keyName = "W"; break; }
    case ord("X"): { keyName = "X"; break; }
    case ord("Y"): { keyName = "Y"; break; }
    case ord("Z"): { keyName = "Z"; break; }
    default: { keyName = "KEY " + string(currVal); break; }
}

var strKeyLen = 0;
var kPosX =8+strCurrLen;
if (global.locale == "ar") {
	strKeyLen = string_length(keyName)*global.fontSmallWidth;
	kPosX = 176 -  strCurrLen - strKeyLen - 8;
}
drawText(keyName, "small", c_white, kPosX, 104)