if (other.type != "Tomb Lord")
{
    if (other.heavy)
    {
        other.xVel = xVel*0.5;
        other.yVel = -2;
    }
    else
    {
        other.xVel = xVel;
        other.yVel = -4;
    }
    other.xVel = xVel;
    other.yVel = -4;

    with other
    {
        hp -= 2;
        if (bloodLeft > 0)
        {
            scrCreateBlood(x+sprite_width/2, y+sprite_height/2, 1);
            if (hp < 0) bloodLeft -= 1;
        }
        status = 98;
        counter = 20;
    }

    playSound(global.sndHit);
    instance_destroy();
}
