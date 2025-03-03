action_inherited();
makeActive();
setCollisionBounds(2, 0, sprite_width-2, sprite_height);
xVel = 2.5;
image_speed = 0.5;
myGrav = 0.6;

// stats
type = "Yeti";
hp = 4;
invincible = 0;
favor = 6;

IDLE = 0;
WALK = 1;
ATTACK = 2;
THROW = 3;
STUNNED = 98;
DEAD = 99;
status = IDLE;

whipped = false;
burning = 0;

bounced = false;
dead = false;
counter = 0;
sightCounter = 0;

LEFT = 0;
RIGHT = 1;
facing = RIGHT;

shakeCounter = 0;
shakeToggle = 1;
