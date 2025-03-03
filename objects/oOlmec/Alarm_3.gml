sprite_index = sOlmec;
for (i = 0; i < 12; i += 1)
{
    debris = instance_create(x+rand(0,64), y+32+rand(0,32), oOlmecDebris);
    debris.xVel = rand(1,4)-rand(1,4);
    debris.yVel = -rand(1,3);
}
playSound(global.sndThump);
alarm[4] = 50;
