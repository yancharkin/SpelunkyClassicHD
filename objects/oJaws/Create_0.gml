action_inherited();
type = "Mega Mouth";
image_speed = 0.5;
setCollisionBounds(0, 0, 48, 32);
origX = 0;
origY = 0;
xVel = 0;
yVel = 0;
xAcc = 0.2;
yAcc = 0.2;
dir = 180;
facing = 0;

// stats
hp = 40;
invincible = 0;

bubbleTimer = 0;
bubbleTimerMax = 40;

// status
IDLE = 0;
ATTACK = 1;
PAUSE = 2;
TURN = 3;

canPickUp = false;
status = 0;
counter = 0;

shakeCounter = 0;
shakeToggle = 1;
