if (mouse_check_button(mb_left) and focus)
{
    x = mouse_x-4;
    if (x > 144) x = 144;
    if (x < 8) x = 8;
    y = 160;
    global.musicVol = floor(x / 8);
    SS_SetSoundVol(global.musCave, 2000 + 8000 * (global.musicVol/18));
}
else
{
    focus = false;
    move_snap(8, 8);
    y = 160;
    global.musicVol = x / 8;
    stopAllMusic();
}
