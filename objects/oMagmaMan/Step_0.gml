if (hp > 0) hp -= 1;
if (collision_point(x+8, y+8, oSolid, 0, 0) or hp < 1)
{
    xVel = 0;
    yVel = 0;
    status = DEAD;
    sprite_index = sMagmaManDie;
}

yVel += myGrav;
if (yVel > yVelLimit) yVel = yVelLimit;

if (isCollisionBottom(1))
    yVel = 0;
else
{
    instance_create(x+8, y+8, oMagma);
    instance_destroy();
}
/*
if (status != DEAD and hp < 1)
{
    status = DEAD;
)
*/

if (rand(1,20) == 1) instance_create(x+rand(4,12), y+rand(4,12), oBurn);
burning -= 1;
    
if (status == IDLE)
{
    if (yVel < 0 and isCollisionTop(1))
    {
        yVel = 0;
    }

    if (isCollisionBottom(1) and counter > 0) counter -= 1;    
    if (counter < 1)
    {
        facing = rand(0,1);
        status = WALK;
        if (rand(1,6) == 1)
        {
            magma = instance_create(x+8, y+8, oMagma);
            magma.hp = hp;
            instance_destroy();
        }
    }
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
        xVel = -1.5;
        if (not collision_point(x-1, y+16, oSolid, -1, -1))
        {
            status = IDLE;
            counter = rand(20,50);
            xVel = 0;
        }
    }
    else
    {
        xVel = 1.5;
        if (not collision_point(x+16, y+16, oSolid, -1, -1))
        {
            status = IDLE;
            counter = rand(20,50);
            xVel = 0;
        } 
    }
    
    if (rand(1,100) == 1)
    {
        status = IDLE;
        counter = rand(20,50);
        xVel = 0;
    }
}

moveTo(xVel,yVel);
if (isCollisionSolid())
    y -= 2;

if (status < STUNNED and status != THROW)
{
    if (abs(xVel) > 0) sprite_index = sMagmaManWalkL;
    else sprite_index = sMagmaManLeft;
}
/* */
/*  */
