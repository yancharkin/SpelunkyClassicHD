if (status == GET_FILE_NAME)
{
    if (keyboard_key == global.keyEnter)
    {
        if (levelName != "")
        {
            status = EDIT;
            file = file_text_open_read(working_directory + "levels/" + string_lower(levelName)+".lvl");
            if (file)
            {
                for (j = 0; j < 32; j += 1)
                {
                    str = file_text_read_string(file);
                    for (i = 0; i < 40; i += 1)
                    {
                        levelArray[i, j] = string_char_at(str, i+1);
                        //scrCreateTile(levelArray[i, j], 16+i*16, 16+j*16);
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
                        scrCreateTile(levelArray[i, j], 16+i*16, 16+j*16);
                        if (levelArray[i, j] == "X")
                        {
                            obj = instance_position(16+i*16, 16+j*16, oExit);
                            if (obj)
                            {
                                if (exitNamesNum > 0)
                                {
                                    obj.leadsTo = exitNames[exitNamesID];
                                    exitNamesID += 1;
                                }
                            }
                        }
                        else if (levelArray[i, j] == "@")
                        {
                            obj = instance_position(16+i*16, 16+j*16, oEntrance);
                            if (obj)
                            {
                                if (exitNamesNum > 0)
                                {
                                    obj.leadsTo = exitNames[exitNamesID];
                                    exitNamesID += 1;
                                }
                            }
                        }
                        else if (levelArray[i, j] == "I")
                        {
                            obj = instance_position(16+i*16, 16+j*16, oMsgSign);
                            if (obj)
                            {
                                if (signNamesNum > 0)
                                {
                                    obj.message = signNames[signNamesID];
                                    signNamesID += 1;
                                }
                            }
                        }
                    }
                }
            }
            window_set_cursor(cr_default);
            oCursObj.visible = true;
            instance_create(x+16, y, oEditButton);
            instance_create(x+320-32, y, oNewButton);
            instance_create(x+320-48, y, oTestButton);
        }
    }
    else if (keyboard_key == vk_backspace or keyboard_key == vk_delete)
    {
        //levelName += "DEL";
        levelName = string_delete(levelName, string_length(levelName), 1);
    }
    else levelName += scrGetChar(keyboard_key);
}
else if (status == EDIT)
{
    if (keyboard_key == ord("E"))
    {
    
        if (mouse_x > 16 and
            mouse_x < room_width-16 and
            mouse_y > 16 and
            mouse_y < room_height-16 and
            oCursObj.x >= 16 and
            oCursObj.x < room_width-16 and
            oCursObj.y >= 16 and
            oCursObj.y < room_height-16)
        {
            obj = instance_position(oCursObj.x+8, oCursObj.y+12, oDrawnSprite);
            if (obj)
            {
                if (obj.type == "Exit")
                {
                    textEdit = obj.leadsTo;
                    oLevelEditor.status = EDIT_DOOR;
                    with oNewButton { instance_destroy(); }
                    with oTestButton { instance_destroy(); }
                    with oEditButton { instance_destroy(); }
                    //levelArray[floor(oCursObj.x/16)-1, floor(oCursObj.y/16)-1] = "0";
                }
                else if (obj.type == "Message Sign")
                {
                    textEdit = obj.message;
                    oLevelEditor.status = EDIT_MSG;
                    with oNewButton { instance_destroy(); }
                    with oTestButton { instance_destroy(); }
                    with oEditButton { instance_destroy(); }
                    //levelArray[floor(oCursObj.x/16)-1, floor(oCursObj.y/16)-1] = "0";
                }
            }
        }
    }
}
else if (status == EDIT_DOOR)
{
    if (keyboard_key == global.keyEnter)
    {
        obj.leadsTo = textEdit;
        status = EDIT;
        window_set_cursor(cr_default);
        oCursObj.visible = true;
        instance_create(x+16, y, oEditButton);
        instance_create(x+320-48, y, oNewButton);
        instance_create(x+320-48, y, oTestButton);
    }
    else if (keyboard_key == vk_backspace or keyboard_key == vk_delete)
    {
        textEdit = string_delete(textEdit, string_length(textEdit), 1);
    }
    else if (string_length(textEdit) < 38) textEdit += scrGetChar(keyboard_key);
}
else if (status == EDIT_MSG)
{
    if (keyboard_key == global.keyEnter)
    {
        obj.message = textEdit;
        status = EDIT;
        window_set_cursor(cr_default);
        oCursObj.visible = true;
        instance_create(x+16, y, oEditButton);
        instance_create(x+320-48, y, oNewButton);
        instance_create(x+320-48, y, oTestButton);
    }
    else if (keyboard_key == vk_backspace or keyboard_key == vk_delete)
    {
        textEdit = string_delete(textEdit , string_length(textEdit), 1);
    }
    else if (string_length(textEdit) < 38)textEdit += scrGetChar(keyboard_key);
}

