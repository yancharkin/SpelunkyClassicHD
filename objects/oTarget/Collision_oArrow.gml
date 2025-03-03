other.xVel = 0;
other.yVel = 0;
if (not dying)
{
    dying = true;
    n = 0;
    if (other.y >= y-2 and other.y <= y+2)
    {
        n = 5;
        playSound(global.sndCoin);
    }
    else if (other.y >= y-6 and other.y <= y-3) n = 3;
    else if (other.y >= y+3 and other.y <= y+6) n = 3;
    else if (other.y >= y-10 and other.y <= y-7) n = 2;
    else if (other.y >= y+7 and other.y <= y+10) n = 2;
    else n = 1;
    //if (hard) n *= 2;
    oMoonRoom.baskets += n;
    playSound(global.sndHit);
}

if (life <= 2) with other { instance_destroy(); }
