if (not other.invincible)
{
    other.hp -= 3;
    other.xVel = rand(0,2)-rand(1,2);
    other.xVel = -1;
    other.yVel = -6;
    status = 2;

    instance_create(x, y, oLaserExplode);
    instance_destroy();

}
