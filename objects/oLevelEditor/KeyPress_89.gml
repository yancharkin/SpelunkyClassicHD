if (status == EXIT or status == NEW)
{
    file_delete(levelName);
    exitNames[0] = "";
    exitNamesID = 0;
    signNames[0] = "";
    signNamesID = 0;
    file = file_text_open_write(working_directory + "levels/" + string_lower(levelName)+".lvl");
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
}

if (status == EXIT)
{
    global.titleStart = 2;
    if (file_exists(working_directory + "levels/test.tmp")) file_delete(working_directory + "levels/test.tmp");
    room_goto(rTitle);
}
else if (status == NEW)
{
    global.testLevel = "";
    room_restart();
}

