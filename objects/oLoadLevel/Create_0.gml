global.cleanSolids = false;
global.message = "";
global.message2 = "";
window_set_cursor(cr_default);
global.keepScore = false;
global.currLevel = 1;
levelLoaded = false;

msg = tr("PRESS ESCAPE TO RETURN TO TITLE.")
msgTimer = 0;

GET_FILE_NAME = 0;
status = 0;
blackOut = false;
if (global.customLevel)
{
    status = 1;
    blackOut = true;
}
else
{
    lifeStart = "4";
    bombStart = "4";
    ropeStart = "4";
    instance_create(256, 64, oLoadButton);
    global.prevCustomLevel = "";
}

levelName = global.firstCustomLevel;
author = "ANONYMOUS";
music = "CAVE";
nextLevel = "";

for (j = 0; j < 32; j += 1)
{
    for (i = 0; i < 40; i += 1)
    {
        levelArray[i, j] = "0";
    }
}

// load level list
if (not global.customLevel)
{
    tempFile = file_find_first(working_directory + "levels/*.lvl", 0);
    while (tempFile != "")
    {
        if (string_char_at(tempFile, 0) != "!")
        {
            break;
        }
        tempFile = file_find_next();
    }
    levelList[0] = "";
    levelList[0] = tempFile;
    levelList[0] = string_delete(levelList[0], string_length(levelList[0])-3, 4);
    numLevels = 1;
    while (levelList[numLevels-1] != "")
    {
        tempFile = file_find_next();
        if (tempFile != "")
        {
            if (string_char_at(tempFile, 0) != "!")
            {
                levelList[numLevels] = tempFile;
                levelList[numLevels] = string_delete(levelList[numLevels], string_length(levelList[numLevels])-3, 4);
                numLevels += 1;
            }
        }
        else
        {
            break;
        }
    }
    if (levelList[0] == "") numLevels = 0;

    page = 1;
    numPages = ceil(numLevels / 10);

    instance_deactivate_object(oPageUp);
    if (numPages <= 1) instance_deactivate_object(oPageDown);
}

if (global.customLevel and not levelLoaded)
{
    scrLoadLevel(-1);
}
else oScreen.enabled = false;

/* */
/*  */
