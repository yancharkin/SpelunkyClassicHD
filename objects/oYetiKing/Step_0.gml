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
    scrCreateBlood(x+14+rand(0,4), y+14+rand(0,4), 3);
    repeat(4)
    {
        instance_create(x+14+rand(0,4), y+14+rand(0,6), oBone);
    }
    repeat(4)
    {
        if (rand(1,12) == 1)
        {
            obj = instance_create(x+16, y+16, oSpikeShoes);
            obj.cost = 0;
            obj.forSale = false;
        }
        else if (rand(1,2) == 1) obj = instance_create(x+16, y+16, oSapphireBig);
        else
        {
            obj = instance_create(x+16, y+16, oRopePile);
            obj.cost = 0;
            obj.forSale = false;
        }
        obj.xVel = rand(0,3)-rand(0,3);
        obj.yVel = -rand(1,2);
    }
    if (countsAsKill)
    {
        global.enemyKills[14] += 1;
        global.yetikings += 1;
        global.kills += 1;
    }
    instance_destroy();
}

if (isCollisionBottom(1) and status != STUNNED) yVel = 0;

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
            sprite_index = sYetiKingTurnR;
            status = TURN;
            counter = 30;
        }
        else if (oPlayer1.x < x+16 and abs(oPlayer1.y-(y+16)) < 32 and attackTimer == 0)
        {
            status = ATTACK;
            sprite_index = sYetiKingYellL;
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
            sprite_index = sYetiKingTurnL;
            status = TURN;
            counter = 30;
        }
        else if (oPlayer1.x > x+16 and abs(oPlayer1.y-(y+16)) < 32 and attackTimer == 0)
        {
            status = ATTACK;
            sprite_index = sYetiKingYellR;
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
        if (not SS_IsSoundPlaying(global.sndYetiYell)) playSound(global.sndYetiYell);
        with oIce
        {
            if (instance_exists(oYetiKing))
            {
                if (rand(1,60) == 1 and
                    abs((oYetiKing.x+16)-(x+8)) > 16 and
                    point_distance(x, y, oYetiKing.x, oYetiKing.y) < 96)
                {
                    instance_create(x, y, oIceBlock);
                    instance_destroy();
                }
            }
        }
        with oThinIce
        {
            thickness -= 2;
        }
    }
}

if (isCollisionSolid())
    y -= 2;

if (facing == LEFT)
{   
    if (status == WALK) sprite_index = sYetiKingWalkL;
    else if (status == IDLE) sprite_index = sYetiKingLeft;
}
if (facing == RIGHT)
{   
    if (status == WALK) sprite_index = sYetiKingWalkR;
    else if (status == IDLE) sprite_index = sYetiKingRight;
}
}
