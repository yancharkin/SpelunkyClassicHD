action_inherited();
if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+4 and
        y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+4))
{
moveTo(xVel,yVel);

yVel += myGrav;
if (yVel > yVelLimit) yVel = yVelLimit;

if (collision_point(x+8, y+8, oSolid, 0, 0)) hp = -999;

if (hp < 1)
{
    scrCreateBlood(x+8, y+8, 1);
    repeat(3)
    {
        instance_create(other.x+8, other.y+8, oBone);
    }
    skull = instance_create(other.x+8, other.y+8, oSkull);
    skull.yVel = -rand(1,3);
    skull.xVel = rand(0,3)-rand(0,3);
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[6] += 1;
        global.zombies += 1;
        global.kills += 1;
    }
    instance_destroy();
}

if (isCollisionRight(1))
{
    xVel = -1;
}

if (isCollisionLeft(1))
{
    xVel = 1;
}

colBot = false;
if (isCollisionBottom(1)) colBot = true;

dist = distance_to_object(oPlayer1)

if (status == IDLE)
{
    xVel = 0;
    if (counter > 0) counter -= 1;
    else if (dist < 64) status = BOUNCE;
    if (dist < 48) status = BOUNCE;
    if (oPlayer1.swimming) status = IDLE;
    if (status == BOUNCE) playSound(global.sndZombie);
}
else if (status == RECOVER)
{
    if (colBot)
    {
        status = IDLE;
        xVel = 0;
        yVel = 0;
        counter = rand(40,100);
    }
}
else if (status == BOUNCE)
{
    if (colBot)
    {
        if (rand(1,4) == 1)
        {
            yVel = -1 * rand(2,4);
            if (oCharacter.x < x)
            {
                facing = LEFT;
                xVel = -3;
            }
            else
            {
                facing = RIGHT;
                xVel = 3;
            }
        }
        else
        {
            yVel = -1 * rand(1,2);
            if (oCharacter.x < x)
            {
                facing = LEFT;
                xVel = -1;
            }
            else
            {
                facing = RIGHT;
                xVel = 1;
            }
        }
    }
    else
    {
        status = RECOVER;
    }
}
else if (status != DROWNED)
{
    status = IDLE;
    xVel = 0;
}

if (isCollisionTop(1))
    yVel = 1;

//if (isCollisionSolid())
//  y -= 2;

if (not colBot) sprite_index = sZombieJumpL;
else sprite_index = sZombieLeft;
}
