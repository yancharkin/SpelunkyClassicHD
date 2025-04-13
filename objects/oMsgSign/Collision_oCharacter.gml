if (isRoom("rLevelEditor") or isRoom("rLoadLevel")) {
    message1 = "";
    message2 = "";
} else if (x == 32 and y == 64) {
    message1 = "WELCOME TO THE TUTORIAL CAVE!";
    message2 = "THIS MIGHT BE YOUR FIRST TIME PLAYING.";
} else if (x == 80 and y == 96) {
    message1[0] = "PRESS ";
    if (global.touchControlsVisibility > 0) {
        message1[1] = "B";
    } else if (global.gamepadOn) {
        message1[1] = scrGetJoy(global.joyJumpVal);
    } else {
        message1[1] = scrGetKey(global.keyJumpVal);
    }
    message1[2] = " TO JUMP.";
    message2 = "";
    messageHighlights[0] = 1;
} else if (x == 176 and y == 96) {
    message1 = "YOU CAN HANG ON LEDGES, TOO!";
    message2 = "";
} else if (x == 240 and y == 64) {
    message1[0] = "PRESS ";
    if (global.touchControlsVisibility > 0) {
        message1[1] = "A";
    } else if (global.gamepadOn) {
        message1[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message1[1] = scrGetKey(global.keyAttackVal);
    }
    message1[2] = " TO USE YOUR WHIP.";
    message2 = "";   
    messageHighlights[0] = 1;
} else if (x == 384 and y == 96) {
    message1 = "COLLECT THE TREASURE!";
    message2 = "";
} else if (x == 512 and y == 32) {
    message1[0] = "HOLD UP AND PRESS ";
    if (global.touchControlsVisibility > 0) {
        message1[1] = "A";
    } else if (global.gamepadOn) {
        message1[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message1[1] = scrGetKey(global.keyAttackVal);
    }
    message1[2] = " TO OPEN CHESTS.";
    message2 = "";
    messageHighlights[0] = 1;
} else if (x == 544 and y == 112) {
    message1 = "HOLD DOWN TO DUCK AND CRAWL.";
    message2 = "";
} else if (x == 576 and y == 128) {
    message1 = "CRAWL OVER THE EDGE TO DO A FLIP HANG.";
    message2 = "FALLING TOO FAR CAN REALLY HURT!";
} else if (x == 640 and y == 96) {
    message1 = "HOLD UP TO CLIMB THE LADDER.";
    message2 = "";
} else if (x == 608 and y == 256) {
    message1[0] = "DUCK AND PRESS ";
    if (global.touchControlsVisibility > 0) {
        message1[1] = "A";
    } else if (global.gamepadOn) {
        message1[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message1[1] = scrGetKey(global.keyAttackVal);
    }
    message1[2] = " TO PICK UP ITEMS.";
    message2 = "";
    messageHighlights[0] = 1;
} else if (x == 576 and y == 256) {
    message1[0] = "PRESS ";
    if (global.touchControlsVisibility > 0) {
        message1[1] = "A";
    } else if (global.gamepadOn) {
        message1[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message1[1] = scrGetKey(global.keyAttackVal);
    }
    message1[2] = " TO THROW OR USE ITEMS.";
    message2 = "HOLD UP TO THROW HIGH AND DOWN TO DROP.";
    messageHighlights[0] = 1;
} else if (x == 496 and y == 256) {
    message1[0] = "PRESS ";
    message1[1] = "X";
    message1[2] = " TO SELECT YOUR ROPE AND";
    message2[0] = "A";
    message2[1] = " TO USE IT.";
    if (global.touchControlsVisibility > 0) {
        message1[1] = "X";
        message2[0] = "A";
    } else if (global.gamepadOn) {
        message1[1] = scrGetJoy(global.joyItemVal);
        message2[0] = scrGetJoy(global.joyAttackVal);
    } else {
        message1[1] = scrGetKey(global.keyItemVal);
        message2[0] = scrGetKey(global.keyAttackVal);
    }
    messageHighlights[0] = 1;
    message2Highlights[0] = 0;
} else if (x == 432 and y == 176) {
    message1[0] = "CROUCH AND PRESS ";
    if (global.touchControlsVisibility > 0) {
        message1[1] = "A";
    } else if (global.gamepadOn) {
        message1[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message1[1] = scrGetKey(global.keyAttackVal);
    }
    message2 = "TO THROW A ROPE DOWN A LEDGE.";
    messageHighlights[0] = 1;
} else if (x == 384 and y == 208) {
    message1[0] = "TO RUN, HOLD DOWN ";
    message1[2] = " OR ";
    message1[4] = ".";
    if (global.touchControlsVisibility > 0) {
        message1[1] = "A";
        message1[3] = "Y";
    } else if (global.gamepadOn) {
        message1[1] = scrGetJoy(global.joyAttackVal);
        message1[3] = scrGetJoy(global.joyRunVal);
    } else {
        message1[1] = scrGetKey(global.keyAttackVal);
        message1[3] = scrGetKey(global.keyRunVal);
    }
    message2 = "";
    messageHighlights[0] = 1;
    messageHighlights[1] = 3;
} else if (x == 256 and y == 208) {
    message1 = "OPEN THIS CRATE FOR A BAG OF BOMBS.";
    message2 = "";
} else if (x == 224 and y == 208) {
    message1[0] = "PRESS ";
    message1[2] = " TO SELECT BOMBS AND ";
    message2[0] = "PRESS ";
    message2[2] = " TO USE IT.";
    if (global.touchControlsVisibility > 0) {
        message1[1] = "X";
        message2[1] = "A";
    } else if (global.gamepadOn) {
        message1[1] = scrGetJoy(global.joyItemVal);
        message2[1] = scrGetJoy(global.joyAttackVal);
    } else {
        message1[1] = scrGetKey(global.keyItemVal);
        message2[1] = scrGetKey(global.keyAttackVal);
    }
    messageHighlights[0] = 1
    message2Highlights[0] = 1;
} else if (x == 96 and y == 256) {
    message1 = "THERE'S LOTS MORE AHEAD!";
    message2 = "USE YOUR WITS AND BEWARE OF TRAPS!";
}

trMessages(message1, message2, messageHighlights, message2Highlights, 200);