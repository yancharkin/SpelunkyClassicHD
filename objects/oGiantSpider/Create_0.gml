action_inherited();
type = "Giant Spider";
makeActive();
setCollisionBounds(2, 16, 30, 32);
xVel = 0;
yVel = 0;
yDelta = -0.4;
myGrav = 0.3;
myGravNorm = 0.3;
image_speed = 0.8;

// stats
hp = 1;
invincible = 0;
whipped = 10;
squirtTimer = rand(100,1000);

// status
IDLE = 0;
BOUNCE = 1;
RECOVER = 2;
CRAWL = 3;
DROWNED = 4;
SQUIRT = 5;

status = 0;
bounceCounter = 0;

shakeCounter = 0;
shakeToggle = 1

playSound(global.sndGiantSpider);
