if (other.invincible == 0)
{
    other.blink = 30
    other.invincible = 30
    other.yVel = -2
    if (other.x < x)
        other.xVel = -6
    else
        other.xVel = 6
    
    if (global.plife > 0) global.plife -= 1;
    playSound(global.sndHurt);
}

