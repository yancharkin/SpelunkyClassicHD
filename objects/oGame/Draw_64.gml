/// @description  Pause menu
if (paused) {
	draw_set_color(c_black);
	draw_rectangle(0, 0, global.display_w, global.display_h, false);
    var color0 = c_white;
    var color1 = c_white;
    var color2 = c_white;
    var color3 = c_white;
    var color4 = c_white;
    var color5 = c_white;
    var color6 = c_white;
    var color7 = c_white;
    var color8 = c_white;
    switch (menuItemIndex) {
        case 0: { color0 = c_yellow; break; }
        case 1: { color1 = c_yellow; break; }
        case 2: { color2 = c_yellow; break; }
        case 3: { color3 = c_yellow; break; }
        case 4: { color4 = c_yellow; break; }
        case 5: { color5 = c_yellow; break; }
        case 6: { color6 = c_yellow; break; }
        case 7: { color7 = c_yellow; break; }
        case 8: { color8 = c_yellow; break; }
    }

    if (global.music) {
        var strMusic = tr("ON");
    } else {
        var strMusic = tr("OFF");
    }
    if (global.fullscreen) {
        var strFullscreen = tr("ON");
    } else {
        var strFullscreen = tr("OFF");
    }
    if (global.toggleRunEnabled) {
        var strToggleRunEnabled = tr("ON");
    } else {
        var strToggleRunEnabled = tr("OFF");
    }

    var strLocaleName = string_upper(global.localesMap[? global.locale]);
	var strLocaleName2 = string_upper(global.localesTr[$ global.locale][$ global.locale2]);

    if (isRoom("rTitle")) {
        if (global.html5Build) {
            drawTextHCentered(tr("MUSIC") + " <" + strMusic + ">", "small", color0, 0, firstMenuItemTitleY);
            drawTextHCentered(tr("KEYBOARD CONFIGURATION"), "small", color1, 0, firstMenuItemTitleY+20);
            drawTextHCentered(tr("GAMEPAD") + " <" + string(global.joyid) + ">", "small", color2, 0, firstMenuItemTitleY+40);
            drawTextHCentered(tr("GAMEPAD CONFIGURATION"), "small", color3, 0, firstMenuItemTitleY+60);
            drawTextHCentered(tr("TOUCH CONTROLS VISIBILITY") + " <" + string(global.touchControlsVisibility) + ">", "small", color4, 0, firstMenuItemTitleY+80);
            drawTextHCentered(tr("TOGGLEABLE RUN BUTTON") + " <" + strToggleRunEnabled + ">", "small", color5, 0, firstMenuItemTitleY+100);
            if (global.mobileBuild) {
                drawTextHCentered(tr("LANGUAGE") + " <" + strLocaleName + ">", "small", color6, 0, firstMenuItemTitleY+120);
                drawTextHCentered(tr("RESTART"), "small", color7, 0, firstMenuItemTitleY+140);
            } else if (global.browserBuild) {
                drawTextHCentered(tr("TOGGLE FULLSCREEN"), "small", color6, 0, firstMenuItemTitleY+120);
                drawTextHCentered(tr("LANGUAGE") + " <" + strLocaleName + ">", "small", color7, 0, firstMenuItemTitleY+140);
                drawTextHCentered(tr("RESTART"), "small", color8, 0, firstMenuItemTitleY+160);
            //} else if (global.electronBuild) {
            } else {        
                drawTextHCentered(tr("FULLSCREEN") + " <" + strFullscreen + ">", "small", color6, 0, firstMenuItemTitleY+120);    
                drawTextHCentered(tr("LANGUAGE") + " <" + strLocaleName + ">", "small", color7, 0, firstMenuItemTitleY+140);
                drawTextHCentered(tr("QUIT"), "small", color8, 0, firstMenuItemTitleY+160);
            }
        } else {
            drawTextHCentered(tr("MUSIC") + " <" + strMusic + ">", "small", color0, 0, firstMenuItemTitleY);
            drawTextHCentered(tr("KEYBOARD CONFIGURATION"), "small", color1, 0, firstMenuItemTitleY+20);
            drawTextHCentered(tr("GAMEPAD CONFIGURATION"), "small", color2, 0, firstMenuItemTitleY+40);
            drawTextHCentered(tr("TOGGLEABLE RUN BUTTON") + " <" + strToggleRunEnabled + ">", "small", color3, 0, firstMenuItemTitleY+60);
            if (global.mobileBuild) {
                drawTextHCentered(tr("TOUCH CONTROLS VISIBILITY") + " <" + string(global.touchControlsVisibility) + ">", "small", color4, 0, firstMenuItemTitleY+80);
                drawTextHCentered(tr("LANGUAGE") + " 1 <" + strLocaleName + ">", "small", color5, 0, firstMenuItemTitleY+100);
                drawTextHCentered(tr("LANGUAGE") + " 2 <" + strLocaleName2 + ">", "small", color6, 0, firstMenuItemTitleY+120);
				drawTextHCentered(tr("RESTART"), "small", color7, 0, firstMenuItemTitleY+140);
            } else {
                drawTextHCentered(tr("FULLSCREEN") + " <" + strFullscreen + ">", "small", color4, 0, firstMenuItemTitleY+80);
                drawTextHCentered(tr("LANGUAGE") + " 1 <" + strLocaleName + ">", "small", color5, 0, firstMenuItemTitleY+100);
				drawTextHCentered(tr("LANGUAGE") + " 2 <" + strLocaleName2 + ">", "small", color6, 0, firstMenuItemTitleY+120);
                drawTextHCentered(tr("QUIT"), "small", color7, 0, firstMenuItemTitleY+140);
            }
        }
    } else {
        if (global.html5Build) {
            drawTextHCentered(tr("MUSIC") + " <" + strMusic + ">", "small", color0, 0, firstMenuItemGameY);
            drawTextHCentered(tr("TOUCH CONTROLS VISIBILITY") + " <" + string(global.touchControlsVisibility) + ">", "small", color1, 0, firstMenuItemGameY+20);
            drawTextHCentered(tr("TOGGLEABLE RUN BUTTON") + " <" + strToggleRunEnabled + ">", "small", color2, 0, firstMenuItemGameY+40);
            if (global.mobileBuild) {
                drawTextHCentered(tr("LANGUAGE") + " <" + strLocaleName + ">", "small", color3, 0, firstMenuItemGameY+60);
                drawTextHCentered(tr("DIE!"), "small", color4, 0, firstMenuItemGameY+80);
                drawTextHCentered(tr("RESTART"), "small", color5, 0, firstMenuItemGameY+100);
            } else if (global.browserBuild) {
                drawTextHCentered(tr("TOGGLE FULLSCREEN"), "small", color3, 0, firstMenuItemGameY+60);
                drawTextHCentered(tr("LANGUAGE") + " <" + strLocaleName + ">", "small", color4, 0, firstMenuItemGameY+80);
                drawTextHCentered(tr("DIE!"), "small", color5, 0, firstMenuItemGameY+100);
                drawTextHCentered(tr("RESTART"), "small", color6, 0, firstMenuItemGameY+120);
            //} else if (global.electronBuild) {
            } else {
                drawTextHCentered(tr("FULLSCREEN") + " <" + strFullscreen + ">", "small", color3, 0, firstMenuItemGameY+60);
                drawTextHCentered(tr("LANGUAGE") + " <" + strLocaleName + ">", "small", color4, 0, firstMenuItemGameY+80);
                drawTextHCentered(tr("DIE!"), "small", color5, 0, firstMenuItemGameY+100);
                drawTextHCentered(tr("QUIT"), "small", color6, 0, firstMenuItemGameY+120);
            }
        } else {
            drawTextHCentered(tr("MUSIC") + " <" + strMusic + ">", "small", color0, 0, firstMenuItemGameY);
            drawTextHCentered(tr("TOGGLEABLE RUN BUTTON") + " <" + strToggleRunEnabled + ">", "small", color1, 0, firstMenuItemGameY+20);
            if (global.mobileBuild) {
                drawTextHCentered(tr("TOUCH CONTROLS VISIBILITY") + " <" + string(global.touchControlsVisibility) + ">", "small", color2, 0, firstMenuItemGameY+40);
                drawTextHCentered(tr("LANGUAGE") + " 1 <" + strLocaleName + ">", "small", color3, 0, firstMenuItemGameY+60);
				drawTextHCentered(tr("LANGUAGE") + " 2 <" + strLocaleName2 + ">", "small", color4, 0, firstMenuItemGameY+80);
                drawTextHCentered(tr("DIE!"), "small", color5, 0, firstMenuItemGameY+100);
                drawTextHCentered(tr("RESTART"), "small", color6, 0, firstMenuItemGameY+120);
            } else {
                drawTextHCentered(tr("FULLSCREEN") + " <" + strFullscreen + ">", "small", color2, 0, firstMenuItemGameY+40);
                drawTextHCentered(tr("LANGUAGE") + " 1 <" + strLocaleName + ">", "small", color3, 0, firstMenuItemGameY+60);
				drawTextHCentered(tr("LANGUAGE") + " 2 <" + strLocaleName2 + ">", "small", color4, 0, firstMenuItemGameY+80);
                drawTextHCentered(tr("DIE!"), "small", color5, 0, firstMenuItemGameY+100);
                drawTextHCentered(tr("QUIT"), "small", color6, 0, firstMenuItemGameY+120);
            }
        }
    }
    if (global.html5Build) drawTouchControls();
}

///TouchInput
if ((global.mobileBuild) or (global.html5Build)) {
    enableTouchInput();
}

///Draw the HUD

display_set_gui_size(global.display_w,global.display_h);
if (!global.html5Build) {
    scrDrawHUD();
    if (global.mobileBuild) {
        drawTouchControls();
    }
    showMessages();
    /*
    if (global.messageTimer > 0) {
        y1 = 216 + 8 - global.fontSmallHeight;
        y2 = y1 + global.fontSmallHeight;
        drawMessage(global.message, 'small', c_white, 0, y1, 1);
        if (not isRoom("rTutorial")) {
            drawMessage(global.message2, 'small', c_yellow, 0, y2, 2);
        } else {
            drawMessage(global.message2, 'small', c_white, 0, y2, 2);
        }
        global.messageTimer -= 1;
    }
    */
}