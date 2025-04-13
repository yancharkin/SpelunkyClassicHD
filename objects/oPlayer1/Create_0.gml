action_inherited();
script_execute(characterCreateEvent,0,0,0,0,0);
// for debugging
firstLevelSkip = 1;
levelSkip = 1;

if (global.isDamsel) sprite_index = sDamselLeft;
else if (global.isTunnelMan) sprite_index = sTunnelLeft;

// reset gamepad
/*
gamepad.attackPressed = false;
gamepad.attack = false;
gamepad.startPressed = false;
gamepad.start = false;
*/

active = true;
dead = false;
deadCounter = 100;
stunned = false;
bounced = false;
myGrav = 0.6;

fallTimer = 0;
stunTimer = 0;
wallHurt = 0;
pushTimer = 0;
whoaTimer = 0;
whoaTimerMax = 30;
distToNearestLightSource = 999;

// swimming
bubbleTimer = 0;
bubbleTimerMax = 20;

// gambling
bet = 0;
point = false;

climbSndToggle = false;
walkSndToggle = false;

kAttack = true;
kAttackPressed = false;
whipping = false;
cantJump = 0;
kJumped = false;
burning = 0;
firing = 0;
firingMax = 20;
firingPistolMax = 20;
firingShotgunMax = 40;
bowArmed = false;
bowStrength = 0;
jetpackFuel = 0;
bloodless = false;

 // used with Kapala
redColor = 0;
redToggle = false;

kAttackReleased = 0;
holdItem = 0;
holdItemType = "";
pickupItemType = "";
kItem = 0;
kItemPressed = 0;
kItemReleased = 0;
kRope = 0;
kBomb = 0;
kPay = 0;

holdArrow = 0;
holdArrowToggle = false;
bombArrowCounter = 80;
ARROW_NORM = 1;
ARROW_BOMB = 2;

moveToggle = true;

viewCount = 0;
lookOff = 0;

pExit = 0;

xSTART = 0;
xTUTORIAL = 1;
xSCORES = 2;
xTITLE = 3;
xEND = 4;
xSHORTCUT5 = 5;
xSHORTCUT9 = 6;
xSUN = 7;
xMOON = 8;
xSTARS = 9;
xCHANGE = 10;
xSHORTCUT13 = 11;
xCHANGE2 = 12;

if (isRoom("rOlmec")) active = false;

message1 = "";
message2 = "";
