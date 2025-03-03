sprite_index = sOlmecStart3;
alarm[3] = 50;
for (i = 0; i < 6; i += 1)
{
    debris = instance_create(x+rand(0,32), y+rand(0,32), oOlmecDebris);
    debris.xVel = -rand(1,4);
    debris.yVel = -rand(1,3);
}
playSound(global.sndThump);
