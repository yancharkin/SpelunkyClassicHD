action_inherited();
if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+4 and
        y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+4))
{
if (status == STUNNED) myGrav = 0.6;

moveTo(xVel,yVel);

colLeft = false;
colRight = false;
colBot = false;
colTop = false;
if (isCollisionLeft(1)) colLeft = true;
if (isCollisionRight(1)) colRight = true;
if (isCollisionBottom(1)) colBot = true;
if (isCollisionTop(1)) colTop = true;

if (not held and status != HANG and status != FLY) yVel += myGrav;
if (yVel > yVelLimit) yVel = yVelLimit;

if (status >= STUNNED)
{
    if (collision_point(x+8, y+12, oSolid, 0, 0))
    {
        instance_create(x+8, y+8, oSmokePuff);
        playSound(global.sndCavemanDie);
        instance_destroy();
    }
}
else if (not held)
{
    if (collision_point(x+8, y+8, oSolid, 0, 0))
    {
        instance_create(x+8, y+8, oSmokePuff);
        playSound(global.sndCavemanDie);
        instance_destroy();
    }
}

if (isCollisionBottom(1) and status != STUNNED)
    yVel = 0;

if (status != DEAD and status != STUNNED and hp < 1)
{
    status = DEAD;
}

if (burning > 0)
{
    if (rand(1,5) == 1) instance_create(x+rand(4,12), y+rand(4,12), oBurn);
    burning -= 1;
}

dist = distance_to_point(oPlayer1.x-8, oPlayer1.y-8);

if (status == IDLE)
{
    bounced = false;
    if (colBot and
        (collision_point(x-1, y, oSolid, -1, -1) or collision_point(x+16, y, oSolid, -1, -1)))
    {
        yVel = -6;
        if (facing == LEFT) xVel = -1;
        else xVel = 1;
        counter -= 10;
    }
    
    if (yVel < 0 and isCollisionTop(1))
    {
        yVel = 0;
    }

    if (isCollisionBottom(1) and counter > 0) counter -= 1;    
    if (counter < 1)
    {
        facing = rand(0,1);
        status = WALK;
    }
    
    if (dist < 96)
    {
        if (oPlayer1.x < x+8) facing = LEFT;
        else if (oPlayer1.x > x+8) facing = RIGHT;
        status = ATTACK;
    }
}
else if (status == WALK)
{
    if (isCollisionLeft(1) or isCollisionRight(1))
    {
        if (facing == LEFT) facing = RIGHT;
        else facing = LEFT;
    }
    
    if (not colBot)
    {
        // do nothing
    }
    else if (rand(1,100) == 1)
    {
        status = IDLE;
        counter = rand(20,50);
        xVel = 0;
    }
    else if (facing == LEFT)
    {
        xVel = -1.5;
        if (not collision_point(x-1, y+16, oSolid, -1, -1))
        {
            status = IDLE;
            counter = rand(20,50);
            xVel = 0;
            yVel = 0;
        }
    }
    else if (facing == RIGHT)
    {
        xVel = 1.5;
        if (not collision_point(x+16, y+16, oSolid, -1, -1))
        {
            status = IDLE;
            counter = rand(20,50);
            xVel = 0;
            yVel = 0;
        } 
    }
    
    if (dist < 96) status = ATTACK;
}
else if (status == ATTACK)
{
    image_speed = 1;
    if (facing == LEFT and isCollisionLeft(4))
    {
        if (isCollisionTop(1)) facing = RIGHT;
        else status = BOUNCE;
    }
    else if (facing == RIGHT and isCollisionRight(4))
    {
        if (isCollisionTop(1)) facing = LEFT;
        else status = BOUNCE;
    }
    else if (facing == LEFT)
    {
        if (not collision_point(x-8, y+16, oSolid, 0, 0))
        {
            status = BOUNCE;
        }
    }
    else if (facing == RIGHT)
    {
        if (not collision_point(x+8, y+16, oSolid, 0, 0))
        {
            status = BOUNCE;
        }
    }
    
    if (abs(oPlayer1.x-x) < 32 and oPlayer1.y < y+8 and not collision_point(x+8, y+8, oWater, 0, 0)) status = FLY;
    
    if (facing == LEFT) xVel = -4;
    else xVel = 4;
}
else if (status == RECOVER)
{
    if (facing == LEFT and isCollisionLeft(1))
    {
        facing = RIGHT;
        xVel = -xVel;
    }
    else if (facing == RIGHT and isCollisionRight(1))
    {
        facing = LEFT;
        xVel = -xVel;
    }
    else if (colBot)
    {
        status = IDLE;
        xVel = 0;
        yVel = 0;
        counter = rand(40,100);
    }
    else if (not collision_point(x+8, y+8, oWater, 0, 0))
    {
        if (rand(1,100) == 1) status = FLY;
        else if (collision_point(x+8, y+24, oWater, 0, 0)) status = FLY;
    }
}
else if (status == BOUNCE)
{
    if (colBot)
    {
        yVel = -1 * rand(3,6);
    }
    else
    {
        status = RECOVER;
    }
}
else if (status == STUNNED)
{
    if (colBot)
    {
        // do nothing
    }
    else
    {
        if (xVel == 0 and hp > 0) sprite_index = sVampireStunL;
        else if (bounced)
        {
            if (yVel < 0) sprite_index = sVampireBounceL;
            else sprite_index = sVampireFallL;
        }
        else
        {
            if (abs(xVel) > 0) sprite_index = sVampireDieLL;
            else sprite_index = sVampireDieLR;
        }
    }
    
    if (colBot and not bounced)
    {
        bounced = true;
        scrCreateBlood(x+8, y+8, 1);
    }
    
    if (held or colBot)
    {
        if (counter > 0) counter -= 1;
        else if (hp > 0)
        {
            status = IDLE;
            if (held)
            {
                held = false;
                with oPlayer1 { holdItem = 0; pickupItemType = ""; }
            }
        }
    }
}
else if (status == DEAD)
{
    repeat(3)
    {
        instance_create(other.x+8, other.y+8, oBone);
    }
    obj = instance_create(other.x+8, other.y+8, oSkull);
    obj.yVel = -rand(1,3);
    obj.xVel = rand(0,3)-rand(0,3);
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[7] += 1;
        global.vampires += 1;
        global.kills += 1;
    }
    playSound(global.sndCavemanDie);
    obj = instance_create(x+8, y+8, oCapePickup);
    obj.cost = 0;
    obj.forSale = false;
    instance_destroy();
}
else if (status == HANG)
{
    xVel = 0;
    yVel = 0;

    if (not oPlayer1.dead and not oPlayer1.swimming and
        ((dist < 90 and oPlayer1.y > y + 16) or not collision_point(x+8, y-1, oSolid, 0, 0)))
    {
        status = FLY;
        playSound(global.sndBat);
    }
}
else if (status == FLY and instance_exists(oPlayer1) and not oPlayer1.swimming and not oPlayer1.dead)
{
    xVel = 0;
    yVel = 0;

    if (dist < 160)
    {
        dir = point_direction(x+8, y+8, oPlayer1.x, oPlayer1.y)
        if (isCollisionRight(1) and oPlayer1.x > x+8)
        {
            if (oPlayer1.y < y+8) dir = 90;
            else dir = 270;
        }
        if (isCollisionLeft(1) and oPlayer1.x < x+8)
        {
            if (oPlayer1.y < y+8) dir = 90;
            else dir = 270;
        }
        if (isCollisionTop(1) and oPlayer1.y < y+8 and abs(oPlayer1.x - x) > 8)
        {
            if (oPlayer1.x < x+8) dir = 180;
            else dir = 0;
        }
        if (isCollisionBottom(1) and oPlayer1.y > y+8 and abs(oPlayer1.x - x) > 8)
        {
            if (oPlayer1.x < x+8) dir = 180;
            else dir = 0;
        }
        
        if (collision_point(x+8, y+16, oWater, 0, 0) and dir > 180 and dir < 360)
        {
            dir = 90;
        }
        
        if (not collision_point(x, y+12, oWater, 0, 0) or oPlayer1.y < y)
        {
            xVel = 2 * cos(degtorad(dir));
            yVel = -2 * sin(degtorad(dir));
        }
    }
    else
    {
        if (collision_point(x+8, y-1, oSolid, 0, 0)) status = HANG;
        else
        {
            dir = 90;
            xVel = 2 * cos(degtorad(dir));
            yVel = -2 * sin(degtorad(dir));  
        }
    }
    
    if (oPlayer1.x < x+8) facing = LEFT;
    else facing = RIGHT;

    if (colBot or collision_point(x, y, oWater, 0, 0))
    {
        status = IDLE;
    }
}
else if (status == FLY)
{
    xVel = 0;
    yVel = 0;
    
    if (collision_point(x+8, y-1, oSolid, 0, 0)) status = HANG;
    else
    {
        dir = 90;
        xVel = 1 * cos(degtorad(dir));
        yVel = -1 * sin(degtorad(dir));  
    }
}

if (status >= STUNNED)
{
    scrCheckCollisions();
    
    if (xVel == 0 and yVel == 0 and hp < 1) status = DEAD;
}

//if (isCollisionSolid()) y -= 2;

if (xVel > 0) xVel -= 0.1;
if (xVel < 0) xVel += 0.1;
if (abs(xVel) < 0.5) xVel = 0;

if (status == HANG) sprite_index = sVampireBatHang;
else if (status < STUNNED and status != THROW)
{
    if (status == FLY) sprite_index = sVampireBatLeft;
    else if (status == RECOVER) sprite_index = sVampireJumpL;
    else if (abs(xVel) > 0) sprite_index = sVampireRunL;
    else sprite_index = sVampireLeft;
}
if (held)
{
    if (hp > 0) sprite_index = sVampireHeldL;
    else sprite_index = sVampireDHeldL;
}
}
