action_inherited();
active = true;
type = tr("NONE");
shopDesc = "";
New = true; // set to false once player has picked up, currently just used for bow
held = false;
LEFT = 18;
RIGHT = 19;
DUCKING = 12;
myGrav = 0.6;
armed = false;
trigger = false; // for idols
safe = false;
heavy = false;
value = 0;
colBot = false;
canPickUp = true;

bounceFactor = 0.5;
frictionFactor = 0.3;
bloodless = false;
breakPieces = true;

cost = 0;
forSale = false;
stolen = false;
inDiceHouse = false; // for dice house
cimg = 0;

stuck = false;

// for sticky bombs
sticky = false;
enemyID = 0;
stickyXDiff = 0;
stickyYDiff = 0;

if (global.hasSpectacles) depth = 51;
else depth = 101;
