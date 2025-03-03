/*
type = "Message Sign";

// tutorial cave init
if (isRoom("rLevelEditor") or isRoom("rLoadLevel"))
{
    message = "";
    message2 = "";
}
else if (x == 32 and y == 64)
{
    message = tr("WELCOME TO THE TUTORIAL CAVE!");
    message2 = tr("THIS MIGHT BE YOUR FIRST TIME PLAYING.");

}
else if (x == 80 and y == 96)
{
    if (global.gamepadOn) message = tr("PRESS ") + scrGetJoy(global.joyJumpVal) + tr(" TO JUMP.");
    else message = tr("PRESS ") + scrGetKey(global.keyJumpVal) + tr(" TO JUMP.");
    message2 = "";

}
else if (x == 176 and y == 96)
{
    message = tr("YOU CAN HANG ON LEDGES, TOO!");
    message2 = "";

}
else if (x == 240 and y == 64)
{
    if (global.gamepadOn) message = tr("PRESS ") + scrGetJoy(global.joyAttackVal) + tr(" TO USE YOUR WHIP.");
    else message = tr("PRESS ") + scrGetKey(global.keyAttackVal) + tr(" TO USE YOUR WHIP.");
    message2 = "";

}
else if (x == 384 and y == 96)
{
    message = tr("COLLECT THE TREASURE!");
    message2 = "";

}
else if (x == 512 and y == 32)
{
    if (global.gamepadOn) message = tr("HOLD UP AND PRESS ") + scrGetJoy(global.joyAttackVal) + tr(" TO OPEN CHESTS.");
    else message = tr("HOLD UP AND PRESS ") + scrGetKey(global.keyAttackVal) + tr(" TO OPEN CHESTS.");
    message2 = "";

}
else if (x == 544 and y == 112)
{
    message = tr("HOLD DOWN TO DUCK AND CRAWL.");
    message2 = "";

}
else if (x == 576 and y == 128)
{
    message = tr("CRAWL OVER THE EDGE TO DO A FLIP HANG.");
    message2 = tr("FALLING TOO FAR CAN REALLY HURT!");

}
else if (x == 640 and y == 96)
{
    message = tr("HOLD UP TO CLIMB THE LADDER.");
    message2 = "";

}
else if (x == 608 and y == 256)
{
    if (global.gamepadOn) message = tr("DUCK AND PRESS ") + scrGetJoy(global.joyAttackVal) + tr(" TO PICK UP ITEMS.");
    else message = tr("DUCK AND PRESS ") + scrGetKey(global.keyAttackVal) + tr(" TO PICK UP ITEMS.");
    message2 = "";

}
else if (x == 576 and y == 256)
{
    if (global.gamepadOn) message = tr("PRESS ") + scrGetJoy(global.joyAttackVal) + tr(" TO THROW OR USE ITEMS.");
    else message = tr("PRESS ") + scrGetKey(global.keyAttackVal) + tr(" TO THROW OR USE ITEMS.");
    message2 = tr("HOLD UP TO THROW HIGH AND DOWN TO DROP.");

}
else if (x == 496 and y == 256)
{
    if (global.gamepadOn) message = tr("PRESS ") + scrGetJoy(global.joyItemVal) + tr(" TO SELECT YOUR ROPE AND");
    else message = tr("PRESS ") + scrGetKey(global.keyItemVal) + tr(" TO SELECT YOUR ROPE AND");
    if (global.gamepadOn) message2 = scrGetJoy(global.joyAttackVal) + tr(" TO USE IT.");
    else message2 = scrGetKey(global.keyAttackVal) + tr(" TO USE IT.");

}
else if (x == 432 and y == 176)
{
    if (global.gamepadOn) message = tr("CROUCH AND PRESS ") + scrGetJoy(global.joyAttackVal);
    else message = tr("CROUCH AND PRESS ") + scrGetKey(global.keyAttackVal);
    message2 = tr("TO THROW A ROPE DOWN A LEDGE.");

}
else if (x == 384 and y == 208)
{
    if (global.gamepadOn) message = tr("TO RUN, HOLD DOWN ") + scrGetJoy(global.joyAttackVal) + tr(" OR ") + scrGetJoy(global.joyRunVal) + ".";
    else message = tr("TO RUN, HOLD DOWN ") + scrGetKey(global.keyAttackVal) + tr(" OR ") + scrGetKey(global.keyRunVal) + ".";
    message2 = "";
}
else if (x == 256 and y == 208)
{
    message = tr("OPEN THIS CRATE FOR A BAG OF BOMBS.");
    message2 = "";

}
else if (x == 224 and y == 208)
{
    if (global.gamepadOn) message = tr("PRESS ") + scrGetJoy(global.joyItemVal) + tr(" TO SELECT BOMBS AND ");
    else message = tr("PRESS ") + scrGetKey(global.keyItemVal) + tr(" TO SELECT BOMBS AND ");
    if (global.gamepadOn) message2 =  tr("PRESS ") + scrGetJoy(global.joyAttackVal) + tr(" TO USE IT.");
    else message2 =  tr("PRESS ") + scrGetKey(global.keyAttackVal) + tr(" TO USE IT.");

}
else if (x == 96 and y == 256)
{
    message = tr("THERE'S LOTS MORE AHEAD!");
    message2 = tr("USE YOUR WITS AND BEWARE OF TRAPS!");

}
*/

/* */
/*  */
