if (other.sprite_index != sPExit and other.sprite_index != sDamselExit and other.sprite_index != sTunnelExit)
{
    if (global.plife > 0)
    {
        global.plife -= 2;
        if (global.plife <= 0 and isRealLevel()) global.enemyDeaths[20] += 1;
    }
    other.xVel = xVel;
    other.yVel = -4;

    with other
    {
        instance_create(x, y, oBlood);
        stunned = true;
        stunTimer = 20;
    }

    playSound(global.sndHurt);
    instance_destroy();
}

