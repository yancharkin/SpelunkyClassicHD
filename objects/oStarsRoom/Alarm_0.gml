if (not oPlayer1.dead)
{
    n = rand(0,3);
    instance_create(32 + n*80, 0, oShopkeeper2);
    if (kills >= 40)
    {
        alarm[0] = 100;
    }
    else if (kills >= 30)
    {
        alarm[0] = 125;
    }
    else if (kills >= 20)
    {
        alarm[0] = 150;
    }
    else if (kills >= 10)
    {
        alarm[0] = 175;
    }
    else alarm[0] = 200;
}