else if (status == INFO_NAME)
{
    if (keyboard_key == global.keyEnter)
    {
        if (levelName != "")
        {
            status = INFO_AUTHOR;
            window_set_cursor(cr_default);
            oCursObj.visible = true;
        }
    }
    else if (keyboard_key == vk_backspace or keyboard_key == vk_delete)
    {
        levelName = string_delete(levelName, string_length(levelName), 1);
    }
    else levelName += scrGetChar(keyboard_key);
}
else if (status == INFO_AUTHOR)
{
    if (keyboard_key == global.keyEnter)
    {
        if (author != "")
        {
            status = INFO_MUSIC;
            window_set_cursor(cr_default);
            oCursObj.visible = true;
        }
    }
    else if (keyboard_key == vk_backspace or keyboard_key == vk_delete)
    {
        author = string_delete(author, string_length(author), 1);
    }
    else author += scrGetChar(keyboard_key);
}
else if (status == INFO_MUSIC)
{
    if (keyboard_key == global.keyEnter)
    {
        if (music != "")
        {
            status = INFO_LIFE;
            window_set_cursor(cr_default);
            oCursObj.visible = true;
        }
    }
    else if (keyboard_key == vk_backspace or keyboard_key == vk_delete)
    {
        music = string_delete(music, string_length(music), 1);
    }
    else music += scrGetChar(keyboard_key);
}
else if (status == INFO_LIFE)
{
    if (keyboard_key == global.keyEnter)
    {
        if (lifeStart != "")
        {
            status = INFO_BOMBS;
            window_set_cursor(cr_default);
            oCursObj.visible = true;
        }
    }
    else if (keyboard_key == vk_backspace or keyboard_key == vk_delete)
    {
        lifeStart = string_delete(lifeStart, string_length(lifeStart), 1);
    }
    else lifeStart += scrGetChar(keyboard_key);
}
else if (status == INFO_BOMBS)
{
    if (keyboard_key == global.keyEnter)
    {
        if (bombStart != "")
        {
            status = INFO_ROPE;
            window_set_cursor(cr_default);
            oCursObj.visible = true;
        }
    }
    else if (keyboard_key == vk_backspace or keyboard_key == vk_delete)
    {
        bombStart = string_delete(bombStart, string_length(bombStart), 1);
    }
    else bombStart += scrGetChar(keyboard_key);
}
else if (status == INFO_ROPE)
{
    if (keyboard_key == global.keyEnter)
    {
        if (ropeStart != "")
        {
            status = INFO_NEXT;
            window_set_cursor(cr_default);
            oCursObj.visible = true;
        }
    }
    else if (keyboard_key == vk_backspace or keyboard_key == vk_delete)
    {
        ropeStart = string_delete(ropeStart, string_length(ropeStart), 1);
    }
    else ropeStart += scrGetChar(keyboard_key);
}
else if (status == INFO_NEXT)
{
    if (keyboard_key == global.keyEnter)
    {
        if (nextLevel != "")
        {
            status = EDIT;
            window_set_cursor(cr_default);
            oCursObj.visible = true;
            instance_create(x+16, y, oEditButton);
            instance_create(x+320-48, y, oNewButton);
            instance_create(x+320-48, y, oTestButton);
        }
    }
    else if (keyboard_key == vk_backspace or keyboard_key == vk_delete)
    {
        nextLevel = string_delete(nextLevel , string_length(nextLevel), 1);
    }
    else nextLevel += scrGetChar(keyboard_key);
}

