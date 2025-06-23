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
playerDepth = 0;

 touchControlsVisibilityTimer = 0;

// Black Market
genClothingShop = false;
genBombShop = false;
genSupplyShop = false;
genRareShop = false;
genWeaponShop = false;

if (instance_number(oGame) > 1) instance_destroy();

moveableSolidGrav = 1; // how fast moveable solids should accelerate downwards
time = 1;

// sound_loop(sndzMusicTest);

if (global.gameStart) scrInitLevel();

//Menu
menuItemIndex = 0;

//Debug
if (global.debugBuild) instance_create(0, 0, oDebug);


if (not global.mobileBuild) {
	maxIndexTitle = 7;
	maxIndexGame = 4;
	if (global.html5Build) maxIndexTitle = 10;
} else {
	maxIndexTitle = 8;
	maxIndexGame = 3;
}

firstMenuItemTitleY = (240 - global.fontSmallHeight - 20 * maxIndexTitle) / 2;
firstMenuItemGameY = (240 - global.fontSmallHeight - 20 * maxIndexGame) / 2;

//TouchInput
if ((global.mobileBuild) or (global.html5Build)) {
    enableTouchInput();
}