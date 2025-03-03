rope = instance_create(x+16, y, oRopeThrow);
rope.falling = true;
rope.armed = true;
alarm[1] = 50;
status = 3;
playSound(global.sndThrow);
