if (not safe)
{
    if (other.type == "Yeti King" or other.type == "Tomb Lord")
    {
        other.xVel = xVel*0.5;
        other.yVel = -2;
    }
    else
    {
        other.xVel = xVel;
        other.yVel = -4;
    }
    
    with other
    {
        hp -= 4;
        if ((type == "Caveman" or
             type == "Yeti" or
             type == "Hawkman" or
             type == "Shopkeeper") and
            status != 99)
        {
            status = 98;
            counter = 20;
        }
        
        if (bloodLeft > 0)
        {
            scrCreateBlood(x+sprite_width/2, y+sprite_height/2, 1);
            if (hp < 0) bloodLeft -= 1;
        }
    }

    playSound(global.sndHit);
    instance_destroy();
}
