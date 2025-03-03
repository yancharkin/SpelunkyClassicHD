destroy = false;
colTop = false;
colLeft = false;
colRight = false;
colBot = false;
if (held)
{
    if (oCharacter.facing == LEFT)
    {
        x = oCharacter.x - 4;  
    }
    else if (oCharacter.facing == RIGHT)
    {
        x = oCharacter.x + 4;  
    }
    
    if (oCharacter.state == DUCKING and abs(oCharacter.xVel) < 2) y = oCharacter.y + 4;
    else y = oCharacter.y;  
    depth = 1;
}
else
{
    moveTo(xVel, yVel);

    if (yVel < 6)
    {
        yVel += myGrav;
    }
    
    if (isCollisionTop(1)) colTop = true;    
    if (isCollisionLeft(1)) colLeft = true;
    if (isCollisionRight(1)) colRight = true;
    if (isCollisionBottom(1)) colBot = true;

    if (colTop and yVel < 0)
    {
        if (yVel < -3) destroy = true;
        yVel = -yVel * 0.8;
    }
    
    if (colLeft or colRight)
    {
        if (abs(xVel) > 3) destroy = true;
        xVel = -xVel * 0.5;
    }
    
    if (collision_point(x, y, oSolid, 0, 0)) destroy = true;
    
    if (colBot)
    {
        if (yVel > 3) destroy = true;
    
        // bounce
        if (yVel > 1) yVel = -yVel * 0.5;
        else yVel = 0;
        
        // friction
        if (abs(xVel) < 0.1) xVel = 0;
        else if (abs(xVel) != 0) xVel *= 0.3;
    }
    
    if (colLeft)
    {
        if (not colRight) x += 1;
        yVel = 0;
    }
    else if (colRight)
    {
        x -= 1;
        yVel = 0;
    }
    
    if (isCollisionBottom(0) and abs(yVel) < 1)
    {
        y -= 1;
        yVel = 0;
    }

    depth = 100;
    
    if (collision_rectangle(x-3, y-3, x+3, y+3, oLava, 0, 0))
    {
        myGrav = 0;
        xVel = 0;
        yVel = 0;
        y += 0.05;
    }
    if (collision_point(x, y-5, oLava, 0, 0))
    {
        if (type == "Bomb")
        {
            instance_create(x, y, oExplosion);
            for (i = 0; i < 3; i += 1)
            {
                instance_create(x, y, oFlame);
            }

            playSound(global.sndExplosion);
        }
        instance_destroy();
    }
}

if (collision_rectangle(x-3, y-3, x+3, y+3, oEnemy, 0, 0) and (abs(xVel) > 2 or abs(yVel) > 2))
{
    enemy = instance_nearest(x, y, oEnemy);
    if (not enemy.invincible)
    {
        enemy.xVel = xVel;
        with enemy
        {
            if (type == "Caveman" or type == "ManTrap" or type == "Yeti" or type == "Hawkman" or type == "Shopkeeper")
            {
                if (status != 98)
                {
                    if (type == "Caveman" or type == "Yeti" or type == "Hawkman" or type == "Shopkeeper")
                    {
                        for (i = 0; i < 1; i += 1)
                        {
                            instance_create(x, y, oBlood);
                        }
                    }
                    status = STUNNED;
                    counter = stunTime;
                    yVel = -6;
                    playSound(global.sndHit);
                }
            }
            else
            {
                instance_create(x+8, y+8, oBlood);
                hp -= 1;
                origX = x;
                origY = y;
                shakeCounter = 10;
                playSound(global.sndHit);
            }
        }
        enemy.xVel = xVel * 0.3;
        
        if (type == "Arrow" or type == "Fish Bone")
            instance_destroy();
    }
    
    destroy = true;
}

if (type != "Damsel" and collision_rectangle(x-3, y-3, x+3, y+3, oDamsel, 0, 0) and (abs(xVel) > 2 or abs(yVel) > 2))
{
    enemy = instance_nearest(x, y, oDamsel);
    if (not enemy.invincible and (abs(xVel) > 1 or abs(yVel) > 1))
    {
        for (i = 0; i < 1; i += 1)
        {
            instance_create(x, y, oBlood);
        }
    }
    with enemy
    {
        if (held) held = false;
        with oPlayer1 { holdItem = 0; }
        hp -= 1;
        yVel = -6;
        status = 2;
        counter = 120;
    }
    enemy.xVel = xVel * 0.3;
        
    destroy = true;
}

if (destroy)
{
    if (held)
    {
        oPlayer1.holdItem = 0;
        oPlayer1.pickupItemType = "";
    }
    instance_destroy();
}
