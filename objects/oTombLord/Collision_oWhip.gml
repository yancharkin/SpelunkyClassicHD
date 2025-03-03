if (whipped == 0 and other.y < y+12)
{
    hp -= other.damage;
    countsAsKill = true;
    instance_create(x+16, y+24, oBlood);
    playSound(global.sndHit);
    whipped = 10;
}

