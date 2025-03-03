script_execute(gameStepEvent,0,0,0,0,0);
if (not instance_exists(oXMarket)) global.udjatBlink = false;
else
{
    with oPlayer1
    {
        dm = distance_to_object(oXMarket);
        if (dm < 4) dm = 4;
        if (oGame.alarm[2] < 1 or dm < oGame.alarm[2]) oGame.alarm[2] = dm;
    }
}

if (global.gameStart and instance_exists(oCharacter) and isLevel())
{
    if (not oCharacter.dead)
    {
        global.time += room_speed;
        global.xtime += room_speed;
    }
}

// GHOST
if (instance_exists(oPlayer1))
{
    if (isLevel() and not isRoom("rOlmec") and not isRoom("rLoadLevel") and global.currLevel > 1 and
        not global.hasCrown and global.xtime > 120000 and
        oPlayer1.sprite_index != sPExit and oPlayer1.sprite_index != sDamselExit)
    {
        if (not oLevel.musicFade)
        {
            oLevel.musicFade = true;
            global.message = tr("A CHILL RUNS UP YOUR SPINE...");
            global.message2 = tr("LET'S GET OUT OF HERE!");
            global.messageTimer = 200;
        }
    }
    
    if (isLevel() and not isRoom("rOlmec") and not isRoom("rLoadLevel") and global.currLevel > 1 and
        not global.hasCrown and global.xtime > 150000 and not global.ghostExists and
        oPlayer1.sprite_index != sPExit and oPlayer1.sprite_index != sDamselExit)
    {
        if (oPlayer1.x > room_width / 2) instance_create(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+8, __view_get( e__VW.YView, 0 )+floor(__view_get( e__VW.HView, 0 ) / 2), oGhost);
        else instance_create(__view_get( e__VW.XView, 0 )-32,  __view_get( e__VW.YView, 0 )+floor(__view_get( e__VW.HView, 0 ) / 2), oGhost);
        global.ghostExists = true;
    }
}

if (global.checkWater)
{
    global.waterCounter = 0;
    with oWater
    {
        // if (y > view_yview[0]-32 and y < view_yview[0] + view_hview[0]+32 and not isRoom("rOlmec"))
        if (not isRoom("rOlmec"))
        {
            if ((!isRoom("rLoadLevel") and y < 512) or isRoom("rLoadLevel"))
            {
        
            instance_activate_region(x-16, y-16, 48, 48, true);
        
            if (not collision_point(x, y-16, oSolid, 0, 0) and not collision_point(x, y-16, oWater, 0, 0))
            {
                if (type == "Lava") sprite_index = sLavaTop;
                else sprite_index = sWaterTop;
            }
            
            obj = instance_place(x-16, y, oWater);
            if (instance_exists(obj))
            {
                if (obj.sprite_index == sWaterTop or obj.sprite_index == sLavaTop)
                {
                    if (type == "Lava") sprite_index = sLavaTop;
                    else sprite_index = sWaterTop;
                }
            }
            
            obj = instance_place(x+16, y, oWater);
            if (instance_exists(obj))
            {
                if (obj.sprite_index == sWaterTop or obj.sprite_index == sLavaTop)
                {
                    if (type == "Lava") sprite_index = sLavaTop;
                    else sprite_index = sWaterTop;
                }
            }
            
            if ((not collision_point(x-16, y, oSolid, 0, 0) and not collision_point(x-16, y, oWater, 0, 0)) or
                (not collision_point(x+16, y, oSolid, 0, 0) and not collision_point(x+16, y, oWater, 0, 0)) or
                (not collision_point(x, y+16, oSolid, 0, 0) and not collision_point(x, y+16, oWater, 0, 0))) 
            {
                instance_destroy();
                global.waterCounter += 1;
            }
            
            global.waterLoopSafety += 1;
            if (global.waterLoopSafety > 100000) global.checkWater = false;
            
            }
        }
    }
    
    if (global.waterCounter == 0) global.checkWater = false;
}
else
{
    global.waterLoopSafety = 0;
}

