action_inherited();
// dummy actor for title

image_speed = 0.6;
if (global.isDamsel) sprite_index = sDamselClimb2;
if (global.isTunnelMan) sprite_index = sTunnelClimb2;
else sprite_index = sClimbUp2;
status = 0;

xVel = 0;
yVel = -1;
