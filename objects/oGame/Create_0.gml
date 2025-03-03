/// @description  Create Game
drawStatus = 0;
moneyCount = 0;
globalvar debug;
debug = false;
global.ghostExists = false;

paused = false;
damsel = false;
idol = false;
altar = false;

// Black Market
genClothingShop = false;
genBombShop = false;
genSupplyShop = false;
genRareShop = false;
genWeaponShop = false;

if (instance_number(oGame) > 1) instance_destroy();

moveableSolidGrav = 1; // how fast moveable solids should accelerate downwards
time = 1;

// sound_loop(sndMusicTest);

if (global.gameStart) scrInitLevel();

//Menu
menuItemIndex = 0;

//Debug
if (global.debugBuild) instance_create(0, 0, oDebug);

if (global.html5Build) {
    if (global.mobileBuild) {
        maxIndexTitle = 7;
        maxIndexGame = 5;
    } else {
        maxIndexTitle = 8;
        maxIndexGame = 6;
    }
} else {
    maxIndexTitle = 6;
    maxIndexGame = 5;
}

firstMenuItemTitleY = (240 - global.fontSmallHeight - 20 * maxIndexTitle) / 2;
firstMenuItemGameY = (240 - global.fontSmallHeight - 20 * maxIndexGame) / 2;

//Left analog stick in the menu
global.analogLDownPreviousState = false;
global.analogLUpPreviousState = false;
global.analogLDownPressed = false;
global.analogLUpPressed = false;

//for HTML5
localeChanged = false;
changeSprites = false;

//Gamepad in HTML5
instance_create(0, 0, oHtml5Gamepad);
global.bStartPressed = false;
global.bStartPreviousState = false;
global.bJumpPressed = false;
global.bJumpPressedPreviousState = false;
global.bJumpReleased = false;
global.bJumpReleasedPreviousState = false;
global.bAttackPressed = false;
global.bAttackPressedPreviousState = false;
global.bAttackReleased = false;
global.bAttackReleasedPreviousState = false;

