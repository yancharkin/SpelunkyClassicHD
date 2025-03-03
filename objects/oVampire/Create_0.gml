action_inherited();
makeActive();
setCollisionBounds(2, 0, sprite_width-2, sprite_height);
xVel = 2.5;
image_speed = 0.5;

// stats
type = "Vampire";
hp = 6;
invincible = 0;
myGrav = 0.2;
myGravNorm = 0.2;

IDLE = 0;
WALK = 1;
ATTACK = 2;
THROW = 3;
RECOVER = 4;
BOUNCE = 5;
HANG = 6;
FLY = 7;
STUNNED = 98;
DEAD = 99;
status = IDLE;

whipped = false;
bloodless = true;
bounced = false;
dead = false;
counter = 0;
stunTime = 60;
sightCounter = 0;

LEFT = 0;
RIGHT = 1;
facing = RIGHT;

shakeCounter = 0;
shakeToggle = 1;
