action_inherited();
type = "Olmec";
shopWall = false;
makeActive();
setCollisionBounds(2, 0, 62, 64);
xVel = 0
yVel = 0
yDelta = -0.4
myGrav = 0.2;
invincible = true;
viscidTop = 1;
carryPlayer = false;
image_speed = 0.4

LEFT = 0;
RIGHT = 1;
facing = rand(0,1);

// status
START2 = -2;
START1 = -1;
IDLE = 0
BOUNCE = 1
RECOVER = 2
WALK = 3
DROWNING = 4;
PREPARE = 5;
SLAM = 6;
CREATE = 7;
DEAD = 99;
status = -1;

counter = 0;
bounceCounter = 0
slammed = false;

__view_set( e__VW.HBorder, 0, 0 );
__view_set( e__VW.VBorder, 0, 0 );
__view_set( e__VW.YView, 0, 400 );
__view_set( e__VW.Object, 0, oOlmec );

