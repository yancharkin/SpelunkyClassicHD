action_inherited();
if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+4 and
        y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+4))
{
moveTo(xVel,yVel);

yVel += myGrav;
if (yVel > yVelLimit) yVel = yVelLimit;

if (collision_point(x+8, y+8, oSolid, 0, 0))
{
    hp = 0;
}

if (hp < 1)
{
    scrCreateBlood(x+8, y+8, 3);
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[2] += 1;
        global.spiders += 1;
        global.kills += 1;
    }
    instance_destroy();
}

if (isCollisionRight(1))
{
    xVel = 1;
}

if (isCollisionLeft(1))
{
    xVel = -1;
}

dist = distance_to_object(oCharacter)

if (status == IDLE)
{
    alarm[0] = rand(5,20);
    status = RECOVER;
}
else if (status == RECOVER)
{
    if (isCollisionBottom(1)) xVel = 0;
}
else if (status == BOUNCE and dist < 90)
{
    if (isCollisionBottom(1))
    {
        yVel = -1 * rand(2,5);
        if (oCharacter.x < x+8)
        {
            xVel = -2.5;
        }
        else
        {
            xVel = 2.5;
        }
        
        if (rand(1,4) == 1) { status = IDLE; xVel = 0; yVel = 0; }
    }
}
else if (status != DROWNED)
{
    status = IDLE;
    //xVel = 0;
}

if (isCollisionTop(1))
    yVel = 1;
/*
if (isCollisionLeft(1) or isCollisionRight(1))
{
    xVel = -xVel;
}
*/

//if (isCollisionSolid())
//  y -= 2;
}
/* */
if (collision_point(x+8, y+8, oWater, 0, 0) and status != DROWNED)
{
    status = DROWNED;
    sprite_index = sSpiderDrowning;
    alarm[1] = 30;
    xVel = 0;
    yVel = 0.2;
    instance_create(x+8, y, oSplash);
    playSound(global.sndSplash);
}
/* */
/*  */
