if (x > __view_get( e__VW.XView, 0 )-16 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+16 and
        y > __view_get( e__VW.YView, 0 )-16 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+16)
{
if (status == IDLE)
{
    dist = point_distance(x, y, oCharacter.x, oCharacter.y);
    if (counter > 0) counter -= 1;
        
    if (dist < 90 and counter < 1)
    {
        if (abs(oCharacter.y - (y+8)) < 8 and oCharacter.x > x+8 and not isCollisionRight(2))
        {
            status = ATTACK;
            dir = RIGHT;
            xa = 0.5;
        }
        else if (abs(oCharacter.x - (x+8)) < 8 and oCharacter.y > y+8 and not isCollisionBottom(2))
        {
            status = ATTACK;
            dir = DOWN;
            ya = 0.5;
        }
        else if (abs(oCharacter.y - (y+8)) < 8 and oCharacter.x < x+8 and not isCollisionLeft(2))
        {
            status = ATTACK;
            dir = LEFT;
            xa = -0.5;
        }
        else if (abs(oCharacter.x - (x+8)) < 8 and oCharacter.y < y+8 and not isCollisionTop(2))
        {
            status = ATTACK;
            dir = UP;
            ya = -0.5;
        }
    }
}
else if (status == ATTACK)
{
    colLeft = false;
    colRight = false;
    colTop = false;
    colBot = false;
    if (isCollisionLeft(1)) colLeft = true;
    if (isCollisionRight(1)) colRight = true;
    if (isCollisionTop(1)) colTop = true;
    if (isCollisionBottom(1)) colBot = true;

    if (abs(xv) < 4) xv += xa;
    if (abs(yv) < 4) yv += ya;
    x += xv;
    y += yv;
    if (dir == RIGHT)
    {
        if (isCollisionRight(2) and colRight)
        {
            x -= 2;
            hit = true;
        }
        if (colRight)
        {
            x -= 1;
            hit = true;
        }
    }
    else if (dir == DOWN)
    {
        if (isCollisionBottom(2) and colBot)
        {
            y -= 2;
            hit = true;
        }
        if (colBot)
        {
            y -= 1;
            hit = true;
        }
    }
    else if (dir == LEFT)
    {
        if (isCollisionLeft(2) and colLeft)
        {
            x += 2;
            hit = true;
        }
        if (colLeft)
        {
            x += 1;
            hit = true;
        }
    }
    else if (dir == UP)
    {
        if (isCollisionTop(2) and colTop)
        {
            y += 2;
            hit = true;
        }
        if (colTop)
        {
            y += 1;
            hit = true;
        }
    }
    
    if (collision_rectangle(x-1,y-1,x+17,y+17,oTombLord,0,0)) hit = true;
    
    if (hit)
    {
        xv = 0;
        yv = 0;
        xa = 0;
        ya = 0;
    }
    if (hit and not colRight and
        not colLeft and
        not colTop and
        not colBot)
    {
        status = IDLE;
        hit = false;
        counter = 50;
    }
}
else if (status = 99)
{
    xv = 0;
    yv = 0;
    xa = 0;
    ya = 0;
    y += 0.05;
    if (collision_point(x, y-1, oLava, 0, 0)) instance_destroy();
}

if (collision_rectangle(x+1, y+1, x+15, y+15, oLava, 0, 0))
{
    status = 99;
}}
