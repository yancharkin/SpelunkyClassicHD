if (alarm[0] == alarmSec*fps) {
    status += 1;
	alarm[0] = alarmSec*fps;
};

if (status > 11 and not global.debugBuild) room_goto(rTitle);
if (status > 12) room_goto(rTitle);