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
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[9] += 1;
        global.firefrogs += 1;
        global.kills += 1;
    }
    obj = instance_create(x+8, y+8, oFireFrogBomb);
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

dist = distance_to_object(oCharacter)

if (status == IDLE)
{
    xVel = 0;
    if (counter > 0) counter -= 1;
    else if (dist < 64) status = BOUNCE;
    //if (dist < 48) status = BOUNCE;
    if (status == BOUNCE) playSound(global.sndFrog);
}
else if (status == RECOVER)
{
    if (colBot)
    {
        status = IDLE;
        xVel = 0;
        yVel = 0;
        counter = rand(10,40);
    }
}
else if (status == BOUNCE)
{
    if (colBot)
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

if (not colBot) sprite_index = sFireFrogJumpL;
else sprite_index = sFireFrogLeft;
}
