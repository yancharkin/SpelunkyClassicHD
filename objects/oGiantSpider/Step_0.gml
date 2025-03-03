if ((x > __view_get( e__VW.XView, 0 )-32 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) and
        y > __view_get( e__VW.YView, 0 )-32 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )))
{
moveTo(xVel,yVel);

yVel += myGrav;
if (yVel > yVelLimit) yVel = yVelLimit;

if (whipped > 0) whipped -= 1;

if (collision_point(x+16, y+24, oSolid, 0, 0))
{
    hp = 0;
}

if (hp < 1)
{
    repeat(rand(1,3))
    {
        n = rand(1,3);
        switch (n)
        {
            case 1: { gem = instance_create(x+16, y+24, oEmeraldBig); break; }
            case 2: { gem = instance_create(x+16, y+24, oSapphireBig); break; }
            case 3: { gem = instance_create(x+16, y+24, oRubyBig); break; }
        }
        gem.xVel = rand(0,3) - rand(0,3);
        gem.yVel = -2;
    }
    obj = instance_create(x+16, y+24, oPaste);
    obj.cost = 0;
    obj.forSale = false;
    scrCreateBlood(x+16, y+24, 4);
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[3] += 1;
        global.giantspiders += 1;
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

if (isCollisionTop(1) and isCollisionBottom(1) and status != CRAWL)
{
    status = CRAWL;
    if (oCharacter.x < x+16)
        xVel = -1;
    else
        xVel = 1;
}

dist = distance_to_object(oCharacter)

if (squirtTimer > 0) squirtTimer -= 1;

if (status == IDLE)
{
    if (sprite_index != sGiantSpiderFlip) sprite_index = sGiantSpider;
    alarm[0] = rand(5,20);
    if (squirtTimer == 0) status = SQUIRT;
    else status = RECOVER;
}
else if (status == CRAWL)
{
    sprite_index = sGiantSpiderCrawl;
    if (not isCollisionTop(1) or not isCollisionBottom(1)) status = IDLE;
    else if (isCollisionRight(1)) xVel = -1;
    else if (isCollisionLeft(1)) xVel = 1;
}
else if (status == SQUIRT)
{
    sprite_index = sGiantSpiderSquirt;
    if (image_index >= 5 and squirtTimer == 0)
    {
        instance_create(x+16, y+16, oWebBall);
        squirtTimer = rand(100,1000);
    }
}
else if (status == RECOVER)
{
    if (isCollisionBottom(1)) xVel = 0;
}
else if (status == BOUNCE and dist < 120)
{
    sprite_index = sGiantSpiderJump;
    if (isCollisionBottom(1))
    {
        sprite_index = sGiantSpider;
        yVel = -1 * rand(3,6);
        if (oCharacter.x < x+16)
        {
            xVel = -2.5;
        }
        else
        {
            xVel = 2.5;
        }
        playSound(global.sndSpiderJump);
        
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
/*  */
