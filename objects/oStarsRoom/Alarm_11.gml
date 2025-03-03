if (not oPlayer1.dead and rand(1, 100) < kills)
{
    n = rand(0,3);
    instance_create(32 + n*80, 0, oSpider);
}

if (not oPlayer1.dead) alarm[11] = 20;
