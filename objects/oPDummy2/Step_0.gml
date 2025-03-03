x += xVel;
y += yVel;

if (status == DROP)
{
    if (global.isDamsel) sprite_index = sDamselFallL;
    else if (global.isTunnelMan) sprite_index = sTunnelFallL;
    else sprite_index = sDieLFall;
    yVel = 6;
    if (collision_point(x, y+9, oDesert2, 0, 0))
    {
        yVel = 0;
        status += 1;
        if (global.isDamsel) sprite_index = sDamselStunL;
        else if (global.isTunnelMan) sprite_index = sTunnelStunL;
        else sprite_index = sStunL;
        poof = instance_create(x-4, y+6, oPoof);
        with poof { xVel = -0.4; }
        poof = instance_create(x+4, y+6, oPoof);
        with poof { xVel = 0.4; }
        playSound(global.sndThud);
    }
}
else if (status == STUNNED)
{
    alarm[0] = 70;
    alarm[1] = 50;
    status = GETUP;
}
else if (status == GETUP)
{
    treasure = instance_nearest(x, y, oBigTreasure);
    if (treasure)
    {
        if (treasure.yVel == 0)
        {
            yVel = -4;
            status = JUMPING;
        }
    }
}
else if (status == JUMPING)
{
    if (global.isDamsel) sprite_index = sDamselDieLR;
    else if (global.isTunnelMan) sprite_index = sTunnelDieLR;
    else sprite_index = sJumpLeft;
    if (yVel < 4) yVel += 0.6;
    if (collision_point(x, y+6, oDesert2, 0, 0))
    {
        yVel = 0;
        status += 1;
        alarm[2] = 50;
        if (global.isDamsel) sprite_index = sDamselLeft;
        else if (global.isTunnelMan) sprite_index = sTunnelLeft;
        else sprite_index = sStandLeft;
        facing = RIGHT;
        with oMenu
        {
            visible = true;
        }
    }
}   

if (collision_point(x, y+6, oDesert2, 0, 0))
{
    y -= 2;
}
if (collision_point(x, y+7, oDesert2, 0, 0))
{
    y -= 1;
}
