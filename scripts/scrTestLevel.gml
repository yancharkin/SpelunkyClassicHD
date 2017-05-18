//
// scrTestLevel()
//
// Start testing a custom level you're editing.
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

    // file_delete(levelName);
    exitNames[0] = "";
    exitNamesID = 0;
    signNames[0] = "";
    signNamesID = 0;
    file = file_text_open_write("levels/test.tmp");
    for (j = 0; j < 32; j += 1)
    {
        for (i = 0; i < 40; i += 1)
        {
            file_text_write_string(file, levelArray[i, j]);
            if (levelArray[i, j] == "X" or levelArray[i, j] == "@")
            {
                obj = instance_position(16+i*16, 16+j*16, oExit);
                if (not obj) obj = instance_position(16+i*16, 16+j*16, oEntrance);
                if (obj)
                {
                    exitNames[exitNamesID] = obj.leadsTo;
                    exitNamesID += 1;
                }
            }
            else if (levelArray[i, j] == "I")
            {
                obj = instance_position(16+i*16, 16+j*16, oMsgSign);
                if (obj)
                {
                    signNames[signNamesID] = obj.message;
                    signNamesID += 1;
                }
            }
        }
        file_text_writeln(file);
    }
    file_text_write_string(file, author);
    file_text_writeln(file);
    file_text_write_string(file, music);
    file_text_writeln(file);
    file_text_write_string(file, lifeStart);
    file_text_writeln(file);
    file_text_write_string(file, bombStart);
    file_text_writeln(file);
    file_text_write_string(file, ropeStart);
    file_text_writeln(file);
    file_text_write_string(file, nextLevel);
    file_text_writeln(file);
    file_text_write_string(file, string(exitNamesID));
    if (exitNamesID > 0) file_text_writeln(file);
    for (i = 0; i < exitNamesID; i += 1)
    {
        file_text_write_string(file, exitNames[i]);
        if (i < exitNamesID) file_text_writeln(file);
    }
    file_text_write_string(file, string(signNamesID));
    if (signNamesID > 0) file_text_writeln(file);
    for (i = 0; i < signNamesID; i += 1)
    {
        file_text_write_string(file, signNames[i]);
        if (i < signNamesID-1) file_text_writeln(file);
    }
    file_text_close(file);


    global.tofu = true;
    global.currLevel = 1;
    global.gameStart = true;
    global.customLevel = true;
    global.firstCustomLevel = "";
    global.nextCustomLevel = levelName;
    global.testLevel = levelName;
    global.plife = real(lifeStart);
    global.bombs = real(bombStart);
    global.rope = real(ropeStart);
