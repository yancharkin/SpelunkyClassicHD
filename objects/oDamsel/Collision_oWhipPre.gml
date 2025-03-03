if (other.type == "Machete" and hit == 0)
{
     hp -= other.damage;
     hit = 10;
     playSound(global.sndHit);
     playSound(global.sndDamsel);
     if (bloodLeft > 0)
     {
        scrCreateBlood(x+sprite_width/2, y+sprite_height/2, 1);
        if (hp < 0) bloodLeft -= 1;
     }
}
else if (status != THROWN and (status < EXIT or status == SLAVE or status == KISS) and hit == 0)
{
    yVel = -2;
    hit = 10;
    playSound(global.sndHit);
    playSound(global.sndDamsel);
    if (forSale)
    {
        scrShopkeeperAnger(3);
    }
}
