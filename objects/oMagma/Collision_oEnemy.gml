if (other.type != "Magma Man")
{
    other.yVel = -4;
    if (x < other.x)
        other.xVel = -3;
    else
        other.xVel = 3;
    if (other.status != 98) playSound(global.sndFlame);
    with other
    {
        burning = 100;
        hp -= 2;
        status = 98;
        counter = 50;
    }
}
