if (not other.invincible)
{
    other.hp -= 100;
    if (x < other.x) other.xVel = rand(4,6);
    else other.xVel = -rand(4,6);
    other.yVel = -6;
    other.burning = 50;
    other.status = 2;
}
