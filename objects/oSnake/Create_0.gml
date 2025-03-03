action_inherited();
makeActive();
setCollisionBounds(2, 0, 14, 16);
xVel = 2.5;
image_speed = 0.4;

// stats
type = "Snake";
hp = 1;
invincible = 0;

IDLE = 0;
WALK = 1;
ATTACK = 2;
STUNNED = 98;
DEAD = 99;
status = IDLE;

bounced = false;
dead = false;
counter = 0;

LEFT = 0;
RIGHT = 1;
facing = RIGHT;

shakeCounter = 0;
shakeToggle = 1;
