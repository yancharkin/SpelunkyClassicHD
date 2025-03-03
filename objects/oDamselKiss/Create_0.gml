action_inherited();
image_speed = 0.5;

kissed = false;

IDLE = 0;
RUN = 1;
THROWN = 2;
YELL = 3;
EXIT = 4;
status = IDLE;

if (global.isDamsel) sprite_index = sStandLeft;
