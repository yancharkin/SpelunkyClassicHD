sprite_index = sOlmecStart2;
for (i = 0; i < 6; i += 1)
{
    debris = instance_create(x+32+rand(0,32), y+rand(0,32), oOlmecDebris);
    debris.xVel = rand(1,4);
    debris.yVel = -rand(1,3);
}
playSound(global.sndThump);
with oHawkmanWorship
{
    obj = instance_create(x, y, oHawkman);
    with obj
    {
        status = 98;
        hp = 1;
        xVel = -3;
        yVel = -5;
        counter = 300;
    }
    instance_destroy();
}
with oCavemanWorship
{
    image_index = 0;
    image_speed = 0;
}
alarm[2] = 50;
