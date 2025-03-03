action_inherited();
makeActive();
setCollisionBounds(2, 0, sprite_width-2, sprite_height);
xVel = 0;
image_speed = 0.5;
myGrav = 0.6;

// stats
type = "Shopkeeper";
style = "General";
hp = 20;
invincible = 0;
favor = 12;

IDLE = 0;
WALK = 1;
ATTACK = 2;
THROW = 3;
PATROL = 4;
FOLLOW = 5;
STUNNED = 98;
DEAD = 99;
status = 0;

whipped = false;
bounced = false;
dead = false;
counter = 0;
sightCounter = 0;
turnTimer = 0;
throwCount = 0;
stunTime = 5;

betValue = 1000 + global.currLevel * 500;

LEFT = 0;
RIGHT = 1;
facing = LEFT;

shakeCounter = 0;
shakeToggle = 1;

welcomed = false;
angered = false;

hasGun = true;
firing = 0;
firingMax = 30;
