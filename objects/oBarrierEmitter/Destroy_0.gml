repeat(6)
{
    obj = instance_create(x+2+rand(0,14), y+2+rand(0,14), oFlareSpark);
    obj.yVel = rand(1,3);
}
scrShake(10);
playSound(global.sndSmallExplode);
with oBarrier
{
    instance_destroy();
}