// game over
if (instance_exists(oPlayer1))
{
    if (oPlayer1.dead)
    {
        if (drawStatus == 0)
        {
            alarm[0] = 50;
            drawStatus += 1;
        }
        if (drawStatus > 2)
        {
            moneyDiff = global.money - moneyCount;
            if (moneyDiff > 1000)
                moneyCount += 1000;
            else if (moneyDiff > 100)
                moneyCount += 100;
            else
                moneyCount += moneyDiff;
       }
    }
}

// GAMEPAD PAUSE
if (gamepad_button_check_pressed(global.joyid, global.joyStartVal)) event_perform(ev_keypress, vk_escape);

///Gamepad in HTML5

if (global.html5Build) {
    //Start
    if (html5_gamepad_button_check(global.joyid, global.joyStartVal)) {
        if (global.bStartPreviousState == false) {
            global.bStartPressed = true;
            global.bStartPreviousState = true;
        }
    } else {
        global.bStartPreviousState = false;
    }
    //Jump
    if (html5_gamepad_button_check(global.joyid, global.joyJumpVal)) {
        global.bJumpReleasedPreviousState = false;
        if (global.bJumpPressedPreviousState == false) {
            global.bJumpPressed = true;
            global.bJumpPressedPreviousState = true;
        }
    } else {
        global.bJumpPressedPreviousState = false;
        if (global.bJumpReleasedPreviousState == false) {
            global.bJumpReleased = true;
            global.bJumpReleasedPreviousState = true;
        }
    }
    //Attack
    if (html5_gamepad_button_check(global.joyid, global.joyAttackVal)) {
        global.bAttackReleasedPreviousState = false;
        if (global.bAttackPressedPreviousState == false) {
            global.bAttackPressed = true;
            global.bAttackPressedPreviousState = true;
        }
    } else {
        global.bAttackPressedPreviousState = false;
        if (global.bAttackReleasedPreviousState == false) {
            global.bAttackReleased = true;
            global.bAttackReleasedPreviousState = true;
        }
    }
    /*
    //Item
    if (html5_gamepad_button_check(global.joyid, global.joyItemVal)) {
        if (global.bItemPreviousState == false) {
            global.bItemPressed = true;
            global.bItemPreviousState = true;
        }
    } else {
        global.bItemPreviousState = false;
    }
    //Bomb
    if (html5_gamepad_button_check(global.joyid, global.joyBombVal)) {
        if (global.bBombPreviousState == false) {
            global.bBombPressed = true;
            global.bBombPreviousState = true;
        }
    } else {
        global.bBombPreviousState = false;
    }
    //Run
    if (html5_gamepad_button_check(global.joyid, global.joyRunVal)) {
        if (global.bRunPreviousState == false) {
            global.bRunPressed = true;
            global.bRunPreviousState = true;
        }
    } else {
        global.bRunPreviousState = false;
    }
    //Rope
    if (html5_gamepad_button_check(global.joyid, global.joyRopeVal)) {
        if (global.bRopePreviousState == false) {
            global.bRopePressed = true;
            global.bRopePreviousState = true;
        }
    } else {
        global.bRopePreviousState = false;
    }
    //Flare
    if (html5_gamepad_button_check(global.joyid, global.joyFlareVal)) {
        if (global.bFlarePreviousState == false) {
            global.bFlarePressed = true;
            global.bFlarePreviousState = true;
        }
    } else {
        global.bFlarePreviousState = false;
    }
    //Pay
    if (html5_gamepad_button_check(global.joyid, global.joyPayVal)) {
        if (global.bPayPreviousState == false) {
            global.bPayPressed = true;
            global.bPayPreviousState = true;
        }
    } else {
        global.bPayPreviousState = false;
    }
    */
    alarm[4] = 1;
}

