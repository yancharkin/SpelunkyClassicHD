action_inherited();
makeActive()
setCollisionBounds(4, 0, 12, 12)
xVel = 0
yVel = 0
yDelta = -0.4
image_speed = 0.4

// stats
hp = 1;
invincible = 0;

// status
IDLE = 0;
BOUNCE = 1;
RECOVER = 2;
WALK = 3;

status = 0;
bounceCounter = 0;

shakeCounter = 0;
shakeToggle = 1;
