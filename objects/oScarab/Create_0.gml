action_inherited();
image_speed = 0.5;
setCollisionBounds(4, 4, 12, 12);
origX = 0;
origY = 0;
xVel = 0;
yVel = 0;
xAcc = 0.2;
yAcc = 0.2;
counter = rand(10,30);
if (global.levelType == 0) value = 4000;
else if (global.levelType == 1) value = 8000;
else if (global.levelType == 3) value = 12000;

// stats
hp = 1;
invincible = 0;
bloodless = true;

// status
IDLE = 0;
ATTACK = 1;

status = IDLE;

shakeCounter = 0;
shakeToggle = 1;
