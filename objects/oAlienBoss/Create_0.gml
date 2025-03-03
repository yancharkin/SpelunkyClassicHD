action_inherited();
makeActive();
setCollisionBounds(0, 0, 32, 32);
xVel = 2.5;
image_speed = 0.25;

// stats
type = "Alien Boss";
hp = 10;
invincible = 0;

IDLE = 0;
DEAD = 99;
status = IDLE;

canPickUp = false;
bounced = false;
dead = false;
counter = 0;

LEFT = 0;
RIGHT = 1;
facing = LEFT;

shakeCounter = 0;
shakeToggle = 1;

psychicRecover = 100;
