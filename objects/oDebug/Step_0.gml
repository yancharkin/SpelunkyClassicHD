/// @description  Debug script

// Check platform
if (keyboard_check_pressed(vk_f1)) {
    show_debug_message("///////////////////////////////////////////");
    show_debug_message("Windows:" + string(os_windows));
    show_debug_message("Linux:" + string(os_linux));
    show_debug_message("MacOSX:" + string(os_macosx));
    show_debug_message("Unknown:" + string(os_unknown));
    show_debug_message("///////////////////////////////////////////");

    switch (os_type) {
        case os_windows: show_debug_message("Running on Windows"); break;
        case os_linux: show_debug_message("Running on Linux"); break;
    }

    if (os_browser == browser_not_a_browser) {
        show_debug_message("Not running in a browser");
    } else {
        if (os_browser == browser_chrome) {
            show_debug_message("Running in Chrome");
        } else if (os_browser == browser_firefox) {
            show_debug_message("Running in Firefox");
        } else if (os_browser == browser_unknown) {
            show_debug_message("Running in unknown browser");
        }
    }
    show_debug_message("///////////////////////////////////////////");
}

//Debug levels
if (keyboard_check_pressed(vk_f2)) {
    global.levelIndex += 1;
    switch (global.levelIndex) {
        case 1: {
            room_goto(rTransition1);
            break;
        }
        case 2: {
            global.currLevel = 4;
            room_goto(rTransition1x);
            break;
        }
        case 3: {
            global.currLevel = 9;
            room_goto(rTransition2);
            break;
        }
        case 4: {
            global.currLevel = 13;
            room_goto(rTransition2x);
            break;
        }
        case 5: {
            room_goto(rTransition3);
            break;
        }
        case 6: {
            room_goto(rTransition3x);
            break;
        }
        case 7: {
            room_goto(rTransition4);
            break;
        }
        case 8: {
            // Olmec fight
            global.currLevel = 16;
            room_goto(rTransition4);
            break;
        }
        case 9: {
            room_goto(rSun);
            break;
        }
        case 10: {
            room_goto(rMoon);
            break;
        }
        case 11: {
            room_goto(rStars);
            break;
        }       
        case 12: {
            room_goto(rEnd);
            break;
        }
        case 13: {
            room_goto(rEndCustom);
            break;
        }
        /*
        case 14: {
            room_goto(rCredits1);
            break;
        }
        case 15: {
            room_goto(rCredits2);
            break;
        }
        */
        case 14: {
            global.levelIndex = 0;
            break;
        }
    }
}

// Open shortcuts and challenges
if (keyboard_check_pressed(vk_f3)) {
    global.plife=99;
    // Shortcuts
    global.tunnel1 = 0;
    global.tunnel2 = 0;
    // Challenges
    global.money =200000;
    global.time = 300; // NOT ENOUGH TO OPEN MOON ROOM! Have to complete the game (F2 is OK).
    global.kills = 200;
    global.damsels = 10;
}

// Debug items
if (keyboard_check_pressed(vk_f4)) {
    itemsBundleIndex += 1;
    if (itemsBundleIndex == 6) {
        itemsBundleIndex = 0;
    }
}
if (keyboard_check_pressed(vk_f5)) {
    var player = oGame.players[0];
    switch (itemsBundleIndex) {
        case 0: {
            instance_create(player.x-24, player.y, oRock);
            instance_create(player.x+24, player.y, oRopePile);
            instance_create(player.x-48, player.y, oBombBox);
            instance_create(player.x+48, player.y, oLockedChest);
            instance_create(player.x-72, player.y, oDamsel);
            instance_create(player.x+72, player.y, oKey);
            break;
        }
        case 1: {
            instance_create(player.x-24, player.y, oBow);
            instance_create(player.x+24, player.y, oPistol);
            instance_create(player.x-48, player.y, oShotgun);
            instance_create(player.x+48, player.y, oWebCannon);
            instance_create(player.x-72, player.y, oMachete);
            instance_create(player.x+72, player.y, oMattock);
            break;
        }
        case 2: {
            instance_create(player.x-24, player.y, oGloves);
            instance_create(player.x+24, player.y, oMitt);
            instance_create(player.x-48, player.y, oSpringShoes);
            instance_create(player.x+48, player.y, oSpikeShoes);
            instance_create(player.x-72, player.y, oSpectacles);
            instance_create(player.x+72, player.y, oCapePickup);
            break;
        }
        case 3: {
            instance_create(player.x-24, player.y, oJetpack);
            instance_create(player.x+24, player.y, oParaPickup);
            instance_create(player.x-48, player.y, oCompass);
            instance_create(player.x+48, player.y, oFlareCrate);
            instance_create(player.x-72, player.y, oCrate);
            instance_create(player.x+72, player.y, oPaste);
            break;
        }
        case 4: {
            instance_create(player.x-24, player.y, oUdjatEye);
            instance_create(player.x+24, player.y, oAnkh);
            instance_create(player.x-48, player.y, oCrown);
            instance_create(player.x+48, player.y, oSceptre);
            instance_create(player.x-72, player.y, oTeleporter);
            instance_create(player.x+72, player.y, oKapala);
            break;
        }
        case 5: {
            instance_create(player.x-24, player.y, oLampItem);
            instance_create(player.x+24, player.y, oLampRedItem);
            instance_create(player.x-48, player.y, oArrow);
            instance_create(player.x+48, player.y, oBasketball);
            instance_create(player.x-72, player.y, oJordans);
            caveman = instance_create(player.x+72, player.y, oCaveman);
            caveman.hp = 0;
            break;
        }
    }
}

/* */
/*  */
