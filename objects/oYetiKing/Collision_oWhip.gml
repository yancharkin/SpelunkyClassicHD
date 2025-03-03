if (whipped == 0 and other.y < y+12)
{
    if (other.puncture)
    {
        hp -= other.damage;
        countsAsKill = true;
        scrCreateBlood(x+sprite_width/2, y+sprite_height/2, 1);
        playSound(global.sndHit);
        whipped = 10;
    }
    else
    {
        playSound(global.sndHit);
        whipped = 10;
    }
}

