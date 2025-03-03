action_inherited();
if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+4 and
     y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+4))
{
moveTo(xVel,yVel);

if (not held) yVel += myGrav;
if (yVel > 8) yVel = 8;

colLeft = false;
colRight = false;
colBot = false;
colTop = false;
if (isCollisionLeft(1)) colLeft = true;
if (isCollisionRight(1)) colRight = true;
if (isCollisionBottom(1)) colBot = true;
if (isCollisionTop(1)) colTop = true;

if (colBot and status != STUNNED) yVel = 0;

if (throwCount > 0) throwCount -= 1;

// crushed
if (status >= STUNNED)
{
    if (collision_point(x+8, y+12, oSolid, 0, 0))
    {
        scrCreateBlood(x+8, y+8, 3);
        playSound(global.sndCavemanDie);
        if (hp > 0)
        {
            if (isRealLevel()) global.enemyKills[19] += 1;
            global.shopkeepers += 1;
            global.kills += 1;
        }
        global.murderer = true;
        instance_destroy();
    }
}
else if (not held and collision_point(x+8, y+8, oSolid, 0, 0))
{
    scrCreateBlood(x+8, y+8, 3);
    playSound(global.sndCavemanDie);
    if (hp > 0)
    {
        if (isRealLevel()) global.enemyKills[19] += 1;
        global.shopkeepers += 1;
        global.kills += 1;
    }
    global.murderer = true;
    if (hasGun)
    {
        obj = instance_create(x+8, y+8, oShotgun);
        obj.yVel = rand(4,6);
        if (xVel < 0) obj.xVel = -1 * rand(4,6);
        else obj.xVel = rand(4,6);
        obj.cost = 0;
        obj.forSale = false;
        hasGun = false;
    }
    instance_destroy();
}

if (status != DEAD and status != STUNNED and hp < 1)
{
    status = DEAD;
}

dist = distance_to_object(oPlayer1);    

if (status == IDLE or status == FOLLOW)
{
    if (oPlayer1.holdItem > 0)
    {
        item = oPlayer1.holdItem;
        if (item.cost > 0)
        {
            global.message = item.buyMessage;
            global.message2[0] = tr("PRESS ");
            if (global.touchControlsVisibility > 0) {
                global.message2[1] = "$";               
            } else if (global.gamepadOn) {
                global.message2[1] = scrGetJoy(global.joyPayVal);
            } else {
                global.message2[1] = scrGetKey(global.keyPayVal);
            }
            global.message2[2] = tr(" TO PURCHASE.");
            global.message2Highlights[0] = 1;
            global.messageTimer = 200;
        }
    }
}

if ((status == PATROL or status == WALK))
{
    if (not oPlayer1.dead and distance_to_object(oPlayer1) < 64 and oPlayer1.y - (y+8) < 16)
    {
        status = ATTACK;
    }
    else if (abs(oPlayer1.x-(x+8)) < 4)
    {
        status = ATTACK;
    }
}

if (status == IDLE)
{
    bounced = false;
    
    if (colLeft)
    {
        x += 1;
    }
    if (colRight)
    {
        x -= 1;
    }
    if (colLeft and colRight) status = ATTACK;
    
    if (oPlayer1.x < x+8) facing = LEFT;
    else facing = RIGHT;
    
    if (yVel < 0 and colTop)
    {
        yVel = 0;
    }
    
    if (global.murderer or global.thiefLevel > 0)
    {
        status = PATROL;
    }
    else if (not welcomed and (scrGetRoomX(oPlayer1.x) == scrGetRoomX(x) and scrGetRoomY(oPlayer1.y) == scrGetRoomY(y)))
    {
        if (style == tr("BOMB")) global.message = tr("WELCOME TO ") + scrGetName() + tr("'S BOMB SHOP!");
        else if (style == "Weapon") global.message = tr("WELCOME TO ") + scrGetName() + tr("'S ARMORY!");
        else if (style == "Clothing") global.message = tr("WELCOME TO ") + scrGetName() + tr("'S CLOTHING SHOP!");
        else if (style == "Rare") global.message = tr("WELCOME TO ") + scrGetName() + tr("'S SPECIALTY SHOP!");
        else if (style == "Craps") global.message = tr("WELCOME TO ") + scrGetName() + tr("'S DICE HOUSE!");
        else if (style == "Kissing") global.message = tr("WELCOME TO ") + scrGetName() + tr("'S KISSING PARLOR!");
        else if (style == "Ankh") global.message = tr("I HAVE SOMETHING SPECIAL...");
        else global.message = tr("WELCOME TO ") + scrGetName() + tr("'S SUPPLY SHOP!");
        if (style == "Craps")
        {
            global.message2[0] = tr("PRESS ");
            if (global.touchControlsVisibility > 0) {
                global.message2[1] = "$";
            } else if (global.gamepadOn) {
                global.message2[1] = scrGetJoy(global.joyPayVal);
            } else {
                global.message2[1] = scrGetKey(global.keyPayVal);
            }
            global.message2[2] = tr(" TO BET $");
            global.message2[3] = string(betValue);
            global.message2[4] = ".";

            global.message2Highlights[0] = 1;
        }
        else if (style == "Kissing")
        {
            global.message2[0] = "$";
            global.message2[1] = string(getKissValue());
            global.message2[2] = tr(" A KISS. PRESS ");
            if (global.touchControlsVisibility > 0) {
                global.message2[3] = "$";
            } else if (global.gamepadOn) {
                global.message2[3] = scrGetJoy(global.joyPayVal);
            } else {
                global.message2[3] = scrGetKey(global.keyPayVal);
            }
            global.message2[4] = ".";
            global.message2Highlights[0] = 3;
        }
        else global.message2 = "";
        global.messageTimer = 200;
        welcomed = true;
    }
    
    ///////////////
    // CRAPS
    ///////////////
    
    if (style == "Craps")
    {
        global.diceRolled = true;
        global.diceValue = 0;
        if (instance_number(oDice) == 2 and oPlayer1.bet > 0)
        {
            with oDice
            {
                if (not rolled) global.diceRolled = false;
                global.diceValue += value;
            }
        }
        else
        {
            global.diceRolled = false;
        }
        
        if (global.diceRolled)
        {
            if (global.diceValue == 7)
            {
                if (isRealLevel()) global.diceGamesWon += 1;
                global.message = tr("YOU ROLLED A SEVEN!");
                global.message2 = tr("YOU WIN A PRIZE!");
                global.messageTimer = 200;
                oPlayer1.bet = 0;
                with oItem
                {
                    if (inDiceHouse)
                    {
                        obj = instance_create(x-4, y+6, oPoof);
                        obj.xVel = -0.4;
                        obj = instance_create(x+4, y+6, oPoof);
                        obj.xVel = 0.4;
                        scrGenerateItem(x, y, 1);
                        obj.inDiceHouse = true;
                        if (oPlayer1.x < x) x -= 32;
                        else x += 32;
                        obj = instance_create(x-4, y+6, oPoof);
                        obj.xVel = -0.4;
                        obj = instance_create(x+4, y+6, oPoof);
                        obj.xVel = 0.4;
                        cost = 0;
                        forSale = false;
                        inDiceHouse = false;
                    }
                }
            }
            else if (global.diceValue > 7)
            {
                if (isRealLevel()) global.diceGamesWon += 1;
                global.message = tr("YOU ROLLED A ") + string(global.diceValue) + "!";
                global.message2 = tr("CONGRATULATIONS! YOU WIN!");
                global.messageTimer = 200;
                global.collect += oPlayer1.bet * 2;
                global.collectCounter += 20;
                if (global.collectCounter > 100) global.collectCounter = 100;
                oPlayer1.bet = 0;
            }
            else if (global.diceValue < 7)
            {
                if (isRealLevel()) global.diceGamesLost += 1;
                global.message = tr("YOU ROLLED A ") + string(global.diceValue) + "!";
                global.message2 = tr("I'M SORRY, BUT YOU LOSE!");
                global.messageTimer = 200;
                oPlayer1.bet = 0;
            }
            global.diceRolled = false;
            with oDice { rolled = false; }
        }
    }
    else if (oPlayer1.holdItem > 0)
    {
        obj = oPlayer1.holdItem;
        if (obj.cost > 0)
        {
            if (scrGetRoomX(oPlayer1.x) == scrGetRoomX(x) and scrGetRoomY(oPlayer1.y) == scrGetRoomY(y))
            {
                status = FOLLOW;
            }
        }
    }
}
else if (status == FOLLOW)
{
    image_speed = 0.5;
    
    if (isCollisionLeft(1) or isCollisionRight(1))
    {
        if (facing == LEFT) facing = RIGHT;
        else facing = LEFT;
    }
    
    if (turnTimer > 0) turnTimer -= 1;
    else if (abs(oPlayer1.y - (y+8)) < 8 and isCollisionBottom(1) and dist > 16)
    {
        if (oPlayer1.x < x) facing = LEFT;
        else facing = RIGHT;
        turnTimer = 10;
    }
    
    i = dist/16 * 1.5;
    if (facing == LEFT)
    {
        xVel = -i;
    }
    else
    {
        xVel = i;
    }

    if (xVel < -3) xVel = -3;
    if (xVel > 3) xVel = 3;
    
    if (dist < 12 or oPlayer1.y < y) xVel = 0;
    
    if (oPlayer1.holdItem != 0)
    {
        obj = oPlayer1.holdItem;
        if (obj == 0 or obj.cost == 0)
        {
            status = IDLE;
        }
    }
    else
    {
        status = IDLE;
    }
}
else if (status == PATROL)
{
    bounced = false;
    
    if (yVel < 0 and isCollisionTop(1))
    {
        yVel = 0;
    }

    if (colBot and counter > 0) counter -= 1;    
    if (counter < 1)
    {
        facing = rand(0,1);
        status = WALK;
    }
}
else if (status == WALK)
{
    image_speed = 0.5;

    if (isCollisionLeft(1) or isCollisionRight(1))
    {
        if (facing == LEFT) facing = RIGHT;
        else facing = LEFT;
    }
    
    if (facing == LEFT)
    {
        if (not collision_point(x-1, y, oSolid, -1, -1))
        {
            status = PATROL;
            counter = rand(20,50);
            xVel = 0;
        }
        xVel = -1.5;
    }
    else
    {
        if (not collision_point(x+16, y, oSolid, -1, -1))
        {
            status = PATROL;
            counter = rand(20,50);
            xVel = 0;
        }
        xVel = 1.5;
    }
    
    if (rand(1,100) == 1)
    {
        status = PATROL;
        counter = rand(20,50);
        xVel = 0;
    }
}
else if (status == ATTACK)
{
    image_speed = 1;
    
    if (not angered)
    {
        with oItem
        {
            cost = 0;
            forSale = false;
        }
        angered = true;
    }
    
    if (turnTimer > 0) turnTimer -= 1;
    else if (abs(oPlayer1.y - (y+8)) < 8 and isCollisionBottom(1) and dist > 16)
    {
        if (oPlayer1.x < x) facing = LEFT;
        else facing = RIGHT;
        turnTimer = 20;
    }
    
    if (isCollisionLeft(1) or isCollisionRight(1))
    {
        if (facing == LEFT) facing = RIGHT;
        else facing = LEFT;
    }
    
    if (facing == LEFT) xVel = -3;
    else xVel = 3;
    
    if (hasGun)
    {
        if (firing > 0) firing -= 1;
        else if (abs(oPlayer1.y - (y+8)) < 32)
        {
            if (facing == LEFT and oPlayer1.x < x+8 and dist < 96)
            {
                instance_create(x, y+9, oShotgunBlastLeft);
                for (i = 0; i < 6; i+= 1)
                {
                    obj = instance_create(x+4, y+8, oBullet);
                    obj.xVel = (-1 * rand(6,8)) + xVel;
                    if (obj.xVel >= -6) obj.xVel = -6;
                    obj.yVel = random(1) - random(1);
                    obj.safe = true;
                    with obj { if (collision_point(x, y, oSolid, 0, 0)) instance_destroy(); }
                }
                yVel -= 1;
                xVel += 3;
                playSound(global.sndShotgun);
                firing = firingMax;
            }
            if (facing == RIGHT and oPlayer1.x > x+8 and dist < 96)
            {
                instance_create(x+16, y+9, oShotgunBlastRight);
                for (i = 0; i < 6; i+= 1)
                {
                    obj = instance_create(x+12, y+8, oBullet);
                    obj.xVel = rand(6,8) + xVel;
                    if (obj.xVel < 6) obj.xVel = 6;
                    obj.yVel = random(1) - random(1);
                    obj.safe = true;
                    with obj { if (collision_point(x, y, oSolid, 0, 0)) instance_destroy(); }
                }
                yVel -= 1;
                xVel -= 3;
                playSound(global.sndShotgun);
                firing = firingMax;
            }
        }
    }
    
    // jump
    if (oPlayer1.y > y and abs(oPlayer1.x - (x+8)) < 64)
    {
        // do nothing
    }
    else if ((facing == LEFT and collision_point(x-16, y, oSolid, -1, -1)) or
        (facing == RIGHT and collision_point(x+32, y, oSolid, -1, -1)))
    {
        if (colBot and not isCollisionTop(4)) yVel = -1 * rand(7,8);
        /*
        else
        {
            if (facing == LEFT) xVel = -1.5;
            else xVel = 1.5;
        }
        */
    }
    else if (oPlayer1.y <= y+16 and 
             ((facing == LEFT and not collision_point(x-16, y+16, oSolid, -1, -1)) or
             (facing == RIGHT and not collision_point(x+32, y+16, oSolid, -1, -1))))
    {
        if (colBot and not isCollisionTop(4)) yVel = -1 * rand(7,8);
    }
    
    if (not colBot and oPlayer1.y > y+8)
    {
        if (facing == LEFT) xVel = -1.5;
        else xVel = 1.5;
    }
    
    if (oPlayer1.dead)
    {
        status = WALK;
    }
}
else if (status == STUNNED)
{
        if (colBot) sprite_index = sShopStunL;
        else if (bounced)
        {
            if (yVel < 0) sprite_index = sShopBounceL;
            else sprite_index = sShopFallL;
        }
        else
        {
            if (xVel < 0) sprite_index = sShopDieLL;
            else sprite_index = sShopDieLR;
        }
    
    if (colBot and not bounced)
    {
        bounced = true;
        scrCreateBlood(x+8, y+8, 3);
    }
    
    if (held or colBot)
    {      
        if (counter > 0) counter -= 1;
        else if (hp > 0)
        {
            status = ATTACK;
            if (held)
            {
                held = false;
                with oPlayer1 { holdItem = 0; pickupItemType = ""; }
            }
        }
    }
}
else if (status == DEAD)
{
    if (not dead)
    {
        if (isRoom("rStars"))
        {
            if (oStarsRoom.kills < 99) oStarsRoom.kills += 1;
        }
        else
        {
            if (isRealLevel()) global.enemyKills[19] += 1;
            global.shopkeepers += 1;
            global.kills += 1;
            global.murderer = true;
            repeat(rand(1,4))
            {
                obj = instance_create(x+8, y+8, oGoldNugget);
                obj.yVel = -1;
                obj.xVel = rand(1,3)-rand(1,3);
            }
        }
        playSound(global.sndCavemanDie);
        
        dead = true;
    }

    sprite_index = sShopDieL;

    
    if (abs(xVel) > 0 or abs(yVel) > 0) status = STUNNED;
}

if (status >= STUNNED)
{
    if (hasGun)
    {
        obj = instance_create(x+8, y+8, oShotgun);
        obj.yVel = rand(4,6);
        if (xVel < 0) obj.xVel = -1 * rand(4,6);
        else obj.xVel = rand(4,6);
        obj.cost = 0;
        obj.forSale = false;
        hasGun = false;
    }

    scrCheckCollisions();
    
    if (xVel == 0 and yVel == 0 and hp < 1) status = DEAD;
}

//if (isCollisionSolid()) y -= 2;

if (xVel > 0) xVel -= 0.1;
if (xVel < 0) xVel += 0.1;
if (abs(xVel) < 0.5) xVel = 0;

if (status < STUNNED and status != THROW)
{
    if (abs(xVel) > 0) sprite_index = sShopRunLeft;
    else sprite_index = sShopLeft;
}
if (held)
{
        if (hp > 0) sprite_index = sShopHeldL;
        else sprite_index = sShopDHeldL;
}
}

/* */
/*  */
