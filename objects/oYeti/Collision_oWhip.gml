if (not whipped)
{
    if (other.puncture)
    {
        hp -= other.damage;
        countsAsKill = true;
        if (bloodLeft > 0)
        {
            scrCreateBlood(x+sprite_width/2, y+sprite_height/2, 1);
            if (hp < 0) bloodLeft -= 1;
        }
        status = STUNNED;
        counter = stunTime;
        yVel = -3;
        if (oPlayer1.x-8 < x) xVel = 2;
        else xVel = -2;
        image_speed = 0.5;
        playSound(global.sndHit);
        whipped = true;
        alarm[0] = 10;
    }
    else
    {
        yVel = -2;
        if (oPlayer1.x-8 < x) xVel = 1;
        else xVel = -1;
        playSound(global.sndHit);
        whipped = true;
        alarm[0] = 10;
    }
}
