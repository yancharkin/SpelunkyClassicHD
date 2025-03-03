if (instance_exists(oScreen)) { oScreen.enabled = true; }
global.drawHUD = true;
global.gameStart = true;
global.shake = 0;
shakeSwitch = false;
musicFade = false;
musicFadeTimer = 0;
global.xviewPrev = 0
global.yviewPrev = 0;

global.xmoney = 0;
global.xtime = 0;

global.ghostExists = false;

if (global.darkLevel) darkness = 1;
else darkness = 0;
global.darknessLerp = 0;

if (global.music)
{
    startMusic();
}

if (instance_exists(oPlayer1))
{
    with oPlayer1
    {
        scrHoldItem(global.pickupItem);
        // safe check instead of just setting holditem
        if (instance_exists(holdItem)) {
            holdItem.cost = 0;
            }
        if (global.kaliPunish >= 2)
        {
            instance_create(x, y, oBall);
            obj = instance_create(x, y, oChain);
            obj.linkVal = 1;
            obj = instance_create(x, y, oChain);
            obj.linkVal = 2;
            obj = instance_create(x, y, oChain);
            obj.linkVal = 3;
            obj = instance_create(x, y, oChain);
            obj.linkVal = 4;
        }
    }
}

