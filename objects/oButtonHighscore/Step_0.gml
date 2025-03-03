if (collision_rectangle(x+2, y+11, x+13, y+15, oSolid, 0, 0))
{
    if (not pushed)
    {
        counter = 20;
        playSound(global.sndClick);
    }
    pushed = true;
}
else pushed = false;

if (pushed)
{
    if (counter > 0) counter -= 1;
    if (counter == 1)
    {
        scrResetHighscores();
        global.shake = 60;
        playSound(global.sndThump);
    }
    with oTrophy { instance_destroy(); }
    with oXSun { instance_destroy(); }
    with oXMoon { instance_destroy(); }
    with oXStars { instance_destroy(); }
    with oXChange { instance_destroy(); }
    sprite_index = sButtonPushed;
    
    oHighscores.tMoney = 0;
    oHighscores.tTime = 0;
    oHighscores.tKills = 0;
    oHighscores.tSaves = 0;
}
else sprite_index = sButton;
