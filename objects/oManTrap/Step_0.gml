action_inherited();
if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+4 and
        y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+4))
{
moveTo(xVel,yVel);

if (not held) yVel += myGrav;
if (yVel > yVelLimit) yVel = yVelLimit;

colLeft = false;
colRight = false;
colBot = false;
colTop = false;
if (isCollisionLeft(1)) colLeft = true;
if (isCollisionRight(1)) colRight = true;
if (isCollisionBottom(1)) colBot = true;
if (isCollisionTop(1)) colTop = true;

if (hp < 1)
{
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[10] += 1;
        global.mantraps += 1;
        global.kills += 1;
    }
    repeat(3) { instance_create(x+rand(0,16), y-8+rand(0,16), oLeaf); }
    scrCreateBlood(x+8, y+8, 1);
    if (ateShopkeeper)
    {
        obj = instance_create(x, y, oShopkeeper);
        obj.status = 2;
        obj.hasGun = false;
        repeat(3) { instance_create(x+rand(0,16), y-8+rand(0,16), oLeaf); }
        scrCreateBlood(x+8, y+8, 1);
        playSound(global.sndSmallExplode);
    }
    instance_destroy();
}

if (isCollisionBottom(1) and status != STUNNED) yVel = 0;

if (status == IDLE)
{
    if (counter > 0) counter -= 1;
    if (counter == 0)
    {
        facing = rand(0,1);
        status = WALK;
    }
}
else if (status == WALK)
{
    if (isCollisionLeft(1) or isCollisionRight(1))
    {
        if (facing == LEFT) facing = RIGHT;
        else facing = LEFT;
    }
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
    if ((not collision_point(x-1, y+16, oSolid, -1, -1) or collision_point(x-1, y, oSolid, -1, -1)) and
        (not collision_point(x+16, y+16, oSolid, -1, -1) or collision_point(x+16, y, oSolid, -1, -1)))
    {
        if (collision_point(x-1, y, oSolid, -1, -1)) facing = RIGHT
        else facing = LEFT;
        xVel = 0;
    }
    else if (facing == LEFT) xVel = -1;
    else xVel = 1;
    
    if (rand(1,100) == 1)
    {
        status = IDLE;
        counter = rand(20,50);
        xVel = 0;
    }
}
else if (status == STUNNED)
{
    // xVel = 0;
    /*
    if (counter > 0) counter -= 1;
    else
    {
        status = IDLE;
        counter = rand(20,50);
    }
    */
    sprite_index = sManTrapStunL;

    if (colBot and not bounced)
    {
        bounced = true;
        scrCreateBlood(x+8, y+8, 1);
    }
    
    if (held or colBot)
    {      
        if (counter > 0) counter -= 1;
        else
        {
            if (ateShopkeeper)
            {
                obj = instance_create(x, y, oShopkeeper);
                obj.status = 2;
                obj.hasGun = false;
                repeat(3) { instance_create(x+rand(0,16), y-8+rand(0,16), oLeaf); }
                scrCreateBlood(x+8, y+8, 1);
                playSound(global.sndSmallExplode);
                instance_destroy();
            }
            else if (hp > 0)
            {
                status = IDLE;
                counter = rand(20,50);
                if (held)
                {
                    held = false;
                    // trap can get stuck in wall at this point:
                    if (collision_point(x+16, y+8, oSolid, 0, 0)) x = oPlayer1.x - 12;
                    else if (collision_point(x, y+8, oSolid, 0, 0)) x = oPlayer1.x - 4;
                    y = oPlayer1.y - 8;
                    with oPlayer1 { holdItem = 0; pickupItemType = ""; }
                }
            }
        }
    }
}

if (status >= STUNNED)
{
    scrCheckCollisions();
}

// friction
if (colBot)
{
    if (abs(xVel) < 0.1) xVel = 0;
    else if (abs(xVel) != 0) xVel *= 0.3;
}

if (isCollisionSolid()) y -= 2;

if (status == EATING and image_index == 8)
{
    scrCreateBlood(x+8, y, 1);
}

if (status == SLEEPY and image_index == 6 and rand(1,8) == 1)
{
    if (facing == LEFT)
    {
        bone = instance_create(x+2, y+4, oBone);
        with bone { xVel = -2; }
    }
    else
    {
        bone = instance_create(x+14, y+4, oBone);
        with bone { xVel = 2; }
    }
}

if (status < SLEEPY)
{
    sprite_index = sManTrapLeft;
}
}

/* */
/*  */
