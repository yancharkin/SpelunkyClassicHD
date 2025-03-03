y += yVel;

if (status != STOPPED and collision_point(x+8, y, oDamselKiss, 0, 0))
{
    person = instance_nearest(x+8, y, oDamselKiss);
    if (not person.kissed)
    {
        status = STOPPED;
        xVel = 0;
        yVel = 0;
        if (global.isDamsel) sprite_index = sDamselLeft;
        else if (global.isTunnelMan) sprite_index = sTunnelLeft;
        else sprite_index = sStandLeft;
    
        with person
        {
            if (global.isDamsel) sprite_index = sPKissL;
            else sprite_index = sDamselKissL;
        }
        alarm[5] = 30;
    }
}

if (instance_exists(oTunnelMan))
{
    person = instance_nearest(x+8, y, oTunnelMan);
    if (status != STOPPED and collision_point(x+8, y, oTunnelMan, 0, 0) and person.talk == 0)
    {
        status = STOPPED;
        xVel = 0;
        yVel = 0;
        if (global.isDamsel) sprite_index = sDamselLeft;
        else if (global.isTunnelMan) sprite_index = sTunnelLeft;
        else sprite_index = sStandLeft;
    
        with person
        {
            talk = 1;
        }
    }
}

if (status == TRANSITION)
{
    if (x >= 280)
    {
        if (sprite_index != sPExit and sprite_index != sDamselExit and sprite_index != sTunnelExit)
        {
            playSound(global.sndSteps);
            if (global.isDamsel) sprite_index = sDamselExit;
            else if (global.isTunnelMan) sprite_index = sTunnelExit;
            else sprite_index = sPExit;
        }
    }
    else x += 2;
}
else if (status == END and sprite_index != sStandLeft and sprite_index != sDamselLeft and sprite_index != sTunnelLeft)
{
    if (x >= 448 + 8)
    {
        // stop
        if (global.isDamsel) sprite_index = sDamselLeft;
        else if (global.isTunnelMan) sprite_index = sTunnelLeft;
        else sprite_index = sStandLeft;
        alarm[0] = 20;
    }
    else x += 2;
}
else if (status == LAVA)
{
    alarm[3] = 50;
    status += 1;
}
else if (status == LAVA+1)
{
    instance_create(oEndPlat.x+rand(0,80), 192+32, oBurn)
}
