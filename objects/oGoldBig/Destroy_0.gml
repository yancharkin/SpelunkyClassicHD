gold = instance_create(x+rand(0,2)-rand(0,2), y+rand(0,2)-rand(0,2), oGoldNugget);
gold.xVel = rand(0,3) - rand(0,3);
gold.yVel = rand(3,6);

for (i = 0; i < rand(2,3); i += 1)
{
    gold = instance_create(x+rand(0,2)-rand(0,2), y+rand(0,2)-rand(0,2), oGoldChunk);
    gold.xVel = rand(0,3) - rand(0,3);
    gold.yVel = rand(3,6);
}
