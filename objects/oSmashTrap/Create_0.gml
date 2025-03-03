action_inherited();
makeActive();
setCollisionBounds(1, 1, 15, 15);
invincible = false;
viscidTop = 1;

xv = 0;
yv = 0;
xa = 0;
ya = 0;

xVel = 0;
yVel = 0;
xAcc = 0;
yAcc = 0;

IDLE = 0;
ATTACK = 1;
status = 0;

hit = false;
counter = 0;

dir = rand(0,3);
RIGHT = 0;
DOWN = 1;
LEFT = 2;
UP = 3;
