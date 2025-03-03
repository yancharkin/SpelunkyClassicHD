action_inherited();
if (carryPlayer or collision_rectangle(x-1, y, x+66, y+62, oPlayer1, 0, 0))
{
    oPlayer1.x += xVel;
    oPlayer1.y += yVel;
}
moveTo(xVel,yVel);

if (yVel < 6)
{
    yVel += myGrav;
}
    
if (isCollisionTop(1))
{
    instance_create(x, y-16, oOlmecSlam);
    y += 1;
    if (yVel < 0) yVel = -yVel * 0.8;
}

if (isCollisionLeft(1))
{
    x += 1;
    xVel = 0;
    //if (xVel < 0) xVel = -xVel * 0.8;
}
if (isCollisionRight(1))
{
    x -= 1;
    xVel = 0;
    //if (xVel > 0) xVel = -xVel * 0.8;
}

if (collision_point(x, y+64, oLava, 0, 0)) status = DROWNING;

if (collision_point(x, y-2, oLava, 0, 0))
{
    global.enemyKills[21] += 1;
    global.olmecDead = true;
    global.kills += 1;
    instance_destroy();
}

dist = distance_to_object(oPlayer1) + 32;


if (collision_rectangle(x, y-2, x+64, y+64, oPlayer1, 0, 0)) carryPlayer = true;
else carryPlayer = false;

if (status == START1)
{
    if (__view_get( e__VW.XView, 0 ) < 176-global.room_offset) __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (2) );
    else
    {
        alarm[1] = 100;
        status = START2;
    }
    
    if (isCollisionBottom(1))
        yVel = 0;
}
else if (status == START2)
{   
    if (isCollisionBottom(1))
        yVel = 0;
}
else if (status == IDLE)
{
    if (counter > 0) counter -= 1;
    if (counter == 0) status = BOUNCE;
    
    if (isCollisionBottom(1))
    {
        yVel = 0;
    }
    
    toggle = true;
}
else if (status == CREATE)
{
    repeat(6)
    {
        instance_create(x+32+rand(0,32)-rand(0,32), y+14+rand(0,32)-rand(0,32), oPsychicCreate2);
    }
    instance_create(x+32, y+16, oYellowBall);
    instance_create(x+32, y+16, oYellowBall);
    instance_create(x+32, y+16, oYellowBall);
    playSound(global.sndPsychic);
    status = IDLE;
}
else if (status == RECOVER)
{
    if (isCollisionBottom(1))
    {
        playSound(global.sndThump);
        status = IDLE;
        xVel = 0;
        yVel = 0;
        counter = rand(40,100);
    }
    else
    {
        if (counter > 1) counter -= 1;
        else if (counter == 1)
        {
            if (oPlayer1.x < x) xVel = -0.25;
            else if (oPlayer1.x > x+64) xVel = 0.25;
            else xVel = 0;
            counter -= 1;
        }
        else
        {
            if (xVel < 0 and toggle) xVel -= 0.25;
            else if (xVel < 0 and not toggle) xVel += 0.25;
            if (xVel > 0 and toggle) xVel += 0.25;
            else if (xVel > 0 and not toggle) xVel -= 0.25;
            if (xVel <= -2 or xVel >= 2) toggle = not toggle;
        }

        if ((not oPlayer1.active and yVel >= 0) or
            (oPlayer1.y > y and abs(oPlayer1.x - (x+32)) < 32 and xVel > -1))
        {
            status = PREPARE;
            yVel = 0;
            xVel = 0;
            myGrav = 0;
            counter = 20;
        }
    }
}
else if (status == BOUNCE)
{
    if (isCollisionBottom(1))
    {
        yVel = -4;
    }
    else
    {
        counter = 10;
        status = RECOVER;
        playSound(global.sndBigJump);
    }
}
else if (status == PREPARE)
{
    if (counter > 0) counter -= 1;
    else
    {
        yVel = 5;
        myGrav = 0.2;
        status = SLAM;
        slammed = false;
    }
}
else if (status == SLAM)
{
    carryPlayer = false;
    if (isCollisionBottom(1))
    {
        if (not slammed)
        {
            instance_create(x, y+64, oOlmecSlam);
            slammed = true;
            scrShake(5);
        }
        else
        {
            if (rand(1,2) == 1 or not oPlayer1.active) status = IDLE;
            else status = CREATE;
            xVel = 0;
            yVel = 0;
            counter = 60;
            if (not oPlayer1.active) alarm[5] = 50;
        }
    }
}
else if (status == DROWNING)
{
    xVel = 0;
    yVel = 0.1;
    myGrav = 0;
    scrShake(10);
    if (not SS_IsSoundPlaying(global.sndFlame)) playSound(global.sndFlame);
}

if (isCollisionTop(1))
    yVel = 1;
if (isCollisionLeft(1) or isCollisionRight(1))
{
    xVel = -xVel;
}

if (isCollisionSolid())
  y -= 2;

