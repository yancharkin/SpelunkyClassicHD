global.lake = false;
global.cemetary = false;
// DFK adding this to override tutorial
global.firstTime = false;

if (!global.firstLaunch) {
    if (global.titleStart == 0) {
        global.titleStart = 2;
    }
} else {
    global.firstLaunch = false;
    configSave();
}

global.keepScore = true;
darkness = 0;
needDark = true;
state = 0;
global.scoresStart = 0;
fadeOut = false;

global.customLevel = false;
global.testLevel = "";
global.prevCustomLevel = "";

__view_set( e__VW.XView, 0, 320 - global.room_offset );

global.newMoney = false;
global.newKills = false;
global.newSaves = false;
global.newTime = false;

ini_open("spelunky.ini")

tMoney = ini_read_real("highscore","value1",0);
tTime = ini_read_real("highscore","value2",0);
tKills = ini_read_real("highscore","value3",0);
tSaves = ini_read_real("highscore","value4",0);

ini_close()

// Tunnel Man
if (global.tunnel1 == 0 or (global.tunnel1 > 0 and global.tunnel2 == 0))
{
    instance_create(352, 96, oLadderOrange);
    instance_create(352, 96+16, oLadderTop);
    instance_create(352, 96+32, oLadderOrange);
    instance_create(352, 96+48, oLadderOrange);
    instance_create(352, 96+64, oLadderOrange);
    instance_create(352, 96+80, oLadderOrange);
    
    if (global.tunnel2 == 0)
    {
        instance_create(128, 112, oLevel9Sign);
        instance_create(144, 128, oXShortcut9);
            
        if (global.tunnel1 == 0)
        {
            instance_create(192, 112, oLevel13Sign);
            instance_create(208, 128, oXShortcut13);
        }
    } 
}
else
{   
    with (oBrickSmooth)
    {
    instance_destroy();
    }
    
    instance_create(304, 112, oBrick);
    instance_create(288, 112, oBrick);
    instance_create(272, 112, oBrick);
    instance_create(256, 128, oBrick);    
    instance_create(256, 32, oBrick);
    instance_create(256, 48, oBrick);
    instance_create(256, 64, oBrick);
    instance_create(256, 80, oBrick);
    instance_create(256, 96, oBrick);
    instance_create(256, 112, oBrick);
    instance_create(272, 48, oBrick);
    instance_create(272, 64, oBrick);
    instance_create(272, 80, oBrick);
    instance_create(272, 96, oBrick);
    instance_create(288, 96, oBrick);
    instance_create(304, 96, oBrick);
    instance_create(320, 96, oBrick);
    instance_create(336, 96, oBrick);
}

if (tMoney >= 200000 && tTime > 0 && tTime <= 600 && tKills >= 120 && tSaves >= 8)
{
    instance_create(32, 112, oMultiTrophy);
    instance_create(32, 128, oXChange2);
}
else
{
    instance_create(32+8, 128+8, oTunnelMan);
}

if (global.titleStart == 0)
{
    darkness = 1;
    alarm[0] = 50;
    with oScreen { canPause = false; }
    //instance_create(280, -32, oPDummy4);
    //instance_create(280, 32, oFlare);
}
else if (global.titleStart == 1) // start at highscore door
{
    player = instance_create(432+8, 184, oPlayer1);
    player.facing = 19;
    instance_create(320+280, 188, oFlare);
    with oScreen { canPause = true; }
    playMusic(global.musTitle, true);
    if (global.firstTime) instance_create(384, 144, oHintHand);
}
else if (global.titleStart == 2) // start at rope
{
    player = instance_create(320+280, 184, oPlayer1);
    player.facing = 18;
    instance_create(320+280, 188, oFlare);
    with oScreen { canPause = true; }
    playMusic(global.musTitle, true);
    if (global.firstTime) instance_create(384, 144, oHintHand);
}
else if (global.titleStart == 3) // start at tutorial door
{
    player = instance_create(336+8, 184, oPlayer1);
    player.facing = 19;
    instance_create(320+280, 188, oFlare);
    with oScreen { canPause = true; }
    playMusic(global.musTitle, true);
    if (global.firstTime) instance_create(384, 144, oHintHand);
}

if (global.firstTime)
{
    instance_create(320, 160, oBrick);
    instance_create(336, 160, oBrick);
    instance_create(336, 176, oBrick);
}

