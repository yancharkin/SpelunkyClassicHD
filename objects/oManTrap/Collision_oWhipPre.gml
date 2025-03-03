if (status != STUNNED)
{
    if (other.type == "Machete")
    {
        hp -= other.damage*2;
    }
    else
    {
        hp -= other.damage;
    }
    countsAsKill = true;
    status = STUNNED;
    counter = stunTime;
    yVel = -3;
    if (other.x < (x+8)) xVel = 2;
    else xVel = -2;
    image_speed = 0.5;
    instance_create(x+rand(0,16), y-8+rand(0,16), oLeaf);
    playSound(global.sndHit);
}
