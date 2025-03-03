action_inherited();
// dummy actor for transitions and ending

TRANSITION = 0;
START = 1;
END = 2;
LAVA = 3;
STOPPED = 99;
status = 0;

yVel = 0;

if (global.isDamsel) sprite_index = sDamselRunL;
else if (global.isTunnelMan) sprite_index = sTunnelRunL;
else sprite_index = sRunLeft;

LEFT = 0;
RIGHT = 1;
facing = RIGHT;
