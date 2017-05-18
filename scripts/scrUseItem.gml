//
// scrUseItem()
//
// Use currently held item.  Must be called by oPlayer1.
//

/**********************************************************************************
    Copyright (c) 2008, 2009 Derek Yu and Mossmouth, LLC
    
    This file is part of Spelunky.

    You can redistribute and/or modify Spelunky, including its source code, under
    the terms of the Spelunky User License.

    Spelunky is distributed in the hope that it will be entertaining and useful,
    but WITHOUT WARRANTY.  Please see the Spelunky User License for more details.

    The Spelunky User License should be available in "Game Information", which
    can be found in the Resource Explorer, or as an external file called COPYING.
    If not, please obtain a new copy of Spelunky from <http://spelunkyworld.com/>
    
***********************************************************************************/

        if (holdItem.sprite_index = sBomb)
        {
            holdItem.sprite_index = sBombArmed;
            holdItem.armed = true; 
            with holdItem
            {
                alarm[0] = 80;
                image_speed = 0.2;
            }
            
            //global.bombs -= 1;
        }
        else if (holdItem.sprite_index = sRopeEnd)
        {
            if (not kDown and colTop)
            {
              // do nothing
            }
            else
            {
            holdItem.held = false;
            holdItem.armed = true; 
            
            holdItem.px = x;
            holdItem.py = y;
            
            if (kDown)
            {
                if (facing == LEFT)
                {
                    obj = instance_create(x-16, y, oRopeThrow);
                }
                else
                {
                    obj = instance_create(x+16, y, oRopeThrow);
                }
                with obj
                {
                    t = true;
                    move_snap(16, 1);
                    if (oPlayer1.x < x and not collision_point(oPlayer1.x+2, oPlayer1.y, oSolid, 0, 0))
                    {
                        if (not collision_rectangle(x-8, y, x-7, y+16, oSolid, 0, 0))
                        {
                            x -= 8;
                        }
                        else if (not collision_rectangle(x+7, y, x+8, y+16, oSolid, 0, 0))
                        {
                            x += 8;
                        }
                        else t = false;
                    }
                    else if (not collision_point(oPlayer1.x-2, oPlayer1.y, oSolid, 0, 0))
                    {
                        if (not collision_rectangle(x+7, y, x+8, y+16, oSolid, 0, 0))
                        {
                            x += 8;
                        }
                        else if (not collision_rectangle(x-8, y, x-7, y+16, oSolid, 0, 0))
                        {
                            x -= 8;
                        }
                        else t = false;
                    }
                    
                    if (not t)
                    {
                        obj = oPlayer1.holdItem;
                        obj = instance_create(obj.x, obj.y, oRopeThrow);
                        if (oPlayer1.facing == 18) obj.xVel = -3.2;
                        else obj.xVel = 3.2;
                        obj.yVel = 0.5;
                        instance_destroy();
                    }
                    else
                    {
                        instance_create(x, y, oRopeTop);
                        armed = false;
                        falling = true;
                        xVel = 0;
                        yVel = 0;
                    }
                }
                with holdItem { instance_destroy(); }
                holdItem = 0;
            }
            else
            {
                holdItem.x = x;
                holdItem.xVel = 0;
                holdItem.yVel = -12;
            }
            
            scrHoldItem(pickupItemType);
            playSound(global.sndThrow);
            }
        }
        else if (holdItem.type == "Machete")
        {
            if (kDown and not whipping)
            {
                if (scrPlayerIsDucking())
                {
                    holdItem.held = false;
                    holdItem.safe = true;
                    holdItem.alarm[2] = 10;
            
                    if (facing == LEFT)
                    {
                        if (holdItem.heavy) holdItem.xVel = -4 + xVel;
                        else holdItem.xVel = -8 + xVel;
                    }
                    else if (facing == RIGHT)
                    {
                        if (holdItem.heavy) holdItem.xVel = 4 + xVel;
                        else holdItem.xVel = 8 + xVel;
                    }
                
                    holdItem.xVel *= 0.4;
                    holdItem.yVel = 0.5;
                    
                    holdItem = 0;
                }
            }
            if (not scrPlayerIsDucking() and not whipping)
            {
                image_speed = 1;
                if (global.isTunnelMan)
                {
                    sprite_index = sTunnelAttackL;
                }
                else if (global.isDamsel)
                {
                    sprite_index = sDamselAttackL;
                }
                else
                {
                    sprite_index = sAttackLeft;
                }
                image_index = 0;
                whipping = true;
                holdItem.visible = false;
            }
        }
        else if (holdItem.type == "Mattock")
        {
            if (kDown and not whipping)
            {
                if (scrPlayerIsDucking())
                {
                    holdItem.held = false;
                    holdItem.safe = true;
                    holdItem.alarm[2] = 10;
            
                    if (facing == LEFT)
                    {
                        if (holdItem.heavy) holdItem.xVel = -4 + xVel;
                        else holdItem.xVel = -8 + xVel;
                    }
                    else if (facing == RIGHT)
                    {
                        if (holdItem.heavy) holdItem.xVel = 4 + xVel;
                        else holdItem.xVel = 8 + xVel;
                    }
                
                    holdItem.xVel *= 0.4;
                    holdItem.yVel = 0.5;
                    
                    holdItem = 0;
                }
            }
            if (not scrPlayerIsDucking() and not whipping and platformCharacterIs(ON_GROUND))
            {
                image_speed = 0.2;
                if (global.isTunnelMan)
                {
                    sprite_index = sTunnelAttackL;
                }
                else if (global.isDamsel)
                {
                    sprite_index = sDamselAttackL;
                }
                else
                {
                    sprite_index = sAttackLeft;
                }
                image_index = 0;
                whipping = true;
                cantJump = 20;
                holdItem.visible = false;
            }
        }
        else if (holdItem.type == "Pistol")
        {
            if (kDown)
            {
                if (scrPlayerIsDucking())
                {
                    holdItem.held = false;
                    holdItem.safe = true;
                    holdItem.alarm[2] = 10;
            
                    if (facing == LEFT)
                    {
                        if (holdItem.heavy) holdItem.xVel = -4 + xVel;
                        else holdItem.xVel = -8 + xVel;
                    }
                    else if (facing == RIGHT)
                    {
                        if (holdItem.heavy) holdItem.xVel = 4 + xVel;
                        else holdItem.xVel = 8 + xVel;
                    }
                
                    holdItem.xVel *= 0.4;
                    holdItem.yVel = 0.5;
                    
                    holdItem = 0;
                }
            }
            if (not scrPlayerIsDucking())
            {
            if (facing == LEFT and firing == 0)
            {
                instance_create(x-9, y+1, oShotgunBlastLeft);
                obj = instance_create(x-9, y-2, oBullet);
                obj.xVel = (-1 * rand(6,8)) + xVel;
                if (obj.xVel >= -6) obj.xVel = -6;
                obj.yVel = 0;
                if (state != HANGING and state != CLIMBING)
                {
                    yVel -= 1;
                    xVel += 1;
                }
                playSound(global.sndShotgun);
                firing = firingPistolMax;
            }
            else if (facing == RIGHT and firing == 0)
            {
                instance_create(x+8, y+1, oShotgunBlastRight);
                obj = instance_create(x+8, y-2, oBullet);
                obj.xVel = rand(6,8) + xVel;
                if (obj.xVel < 6) obj.xVel = 6;
                obj.yVel = 0;
                if (state != HANGING and state != CLIMBING)
                {
                    yVel -= 1;
                    xVel -= 1;
                }
                playSound(global.sndShotgun);
                firing = firingPistolMax;
            }}
        }
        else if (holdItem.type == "Sceptre")
        {
            if (kDown)
            {
                if (scrPlayerIsDucking())
                {
                    holdItem.held = false;
                    holdItem.safe = true;
                    holdItem.alarm[2] = 10;
            
                    if (facing == LEFT)
                    {
                        if (holdItem.heavy) holdItem.xVel = -4 + xVel;
                        else holdItem.xVel = -8 + xVel;
                    }
                    else if (facing == RIGHT)
                    {
                        if (holdItem.heavy) holdItem.xVel = 4 + xVel;
                        else holdItem.xVel = 8 + xVel;
                    }
                
                    holdItem.xVel *= 0.4;
                    holdItem.yVel = 0.5;
                    
                    holdItem = 0;
                }
            }
            if (not scrPlayerIsDucking())
            {
            if (facing == LEFT and firing == 0)
            {
                repeat(3)
                {
                    obj = instance_create(x-12, y+4, oPsychicCreateP);
                    obj.xVel = -rand(1,3);
                    obj.yVel = -random(2);
                }
                obj = instance_create(x-12, y-2, oPsychicWaveP);
                obj.xVel = -6;
                playSound(global.sndPsychic);
                firing = firingPistolMax;
            }
            else if (facing == RIGHT and firing == 0)
            {
                repeat(3)
                {
                    obj = instance_create(x+12, y+4, oPsychicCreateP);
                    obj.xVel = rand(1,3);
                    obj.yVel = -random(2);
                }
                obj = instance_create(x+12, y-2, oPsychicWaveP);
                obj.xVel = 6;
                playSound(global.sndPsychic);
                firing = firingPistolMax;
            }}
        }
        else if (holdItem.type == "Web Cannon")
        {
            if (kDown)
            {
                if (scrPlayerIsDucking())
                {
                    holdItem.held = false;
                    holdItem.safe = true;
                    holdItem.alarm[2] = 10;
            
                    if (facing == LEFT)
                    {
                        if (holdItem.heavy) holdItem.xVel = -4 + xVel;
                        else holdItem.xVel = -8 + xVel;
                    }
                    else if (facing == RIGHT)
                    {
                        if (holdItem.heavy) holdItem.xVel = 4 + xVel;
                        else holdItem.xVel = 8 + xVel;
                    }
                
                    holdItem.xVel *= 0.4;
                    holdItem.yVel = 0.5;
                    
                    holdItem = 0;
                }
            }
            if (not scrPlayerIsDucking())
            {
            if (facing == LEFT and firing == 0)
            {
                instance_create(x-12, y, oShotgunBlastLeft);
                for (i = 0; i < 1; i+= 1)
                {
                    obj = instance_create(x-12, y-2, oWebBall);
                    obj.xVel = (-1 * rand(6,8)) + xVel;
                    if (obj.xVel >= -6) obj.xVel = -6;
                    obj.yVel = 0;
                }
                if (state != HANGING and state != CLIMBING)
                {
                    yVel -= 1;
                    xVel += 1;
                }
                playSound(global.sndShotgun);
                firing = firingPistolMax;
            }
            else if (facing == RIGHT and firing == 0)
            {
                instance_create(x+12, y, oShotgunBlastRight);
                for (i = 0; i < 1; i+= 1)
                {
                    obj = instance_create(x+12, y-2, oWebBall);
                    obj.xVel = rand(6,8) + xVel;
                    if (obj.xVel < 6) obj.xVel = 6;
                    obj.yVel = 0;
                }
                if (state != HANGING and state != CLIMBING)
                {
                    yVel -= 1;
                    xVel -= 1;
                }
                playSound(global.sndShotgun);
                firing = firingPistolMax;
            }}
        }
        else if (holdItem.type == "Teleporter")
        {
            if (kDown)
            {
                if (scrPlayerIsDucking())
                {
                    holdItem.held = false;
                    holdItem.safe = true;
                    holdItem.alarm[2] = 10;
            
                    if (facing == LEFT)
                    {
                        if (holdItem.heavy) holdItem.xVel = -4 + xVel;
                        else holdItem.xVel = -8 + xVel;
                    }
                    else if (facing == RIGHT)
                    {
                        if (holdItem.heavy) holdItem.xVel = 4 + xVel;
                        else holdItem.xVel = 8 + xVel;
                    }
                
                    holdItem.xVel *= 0.4;
                    holdItem.yVel = 0.5;
                    
                    holdItem = 0;
                }
            }
            else
            {
                if (kUp)
                {
                    tx = x;
                    ty = y - (16*rand(4,8));
                    while (ty < 16) { ty += 16; }   
                }
                else if (not scrPlayerIsDucking())
                {
                    if (facing == LEFT and firing == 0)
                    {
                        tx = x - (16*rand(4,8));
                        ty = y;
                        if (tx < 8) tx = 8;
                    }
                    else if (facing == RIGHT and firing == 0)
                    {
                        tx = x + (16*rand(4,8));
                        ty = y;
                        if (tx > room_width - 8) tx = room_width - 8;
                    }
                }
                n = 0;
                while (collision_rectangle(tx-4, ty-4, tx+4, ty+4, oSolid, 0, 0) and n < 3 and ty > 16)
                {
                    ty -= 16;
                    n += 1;
                }
                repeat(3)
                {
                    instance_create(x-4+rand(0,8), y-4+rand(0,8), oFlareSpark);
                }
                if (y < 8) y = 8;
                x = tx;
                y = ty;
                with oBall
                {
                    x = oPlayer1.x;
                    y = oPlayer1.y;
                }
                with oChain
                {
                    x = oPlayer1.x;
                    y = oPlayer1.y;
                }
                // state = STANDING;
                obj = instance_place(x, y, oEnemy);
                if (obj)
                {
                    with obj
                    {
                        scrCreateBlood(oPlayer1.x, oPlayer1.y, 3);
                        hp -= 99;
                        instance_destroy();
                    }
                }
                playSound(global.sndTeleport);
                with oPlayer1
                {
                    state = 16;
                }
            }
        }
        else if (holdItem.type == "Bow")
        {
            if (kDown)
            {
                if (scrPlayerIsDucking())
                {
                    holdItem.held = false;
                    holdItem.safe = true;
                    holdItem.alarm[2] = 10;
            
                    if (facing == LEFT)
                    {
                        if (holdItem.heavy) holdItem.xVel = -4 + xVel;
                        else holdItem.xVel = -8 + xVel;
                    }
                    else if (facing == RIGHT)
                    {
                        if (holdItem.heavy) holdItem.xVel = 4 + xVel;
                        else holdItem.xVel = 8 + xVel;
                    }
                
                    holdItem.xVel *= 0.4;
                    holdItem.yVel = 0.5;
                    
                    holdItem = 0;
                }
            }
            else if (not scrPlayerIsDucking() and
                firing == 0 and not bowArmed and global.arrows > 0)
            {
                bowArmed = true;
                playSound(global.sndBowPull);
            }
            else if (global.arrows <= 0)
            {
                global.message = "I'M OUT OF ARROWS!";
                global.message2 = "";
                global.messageTimer = 80;
            }
        }
        else if (holdItem.type == "Shotgun")
        {
            if (kDown)
            {
                if (scrPlayerIsDucking())
                {
                    holdItem.held = false;
                    holdItem.safe = true;
                    holdItem.alarm[2] = 10;
            
                    if (facing == LEFT)
                    {
                        if (holdItem.heavy) holdItem.xVel = -4 + xVel;
                        else holdItem.xVel = -8 + xVel;
                    }
                    else if (facing == RIGHT)
                    {
                        if (holdItem.heavy) holdItem.xVel = 4 + xVel;
                        else holdItem.xVel = 8 + xVel;
                    }
                
                    holdItem.xVel *= 0.4;
                    holdItem.yVel = 0.5;
                    
                    holdItem = 0;
                }
            }
            if (not scrPlayerIsDucking())
            {
            if (facing == LEFT and firing == 0)
            {
                instance_create(x-9, y+1, oShotgunBlastLeft);
                repeat(6)
                {
                    obj = instance_create(x-9, y-2, oBullet);
                    obj.xVel = (-1 * rand(6,8)) + xVel;
                    if (obj.xVel >= -6) obj.xVel = -6;
                    obj.yVel = random(1) - random(1);
                }
                if (state != HANGING and state != CLIMBING)
                {
                    yVel -= 1;
                    xVel += 3;
                }
                playSound(global.sndShotgun);
                firing = firingShotgunMax;
            }
            else if (facing == RIGHT and firing == 0)
            {
                instance_create(x+8, y+1, oShotgunBlastRight);
                repeat(6)
                {
                    obj = instance_create(x+8, y-2, oBullet);
                    obj.xVel = rand(6,8) + xVel;
                    if (obj.xVel < 6) obj.xVel = 6;
                    obj.yVel = random(1) - random(1);
                }
                if (state != HANGING and state != CLIMBING)
                {
                    yVel -= 1;
                    xVel -= 3;
                }
                playSound(global.sndShotgun);
                firing = firingShotgunMax;
            }}
        }
        else
        {
            if (holdItem.type == "Damsel")
            {
                holdItem.status = 2;
                holdItem.counter = holdItem.stunMax;
                holdItem.y -= 4;
                playSound(global.sndDamsel);
            }
        
            holdItem.held = false;
            holdItem.safe = true;
            holdItem.alarm[2] = 10;
            
            if (facing == LEFT)
            {
                if (holdItem.heavy) holdItem.xVel = -4 + xVel;
                else holdItem.xVel = -8 + xVel;
                if (collision_point(x-8, y, oSolid, 0, 0)) // prevent getting stuck in wall
                {
                    holdItem.x += 8;
                }
            }
            else if (facing == RIGHT)
            {
                if (holdItem.heavy) holdItem.xVel = 4 + xVel;
                else holdItem.xVel = 8 + xVel;
                if (collision_point(x+8, y, oSolid, 0, 0)) // prevent getting stuck in wall
                {
                    holdItem.x -= 8;
                }
            }
            
            if (holdItem.heavy) holdItem.yVel = -2;
            else holdItem.yVel = -3;
    
            if (kUp)
            {
                if (holdItem.heavy) holdItem.yVel = -4;
                else holdItem.yVel = -9;
            }
            
            if (kDown)
            {
                if (platformCharacterIs(ON_GROUND))
                {
                    holdItem.y -= 2;
                    holdItem.xVel *= 0.6;
                    holdItem.yVel = 0.5;
                }
                else holdItem.yVel = 3;
            }
            else if (not global.hasMitt)
            {
                if (facing == LEFT)
                {
                    if (collision_point(x-8, y-10, oSolid, 0, 0))
                    {
                       holdItem.yVel = 0; 
                       holdItem.xVel -= 1;
                    }
                }
                else if (facing == RIGHT)
                {
                    if (collision_point(x+8, y-10, oSolid, 0, 0))
                    {
                       holdItem.yVel = 0;
                       holdItem.xVel += 1;
                    }
                }
            }
            
            if (global.hasMitt and not scrPlayerIsDucking())
            {
                if (holdItem.xVel < 0) holdItem.xVel -= 6;
                else holdItem.xVel += 6;
            
                if (not kUp and not kDown) holdItem.yVel = -0.4;
                else if (kDown) holdItem.yVel = 6;
                
                holdItem.myGrav = 0.1;
            }
            
            if (holdItem.sprite_index == sBombArmed) scrHoldItem(pickupItemType);
            else holdItem = 0;
            playSound(global.sndThrow);
        }
        // DFK added brackets, it was getting a null for holdItem on the y set
        if (kDown and holdItem) {
            holdItem.x = x; 
            holdItem.y = y;
        }
        if (holdItem == 0) pickupItemType = "";
