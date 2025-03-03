action_inherited();
if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+4 and
        y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+4))
{
depth = 40;

moveTo(xVel,yVel);


if (status != HANG and status != CLIMB and status != GRAB) yVel += myGrav;
if (yVel > yVelLimit) yVel = yVelLimit;

if (collision_point(x+8, y+8, oSolid, 0, 0)) hp = -999;

if (collision_point(x+8, y+8, oWater, -1, -1))
{
    if (not swimming)
    {
        instance_create(x+8, y, oSplash);
        swimming = true;
        playSound(global.sndSplash);
    }
}
else
{
    swimming = false;
}

if (hp < 1)
{
    scrCreateBlood(x+8, y+8, 3);
    if (countsAsKill)
    {
        if (isRealLevel()) global.totalMonkeyKills += 1; // this is for stats
        global.monkeys += 1;
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

if (grabCounter > 0) grabCounter -= 1;
if (vineCounter > 0) vineCounter -= 1;
if (throwCounter > 0) throwCounter -= 1;

dist = distance_to_object(oCharacter)

if (status == IDLE)
{
    xVel = 0;
    if (counter > 0) counter -= 1;
    else status = WALK;
    if (dist < 64) status = BOUNCE;
    //if (status == BOUNCE) playSound(global.sndFrog);
}
else if (status == WALK)
{
    if (isCollisionLeft(1) or isCollisionRight(1))
    {
        if (facing == LEFT) facing = RIGHT;
        else facing = LEFT;
    }
    
    if (facing == LEFT)
    {
        xVel = -2;
    }
    else
    {
        xVel = 2;
    }
    
    if (rand(1,100) == 1)
    {
        status = IDLE;
        counter = rand(20,50);
        xVel = 0;
    }
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
    else if (isCollisionLadder())
    {
        if (vineCounter == 0)
        {
            status = HANG;
            xVel = 0;
            yVel = 0;
            counter = rand(10,40);
        }
    }
}
else if (status == BOUNCE)
{
    if (colBot)
    {
        yVel = -1 * rand(4,5);
        if (oCharacter.x < (x+8))
        {
            facing = LEFT;
            xVel = -2;
        }
        else
        {
            facing = RIGHT;
            xVel = 2;
        }
    }
    else
    {
        status = RECOVER;
        playSound(global.sndMonkey);
    }
}
else if (status == HANG)
{
    xVel = 0;
    yVel = 0;
    if (counter > 0) counter -= 1;
    else
    {
        status = CLIMB;
        // dir = rand(0,1);
    }
}
else if (status == CLIMB)
{
    xVel = 0;
    if (dir == UP)
    {
        yVel = -1;
        if (not collision_point(x+8, y, oVine, 0, 0))
        {
            dir = DOWN;
            status = HANG;
            counter = rand(10,40);
        }
    }
    else
    {
        yVel = 1;
        if (not collision_point(x+8, y+22, oVine, 0, 0))
        {
            dir = UP;
            status = HANG;
            counter = rand(10,40);
        }
    }
    
    if (dist < 64 and oCharacter.y > y)
    {
        status = BOUNCE;
        vineCounter = 30;
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
}
else if (status == GRAB)
{
    xVel = 0;
    yVel = 0;
    depth = 120;
    x = oPlayer1.x+grabX;
    y = oPlayer1.y+grabY;
    if (oPlayer1.facing == 18) facing = LEFT;
    else facing = RIGHT;
    if (counter > 0) counter -= 1;
    else
    {
        n = 500+ceil(500 / 4)*global.levelType;
        if (rand(1,4) == 1)
        {
            // trip player
            with oPlayer1
            {
                if (facing == 18) xVel = -3;
                else xVel = 3;
                yVel = -3;
                stunned = true;
                stunTimer = 40;
                status = 16;
                if (holdItem)
                {
                    scrDropItem(0,0);
                    /*
                    if (holdItem.type == "Bow" and bowArmed)
                    {
                        scrFireBow();
                    }
                    else
                    {
                        holdItem.held = false;
                        holdItem = 0;
                        pickupItemType = "";
                    }
                    */
                }
            }
            playSound(global.sndHit);
        }
        else if (global.money >= n and rand(1,10) <= 8)
        {
            // throw out money
            global.money -= n;
            obj = instance_create(x, y, oGoldNugget);
            with obj
            {
                canCollect = false;
                alarm[0] = 20;
                xVel = rand(1,3)-rand(1,3);
                yVel = -rand(3,4);
            }
            playSound(global.sndThrow);
        }
        else if (rand(1,2) == 1 and global.rope > 0)
        {
            // throw out rope
            global.rope -= 1;
            obj = instance_create(x, y, oRopeThrow);
            with obj
            {
                xVel = rand(1,3)-rand(1,3);
                yVel = -rand(3,4);
            }
            playSound(global.sndThrow);
        }
        else if (global.bombs > 0)
        {
            // throw out bomb
            global.bombs -= 1;
            obj = instance_create(x, y, oBomb);
            if (rand(1,10) == 1)
            {
                obj.sprite_index = sBombArmed;
                obj.armed = true;
                obj.image_speed = 1;
                obj.alarm[1] = 40;
            }
            with obj
            {
                xVel = rand(1,3)-rand(1,3);
                yVel = -rand(3,4);
            }
            playSound(global.sndThrow);
                
        }
        status = BOUNCE;
        vineCounter = 20;
        yVel = -1 * rand(2,4);
        if (oCharacter.x > (x+8))
        {
            facing = LEFT;
            xVel = -3;
        }
        else
        {
            facing = RIGHT;
            xVel = 3;
        }
        grabCounter = 60;
    }
}
else if (status != DROWNED)
{
    status = IDLE;
    xVel = 0;
}

if (status != GRAB and isCollisionTop(1))
    yVel = 1;

if (status == HANG) sprite_index = sMonkeyHangL;
else if (status == CLIMB or status == GRAB) sprite_index = sMonkeyClimbL;
else if (not colBot) sprite_index = sMonkeyJumpL;
else if (status == WALK) sprite_index = sMonkeyWalkL;
else sprite_index = sMonkeyLeft;
}

/* */
/*  */
