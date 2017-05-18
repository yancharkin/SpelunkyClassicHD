//
// scrLoadLevel()
//
// Loads a custom level.  Must be called by oLoadLevel!
//

/**********************************************************************************
    Copyright (c) 2008, 2009 Derek Yu and Mossmouth, LLC
    
    This file is part of Spelunky.

    You can redistribute and/or modify Spelunky, including its source code, under
    the terms of the Spelunky User License.

    Spelunky is distributed in the hope that it will be entertaining and useful,
    but WITHOUT WARRANTY.  Please see the Spelunky User License for more details.

    The Spelunky User License should be available in "Game Information", which
    can be found in the Resource Explorer, or as an external file called COPYING.
    If not, please obtain a new copy of Spelunky from <http://spelunkyworld.com/>
    
***********************************************************************************/

if (global.customLevel) levelName = global.nextCustomLevel;

if (global.testLevel != "") file = file_text_open_read("levels/test.tmp");
else file = file_text_open_read("levels/" + string_lower(levelName)+".lvl");
if (file)
{
    window_set_cursor(cr_none);
    with oMenu { instance_destroy(); }
    instance_activate_object(oPageUp);
    with oPageUp { instance_destroy(); }
    instance_activate_object(oPageDown);
    with oPageDown { instance_destroy(); }
    global.customLevel = true;
    levelLoaded = true;
    status = 1;

    for (j = 0; j < 32; j += 1)
    {
        str = file_text_read_string(file);
        for (i = 0; i < 40; i += 1)
        {
            levelArray[i, j] = string_char_at(str, i+1);
//scrCreateTileObj(levelArray[i, j], 16+i*16, 16+j*16);
        }
        file_text_readln(file);
    }
    author = file_text_read_string(file);
    file_text_readln(file);
    music = file_text_read_string(file);
    file_text_readln(file);
    lifeStart = file_text_read_string(file);
    file_text_readln(file);
    bombStart = file_text_read_string(file);
    file_text_readln(file);
    ropeStart = file_text_read_string(file);
    file_text_readln(file);
    nextLevel = file_text_read_string(file);
    exitNamesNum = 0;
    if (not file_text_eof(file))
    {
        file_text_readln(file);
        exitNamesNum = real(file_text_read_string(file));
    }
    if (exitNamesNum > 0)
    {
        file_text_readln(file);
        for (i = 0; i < exitNamesNum; i += 1)
        {
            exitNames[i] = file_text_read_string(file);
if (i < exitNamesNum-1) file_text_readln(file);
        }
    }
    signNamesNum = 0;
    if (not file_text_eof(file))
    {
        file_text_readln(file);
        signNamesNum = real(file_text_read_string(file));
    }
    if (signNamesNum > 0)
    {
        file_text_readln(file);
        for (i = 0; i < signNamesNum; i += 1)
        {
            signNames[i] = file_text_read_string(file);
if (i < signNamesNum-1) file_text_readln(file);
        }
    }
    file_text_close(file);

    // build level
    exitNamesID = 0;
    signNamesID = 0;
    for (j = 0; j < 32; j += 1)
    {
        for (i = 0; i < 40; i += 1)
        {
            scrCreateTileObj(levelArray[i, j], 16+i*16, 16+j*16);
            obj = 0;
            if (levelArray[i, j] == "X")
{
                obj = instance_position(16+i*16, 16+j*16, oExit);
            }
            else if (levelArray[i, j] == "@")
{
                obj = instance_position(16+i*16, 16+j*16, oEntrance);
            }
            if (obj)
            {
                if (exitNamesNum > 0)
                {
                    obj.leadsTo = exitNames[exitNamesID];
                    if (exitNamesID < exitNamesNum-1) exitNamesID += 1;
                }
            }
            
            obj = 0;
            if (levelArray[i, j] == "I")
{
                obj = instance_position(16+i*16, 16+j*16, oMsgSign);
            }
            if (obj)
            {
                if (signNamesNum > 0)
                {
                    obj.message = signNames[signNamesID];
                    if (signNamesID < signNamesNum-1) signNamesID += 1;
                }
            }
        }
    }

    global.customLevelName = levelName;
    global.customLevelAuthor = author;
    global.nextCustomLevel = nextLevel;
    if (argument0 != -1)
    {
        global.plife = floor(real(lifeStart));
        if (global.plife < 1) global.plife = 1;
        if (global.plife > 99) global.plife = 99;
        global.bombs = floor(real(bombStart));
        if (global.bombs < 0) global.bombs = 0;
        if (global.bombs > 99) global.bombs = 99;
        global.rope = floor(real(ropeStart));
        if (global.rope < 0) global.rope = 0;
        if (global.rope > 99) global.rope = 99;
    }
    if (global.customLevel) blackOut = false;
}
else
{
    if (global.customLevel and not instance_exists(oLoadButton))
    {
        room_goto(rEndCustom);
    }
    msg = "NO SUCH LEVEL EXISTS!"
    msgTimer = 60;
}

if (levelLoaded)
{
    obj = instance_nearest(x, y, oEntrance);

    if (instance_exists(obj))
    {
        instance_create(obj.x+8, obj.y+8, oPlayer1);
    }
    else
    {
        instance_create(24, 24, oPlayer1);
    }
    
    with oEntrance
    {
        if (leadsTo == global.prevCustomLevel)
        {
            oPlayer1.x = x + 8;
            oPlayer1.y = y + 8;
            break;
        }
    }

    global.prevCustomLevel = levelName;
    instance_create(x+16, y, oLevel);
    instance_create(x+16, y, oGame);
    oScreen.enabled = true;

    if (gamepad.attackPressed) gamepad.attackPressed = false;
    if (gamepad.startPressed) gamepad.startPressed = false;

    with oLoadButton { instance_destroy(); }
}
