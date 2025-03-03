/// @description Gamepad in HTML5
global.bStartPressed = false;
global.bStartPreviousState = false;
global.bAttackPressed = false;
global.bAttackPressedPreviousState = false;

//Left analog stick
global.analogLDownPreviousState = false;
global.analogLUpPreviousState = false;
global.analogLDownPressed = false;
global.analogLUpPressed = false;

instance_create(0, 0, oHtml5Gamepad);
debugCounter = 0;

global.message = "";
global.message2 = "";

drawPosX = 100;
drawPosY = 83;
drawLoot = -2;
moneyCount = 0;
hurryup = false;

isLoot = false;
isKills = false;

if (global.hasCape)
{
    instance_create(0, 0, oCape);
}

if (global.currLevel-1 < 1)
{
    scrClearGlobals();
    global.firstTime = false;
}

if (global.kaliPunish >= 2)
{
    instance_create(oPDummy.x, oPDummy.y+2, oBall2);
    obj = instance_create(oPDummy.x, oPDummy.y, oChain2);
    obj.linkVal = 1;
    obj = instance_create(oPDummy.x, oPDummy.y, oChain2);
    obj.linkVal = 2;
    obj = instance_create(oPDummy.x, oPDummy.y, oChain2);
    obj.linkVal = 3;
    obj = instance_create(oPDummy.x, oPDummy.y, oChain2);
    obj.linkVal = 4;
}

alarm[0] = 10;
alarm[1] = 30;

if (global.xdamsels > 0)
{
    instance_create(176+8, 176+8, oDamselKiss);
}

if (global.tunnel1 > 0 and global.tunnel2 > 0 and isRoom("rTransition1x"))
{
    if (global.tunnel1 > global.tunnel1Max) global.tunnel1 -= 1;
    else instance_create(96+8, 176+8, oTunnelMan);
}
else if (global.tunnel1 == 0 and global.tunnel2 > 0 and isRoom("rTransition2x"))
{
    if (global.tunnel2 > global.tunnel2Max) global.tunnel2 -= 1;
    else instance_create(96+8, 176+8, oTunnelMan);
}
else if (global.tunnel1 > 0 and global.tunnel2 == 0 and isRoom("rTransition3x"))
{
    if (global.tunnel1 > global.tunnel3Max) global.tunnel1 -= 1;
    else instance_create(96+8, 176+8, oTunnelMan);
}

upHeld = 0;
downHeld = 0;

stopAllMusic();

