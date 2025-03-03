if (other.type != "UFO" and other.invincible == 0)
{
    other.hp -= 3;
    other.xVel = rand(0,2)-rand(1,2);
    other.xVel = -1;
    other.yVel = -6;
    instance_create(x, y, oLaserExplode);
    // global.checkWater = true;
    instance_destroy();
}
