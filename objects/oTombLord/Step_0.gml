action_inherited();
if ((x > __view_get( e__VW.XView, 0 )-36 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) and
        y > __view_get( e__VW.YView, 0 )-36 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )))
{
moveTo(xVel,yVel);

yVel += myGrav;
if (yVel > yVelLimit) yVel = yVelLimit;

if (collision_point(x+16, y+16, oSolid, 0, 0))
{
    hp = 0;
}

if (hp < 1)
{
    scrCreateBlood(x+14+rand(0,4), y+14+rand(0,4), 4);
    repeat(4)
    {
        instance_create(x+14+rand(0,4), y+12+rand(0,6), oBone);
    }
    if (global.currLevel == 13) instance_create(x+16, y+16, oSceptre);
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[20] += 1;
        global.tomblords += 1;
        global.kills += 1;
    }
    instance_destroy();
}

if (isCollisionBottom(1) and status != STUNNED)
    yVel = 0;

if (attackTimer > 0) attackTimer -= 1;
if (whipped > 0) whipped -= 1;
    
if (status == IDLE)
{
    if (counter > 0) counter -= 1;    
    if (counter <= 0)
    {
        status = WALK;
    }
}
else if (status == WALK)
{
    if (counter > 0) counter -= 1;
    
    if (facing == LEFT)
    {
        if (isCollisionLeft(1) or
            (oPlayer1.x > x+16 and abs(oPlayer1.y-(y+32)) < 16 and counter == 0))
        {
            sprite_index = sTombLordTurnR;
            status = TURN;
            counter = 30;
        }
        else if (oPlayer1.x < x+16 and abs(oPlayer1.y-(y+16)) < 32 and attackTimer == 0)
        {
            status = ATTACK;
            sprite_index = sTombLordAttackL;
            image_index = 0;
            xVel = 0;
        }
        else xVel = -1;
    }
    else if (facing == RIGHT)
    {
        if (isCollisionRight(1) or
            (oPlayer1.x < x+16 and abs(oPlayer1.y-(y+32)) < 16 and counter == 0))
        {
            sprite_index = sTombLordTurnL;
            status = TURN;
            counter = 30;
        }
        else if (oPlayer1.x > x+16 and abs(oPlayer1.y-(y+16)) < 32 and attackTimer == 0)
        {
            status = ATTACK;
            sprite_index = sTombLordAttackR;
            image_index = 0;
            xVel = 0;
        }
        else xVel = 1;
    }
}
else if (status == TURN)
{
    xVel = 0;
}
else if (status == ATTACK)
{
    xVel = 0;
    image_speed = 0.5;
    attackTimer = 100;
    if (image_index >= 7 and image_index <= 12)
    {
        if (facing == LEFT)
        {
            obj = instance_create(x+8, y+12+rand(0,4), oFly);
            obj.xVel = -rand(3,5);
        }
        else
        {
            obj = instance_create(x+24, y+12+rand(0,4), oFly);
            obj.xVel = rand(3,5);
        }
    }
}
else if (status >= STUNNED) status = WALK;

if (isCollisionSolid())
    y -= 2;

if (facing == LEFT)
{   
    if (status == WALK) sprite_index = sTombLordWalkL;
    else if (status == IDLE) sprite_index = sTombLordLeft;
}
if (facing == RIGHT)
{   
    if (status == WALK) sprite_index = sTombLordWalkR;
    else if (status == IDLE) sprite_index = sTombLordRight;
}
}
