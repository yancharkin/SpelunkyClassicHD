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
        global.time += game_speed;
        global.xtime += game_speed;
    }
}

// Touch Controls Visibility
if (keyboard_check(vk_f7) and keyboard_check(global.keyPayVal)) {
	touchControlsVisibilityTimer += 1;
} else {
	touchControlsVisibilityTimer = 0;
}
if (touchControlsVisibilityTimer >= 1*game_speed/2) {
	if (global.mobileBuild or global.html5Build) {
		global.touchVisChangeBy = -0.5;
	    menuTouchControls();
	}
	touchControlsVisibilityTimer = 0;
}

// Cheats
if (keyboard_check_pressed(vk_f8)) toggleCheats();
// Instant restart
if (global.debugBuild) {
	if (keyboard_check_pressed(global.keyRestartVal) or  gamepad_button_check_pressed(global.joyid, global.joyRestartVal)) {
	        scrClearGlobals();
	        room_goto(rLevel);
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
			trMessages("A CHILL RUNS UP YOUR SPINE...", "LET'S GET OUT OF HERE!", 0, 0, 200);
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

if (checkLangPressed()) {
		if (!paused) {
		    var locale_tmp = global.locale;
			global.locale = global.locale2;
			global.locale2 = locale_tmp;
		    setLocale();
		    loadLocalizedSprites();
			if (global.message1_src != "") {
				trMessages(global.message1_src, global.message2_src, global.messageHighlights, global.message2Highlights, global.messageTimer);
			};
		}
}

//Pause
if os_is_paused() and not paused {
    instance_deactivate_all(true);
    audio_pause_all();
    paused = true;
}
if (keyboard_check_pressed(global.keyStartVal) or gamepad_button_check_pressed(global.joyid, global.joyStartVal)) {
    if (not paused) {
		if (not isRoom("rIntro")) {
			if (instance_exists(oPlayer1)) {
				playerDepth = 174.8*(global.currLevel-1)+(oPlayer1.y+8)*0.34;
			};
	        instance_deactivate_all(true);
	        audio_pause_all();
	        paused = true;
		}
    } else {
        paused = false;
        instance_activate_all();
        audio_resume_all();
    }
}

///Check input in the menu
if (paused) {
	gamepadInMenu();
    if (checkDownPressed()) {
        menuItemIndex += 1;
        if (isRoom("rTitle") or isRoom("rIntro")) {
            if (menuItemIndex > maxIndexTitle) menuItemIndex = 0;
        } else { 
            if (menuItemIndex > maxIndexGame) menuItemIndex = 0;
        }
    } else if (checkUpPressed()) {
        menuItemIndex -= 1;
        if (isRoom("rTitle") or isRoom("rIntro")) {
            if (menuItemIndex < 0) menuItemIndex = maxIndexTitle;
        } else {
            if (menuItemIndex < 0) menuItemIndex = maxIndexGame;
        }
    } else if (checkJumpPressed()) {
        paused = false;
        instance_activate_all();
		audio_resume_all();
    } else if (checkAttackPressed())
			or (keyboard_check_pressed(global.keyEnter) or checkRightPressed() or checkLeftPressed()) {
        if (isRoom("rTitle") or isRoom("rIntro")) {
            switch (menuItemIndex) {
                case 0: {
                    toggleMusic();
                    if (paused) audio_pause_all();
                    break;
                }
                case 1: {
					if (global.mobileBuild) {
	                    paused = false;
	                    instance_activate_all();
	                    room_goto(rJoyConfig);
					} else {
	                    instance_activate_all();
	                    room_goto(rKeyConfig);
					};
                    break;
                }
                case 2: {
					if (global.mobileBuild) {
						global.toggleRunEnabled = !global.toggleRunEnabled;
					} else {
	                    paused = false;
	                    instance_activate_all();
	                    room_goto(rJoyConfig);
					}
                    break;
                }
                case 3: {
					if (global.mobileBuild) {
						global.touchVisChangeBy = 0.5;
						if (checkLeftPressed()) global.touchVisChangeBy = -0.5;
                        menuTouchControls();
					} else {
						global.toggleRunEnabled = !global.toggleRunEnabled;
					 }
                    break;
                }
                case 4: {
					if (global.mobileBuild) {
						global.vkeySizeChangeBy = 8;
						if (checkLeftPressed()) global.vkeySizeChangeBy = -8;
	                    resizeTouchButtons();
					} else {
						if (global.html5Build) {
							global.touchVisChangeBy = 0.5;
							if (checkLeftPressed()) global.touchVisChangeBy = -0.5;
	                        menuTouchControls();
	                    } else {
	                        menuToggleFullscreen();
	                    }
					}
                    break;
                }
				case 5: {
					if (global.mobileBuild) {
						global.touchOffsetChangeBy = 0.5;
						if (checkLeftPressed()) global.touchOffsetChangeBy = -0.5;
	                    changeTouchOffset()
					} else {
						if (global.html5Build) {
							global.vkeySizeChangeBy = 8;
							if (checkLeftPressed()) global.vkeySizeChangeBy = -8;
		                    resizeTouchButtons();
						} else {
							global.localeChangeBy = 1;
							if (checkLeftPressed()) global.localeChangeBy = -1;
		                    menuLanguage();
						}
					}
                    break;
                }
				case 6: {
					if (global.mobileBuild) {
						global.localeChangeBy = 1;
						if (checkLeftPressed()) global.localeChangeBy = -1;
						menuLanguage();
					} else {
						if (global.html5Build) {
							global.touchOffsetChangeBy = 0.5;
							if (checkLeftPressed()) global.touchOffsetChangeBy = -0.5;
		                    changeTouchOffset()
						} else {
							global.locale2ChangeBy = 1;
							if (checkLeftPressed()) global.locale2ChangeBy = -1;
							changeLocale2();
						}
					}
                    break;
                }
                case 7: {
					if (global.mobileBuild) {
						global.locale2ChangeBy = 1;
						if (checkLeftPressed()) global.locale2ChangeBy = -1;
						changeLocale2();
					} else {
						if (global.html5Build) {
							menuToggleFullscreen();
	                    } else {
							game_end();
	                    }
					}
					break;
                }
               case 8: {
					if (global.mobileBuild) {
	                    instance_activate_all();
	                    audio_stop_all();
						scrClearGlobals();
						room_goto(rLevel);
					} else {
						if (global.html5Build) {
							global.localeChangeBy = 1;
							if (checkLeftPressed()) global.localeChangeBy = -1;
							menuLanguage();
	                    }
					}
                    break;
                }
                case 9: {
					if (global.html5Build) {
						global.locale2ChangeBy = 1;
						if (checkLeftPressed()) global.locale2ChangeBy = -1;
						changeLocale2();
                    }
                    break;
				}
                case 10: {
					if (global.html5StandaloneBuild) {
						game_end();
					} else {
	                    instance_activate_all();
	                    audio_stop_all();
						scrClearGlobals();
						room_goto(rLevel);
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
					global.toggleRunEnabled = !global.toggleRunEnabled;
                    break;
                }
                case 2: {
					if (global.mobileBuild) {
						menuDie();
					} else {
						menuToggleFullscreen();
					}
                    break;
                }
				case 3: {
                    if (global.mobileBuild) {
		                instance_activate_all();
		                audio_stop_all();
						scrClearGlobals();
						room_goto(rLevel);
					} else {
						menuDie();
					}
			        break;
				}
				case 4: {
                    if (global.html5Build and  (not global.html5StandaloneBuild)) {
		                instance_activate_all();
		                audio_stop_all();
						scrClearGlobals();
						room_goto(rLevel);
					} else {
						game_end();
					}	
                    break;
                }
            }
        }
        configSave()
    }
}