with oScreen { canPause = true; }

global.currLevel = 1;

shakeToggle = false;
global.darkLevel = false;
global.snakePit = false;
global.messageTimer = 0;
global.mini1 = 0;
global.mini2 = 0;
global.mini3 = 0;
global.hasJordans = false;
global.arrows = 0;

sunGold = 200000;
moonGold = 600000;
starsGold = 120;

ini_open("spelunky.ini")

tMoney = ini_read_real("highscore","value1",0) -0;
tTime = ini_read_real("highscore","value2",0) -0;
tKills = ini_read_real("highscore","value3",0) -0;
tSaves = ini_read_real("highscore","value4",0)-0;

ini_close()

// debug
/*
tMoney = 200000;
tTime = 1;
tKills = 200;
tSaves = 8;
*/

if (tMoney >= 50000)
{
    trophy = instance_create(32, 32, oTrophy);
    if (tMoney >= 200000)
    {
        trophy.sprite_index = sGoldTrophy;
        instance_create(32, 48, oXSun);
    }
    else if (tMoney >= 100000)
    {
        trophy.sprite_index = sSilverTrophy;
    }
    else
    {
        trophy.sprite_index = sBronzeTrophy;
    }
}

if (tTime > 0 and tTime < 960)
{
    trophy = instance_create(64, 64, oTrophy);
    if (tTime <= 960)
    {
        trophy.sprite_index = sBronzeTrophy;
    }
    if (tTime <= 720)
    {
        trophy.sprite_index = sSilverTrophy;
    }
    if (tTime <= 600)
    {
        trophy.sprite_index = sGoldTrophy;
        instance_create(64, 80, oXMoon);
    }
}

if (tKills >= 80)
{
    trophy = instance_create(32, 96, oTrophy);
    if (tKills >= 120)
    {
        trophy.sprite_index = sGoldTrophy;
        instance_create(32, 112, oXStars);
    }
    else if (tKills >= 100)
    {
        trophy.sprite_index = sSilverTrophy;
    }
    else
    {
        trophy.sprite_index = sBronzeTrophy;
    }
}

if (tSaves >= 4)
{
    trophy = instance_create(64, 128, oTrophy);
    if (tSaves >= 8)
    {
        trophy.sprite_index = sGoldTrophy;
        instance_create(64, 144, oXChange);
    }
    else if (tSaves >= 6)
    {
        trophy.sprite_index = sSilverTrophy;
    }
    else
    {
        trophy.sprite_index = sBronzeTrophy;
    }
}

if (global.scoresStart == 1)
{
    oPlayer1.x = 32+8;
    oPlayer1.y = 48+8;
}
else if (global.scoresStart == 2)
{
    oPlayer1.x = 64+8;
    oPlayer1.y = 80+8;
}
else if (global.scoresStart == 3)
{
    oPlayer1.x = 32+8;
    oPlayer1.y = 112+8;
}

if (global.newMoney) instance_create(272, 48, oNew);
if (global.newKills) instance_create(272, 64, oNew);
if (global.newSaves) instance_create(272, 80, oNew);
if (global.newTime) instance_create(272, 96, oNew);

/* */
/*  */
