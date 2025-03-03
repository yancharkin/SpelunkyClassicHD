action_inherited();
image_speed = 0.5;
setCollisionBounds(4, 0, 12, 16);
origX = 0;
origY = 0;
xVel = 0;
yVel = 0;
xAcc = 0.2;
yAcc = 0.2;

// stats
hp = 1;
invincible = 1;

// status
IDLE = 0;
ATTACK = 1;

status = 1;

LEFT = 0;
RIGHT = 1;
facing = RIGHT;

shakeCounter = 0;
shakeToggle = 1;

playSound(global.sndGhost);
