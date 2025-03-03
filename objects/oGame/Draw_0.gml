if (instance_exists(oPlayer1))
{
    if (oPlayer1.dead or isRoom("rMoon"))
    {
        if (isLevel())
        {
            if (drawStatus > 0)
            {
                drawTextHCentered(tr("GAME OVER"), "large", c_yellow, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+32+16);
            }
            if (drawStatus > 1)
            {
                drawTextHCentered(tr("FINAL SCORE:"), "small", c_yellow, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+64+16);
            }
            if (drawStatus > 2)
            {
                drawTextHCentered("$" + string(moneyCount), "large", c_white, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+72+16);
                if (global.customLevel)
                {
                    if (global.testLevel != "")
                    {
                        if (global.gamepadOn) str = tr("PRESS ") + scrGetJoy(global.joyAttackVal) + tr(" TO EDIT LEVEL.");
                        else str = tr("PRESS ") + scrGetKey(global.keyAttackVal) + tr(" TO EDIT LEVEL.");
                    }
                    else
                    {
                        if (global.gamepadOn) str = tr("PRESS ") + scrGetJoy(global.joyAttackVal) + tr(" TO LOAD ANOTHER LEVEL.");
                        else str = tr("PRESS ") + scrGetKey(global.keyAttackVal) + tr(" TO LOAD ANOTHER LEVEL.");
                    }
                    drawTextHCentered(str, "small", c_yellow, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+120);
                }
                else
                {
                    if (global.gamepadOn) str = tr("PRESS ") + scrGetJoy(global.joyAttackVal) + tr(" FOR HIGH SCORES.");
                    else str = tr("PRESS ") + scrGetKey(global.keyAttackVal) + tr(" FOR HIGH SCORES.");
                    drawTextHCentered(str, "small", c_yellow, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+120);
                }
            }
        }
        else if (isRoom("rSun"))
        {
            if (drawStatus > 0)
            {
                drawTextHCentered(tr("FINISHED!"), "large", c_yellow, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+32+16);
            }
            if (drawStatus > 1)
            {
                if (oSunRoom.highscore) str = tr("YOU SET A NEW RECORD!");
                else str = tr("BETTER LUCK NEXT TIME...");
                drawTextHCentered(str, "small", c_yellow, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+64+16);
            }
        }
        else if (isRoom("rMoon"))
        {
            if (oMoonRoom.timer < 0)
            {
                if (drawStatus > 0)
                {
                    drawTextHCentered(tr("FINISHED!"), "large", c_yellow, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+32+16);
                }
                if (drawStatus > 1)
                {
                    if (oMoonRoom.highscore) str = tr("YOU SET A NEW RECORD!");
                    else str = tr("BETTER LUCK NEXT TIME...");
                    drawTextHCentered(str, "small", c_yellow, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+64+16);
                }
            }
        }
        else if (isRoom("rStars"))
        {
            if (drawStatus > 0)
            {
                drawTextHCentered(tr("FINISHED!"), "large", c_yellow, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+32+16);
            }
            if (drawStatus > 1)
{
                if (oStarsRoom.highscore) str = tr("YOU SET A NEW RECORD!");
                else str = tr("BETTER LUCK NEXT TIME...");
                drawTextHCentered(str, "small", c_yellow, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 )+64+16);
            }
        }
    }
}

action_color(16777215);
// DEBUGGING TEXT

// Display level path
if (false and room == rLevel)
{
    for (j = 0; j < 4; j += 1)
    {
        for (i = 0; i < 4; i += 1)
        {
            draw_text(oPlayer1.x+48+i*16, oPlayer1.y-64+16+j*16, string_hash_to_newline(string(global.roomPath[i,j])));
        }
    }
}

if (false and instance_exists(oPlayer1))
{
    file = file_text_open_read(working_directory + "stats.txt");

    if (file)
    {
    file_text_readln(file);
    file_text_readln(file);
    file_text_readln(file);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.totalCrates = real(str);
    file_text_readln(file);
    str = file_text_read_string(file);
    // str = string_delete(str, 1, 20);
    // global.totalChests = real(str);
        
    draw_text(oPlayer1.x+16, oPlayer1.y-16, string_hash_to_newline(str));
        
    file_text_close(file);
    }
}

if (false and instance_exists(oPlayer1))
{
    draw_set_font(global.fontSmall);
    draw_set_color(c_white);
    draw_text(oPlayer1.x+16, oPlayer1.y-16, string_hash_to_newline(string(oPlayer1.stunTimer)));
    // if (instance_exists(oLockedChest)) { with oPlayer1 { draw_text(x+16, y-32, distance_to_object(oLockedChest)); } }
    // else { draw_text(oPlayer1.x+16, oPlayer1.y-16, "0"); }
    //if (global.madeMoai == true) draw_text(oPlayer1.x+16, oPlayer1.y-16, "TRUE");
    //else draw_text(oPlayer1.x+16, oPlayer1.y-16, "FALSE");
    //draw_text(oPlayer1.x+16, oPlayer1.y-16, string_upper(global.pickupItem));
}

action_color(-100);
// draw_text(oPlayer1.x-24, oPlayer1.y-48, string(radtodeg(arctan(1))));

// DEBUG

if (false and room == rLevel and instance_exists(oXMarket))
{
draw_text(oPlayer1.x-24, oPlayer1.y-48, string_hash_to_newline(string(oPlayer1.x-oXMarket.x)));
draw_text(oPlayer1.x, oPlayer1.y-48, string_hash_to_newline(string(oPlayer1.y-oXMarket.y)));
}

/// Draw HUD (HTML5)
if (global.html5Build) {
    scrDrawHUD();
    drawTouchControls();
    showMessages();
    /*
    if (global.messageTimer > 0) {
        y1 = view_yview[0] + 216 + 8 - global.fontSmallHeight;
        y2 = y1 + global.fontSmallHeight;
        drawMessage(global.message, 'small', c_white, view_xview[0], y1, 1);
        if (not isRoom("rTutorial")) {
            drawMessage(global.message2, 'small', c_yellow, view_xview[0], y2, 2);
        } else {
            drawMessage(global.message2, 'small', c_white, view_xview[0], y2, 2);
        }
        global.messageTimer -= 1;
    }
    */
}

/* */
/*  */
