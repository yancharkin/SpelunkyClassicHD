action_inherited();
type = "Spider";
makeActive();
setCollisionBounds(1, 5, 15, 16);
xVel = 0;
yVel = 0;
yDelta = -0.4;
myGrav = 0.2;
myGravNorm = 0.2;
image_speed = 0.4;

// stats
hp = 1;
invincible = 0;

// status
IDLE = 0;
BOUNCE = 1;
RECOVER = 2;
WALK = 3;
DROWNED = 4;

status = 0;
bounceCounter = 0;

shakeCounter = 0;
shakeToggle = 1