/* */
///Left analog stick and dpad in the menu

if (!global.html5Build) {
    var downPressed = gamepad_axis_value(global.joyid, gp_axislv) > 0.6;
    var upPressed = gamepad_axis_value(global.joyid, gp_axislv) < -0.6;
} else {
    var downPressed = ((html5_gamepad_axis_value(global.joyid, 1) > 0.6) or
            (html5_gamepad_axis_value(global.joyid, 5) > 0.6));
    var upPressed = (html5_gamepad_axis_value(global.joyid, 1) < -0.6 or
            (html5_gamepad_axis_value(global.joyid, 5) < -0.6));
}

if (downPressed) {
    if (global.analogLDownPreviousState == false) {
        global.analogLDownPressed = true;
        global.analogLDownPreviousState = true;
    }
} else {
    global.analogLDownPreviousState = false;
}
if (upPressed) {
    if (global.analogLUpPreviousState == false) {
        global.analogLUpPressed = true;
        global.analogLUpPreviousState = true;
    }
} else {
    global.analogLUpPreviousState = false;
}
alarm[3] = 1;

/* */
///"Fix" the jump touch button and jump keyboard key on Android
if (instance_exists(oPlayer1)) {
    if (keyboard_check(ord("J"))) {
        oPlayer1.initialJumpAcc = -4;
    } else if (global.mobileBuild and keyboard_check(global.keyJumpVal)) {
        oPlayer1.initialJumpAcc = -4;
    } else if (!global.mobileBuild and keyboard_check(global.keyJumpVal)) {
        oPlayer1.initialJumpAcc = -2;
    } else {    
        if (!global.html5Build) {
            if (gamepad.jump or
                    gamepad_button_check(global.joyid, global.joyJumpVal) or
                    (gamepad_button_value(global.joyid, global.joyJumpVal) > 0.6)) {
                oPlayer1.initialJumpAcc = -2;
            }
        } else {
            if (html5_gamepad_button_check(global.joyid, global.joyJumpVal)) {
                oPlayer1.initialJumpAcc = -2;
            }
    
        }
    }
}

/* */
///Check input in the menu

//Pause

if (keyboard_check_pressed(global.keyStartVal) or
        keyboard_check_pressed(vk_escape) or
        global.bStartPressed or
        gamepad_button_check_pressed(global.joyid, global.joyStartVal)) {
    if (not isRoom("rIntro")) {
        if (not paused) {
            instance_deactivate_all(true);
            audio_pause_all();
            paused = true;
        } else {
            paused = false;
            instance_activate_all();
            audio_resume_all();

            // Fix player falling through floor in html5 version
            if (global.html5Build and instance_exists(oPlayer1)) {
                oPlayer1.y -= 1;
            }
        }
    }
}

