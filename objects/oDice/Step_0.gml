if ((x > __view_get( e__VW.XView, 0 )-16 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+16 and
        y > __view_get( e__VW.YView, 0 )-16 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+16))
{
    if (cost > 0 and
        not instance_exists(oShopkeeper))
    {
        cost = 0;
    }

    // stealing makes shopkeeper angry
    if (isLevel())
    {
        if (not isInShop(x, y))
        {
            scrShopkeeperAnger(0);
        }
    }

    if (held)
    {
        if (oCharacter.facing == LEFT) x = oCharacter.x - 4;  
        else if (oCharacter.facing == RIGHT) x = oCharacter.x + 4;  
	    
        if (heavy)
        {
            if (oCharacter.state == DUCKING and abs(oCharacter.xVel) < 2) y = oCharacter.y;
            else y = oCharacter.y-2;  
        }
        else
        {
            if (oCharacter.state == DUCKING and abs(oCharacter.xVel) < 2) y = oCharacter.y + 4;
            else y = oCharacter.y+2;  
        }
        depth = 1;
	    
        if (oCharacter.holdItem == 0)
        {
            held = false;
        }
    }
    else
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

        if (not colBot and yVel < 6) yVel += myGrav;
	    
        if (colLeft or colRight) xVel = -xVel * 0.5;
	    
        if (colBot)
        {
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
	    
        if (colLeft)
        {
            if (not colRight) x += 1;
            //yVel = 0;
        }
        else if (colRight)
        {
            x -= 1;
            //yVel = 0;
        }
	    
        if (isCollisionTop(1))
        {
            if (yVel < 0) yVel = -yVel * 0.8;
            else y += 1;
        }

        if (global.hasSpectacles) depth = 0;
        else depth = 101;
	    
        if (collision_rectangle(x-3, y-3, x+3, y+3, oLava, 0, 0))
        {
            myGrav = 0;
            xVel = 0;
            yVel = 0;
            y += 0.05;
        }
    
        if (collision_point(x, y-5, oLava, 0, 0))
        {
            instance_destroy();
        }
    }

    if ((abs(xVel) > 3 or abs(yVel) > 3))
    {
        if (collision_rectangle(x-2, y-2, x+2, y+2, oEnemy, 0, 0))
        {
            obj = instance_nearest(x, y, oEnemy);
            if (not obj.invincible and obj.type != "Magma Man")
            {
                obj.xVel = xVel;
                with obj
                {
                    if (type == "Caveman" or type == "ManTrap" or type == "Yeti" or type == "Hawkman")
                    {
                        if (status != STUNNED)
                        {
                            if (type == "Caveman" or type == "Yeti" or type == "Hawkman")
                            {
                                instance_create(x, y, oBlood);
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
                            instance_create(x, y, oBlood);
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
                            instance_create(x+16, y+24, oBlood);
                            hp -= 1;
                            whipped = 10;
                            playSound(global.sndHit);
                        }
                    }
                    else if (type == "Alien Boss")
                    {
                        if (status != 99 and sprite_index != sAlienBossHurt)
                        {
                            instance_create(x+8, y+8, oBlood);
                            hp -= 1;
                            sprite_index = sAlienBossHurt;
                            image_speed = 0.8;
                            playSound(global.sndHit);
                        }
                    }
                    else
                    {
                        instance_create(x+8, y+8, oBlood);
                        hp -= 1;
                        origX = x;
                        origY = y;
                        playSound(global.sndHit);
                    }
                    
                }
                obj.xVel = xVel * 0.3;
            }
        }

        if (collision_rectangle(x-2, y-2, x+2, y+2, oDamsel, 0, 0))
        {
            obj = instance_nearest(x, y, oDamsel);
            if (not obj.invincible and obj.status != 2 and obj.status != 99)
            {
                instance_create(x, y, oBlood);
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
                }
                obj.xVel = xVel * 0.3;
                
                playSound(global.sndHit);
            }
        }
    }
}

if (abs(yVel) > 2 or abs(xVel) > 2)
{
    sprite_index = sDiceRoll;
    value = rand(1,6);
    if (oPlayer1.bet > 0) rolling = true;
}
else if (isCollisionBottom(1))
{
    if (rolling and yVel == 0)
    {
        if (rolled) scrShopkeeperAnger(0); // NO CHEATING!
        rolled = true;
        rolling = false;
    }
    if (value == 1) sprite_index = sDice1;
    else if (value == 2) sprite_index = sDice2;
    else if (value == 3) sprite_index = sDice3;
    else if (value == 4) sprite_index = sDice4;
    else if (value == 5) sprite_index = sDice5;
    else sprite_index = sDice6;
}
