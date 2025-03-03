if (not other.invincible)
{
    if (other.bloodLeft > 0)
    {
        with other
        {
            scrCreateBlood(x+sprite_width/2, y+sprite_height/2, 1);
            if (hp < 0) bloodLeft -= 1;
        }
    }
    with other
    {
        if (held)
        {
            held = false;
            with oPlayer1 { holdItem = 0; }
        }
        hp -= 2;
        yVel = -6;
        status = 2;
        counter = 120;
    }
    other.xVel = xVel * 0.3;
    playSound(global.sndDamsel);
    instance_destroy();
}
