if ((x > __view_get( e__VW.XView, 0 )-16 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+16 and
    y > __view_get( e__VW.YView, 0 )-16 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+16) or
    type == "Rope")
{
    if (global.hasSpectacles) depth = 51;
    else depth = 101;

    if ((not instance_exists(oShopkeeper) or
        global.thiefLevel > 0 or
        global.murderer) and cost > 0)
    {
        if (isRealLevel()) global.itemsStolen += 1;
        cost = 0;
        forSale = false;
    }

    // stealing makes shopkeeper angry
    if (isRealLevel())
    {
        if (cost > 0 and forSale and not isInShop(x, y))
        {
            global.itemsStolen += 1;
            scrShopkeeperAnger(0);
            cost = 0;
        }
    }
    else if (isLevel())
    {
        if (cost > 0 and forSale and not isInShop(x, y))
        {
            scrShopkeeperAnger(0);
            cost = 0;
        }
    }
    else cost = 0;

    if (held)
    {
        xVel = 0;
        yVel = 0;
        if (oPlayer1.facing == LEFT) x = oPlayer1.x - 4;  
        if (oPlayer1.facing == RIGHT) x = oPlayer1.x + 4;
    
        if (heavy)
        {
            if (type == "Gold Idol" or type == "Crystal Skull" or type == "Lamp" or type == "Damsel")
            {
                if (oPlayer1.state == DUCKING and abs(oPlayer1.xVel) < 2) y = oPlayer1.y+2;
                else y = oPlayer1.y;
            }
            else
            {
                if (oPlayer1.state == DUCKING and abs(oPlayer1.xVel) < 2) y = oPlayer1.y-2;
                else y = oPlayer1.y-4;
            }
        }
        else
        {
            if (oPlayer1.state == DUCKING and abs(oPlayer1.xVel) < 2) y = oPlayer1.y + 4;
            else y = oPlayer1.y+2;  
        }
        depth = 1;
    
        if (oPlayer1.holdItem == 0)
        {
            held = false;
        }
    }
    else if (not collision_point(x, y, oSolid, 0, 0))
    {
        moveTo(xVel, yVel);

        colLeft = false;
        colRight = false;
        colBot = false;
        colTop = false;
        if (isCollisionLeft(1)) colLeft = true;
        if (isCollisionRight(1)) colRight = true;
        if (isCollisionBottom(1)) colBot = true;
        if (isCollisionTop(1)) colTop = true;

        if (not colLeft and not colRight) stuck = false;
        
        if (not colBot and not stuck) yVel += myGrav;
        if (yVel > 8) yVel = 8;
    
        if (colLeft or colRight)
        {
            xVel = -xVel * 0.5;
            myGrav = 0.6;
        }
    
        if (colBot)
        {
            myGrav = 0.6;
        
            // bounce
            if (yVel > 1) yVel = -yVel * bounceFactor;
            else yVel = 0;
        
            // friction
            if (abs(xVel) < 0.1) xVel = 0;
            else if (abs(xVel) != 0) xVel *= frictionFactor;
        
            if (abs(yVel) < 1)
            {
                y -= 1;
                if (not isCollisionBottom(1)) y += 1;
                yVel = 0;
            }
        }
    
        if (sticky and type == "Bomb" and sprite_index = sBombArmed)
        {
            if (colLeft or colRight or colTop or colBot)
            {
                xVel = 0;
                yVel = 0;
                if (colBot and abs(yVel) < 1) y += 1;
            }    
        }
        else if (type == "Arrow" and abs(xVel) > 6)
        {
            if (colLeft)
            {
                x -= 2;
                xVel = 0;
                yVel = 0;
            }
            else if (colRight)
            {
                x += 2;
                xVel = 0;
                yVel = 0;
            }
            stuck = true;
        }
        else if (colLeft and not stuck)
        {
            if (not colRight) x += 1;
            //yVel = 0;
        }
        else if (colRight and not stuck)
        {
            x -= 1;
            //yVel = 0;
        }
    
        if (sticky and type == "Bomb" and sprite_index = sBombArmed)
        {
            // do nothing
        }
        else if (isCollisionTop(1))
        {
            if (yVel < 0) yVel = -yVel * 0.8;
            else y += 1;
            myGrav = 0.6;
        }
    
        if (collision_rectangle(x-3, y-3, x+3, y+3, oLava, 0, 0))
        {
            myGrav = 0;
            xVel = 0;
            yVel = 0;
            y += 0.05;
        }
        else
        {
            myGrav = 0.6;
        }
    
        if (collision_point(x, y-5, oLava, 0, 0) and type != "Sceptre")
        {
            if (type == "Bomb")
            {
                instance_create(x, y, oExplosion);
                repeat(3)
                {
                    instance_create(x, y, oFlame);
                }

                playSound(global.sndExplosion);
            }
            instance_destroy();
        }
    }
    else
    {
        colLeft = false;
        colRight = false;
        colBot = false;
        colTop = false;
        if (isCollisionLeft(1)) colLeft = true;
        if (isCollisionRight(1)) colRight = true;
        if (isCollisionBottom(1)) colBot = true;
        if (isCollisionTop(1)) colTop = true;
        
        if (colTop and !colBot)
        {
            y += 1;
        }
        else if (colLeft and !colRight)
        {
            x += 1;
        }
        else if (colRight and !colLeft)
        {
            x -= 1;
        }
        else
        {
            xVel = 0;
            yVel = 0;
        }
    }

    if (type == "Bomb" and sticky)
    {
        if ((abs(xVel) > 2 or abs(yVel) > 2)) {
            if (collision_rectangle(x-2, y-2, x+2, y+2, oEnemy, 0, 0)) {
                enemyID = instance_nearest(x, y, oEnemy);
                enemyID.bombID = self;
                stickyXDiff = enemyID.x-x;
                stickyYDiff = enemyID.y-y;
            } else if (collision_rectangle(x-2, y-2, x+2, y+2, oDamsel, 0, 0)) {
                enemyID = collision_rectangle(x-2, y-2, x+2, y+2, oDamsel, 0, 0);
                enemyID.bombID = self;
                stickyXDiff = enemyID.x-x;
                stickyYDiff = enemyID.y-y;
            }
        }
    }
    else if (abs(xVel) > 2 or abs(yVel) > 2)
    {
        if (collision_rectangle(x-2, y-2, x+2, y+2, oEnemy, 0, 0))
        {
            obj = instance_nearest(x, y, oEnemy);
            if (not obj.invincible and obj.type != "Magma Man")
            {
                obj.xVel = xVel;
                
                // vampires are weak to "stakes"
                if (type == "Arrow" and obj.status != 98 and obj.type == "Vampire") obj.hp -= 3;
                
                with obj
                {
                    if (type == "Caveman" or type == "ManTrap" or type == "Vampire" or type == "Yeti" or type == "Hawkman")
                    {
                        if (status != STUNNED)
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
                        if (isRealLevel()) global.enemyKills[16] += 1;
                        global.ufos += 1;
                        global.kills += 1;
                        //instance_destroy();
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
                obj.xVel = xVel * 0.3;
                
                if (type == "Arrow" and sprite_index = sBombArrowRight)
                {
                    instance_create(x, y, oExplosion);
                    if (global.graphicsHigh) scrCreateFlame(x, y, 3);
                }                

                if (type == "Arrow" or type == "Fish Bone")
                {
                    instance_destroy();
                }
            }
        }

        if (collision_rectangle(x-2, y-2, x+2, y+2, oDamsel, false, true))
        {
            obj = collision_rectangle(x-2, y-2, x+2, y+2, oDamsel, false, true);
            if (not obj.invincible and obj.status != 99 and obj.hit == 0)
            {
                if (not (obj.held and safe))
                {
                    scrCreateBlood(obj.x, obj.y, 1);
                    with obj
                    {
                        if (held)
                        {
                            held = false;
                            with oPlayer1 { holdItem = 0; pickupItemType = ""; }
                        }
                        hp -= 1;
                        yVel = -6;
                        status = 2;
                        counter = 120;
                        hit = 10;
                    }
                    obj.xVel = xVel * 0.3;
                    
                    if (type == "Arrow" or type == "Fish Bone") instance_destroy();
                
                    playSound(global.sndHit);
                
                    if (obj.forSale)
                    {
                        scrShopkeeperAnger(3);
                    }
                }
            }
        }
    }
}

