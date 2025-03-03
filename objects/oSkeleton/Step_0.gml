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
    for (i = 0; i < 3; i += 1)
    {
        instance_create(other.x+8, other.y+8, oBone);
    }
    skull = instance_create(other.x+8, other.y+8, oSkull);
    skull.yVel = -rand(1,3);
    skull.xVel = rand(0,3)-rand(0,3);
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[5] += 1;
        global.skeletons += 1;
        global.kills += 1;
    }
    instance_destroy();
}

if (isCollisionBottom(1) and status != STUNNED)
    yVel = 0;

if (status == IDLE)
{
    if (counter > 0) counter -= 1;    
    if (counter == 0)
    {
        // facing = rand(0,1);
        status = WALK;
    }
}
else if (status == WALK)
{
    colLeft = false;
    colRight = false;
    if (isCollisionLeft(1)) colLeft = true;
    if (isCollisionRight(1)) colRight = true;
    
    if (isCollisionLeft(4) and isCollisionRight(4))
    {
        // do nothing
    }
    else if (colLeft or colRight)
    {
        if (facing == LEFT) facing = RIGHT;
        else facing = LEFT;
    }
    /*
    if (facing == LEFT and not collision_point(x-1, y, oSolid, -1, -1) and
        not collision_point(x-1, y+16, oSolid, -1, -1))
    {
        facing = RIGHT;
    }
    else if (facing == RIGHT and not collision_point(x+16, y, oSolid, -1, -1) and
             not collision_point(x+16, y+16, oSolid, -1, -1))
    {
        facing = LEFT;
    }
    */
    
    if (facing == LEFT) xVel = -1;
    else xVel = 1;
    
    /*
    if (rand(1,100) == 1)
    {
        status = IDLE;
        counter = rand(20,50);
        xVel = 0;
    }
    */
}

if (isCollisionSolid())
    y -= 2;

if (status != STUNNED)
{
    if (status == WALK) sprite_index = sSkeletonWalkLeft;
    else sprite_index = sSkeletonLeft;
}
}
/* */
/*  */
