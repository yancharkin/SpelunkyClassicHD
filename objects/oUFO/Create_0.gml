action_inherited();
type = "UFO";
image_speed = 0.5;
setCollisionBounds(4, 2, 12, 14);
origX = 0;
origY = 0;
xVel = 0;
yVel = 0;
xAcc = 0.2;
yAcc = 0.2;

// stats
hp = 1;
invincible = 0;
flying = true;

// status
SEARCH = 0;
DESTROY = 1;
BLAST = 2;

status = SEARCH;
alerted = false;

shift = 0;
shiftToggle = rand(0,1);

shakeCounter = 0;
shakeToggle = 1;
