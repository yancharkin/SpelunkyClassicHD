action_inherited();
// dummy actor for ending (falling from volcano)

DROP = 0;
STUNNED = 1;
GETUP = 2;
JUMPING = 3;
status = 0;

xVel = 0;
yVel = 0;
myGrav = 0.6;

LEFT = 0;
RIGHT = 1;
facing = LEFT;

if (global.isDamsel) sprite_index = sDamselRunL;
else if (global.isTunnelMan) sprite_index = sTunnelRunL;


