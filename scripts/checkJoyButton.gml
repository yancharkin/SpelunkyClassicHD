if (joystick_check_button(joyid,1)) return 1;
else if (joystick_check_button(joyid,2)) return 2;
else if (joystick_check_button(joyid,3)) return 3;
else if (joystick_check_button(joyid,4)) return 4;
else if (joystick_check_button(joyid,5)) return 5;
else if (joystick_check_button(joyid,6)) return 6;
else if (joystick_check_button(joyid,7)) return 7;
else if (joystick_check_button(joyid,8)) return 8;
else if (joystick_check_button(joyid,9)) return 9;
else if (joystick_check_button(joyid,10)) return 10;
else if (joystick_check_button(joyid,11)) return 11;
else if (joystick_check_button(joyid,12)) return 12;
else if (joystick_check_button(joyid,13)) return 13;
else if (joystick_check_button(joyid,14)) return 14;
else if (joystick_check_button(joyid,15)) return 15;
else if (joystick_check_button(joyid,16)) return 16;
else if (joystick_check_button(joyid,17)) return 17;
else if (joystick_check_button(joyid,18)) return 18;
else if (joystick_check_button(joyid,19)) return 19;
else if (joystick_check_button(joyid,20)) return 20;
else if (joystick_zpos(joyid) > 0.1) return -1; // 360 Left Trigger
else if (joystick_zpos(joyid) < -0.1) return -2; // 360 Right Trigger
else return 0;
