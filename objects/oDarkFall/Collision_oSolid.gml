playSound(global.sndBreak);
instance_create(x+8, y+8, oSmokePuff)
for (i = 0; i < 3; i += 1)
{
    obj = instance_create(x+rand(2,14), y+rand(2,14), oRubbleDark);
    obj.xVel = rand(1,3)-rand(1,3);
    obj.yVel = -rand(0,3);
}

instance_destroy();
