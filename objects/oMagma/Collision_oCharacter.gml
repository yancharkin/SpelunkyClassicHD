if (other.invincible == 0)
{
    other.blink = 30;
    other.invincible = 30;
    other.stunned = true;
    other.stunTimer = 20;
    other.burning = 100;
    other.yVel = -4;
    if (other.x < x)
        other.xVel = -6;
    else
        other.xVel = 6;
    instance_create(other.x, other.y, oBlood);
    
    if (global.plife > 0) global.plife -= 2;
    playSound(global.sndHurt);
    playSound(global.sndFlame);
}
