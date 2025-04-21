if (alarm[0] == alarmSec*fps) {
    status += 1;
	alarm[0] = alarmSec*fps;
};

if (status > 11) room_goto(rTitle);