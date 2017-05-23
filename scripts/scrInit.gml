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

initMusic()

startGame = false;
window_set_cursor(cr_none);

global.myFont = font_add_sprite(sFont, ord(' '), false, 0);
global.myFontSmall = font_add_sprite(sFontSmall, ord(' '), false, 0);
global.fullscreen = true;
global.graphicsHigh = true;
global.downToRun = true;
global.gamepadOn = false;
global.screenScale = 1;
global.musicVol = 15;
global.soundVol = 15;

global.keyUpVal = vk_up;
global.keyDownVal = vk_down;
global.keyLeftVal = vk_left;
global.keyRightVal = vk_right;
global.keyJumpVal = ord('Z');
global.keyAttackVal = ord('X');
global.keyItemVal = ord('C');
global.keyRunVal = vk_shift;
global.keyBombVal = ord('A');
global.keyRopeVal = ord('S');
global.keyFlareVal = ord('F');
global.keyPayVal = ord('P');

global.joyJumpVal = 2;
global.joyAttackVal = 1;
global.joyItemVal = 3;
global.joyRunVal = 5;
global.joyBombVal = 7;
global.joyRopeVal = 8;
global.joyFlareVal = 4;
global.joyPayVal = 6;
global.joyStartVal = 10;

file = file_text_open_read(working_directory + "settings.cfg");

if (file)
{
    str = file_text_read_string(file);
    if (str == "0") global.fullscreen = false;
    file_text_readln(file);
    str = file_text_read_string(file);
    if (str == "0") global.graphicsHigh = false;
    file_text_readln(file);
    str = file_text_read_string(file);
    if (str == "0") global.downToRun = false;
    file_text_readln(file);
    str = file_text_read_string(file);
    if (str == "0") global.gamepadOn = false;
    else global.gamepadOn = true;
    file_text_readln(file);
    global.screenScale = real(file_text_read_string(file));
    global.screenScale = 1;
    file_text_readln(file);
    global.musicVol = real(file_text_read_string(file));
    file_text_readln(file);
    global.soundVol = real(file_text_read_string(file));
    file_text_close(file);
}

if (global.musicVol > 17) global.musicVol = 17;
if (global.musicVol < 0) global.musicVol = 0;
if (global.soundVol > 17) global.soundVol = 17;
if (global.soundVol < 0) global.soundVol = 0;

file = file_text_open_read(working_directory + "keys.cfg");
if (file)
{
    global.keyUpVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.keyDownVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.keyLeftVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.keyRightVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.keyJumpVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.keyAttackVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.keyItemVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.keyRunVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.keyBombVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.keyRopeVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.keyFlareVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.keyPayVal = real(file_text_read_string(file));
    file_text_close(file);
}

file = file_text_open_read(working_directory + "gamepad.cfg");
if (file)
{
    global.joyJumpVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.joyAttackVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.joyItemVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.joyRunVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.joyBombVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.joyRopeVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.joyFlareVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.joyPayVal = real(file_text_read_string(file));
    file_text_readln(file);
    global.joyStartVal = real(file_text_read_string(file));
    file_text_close(file);
}

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

if (not joystick_exists(1) and not joystick_exists(2)) global.gamepadOn = false;

globalvar gamepad;
gamepad = instance_create(0, 0, oGamepad);

// if (not joystick_exists(1) and not joystick_exists(2)) global.gamepadOn = false;
