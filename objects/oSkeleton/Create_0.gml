action_inherited();
makeActive();
setCollisionBounds(2, 0, 14, 16);
xVel = 0;
image_speed = 0.5;

// stats
type = "Skeleton";
hp = 1;
invincible = 0;

IDLE = 0;
WALK = 1;
ATTACK = 2;
STUNNED = 98;
DEAD = 99;
status = 0;

bloodless = true;
bounced = false;
dead = false;
counter = 20;

LEFT = 0;
RIGHT = 1;
facing = RIGHT;
if (instance_exists(oPlayer1))
{
    if (oPlayer1.x < x+8) facing = LEFT;
}

shakeCounter = 0;
shakeToggle = 1;
