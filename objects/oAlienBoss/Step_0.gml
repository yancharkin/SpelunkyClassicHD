if (x > __view_get( e__VW.XView, 0 )-36 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) and
        y > __view_get( e__VW.YView, 0 )-36 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ))
{
if (collision_point(x+8, y+8, oSolid, 0, 0))
{
    hp = 0;
}

if (hp < 1 and status != DEAD)
{
    status = DEAD;
    sprite_index = sAlienBossDie;
    depth = 101;
    repeat(4)
    {
        n = rand(1,3);
        switch (n)
        {
            case 1: { gem = instance_create(x+16, y+16, oEmeraldBig); break; }
            case 2: { gem = instance_create(x+16, y+16, oSapphireBig); break; }
            case 3: { gem = instance_create(x+16, y+16, oRubyBig); break; }
        }
        gem.xVel = rand(0,3) - rand(0,3);
        gem.yVel = -2;
    }
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[17] += 1;
        global.alienbosses += 1;
        global.kills += 1;
    }
}

if (sprite_index == sAlienBossDie)
{
    if (rand(1,2) == 1)
    {
        scrCreateBlood(x+8, y+rand(14,18), 1);
        blood = instance_create(x+8, y+rand(14,18), oBlood);
    }
}

yVel += myGrav;
if (yVel > yVelLimit) yVel = yVelLimit;

if (xVel > 0) xVel -= 0.1;
if (xVel < 0) xVel += 0.1;
if (abs(xVel) < 0.5) xVel = 0;

if (isCollisionBottom(1) and status != STUNNED)
    yVel = 0;

if (status == IDLE)
{
    xVel = 0;
}

moveTo(xVel,yVel);

if (isCollisionSolid())
    y -= 2;
    
dist = distance_to_object(oPlayer1);

if (psychicRecover > 0) psychicRecover -= 1;
else if (dist < 96 and status != DEAD and not oPlayer1.dead and not oPlayer1.stunned and oPlayer1.invincible == 0)
{
    for (i = 0; i < 6; i += 1)
    {
        instance_create(x+16+rand(0,32)-rand(0,32), y+16+rand(0,32)-rand(0,32), oPsychicCreate);
    }
    instance_create(x+16, y+16, oPsychicWave);
    psychicRecover = 100;
    playSound(global.sndPsychic);
}

if (sprite_index != sAlienBossHurt) image_speed = 0.25;    
    
if (status != DEAD and sprite_index != sAlienBossHurt and facing == LEFT)
{
    sprite_index = sAlienBoss;
}
if (status != DEAD and sprite_index != sAlienBossHurt and facing == RIGHT)
{
    sprite_index = sAlienBoss;
}
}
