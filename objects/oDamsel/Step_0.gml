action_inherited();
if (active and
    collision_point(x, y, oExit, 0, 0) and
    hp > 0 and
    not held and
    status != THROWN)
{
    global.damselsSavedTotal += 1;
    global.damsels += 1;
    global.xdamsels += 1;
    door = instance_place(x, y, oExit);
    x = door.x+8;
    y = door.y+8;
    if (global.isDamsel) sprite_index = sPExit;
    else sprite_index = sDamselExit2;
    status = 4;
    xVel = 0;
    yVel = 0;
    playSound(global.sndSteps);
    depth = 1000;
    active = false;
    canPickUp = false;
}

if (sprite_index = sDamselExit2 or sprite_index = sPExit)
{
    depth = 1000;
    invincible = true;
}

if (hit > 0) hit -= 1;

if (collision_point(x, y, oWaterSwim, -1, -1))
{
    if (not swimming)
    {
        instance_create(x, y, oSplash);
        swimming = true;
        playSound(global.sndSplash);
    }
    myGrav = 0.2;
}
else
{
    swimming = false;
    myGrav = 0.6;
}

// if damsel dies offscreen sometimes it won't trigger shopkeeper
if (cost > 0 and hp <= 0)
{
    scrShopkeeperAnger(3);
}

if (not invincible)
{
    if (collision_point(x, y, oSolid, 0, 0) and not held)
    {
        scrCreateBlood(x, y, 3);
        if (hp > 0)
        {
            global.damselsKilledTotal += 1;
            global.damselsKilled += 1;
            global.kills += 1;
        }
        playSound(global.sndDamsel);
        instance_destroy();
    }

    if (burning > 0)
    {
        if (rand(1,5) == 1) instance_create(x+rand(4,12), y+rand(4,12), oBurn);
        burning -= 1;
    }

    if (collision_point(x, y+6, oLava, 0, 0))
    {
        status = DEAD;
        dead = true;
        if (hp > 0)
        {
            hp = 0;
            global.damselsKilledTotal += 1;
        }
        burning = 1;
        myGrav = 0;
        xVel = 0;
        yVel = 0.1;
        depth = 999;
    }

    if (collision_point(x, y+6, oSpikes, 0, 0) and yVel > 2)
    {
        obj = instance_place(x, y+6, oSpikes);
        with obj { sprite_index = sSpikesBlood; }
        if (hp > 0)
        {
            scrCreateBlood(x, y, 3);
        }
        if (global.isDamsel)
        {
            sprite_index = sDieL;
        }
        else
        {
            sprite_index = sDamselDieL;
        }
        status = DEAD;
        dead = true;
        if (hp > 0)
        {
            hp = 0;
            global.damselsKilledTotal += 1;
        }
        myGrav = 0;
        xVel = 0;
        yVel = 0.2;
    }

    if (collision_rectangle(x-3, y-3, x+3, y+3, oSpearsLeft, 0, 0) and
        (status != THROWN or isCollisionBottom(1)))
    {
        obj = instance_nearest(x, y, oSpearsLeft);
        if (obj.image_index >= 19 and obj.image_index < 28)
        {
            if (held)
            {
                held = false;
                with oPlayer1 { holdItem = 0; pickupItemType = ""; }
            }
            hp -= 2;
            status = THROWN;
            counter = stunMax;
            yVel = -6;
            if (obj.x < x) xVel = 4;
            else xVel = -4;
            image_speed = 0.5;
            playSound(global.sndHit);
            instance_create(other.x+8, other.y+8, oBlood);
        }
    }
}

if (not held and yVel > 2 and status != THROWN)
{
    status = THROWN;
    //SS_SetSoundPan(global.sndDamsel, 0);
    playSound(global.sndDamsel);
}

