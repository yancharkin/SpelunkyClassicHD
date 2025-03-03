action_inherited();
type = "Monkey";
makeActive()
setCollisionBounds(4, 6, 12, 16)
xVel = 0
yVel = 0
yDelta = -0.4
myGrav = 0.2;
image_speed = 0.4

// stats
hp = 1;
invincible = 0;

LEFT = 0;
RIGHT = 1;
facing = rand(0,1);

// status
IDLE = 0
BOUNCE = 1
RECOVER = 2
WALK = 3
DROWNED = 4;
HANG = 5;
CLIMB = 6;
GRAB = 7;
status = HANG;

grabX = 0;
grabY = 0;
grabCounter = 0;

UP = 0;
DOWN = 1;
dir = 0;

counter = 0;
bounceCounter = 0
vineCounter = 0;
throwCounter = 60;

shakeCounter = 0
shakeToggle = 1

if (collision_point(x, y, oWater, 0, 0)) swimming = true;
