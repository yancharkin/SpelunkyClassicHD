function scrInit() {
	//
	// scrInit()
	//
	// Initialize the game (mostly controls and audio).
	//

	/**********************************************************************************
	    Copyright (c) 2008, 2009 Derek Yu and Mossmouth, LLC

	    This file is part of Spelunky.

	    You can redistribute and/or modify Spelunky, including its source code, under
	    the terms of the Spelunky User License.

	    Spelunky is distributed in the hope that it will be entertaining and useful,
	    but WITHOUT WARRANTY.  Please see the Spelunky User License for more details.

	    The Spelunky User License should be available in "Game Information", which
	    can be found in the Resource Explorer, or as an external file called COPYING.
	    If not, please obtain a new copy of Spelunky from <http://spelunkyworld.com/>

	***********************************************************************************/
	initMusic();
	getPlatform();

	global.debugBuild = false;
	global.levelIndex = 0;
	globalvar gamepad;
	gamepad = instance_create(0, 0, oGamepad);
	window_set_cursor(cr_none);
	startGame = false;

	// Defaults
	global.touchControlsVisibility = 0;
	if (global.mobileBuild) global.touchControlsVisibility = 0.5;
	global.touchVisChangeBy = 0.5;
	global.toggleRun = false;
	global.firstLaunch = true;
	global.locale = "en";
	global.locale2 = "es";
	global.localeChangeBy = 1;
	global.locale2ChangeBy = 1;
	global.fullscreen = false;
	global.toggleRunEnabled = false;
	if (global.mobileBuild) global.toggleRunEnabled = true;
	global.graphicsHigh = true;
	global.downToRun = true;
	global.gamepadOn = false;
	global.music = true;
	global.musicVol = 15;
	global.soundVol = 15;
	
	global.message1 = "";
	global.message2 = "";
	global.message1_src = "";
	global.message2_src = "";
	global.messageHighlights = 0;
	global.message2Highlights = 0;
	global.messageTimer= 0;
	
	global.touchButtons = [];
	global.touchOffsetH = 0.5;
	global.touchOffsetChangeBy = 0.5;
	global.vkeySize = 32;
	global.vkeySizeChangeBy = 8;

	global.assignedButtons = [-1];

	if (global.musicVol > 17) global.musicVol = 17;
	if (global.musicVol < 0) global.musicVol = 0;
	if (global.soundVol > 17) global.soundVol = 17;
	if (global.soundVol < 0) global.soundVol = 0;

	setSoundVol(global.musTitle, 2000 + 8000 * (global.musicVol/18));
	setSoundVol(global.musCave, 2000 + 8000 * (global.musicVol/18));
	setSoundVol(global.musLush, 2000 + 8000 * (global.musicVol/18));
	setSoundVol(global.musIce, 2000 + 8000 * (global.musicVol/18));
	setSoundVol(global.musTemple, 2000 + 8000 * (global.musicVol/18));
	setSoundVol(global.musBoss, 2000 + 8000 * (global.musicVol/18));
	setSoundVol(global.musVictory, 2000 + 8000 * (global.musicVol/18));
	setSoundVol(global.musCredits, 2000 + 8000 * (global.musicVol/18));

	setSoundVol(global.sndIgnite, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndTeleport, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndJetpack, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndWhip, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndJump, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndThrow, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndClimb1, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndClimb2, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndShotgun, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndBowPull, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndSteps, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndBlink1, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndBlink2, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndHit, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndHurt, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndDie, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndCoin, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndGem, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndPickup, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndChestOpen, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndPush, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndMattockBreak, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndTrap, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndClick, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndBreak, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndThud, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndThump, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndCrunch, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndSplash, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndFlame, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndExplosion, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndBoing, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndArrowTrap, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndDamsel, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndKiss, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndGhost, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndBat, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndGiantSpider, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndSpiderJump, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndFrog, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndZombie, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndMonkey, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndAlert, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndCavemanDie, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndAlien, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndLaser, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndLaserCharge, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndSmallExplode, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndPsychic, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndYetiYell, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndBigJump, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndSlam, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndPFall, 2000 + 8000 * (global.soundVol/18));
	setSoundVol(global.sndTFall, 2000 + 8000 * (global.soundVol/18));

	configLoad();
	getLocales();
	setLocale();
	loadLocalizedSprites();
}
