action_inherited();
makeActive();
setCollisionBounds(6, 0, 26, 32);
xVel = 2.5;
image_speed = 0.25;

// stats
type = "Yeti King";
hp = 30;
invincible = 0;
heavy = true;

IDLE = 0;
WALK = 1;
TURN = 2;
ATTACK = 3;
STUNNED = 98;
DEAD = 99;
status = IDLE;

canPickUp = false;
bounced = false;
dead = false;
whipped = 0;
counter = 0;
attackTimer = 0;

LEFT = 0;
RIGHT = 1;
facing = RIGHT;

shakeCounter = 0;
shakeToggle = 1;