if (paused) {
    if (checkDownPressed()) {
        menuItemIndex += 1;
        if (isRoom("rTitle")) {
            if (menuItemIndex > maxIndexTitle) menuItemIndex = 0;
        } else { 
            if (menuItemIndex > maxIndexGame) menuItemIndex = 0;
        }
    } else if (checkUpPressed()) {
        menuItemIndex -= 1;
        if (isRoom("rTitle")) {
            if (menuItemIndex < 0) menuItemIndex = maxIndexTitle;
        } else {
            if (menuItemIndex < 0) menuItemIndex = maxIndexGame;
        }
    } else if (checkJumpPressed()) {
        paused = false;
        instance_activate_all();
    } else if (checkAttackPressed()) or (keyboard_check_pressed(global.keyEnter)) {
        if (isRoom("rTitle")) {
            switch (menuItemIndex) {
                case 0: {
                    toggleMusic();
                    if (paused) audio_pause_all();
                    break;
                }
                case 1: {
                    instance_activate_all();
                    room_goto(rKeyConfig);
                    break;
                }
                case 2: {               
                    if (global.html5Build) {
                        global.joyid = html5_gamepad_next(global.joyid);
                    } else {
                        paused = false;
                        instance_activate_all();
                        room_goto(rJoyConfig);
                    }
                    break;
                }
                case 3: {
                    if (global.html5Build) {
                        paused = false;
                        instance_activate_all();
                        room_goto(rJoyConfigHtml5);
                     } else {
                        global.toggleRunEnabled = !global.toggleRunEnabled;
                     }
                    break;
                }
                case 4: {
                    if (global.html5Build) {
                        menuTouchControls();
                    } else if (global.mobileBuild) {
                            menuTouchControls();
                    } else {
                        menuToggleFullscreen();
                    }
                    break;
                }
                case 5: {
                    if (global.html5Build) {
                        global.toggleRunEnabled = !global.toggleRunEnabled;
                    } else {
                        menuLanguage();
                    }
                    break;
                }
                case 6: {
                    if (global.html5Build) {
                        if (global.mobileBuild) {
                            menuLanguage();
                        } else {
                            menuToggleFullscreen();
                        }
                    } else {
                        if (global.mobileBuild) {
                            instance_activate_all();
                            audio_stop_all();
                            game_restart();
                        } else {
                            quitGame();
                        }
                    }
                    break;
                }
                case 7: {
                    if (global.mobileBuild) {
                        instance_activate_all();
                        audio_stop_all();
                        game_restart();
                    } else {
                        menuLanguage();
                    }
                    break;
                }
                case 8: {
                    if (global.electronBuild) {
                        quitGame();
                    } else if (global.browserBuild) {
                        instance_activate_all();
                        audio_stop_all();
                        game_restart();
                    }
                    break;
                }
            }
        } else {
            switch (menuItemIndex) {
                case 0: {
                    toggleMusic();
                    if (paused) audio_pause_all();
                    break;
                }
                case 1: {
                    if (global.html5Build) {
                        menuTouchControls();
                    } else {
                        global.toggleRunEnabled = !global.toggleRunEnabled;
                    }
                    break;
                }
                case 2: {
                    if (global.html5Build) {
                        global.toggleRunEnabled = !global.toggleRunEnabled;
                    } else {
                        if (global.mobileBuild) {
                            menuTouchControls();
                        } else {
                            menuToggleFullscreen();
                        }
                    }
                    break;
                }
                case 3: {
                    if (global.html5Build) {
                        if (global.mobileBuild) {
                            menuLanguage();
                        } else {
                            menuToggleFullscreen();
                        }
                    } else {
                        if (global.mobileBuild) {
                            menuLanguage();
                        } else {
                            menuLanguage();
                        }
                    }
                    break;
                }
                case 4: {
                    if (global.html5Build) {
                        if (global.mobileBuild) {
                            menuDie();
                        } else {
                            menuLanguage();
                        }
                    } else {
                        if (global.mobileBuild) {
                            menuDie();
                        } else {
                            menuDie();
                        }
                    }
                    break;
                }
                case 5: {
                    if (global.html5Build) {
                        if (global.mobileBuild) {
                            instance_activate_all();
                            audio_stop_all();
                            game_restart();
                        } else {
                            menuDie();
                        }
                    } else {
                        if (global.mobileBuild) {
                            instance_activate_all();
                            audio_stop_all();
                            game_restart();
                        } else {
                            quitGame();
                        }
                    }
                    break;
                }
                case 6: {
                    if (global.browserBuild) {
                        instance_activate_all();
                        audio_stop_all();
                        game_restart();
                    } else {
                        quitGame();
                    }
                    break;
                }
            }
        }
        configSave()
    }
}

/* */
///Change locale (HTML5)
if (global.html5Build) {
    if (localeChanged) {
        setLocale();
        localeChanged = false;
    }
    if (!paused) and (changeSprites) {
        loadLocalizedSprites();
        changeSprites = false;
    }
}

/* */
/*  */
