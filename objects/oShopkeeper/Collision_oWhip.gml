if (not whipped)
{
    if (other.type == "Machete")
    {
        hp -= other.damage;
        if (bloodLeft > 0)
        {
            scrCreateBlood(x+sprite_width/2, y+sprite_height/2, 1);
            if (hp < 0) bloodLeft -= 1;
        }
    }
    yVel = -2;
    if (other.x < x) xVel = 1;
    else xVel = -1;
    playSound(global.sndHit);
    whipped = true;
    alarm[0] = 10;
    status = ATTACK;
}