if (held)
{
    facing = oCharacter.facing;
}
else if (status == SLAVE)
{
    if (oPlayer1.x < x) facing = LEFT;
    else facing = RIGHT;
    if (global.isDamsel)
    {
        sprite_index = sStandLeft;
    }
    else
    {
        sprite_index = sDamselLeft;
    }
}
else if (status == KISS)
{
    if ((sprite_index == sDamselKissL or
         sprite_index == sPKissL) and image_index == 7)
    {
        if (facing == LEFT) instance_create(x-8, y-8, oHeart);
        else instance_create(x+8, y-8, oHeart);
        playSound(global.sndKiss);
    }
}
else if (status == IDLE)
{
    if (global.isDamsel)
    {
        sprite_index = sStandLeft;
    }
    else
    {
        sprite_index = sDamselLeft;
    }
    if (counter > 0) counter -= 1;
    else
    {
        status = YELL;
        if (global.isDamsel)
        {
            sprite_index = sYellLeft;
        }
        else
        {
            sprite_index = sDamselYellL;
        }
        /*if (oPlayer1.x < x) SS_SetSoundPan(global.sndDamsel, -10000);
        else if (oPlayer1.x > x) SS_SetSoundPan(global.sndDamsel, 10000);
        else SS_SetSoundPan(global.sndDamsel, 0);*/
        playSound(global.sndDamsel);
    }
}
else if (status == YELL)
{
    if (image_index == 4)
    {
        instance_create(x, y-16, oYellHelp);
    }
}
else if (status == RUN)
{
    image_speed = 0.8;
    if (global.isDamsel)
    {
        sprite_index = sRunLeft;
    }
    else
    {
        sprite_index = sDamselRunL;
    }
    if (facing == LEFT and isCollisionLeft(2)) facing = RIGHT;
    if (facing == RIGHT and isCollisionRight(2)) facing = LEFT;
    
    if (facing == LEFT)
    {
        xVel = -1.5;
    }
    else
    {
        xVel = 1.5;
    }
}
else if (status == THROWN)
{
    // setCollisionBounds(-4, -2, 4, 2);

    if (!startled)
    {
        global.damselsGrabbed += 1;
        startled = true;
    }
    
    if (global.isDamsel)
    {
        if (xVel == 0) sprite_index = sStunL;
        else if (bounced)
        {
            if (yVel < 0) sprite_index = sDieLBounce;
            else sprite_index = sDieLFall;
        }
        else
        {
            if (xVel < 0) sprite_index = sDieLL;
            else sprite_index = sDieLR;
        }
    }
    else
    {
        if (xVel == 0) sprite_index = sDamselStunL;
        else if (bounced)
        {
            if (yVel < 0) sprite_index = sDamselBounceL;
            else sprite_index = sDamselFallL;
        }
        else
        {
            if (xVel < 0) sprite_index = sDamselDieLL;
            else sprite_index = sDamselDieLR;
        }
    }
    
    if (isCollisionBottom(1) and not bounced)
    {
        bounced = true;
    }
    
    if (isCollisionBottom(2) or collision_rectangle(x-4, y-6, x+4, y+8, oWeb, 0, 0))
    {
        if (!dead)
        {
            if (counter > 0) counter -= 1;
            else status = RUN;
        }
        
        if (hp <= 0)
        {
            if (global.isDamsel)
            {
                sprite_index = sDieL;
            }
            else
            {
                sprite_index = sDamselDieL;
            }
            status = DEAD;
            if (!dead)
            {
                dead = true;
                global.damselsKilledTotal += 1;
                global.damselsKilled += 1;
                global.kills += 1;
            }
        }
    }
}

// sacrifice
if (status == THROWN or status == DEAD)
{
    if (not held and xVel == 0 and yVel == 0)
    {
        if (collision_point(x, y+8, oSacAltarLeft, 0, 0))
        {
            if (sacCount > 0) sacCount -= 1;
            else
            {
            instance_create(x, y, oFlame);
            playSound(global.sndSmallExplode);
            scrCreateBlood(x, y, 3);
            global.message = tr("KALI ACCEPTS YOUR SACRIFICE!");
            if (global.favor <= -8)
            {
                global.message = tr("KALI DEVOURS YOUR SACRIFICE!");
            }
            else if (global.favor < 0)
            {
                if (status == 98) global.favor += favor*1.5;
                else global.favor += favor;
                if (favor > 0) favor = 0;
            }
            else
            {
                if (status == 98) global.favor += favor*1.5;
                else global.favor += favor;
            }
            scrGetFavorMsg();
            global.messageTimer = 200;
            global.shake = 10;
            instance_destroy();
            }
        }
    }
    else sacCount = 20;
}

/* */
/*  */
