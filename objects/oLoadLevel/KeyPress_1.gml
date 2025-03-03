if (status == GET_FILE_NAME)
{
    if (keyboard_key == vk_escape)
    {
        global.gameStart = false;
        global.titleStart = 2;
        room_goto(rTitle);
    }
    else if (keyboard_key == global.keyEnter)
    {
        global.firstCustomLevel = levelName;
        scrLoadLevel(0);
    }
    else if (keyboard_key == vk_backspace or keyboard_key == vk_delete)
    {
        //levelName += "DEL";
        levelName = string_delete(levelName, string_length(levelName), 1);
        with oMenuSel { sprite_index = sMenuSelOff; }
    }
    else
    {
        levelName += scrGetChar(keyboard_key);
        with oMenuSel { sprite_index = sMenuSelOff; }
    }
}

