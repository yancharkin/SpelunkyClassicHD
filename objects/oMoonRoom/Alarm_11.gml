timer -= 1;
if (timer == 0)
{
    global.mini2 = oMoonRoom.baskets;
    if (global.mini2 > 99) global.mini2 = 99;
    scrUpdateHighscores(2);
    timer -= 1;
    oGame.drawStatus = 1;
    with oBatTarget
    {
        obj = instance_create(x+8, y, oPoof);
        obj.xVel = 0;
        obj.yVel = -1;
        obj = instance_create(x+8, y, oPoof);
        obj.xVel = 0;
        obj.yVel = 1;
        
        instance_destroy();
    }
    with oEntrance
    {
        instance_create(x, y, oXScores);
        instance_destroy();
    }
    alarm[10] = 30;
}
else
    alarm[11] = 30;
