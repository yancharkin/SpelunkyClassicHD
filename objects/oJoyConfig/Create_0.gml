status = -3;
joy = false;
alarmSec = 5
global.assignedButtons = [-1];
alarm[0] = alarmSec*fps;
clearBtnPressed = false;
buttonsVisible = false;
window_set_cursor(cr_default);
gamepads = [];
gamepads_n = 0;
findGamepads();
enableTouchInput();