action_inherited();
type = "Piranha";
image_speed = 0.5;
setCollisionBounds(0, 0, 8, 8);
origX = 0;
origY = 0;
xVel = 0;
yVel = 0;
xAcc = 0.2;
yAcc = 0.2;
dir = 0;
if (rand(1,2) == 1) dir = 180;

// stats
hp = 1;
invincible = 0;

bubbleTimer = 0;
bubbleTimerMax = 40;

// status
IDLE = 0;
ATTACK = 1;
PAUSE = 2;
ATTACK_ENEMY = 3;

canBite = true;

status = 0;
counter = 0;

shakeCounter = 0;
shakeToggle = 1;
