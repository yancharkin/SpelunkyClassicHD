with (oHighscores) {
// shake the screen
if (global.shake > 0)
{
    //view_xview[0] = view_xview[0] + rand(0,3) - rand(0,3);
    //view_yview[0] = view_yview[0] + rand(0,3) - rand(0,3);
    //if (view_yview[0] > 16) view_yview[0] = 16 - rand(0,8);
    //if (view_yview[0] < 0) view_yview[0] = 0 + rand(0,8);
    if (shakeToggle) __view_set( e__VW.YView, 0, 0 + rand(1,8) );
    else __view_set( e__VW.XView, 0, -global.room_offset );

    shakeToggle = not shakeToggle;
    global.shake -= 1;
}
else
{
    __view_set( e__VW.XView, 0, -global.room_offset );
    __view_set( e__VW.YView, 0, 0 );
}

}
