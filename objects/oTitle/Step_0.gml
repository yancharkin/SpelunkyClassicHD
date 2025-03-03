if( (keyboard_check_pressed(global.keyEnter)) || (keyboard_check_pressed(global.keyEscape)) || checkAttackPressed() || checkStartPressed())
{
    if (instance_exists(oScreen))
    {
        if (not oScreen.canPause)
        {
            if (gamepad.attackPressed) gamepad.attackPressed = false;
            if (gamepad.startPressed) gamepad.startPressed = false;
            global.titleStart = 2;
            //room_restart();
        }
    }
    else
    {
        if (gamepad.attackPressed) gamepad.attackPressed = false;
        if (gamepad.startPressed) gamepad.startPressed = false;
        global.titleStart = 2;
        //room_restart();
    }
}

if (instance_exists(oPlayer1))
{
//    if (oPlayer1.x <= 320 and view_xview[0] > 0)
    if (oPlayer1.x <= (320 - global.room_offset) and __view_get( e__VW.XView, 0 ) > 0)
    {
        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (8) );
    }
  
    if (oPlayer1.x > (320 - global.room_offset) and __view_get( e__VW.XView, 0 ) < (320 - global.room_offset))
    {
        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (8) );
    }
}

if (fadeOut)
{
    if (darkness < 1) darkness += 0.1;
    else
    {
        room_goto(rCredits1);
    }
}

if (gamepad.select) event_perform(ev_keypress, vk_f5);

