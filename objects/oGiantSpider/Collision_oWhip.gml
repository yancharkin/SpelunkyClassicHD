if (whipped == 0)
{
    hp -= 1;
    instance_create(x+16, y+24, oBlood);
    playSound(global.sndHit);
    whipped = 10;
}

