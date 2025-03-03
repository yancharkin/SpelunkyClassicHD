sprite_index = sGTHHole;
repeat(6)
{
    obj = instance_create(x, y, oSpider);
    obj.xVel = rand(0,3)-rand(0,3);
    obj.yVel = -rand(1,3);
}
playSound(global.sndThump);
