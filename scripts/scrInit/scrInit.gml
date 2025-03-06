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
	if (global.mobileBuild) global.touchControlsVisibility = 2;
	global.toggleRun = false;
	global.firstLaunch = true;
	global.locale = "en";
	global.locale2 = "es";
	global.fullscreen = false;
	global.toggleRunEnabled = false;
	global.graphicsHigh = true;
	global.downToRun = true;
	global.gamepadOn = false;
	global.music = true;
	global.musicVol = 15;
	global.soundVol = 15;

	if (global.musicVol > 17) global.musicVol = 17;
	if (global.musicVol < 0) global.musicVol = 0;
	if (global.soundVol > 17) global.soundVol = 17;
	if (global.soundVol < 0) global.soundVol = 0;

	SS_SetSoundVol(global.musTitle, 2000 + 8000 * (global.musicVol/18));
	SS_SetSoundVol(global.musCave, 2000 + 8000 * (global.musicVol/18));
	SS_SetSoundVol(global.musLush, 2000 + 8000 * (global.musicVol/18));
	SS_SetSoundVol(global.musIce, 2000 + 8000 * (global.musicVol/18));
	SS_SetSoundVol(global.musTemple, 2000 + 8000 * (global.musicVol/18));
	SS_SetSoundVol(global.musBoss, 2000 + 8000 * (global.musicVol/18));
	SS_SetSoundVol(global.musVictory, 2000 + 8000 * (global.musicVol/18));
	SS_SetSoundVol(global.musCredits, 2000 + 8000 * (global.musicVol/18));

	SS_SetSoundVol(global.sndIgnite, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndTeleport, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndJetpack, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndWhip, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndJump, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndThrow, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndClimb1, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndClimb2, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndShotgun, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndBowPull, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndSteps, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndBlink1, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndBlink2, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndHit, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndHurt, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndDie, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndCoin, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndGem, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndPickup, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndChestOpen, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndPush, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndMattockBreak, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndTrap, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndClick, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndBreak, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndThud, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndThump, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndCrunch, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndSplash, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndFlame, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndExplosion, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndBoing, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndArrowTrap, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndDamsel, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndKiss, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndGhost, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndBat, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndGiantSpider, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndSpiderJump, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndFrog, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndZombie, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndMonkey, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndAlert, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndCavemanDie, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndAlien, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndLaser, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndLaserCharge, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndSmallExplode, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndPsychic, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndYetiYell, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndBigJump, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndSlam, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndPFall, 2000 + 8000 * (global.soundVol/18));
	SS_SetSoundVol(global.sndTFall, 2000 + 8000 * (global.soundVol/18));

	configLoad();
	getLocales();
	setLocale();
	loadLocalizedSprites();



}
