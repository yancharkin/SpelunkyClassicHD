messageHighlights = "";
message2Highlights = "";
if (isRoom("rLevelEditor") or isRoom("rLoadLevel")) {
    message = "";
    message2 = "";
} else if (x == 32 and y == 64) {
    message = tr("WELCOME TO THE TUTORIAL CAVE!");
    message2 = tr("THIS MIGHT BE YOUR FIRST TIME PLAYING.");
} else if (x == 80 and y == 96) {
    message[0] = tr("PRESS ");
    if (global.touchControlsVisibility > 0) {
        message[1] = "B";
    } else if (global.gamepadOn) {
        message[1] = scrGetJoy(global.joyJumpVal);
    } else {
        message[1] = scrGetKey(global.keyJumpVal);
    }
    message[2] = tr(" TO JUMP.");
    message2 = "";
    messageHighlights[0] = 1;
} else if (x == 176 and y == 96) {
    message = tr("YOU CAN HANG ON LEDGES, TOO!");
    message2 = "";
} else if (x == 240 and y == 64) {
    message[0] = tr("PRESS ");
    if (global.touchControlsVisibility > 0) {
        message[1] = "A";
    } else if (global.gamepadOn) {
        message[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message[1] = scrGetKey(global.keyAttackVal);
    }
    message[2] = tr(" TO USE YOUR WHIP.");
    message2 = "";   
    messageHighlights[0] = 1;
} else if (x == 384 and y == 96) {
    message = tr("COLLECT THE TREASURE!");
    message2 = "";
} else if (x == 512 and y == 32) {
    message[0] = tr("HOLD UP AND PRESS ");
    if (global.touchControlsVisibility > 0) {
        message[1] = "A";
    } else if (global.gamepadOn) {
        message[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message[1] = scrGetKey(global.keyAttackVal);
    }
    message[2] = tr(" TO OPEN CHESTS.");
    message2 = "";
    messageHighlights[0] = 1;
} else if (x == 544 and y == 112) {
    message = tr("HOLD DOWN TO DUCK AND CRAWL.");
    message2 = "";
} else if (x == 576 and y == 128) {
    message = tr("CRAWL OVER THE EDGE TO DO A FLIP HANG.");
    message2 = tr("FALLING TOO FAR CAN REALLY HURT!");
} else if (x == 640 and y == 96) {
    message = tr("HOLD UP TO CLIMB THE LADDER.");
    message2 = "";
} else if (x == 608 and y == 256) {
    message[0] = tr("DUCK AND PRESS ");
    if (global.touchControlsVisibility > 0) {
        message[1] = "A";
    } else if (global.gamepadOn) {
        message[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message[1] = scrGetKey(global.keyAttackVal);
    }
    message[2] = tr(" TO PICK UP ITEMS.");
    message2 = "";
    messageHighlights[0] = 1;
} else if (x == 576 and y == 256) {
    message[0] = tr("PRESS ");
    if (global.touchControlsVisibility > 0) {
        message[1] = "A";
    } else if (global.gamepadOn) {
        message[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message[1] = scrGetKey(global.keyAttackVal);
    }
    message[2] = tr(" TO THROW OR USE ITEMS.");
    message2 = tr("HOLD UP TO THROW HIGH AND DOWN TO DROP.");
    messageHighlights[0] = 1;
} else if (x == 496 and y == 256) {
    message[0] = tr("PRESS ");
    message[1] = "X";
    message[2] = tr(" TO SELECT YOUR ROPE AND");
    message2[0] = "A";
    message2[1] = tr(" TO USE IT.");
    if (global.touchControlsVisibility > 0) {
        message[1] = "X";
        message2[0] = "A";
    } else if (global.gamepadOn) {
        message[1] = scrGetJoy(global.joyItemVal);
        message2[0] = scrGetJoy(global.joyAttackVal);
    } else {
        message[1] = scrGetKey(global.keyItemVal);
        message2[0] = scrGetKey(global.keyAttackVal);
    }
    messageHighlights[0] = 1;
    message2Highlights[0] = 0;
} else if (x == 432 and y == 176) {
    message[0] = tr("CROUCH AND PRESS ");
    if (global.touchControlsVisibility > 0) {
        message[1] = "A";
    } else if (global.gamepadOn) {
        message[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message[1] = scrGetKey(global.keyAttackVal);
    }
    message2 = tr("TO THROW A ROPE DOWN A LEDGE.");
    messageHighlights[0] = 1;
} else if (x == 384 and y == 208) {
    message[0] = tr("TO RUN, HOLD DOWN ");
    message[2] = tr(" OR ");
    message[4] = ".";
    if (global.touchControlsVisibility > 0) {
        message[1] = "A";
        message[3] = "Y";
    } else if (global.gamepadOn) {
        message[1] = scrGetJoy(global.joyAttackVal);
        message[3] = scrGetJoy(global.joyRunVal);
    } else {
        message[1] = scrGetKey(global.keyAttackVal);
        message[3] = scrGetKey(global.keyRunVal);
    }
    message2 = "";
    messageHighlights[0] = 1;
    messageHighlights[1] = 3;
} else if (x == 256 and y == 208) {
    message = tr("OPEN THIS CRATE FOR A BAG OF BOMBS.");
    message2 = "";
} else if (x == 224 and y == 208) {
    message[0] = tr("PRESS ");
    message[2] = tr(" TO SELECT BOMBS AND ");
    message2[0] = tr("PRESS ");
    message2[2] = tr(" TO USE IT.");
    if (global.touchControlsVisibility > 0) {
        message[1] = "X";
        message2[1] = "A";
    } else if (global.gamepadOn) {
        message[1] = scrGetJoy(global.joyItemVal);
        message2[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message[1] = scrGetKey(global.keyItemVal);
        message2[1] = scrGetKey(global.keyAttackVal);
    }
    messageHighlights[0] = 1
    message2Highlights[0] = 1;
} else if (x == 96 and y == 256) {
    message = tr("THERE'S LOTS MORE AHEAD!");
    message2 = tr("USE YOUR WITS AND BEWARE OF TRAPS!");

}
global.message = message;
global.message2 = message2;
global.messageHighlights = messageHighlights;
global.message2Highlights = message2Highlights;
global.messageTimer = 200;

