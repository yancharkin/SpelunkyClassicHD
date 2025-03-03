/*
if ((x > view_xview[0]-8 and x < view_xview[0]+view_wview[0]+8 and
     y > view_yview[0]-8 and y < view_yview[0]+view_hview[0]+8))
{
*/

if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+4 and
     y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+4))
{

active = true;

if (held)
{
    xVel = 0;
    yVel = 0;
    myGrav = 0;
    
    if (oPlayer1.facing == 18) { x = oPlayer1.x-12;  facing = 0; }
    if (oPlayer1.facing == 19) { x = oPlayer1.x-4;  facing = 1; }
        
    if (oPlayer1.state == 12 and abs(oPlayer1.xVel) < 2) y = oPlayer1.y-10;
    else y = oPlayer1.y-12;
    
    depth = 1;
    
    if (oPlayer1.holdItem == 0 or status < 98)
    {
        held = false;
    }
}
else depth = 60;

if (collision_point(x+floor(sprite_width/2), y+floor(sprite_height/2), oWaterSwim, -1, -1))
{
    if (not swimming)
    {
        instance_create(x+floor(sprite_width/2), y, oSplash);
        swimming = true;
        playSound(global.sndSplash);
    }
    myGrav = myGravWater;
    
    if (type == "Fire Frog")
    {
        obj = instance_create(x, y, oFrog);
        obj.status = status;
        instance_destroy();
    }
}
else
{
    swimming = false;
    myGrav = myGravNorm;
}

if (burning > 0)
{
    if (rand(1,5) == 1) instance_create(x+rand(0,sprite_width), y+rand(0,sprite_height), oBurn);
    burning -= 1;
}

if (collision_point(x+floor(sprite_width/2), y-1, oLava, 0, 0)) instance_destroy();

if (collision_point(x+floor(sprite_width/2), y+sprite_height-2, oLava, 0, 0))
{
    hp = 0;
    countsAsKill = false;
    burning = 1;
    myGrav = 0;
    xVel = 0;
    yVel = 0.1;
    depth = 999;
}

if (collision_rectangle(x+2, y+2, x+14, y+14, oSpearsLeft, 0, 0))
{
    trap = instance_nearest(x, y, oSpearsLeft);
    if (trap.image_index >= 20 and trap.image_index < 24)
    {
        if (type == "Caveman" or type == "ManTrap" or type == "Yeti" or type == "Hawkman" or type == "Shopkeeper")
        {
            // if (status < 98)
            if (hp > 0)
            {
                hp -= 2;
                countsAsKill = false;
                status = 98;
                counter = stunTime;
                yVel = -6;
                if (trap.x+8 < x+8) xVel = 4;
                else xVel = -4;
                image_speed = 0.5;
                playSound(global.sndHit);
                scrCreateBlood(x+sprite_width/2, y+sprite_height/2, 2);
            }
        }
        else
        {
            hp -= 2;
            countsAsKill = false;
            playSound(global.sndHit);
            scrCreateBlood(x+sprite_width/2, y+sprite_height/2, 1);
        }
    }
}

if (collision_point(x+8, y+16, oSpikes, 0, 0) and yVel > 2)
{
    spikes = instance_place(x+8, y+14, oSpikes);
    
    if (not bloodless)
    {
        with spikes { sprite_index = sSpikesBlood; }
    }
    
    if (hp > 0)
    {
        hp = 0;
        countsAsKill = false;
        if (not bloodless) scrCreateBlood(x+sprite_width/2, y+sprite_height/2, 3);
        if (type == "Caveman" or type == "ManTrap" or type == "Yeti" or type == "Hawkman" or type == "Shopkeeper")
            status = 99;
    }
    myGrav = 0;
    xVel = 0;
    yVel = 0.2;
}

// sacrifice
if (status >= 98)
{
    if (not held and xVel == 0 and yVel == 0)
    {
        if (collision_point(x+8, y+16, oSacAltarLeft, 0, 0))
        {
            if (sacCount > 0) sacCount -= 1;
            else
            {
            instance_create(x+8, y+8, oFlame);
            playSound(global.sndSmallExplode);
            scrCreateBlood(x+8, y+8, 3);
            global.message = tr("KALI ACCEPTS THE SACRIFICE!");
            if (global.favor <= -8)
            {
                global.message = tr("KALI DEVOURS THE SACRIFICE!");
            }
            else if (global.favor < 0)
            {
                if (status == 98) global.favor += favor;
                else global.favor += favor/2;
                if (favor > 0) favor = 0;
            }
            else
            {
                if (status == 98) global.favor += favor;
                else global.favor += favor/2;
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

// moving projectile
if (status == 98)
{
    if ((abs(xVel) > 2 or abs(yVel) > 2))
    {
        obj = collision_rectangle(x, y, x+16, y+16, oEnemy, false, true);
        if (obj)
        {
            if (not obj.invincible and obj.type != "Magma Man")
            {
                if (obj.status < 98) obj.xVel = xVel;
                with obj
                {
                    if (type == "Caveman" or type == "ManTrap" or type == "Vampire" or type == "Yeti" or type == "Hawkman")
                    {
                        if (status < STUNNED)
                        {
                            if (type == "Caveman" or type == "Vampire" or type == "Yeti" or type == "Hawkman")
                            {
                                scrCreateBlood(x+8, y+8, 1);
                            }
                            else if (type == "ManTrap")
                            {
                                instance_create(x+rand(0,16), y-8+rand(0,16), oLeaf);
                            }
                            hp -= 1;
                            status = STUNNED;
                            counter = stunTime;
                            yVel = -6;
                            playSound(global.sndHit);
                        }
                    }
                    else if (type == "Shopkeeper")
                    {
                        if (status < 98)
                        {
                            scrCreateBlood(x, y, 1);
                            hp -= 1;
                            yVel = -6;
                            status = 2;
                            playSound(global.sndHit);
                        }
                    }
                    else if (type == "Giant Spider")
                    {
                        if (whipped == 0)
                        {
                            scrCreateBlood(x+16, y+24, 1);
                            hp -= 1;
                            whipped = 10;
                            playSound(global.sndHit);
                        }
                    }
                    else if (type == "Tomb Lord")
                    {
                        if (whipped == 0)
                        {
                            scrCreateBlood(x+16, y+16, 1);
                            hp -= 1;
                            whipped = 20;
                            playSound(global.sndHit);
                        }
                    }
                    else if (type == "Alien Boss")
                    {
                        if (status != 99 and sprite_index != sAlienBossHurt)
                        {
                            scrCreateBlood(x+8, y+8, 1);
                            hp -= 1;
                            sprite_index = sAlienBossHurt;
                            image_speed = 0.8;
                            playSound(global.sndHit);
                        }
                    }
                    else if (type == "UFO")
                    {
                        instance_create(x+8, y+8, oExplosion);
                        playSound(global.sndExplosion);
                        if (rand(1,3) == 1) instance_create(x+8, y+8, oAlienEject);
                        global.ufos += 1;
                        global.kills += 1;
                        instance_destroy();
                    }
                    else
                    {
                        scrCreateBlood(x+8, y+8, 1);
                        hp -= 1;
                        origX = x;
                        origY = y;
                        playSound(global.sndHit);
                    }
                    
                }
                // obj.xVel = xVel * 0.3;
                
                if (type == "Arrow" or type == "Fish Bone") instance_destroy();
            }
        }
    }
}
}
else active = false;
/* */
/*  */
