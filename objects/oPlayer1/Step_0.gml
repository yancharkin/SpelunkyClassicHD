// prevent player from dying on title screen
if (isRoom("rTitle") or isRoom("rHighscores"))
{
    if (global.isTunnelMan) global.plife = 2;
    else global.plife = 4;
}

if (global.plife > 99) global.plife = 99;
if (global.bombs > 99) global.bombs = 99;
if (global.rope > 99) global.rope = 99;

if (global.hasCape and not instance_exists(oCape)) instance_create(x, y, oCape);

if (instance_exists(oCape))
{
    if (oCape.open) fallTimer = 0;
}

// kapala
if (redColor > 0)
{
    if (redToggle) redColor -= 5;
    else if (redColor < 20) redColor += 5;
    else redToggle = true;
}
else redColor = 0;

if (holdArrow == ARROW_BOMB)
{
    if (bombArrowCounter > 0) bombArrowCounter -= 1;
    else
    {
        instance_create(x, y, oExplosion);
        if (global.graphicsHigh)
        {
            scrCreateFlame(x, y, 3);
        }
        bombArrowCounter = 80;
        holdArrow = 0;
    }
    
    if (isInShop(x, y))
    {
        scrShopkeeperAnger(2);
    }
}

// exit game from title screen
if (isRoom("rTitle") and state == CLIMBING and y < 32)
{
    if (holdItem)
    {
        holdItem.held = false;
        holdItem = 0;
        pickupItemType = "";
    }
    instance_create(x, y, oPDummy5);
    instance_destroy();
}

// instead of destroying the player instance when dead, we occasionally make him disappear
// i.e. being eaten by plant
if (dead and not visible)
{
    xVel = 0;
    yVel = 0;
    grav = 0;
    myGrav = 0;
    bounced = true;
}

// find distance to nearest light source, used for dark rooms
// aka longest variable name ever
distToNearestLightSource = 999;
if (instance_exists(oExplosion))
{
    source = instance_nearest(x, y, oExplosion);
    distToNearestLightSource = distance_to_object(source);
    if (source.image_index <= 3) distToNearestLightSource -= source.image_index*16;
    else distToNearestLightSource += (source.image_index-3)*16;
}
if (instance_exists(oLava))
{
    source = instance_nearest(x, y, oLava);
    if (distance_to_object(source) < distToNearestLightSource)
        distToNearestLightSource = distance_to_object(source);
}
if (instance_exists(oLamp))
{
    source = instance_nearest(x, y, oLamp);
    if (distance_to_object(source) < distToNearestLightSource)
        distToNearestLightSource = distance_to_object(source);
}
if (instance_exists(oLampItem))
{
    source = instance_nearest(x, y, oLampItem);
    if (distance_to_object(source) < distToNearestLightSource)
        distToNearestLightSource = distance_to_object(source);
}
if (instance_exists(oFlareCrate))
{
    source = instance_nearest(x, y, oFlareCrate);
    if (distance_to_object(source) < distToNearestLightSource)
        distToNearestLightSource = distance_to_object(source);
}
if (instance_exists(oTikiTorch))
{
    source = instance_nearest(x, y, oTikiTorch);
    if (distance_to_object(source)+48 < distToNearestLightSource)
        distToNearestLightSource = distance_to_object(source)+48;
}
if (instance_exists(oArrowTrapLeftLit))
{
    source = instance_nearest(x, y, oArrowTrapLeftLit);
    if (distance_to_object(source)+48 < distToNearestLightSource)
        distToNearestLightSource = distance_to_object(source)+48;
}
if (instance_exists(oArrowTrapRightLit))
{
    source = instance_nearest(x, y, oArrowTrapRightLit);
    if (distance_to_object(source)+48 < distToNearestLightSource)
        distToNearestLightSource = distance_to_object(source)+48;
}
if (instance_exists(oSpearTrapLit))
{
    source = instance_nearest(x, y, oSpearTrapLit);
    if (distance_to_object(source)+48 < distToNearestLightSource)
        distToNearestLightSource = distance_to_object(source)+48;
}
if (instance_exists(oSmashTrapLit))
{
    source = instance_nearest(x, y, oSmashTrapLit);
    if (distance_to_object(source)+48 < distToNearestLightSource)
        distToNearestLightSource = distance_to_object(source)+48;
}
if (instance_exists(oShotgunBlastLeft))
{
    source = instance_nearest(x, y, oShotgunBlastLeft);
    if (distance_to_object(source) < distToNearestLightSource)
        distToNearestLightSource = distance_to_object(source);
}
if (instance_exists(oShotgunBlastRight))
{
    source = instance_nearest(x, y, oShotgunBlastRight);
    if (distance_to_object(source) < distToNearestLightSource)
        distToNearestLightSource = distance_to_object(source);
}

// WHOA
if (sprite_index == sWhoaLeft or sprite_index == sDamselWhoaL or sprite_index == sTunnelWhoaL)
{
    if (whoaTimer > 0) whoaTimer -= 1;
    else if (holdItem)
    {
        holdItem.held = false;
        if (facing == LEFT) holdItem.xVel = -2;
        else holdItem.xVel = 2;
        if (holdItem.type == "Damsel") playSound(global.sndDamsel);
        if (holdItem.type == "Bow" and bowArmed)
        {
            scrFireBow();
        }
        if (holdItem.type == pickupItemType)
        {
            holdItem = 0;
            pickupItemType = "";
        }
        else scrHoldItem(pickupItemType);
    }
}
else whoaTimer = whoaTimerMax;

// FIRING
if (firing > 0) firing -= 1;

// WATER
if (collision_point(x, y, oWaterSwim, -1, -1))
{
    if (not swimming)
    {
        instance_create(x, y-8, oSplash);
        swimming = true;
        playSound(global.sndSplash);
    }
}

// BURNING
if (burning > 0)
{
    if (rand(1,5) == 1) instance_create(x-8+rand(4,12), y-8+rand(4,12), oBurn);
    burning -= 1;
}

// LAVA
if (collision_point(x, y+6, oLava, 0, 0))
{
    if (not dead)
    {
        if (isRealLevel()) global.miscDeaths[11] += 1;
        playSound(global.sndFlame);
    }
    global.plife -= 99;
    // dead = true;
    xVel = 0;
    yVel = 0.1;
    grav = 0;
    myGrav = 0;
    bounced = true;
    burning = 100;
    depth = 999;
}

// JETPACK
//if (global.hasJetpack and platformCharacterIs(ON_GROUND))
if (global.hasJetpack and platformCharacterIs(20))
{
    jetpackFuel = 50;
}

// fall off bottom of screen
if (y > room_height + 16 and not dead)
{
    if (isRealLevel()) global.miscDeaths[10] += 1;
    global.plife -= 99;
    xVel = 0;
    yVel = 0;
    grav = 0;
    myGrav = 0;
    bounced = true;
    if (holdItem)
    {
        holdItem.visible = true;
        holdItem.held = false;
        holdItem = 0;
        pickupItemType = "";
    }
    playSound(global.sndThud);
    playSound(global.sndDie);
}

if (active)
{
    if (stunTimer > 0 and (sprite_index == sStunL or sprite_index == sDamselStunL or sprite_index == sTunnelStunL))
    {
        image_speed = 0.4;
        stunTimer -= 1;
    }
    
    if (stunTimer < 1 and (sprite_index == sStunL or sprite_index == sDamselStunL or sprite_index == sTunnelStunL))
        stunned = false;
        
    if (instance_exists(oParachute)) fallTimer = 0;   
    
    if (yVel > 0 and state != CLIMBING)
    {
        fallTimer += 1;
        if (fallTimer > 16) wallHurt = 0; // no sense in them taking extra damage from being thrown here
        if (global.hasParachute and not stunned and fallTimer > 14)
        {
            if (not collision_point(x, y+32, oSolid, 0, 0))
            {
                instance_create(x-8, y-16, oParachute);
                fallTimer = 0;
                global.hasParachute = false;
            }
        }
    }
    //else if (platformCharacterIs(ON_GROUND) and fallTimer > 16 and not collision_rectangle(x-8, y-8, x+8, y+8, oSpringTrap, 0, 0)) // LONG DROP
	else if (platformCharacterIs(20) and fallTimer > 16 and not collision_rectangle(x-8, y-8, x+8, y+8, oSpringTrap, 0, 0)) // LONG DROP
    {
        // LONG DROP
        stunned = true;
        if (fallTimer > 48) global.plife -= 10;
        else if (fallTimer > 32) global.plife -= 2;
        else global.plife -= 1;
        if (global.plife < 1)
        {
            scrCreateBlood(x, y, 3);
            if (isRealLevel()) global.miscDeaths[3] += 1;
        }
        bounced = true;
        stunTimer += 60;
        yVel = -3;
        fallTimer = 0;
        obj = instance_create(x-4, y+6, oPoof);
        with obj { xVel = -0.4; }
        obj = instance_create(x+4, y+6, oPoof);
        with obj { xVel = 0.4; }
        playSound(global.sndThud);
    }
    else// if (collision_point(x, y+9, oSolid, 0, 0) or state == JUMPING or state == HANGING or state == CLIMBING or state == DUCKING)
    {
        fallTimer = 0;
        if (instance_exists(oParachute))
        {
            instance_create(x-8, y-16-8, oParaUsed);
            with oParachute { instance_destroy(); }
        }
    }
    
    // if (stunned) fallTimer = 0;
    
    if (swimming and not collision_point(x, y, oLava, 0, 0))
    {
        fallTimer = 0;
        if (bubbleTimer > 0) bubbleTimer -= 1;
        else
        {
            instance_create(x, y-4, oBubble);
            bubbleTimer = bubbleTimerMax;
        }
    }
    else
    {
        bubbleTimer = bubbleTimerMax;
    }
    
    if (state != DUCKTOHANG and not stunned and not dead and sprite_index != sPExit and sprite_index != sDamselExit and sprite_index != sTunnelExit)
    {
        bounced = false;
        characterStepEvent();
    }
    else if (state != DUCKING and state != DUCKTOHANG)
    {
        state = STANDING;
    }
}

// if (dead or stunned)
if (dead or stunned)
{
    if (holdItem)
    {
        if (holdItem.type == "Bow" and bowArmed)
        {
            scrFireBow();
        }
        holdItem.visible = true;
        holdItem.held = false;
        if (holdItem.type == pickupItemType)
        {
            holdItem = 0;
            pickupItemType = "";
        }
        else scrHoldItem(pickupItemType);
        //holdItem = 0;
        //pickupItemType = "";
    }

    if (bounced) yVel += 1;
    else yVel += 0.6;
    
    if (isCollisionTop(1) and yVel < 0)
    {
        yVel = -yVel * 0.8;
    }
    
    if (isCollisionLeft(1) or isCollisionRight(1))
    {
        xVel = -xVel * 0.5;
    }
    
    if (isCollisionBottom(1) or isCollisionPlatformBottom(1))
    {
        // bounce
        if (yVel > 1) yVel = -yVel * 0.5;
        else yVel = 0;
        
        // friction
        if (abs(xVel) < 0.1) xVel = 0;
        else if (abs(xVel) != 0 and collision_point(x, y+16, oIce, 0, 0)) xVel *= 0.8;
        else if (abs(xVel) != 0) xVel *= 0.3;
        
        bounced = true;
    }
    
    // apply the limits since the velocity may be too extreme
    xVelLimit = 10;
    if (xVel > xVelLimit) xVel = xVelLimit;
    else if (xVel < -xVelLimit) xVel = -xVelLimit;
    if (yVel > yVelLimit) yVel = yVelLimit;
    else if (yVel < -yVelLimit) yVel = -yVelLimit;
    
    moveTo(xVel, yVel);
}
else if (isLevel()) // look up and down
{
    //if (kDown and (platformCharacterIs(ON_GROUND) or state == HANGING) and not kRight and not kLeft)
	if (kDown and (platformCharacterIs(20) or state == HANGING) and not kRight and not kLeft)
    {
        if (viewCount <= 30) viewCount += 1;
        else __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (4) );
    }
	//else if (kUp and (platformCharacterIs(ON_GROUND) or state == HANGING) and not kRight and not kLeft)
    else if (kUp and (platformCharacterIs(20) or state == HANGING) and not kRight and not kLeft)
    {
        if (viewCount <= 30) viewCount += 1;
        else __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (4) );
    }
    else viewCount = 0;
}

if (dead)
{
    kAttackPressed = checkAttackPressed();
}

if (global.plife > 0) kBombPressed = checkBombPressed();
else kBombPressed = false;

if (global.plife > 0) kRopePressed = checkRopePressed();
else kRopePressed = false;

kPayPressed = checkPayPressed();
// kFlarePressed = checkFlarePressed();

if ((sprite_index == sAttackLeft or sprite_index == sDamselAttackL or sprite_index == sTunnelAttackL) and facing == LEFT and image_index > 4 and instance_number(oWhip) == 0)
{
    if (holdItem)
    {
        if (holdItem.type == "Machete")
        {
            obj = instance_create(x-16, y, oSlash);
            obj.sprite_index = sSlashLeft;
            playSound(global.sndWhip);
        }
        else if (holdItem.type == "Mattock")
        {
            obj = instance_create(x-16, y, oMattockHit);
            obj.sprite_index = sMattockHitL;
            playSound(global.sndWhip);
        }
    }
    else
    {
        if (global.isTunnelMan)
        {
            obj = instance_create(x-16, y, oMattockHit);
            obj.sprite_index = sMattockHitL;
            playSound(global.sndWhip);
        }
        else
        {
            obj = instance_create(x-16, y, oWhip);
            obj.sprite_index = sWhipLeft;
            playSound(global.sndWhip);
        }
    }
}
else if ((sprite_index == sAttackLeft or sprite_index == sDamselAttackL or sprite_index == sTunnelAttackL) and facing == RIGHT and image_index > 4 and instance_number(oWhip) == 0)
{
    if (holdItem)
    {
        if (holdItem.type == "Machete")
        {
            obj = instance_create(x+16, y, oSlash);
            obj.sprite_index = sSlashRight;
            playSound(global.sndWhip);
        }
        else if (holdItem.type == "Mattock")
        {
            obj = instance_create(x+16, y, oMattockHit);
            obj.sprite_index = sMattockHitR;
            playSound(global.sndWhip);
        }
    }
    else
    {
        if (global.isTunnelMan)
        {
            obj = instance_create(x+16, y, oMattockHit);
            obj.sprite_index = sMattockHitR;
            playSound(global.sndWhip);
        }
        else
        {
            obj = instance_create(x+16, y, oWhip);
            obj.sprite_index = sWhipRight;
            playSound(global.sndWhip);
        }
    }
}

if (holdItem)
{
    if (holdItem.type == "Machete")
    {
        if ((sprite_index == sAttackLeft or sprite_index == sDamselAttackL or sprite_index == sTunnelAttackL) and facing == LEFT and image_index < 2 and instance_number(oMachetePre) == 0)
        {
            obj = instance_create(x+16, y, oMachetePre);
            obj.sprite_index = sMachetePreL;
        }
        else if ((sprite_index == sAttackLeft or sprite_index == sDamselAttackL or sprite_index == sTunnelAttackL) and facing == RIGHT and image_index < 2 and instance_number(oMachetePre) == 0)
        {
            obj = instance_create(x-16, y, oMachetePre);
            obj.sprite_index = sMachetePreR;
        }
    }
    else if (holdItem.type == "Mattock")
    {
        if ((sprite_index == sAttackLeft or sprite_index == sDamselAttackL or sprite_index == sTunnelAttackL) and facing == LEFT and image_index < 2 and instance_number(oMachetePre) == 0)
        {
            obj = instance_create(x+16, y, oMattockPre);
            obj.sprite_index = sMattockPreL;
        }
        else if ((sprite_index == sAttackLeft or sprite_index == sDamselAttackL or sprite_index == sTunnelAttackL) and facing == RIGHT and image_index < 2 and instance_number(oMachetePre) == 0)
        {
            obj = instance_create(x-16, y, oMattockPre);
            obj.sprite_index = sMattockPreR;
        }
    }
}
else if (sprite_index == sTunnelAttackL and image_index < 2 and instance_number(oMattockPre) == 0)
{
    if (facing == LEFT)
    {
        obj = instance_create(x+16, y, oMattockPre);
        obj.sprite_index = sMattockPreL;
    }
    else
    {
        obj = instance_create(x-16, y, oMattockPre);
        obj.sprite_index = sMattockPreR;
    }
}
else if ((sprite_index == sAttackLeft or sprite_index == sDamselAttackL or sprite_index == sTunnelAttackL) and facing == LEFT and image_index < 2 and instance_number(oWhipPre) == 0)
{
    obj = instance_create(x+16, y, oWhipPre);
    obj.sprite_index = sWhipPreL;
}
else if ((sprite_index == sAttackLeft or sprite_index == sDamselAttackL or sprite_index == sTunnelAttackL) and facing == RIGHT  and image_index < 2 and instance_number(oWhipPre) == 0)
{
    obj = instance_create(x-16, y, oWhipPre);
    obj.sprite_index = sWhipPreR;
}

if (not whipping)
{
    with oWhip { instance_destroy(); }
    with oWhipPre { instance_destroy(); }
}

if (holdItem > 0)
{
    if (holdItem.cost > 0 and isLevel())
    {
        if (global.roomPath[scrGetRoomX(x), scrGetRoomY(y)] != 4 and global.roomPath[scrGetRoomX(x), scrGetRoomY(y)] != 5)
        {
            scrStealItem();
            if (instance_exists(oShopkeeper))
            {
                scrShopkeeperAnger(0);
            }
        }
    }
    else if (holdItem.cost > 0)
    {
        scrStealItem();
    }
}

// open chest
if (kUp and kAttackPressed and collision_point(x, y, oChest, 0, 0))
{
    if (isRealLevel()) global.totalChests += 1;
    chest = instance_place(x, y, oChest);
    if (chest.sprite_index == sChest)
    {
        chest.sprite_index = sChestOpen;
        if (rand(1,12) == 1 and global.currLevel > 0)
        {
            obj = instance_create(chest.x, chest.y, oBomb);
            obj.xVel = rand(0,3) - rand(0,3);
            obj.yVel = -2;
            with obj
            {
                sprite_index = sBombArmed;
                alarm[1] = 40;
            }
            playSound(global.sndTrap);
        }
        else {
        playSound(global.sndChestOpen);
        repeat(rand(3,4))
        {
            n = rand(1,3);
            switch (n)
            {
                case 1: { obj = instance_create(chest.x, chest.y, oEmerald); break; }
                case 2: { obj = instance_create(chest.x, chest.y, oSapphire); break; }
                case 3: { obj = instance_create(chest.x, chest.y, oRuby); break; }
            }
            obj.xVel = rand(0,3) - rand(0,3);
            obj.yVel = -2;
        }
        if (rand(1,4) == 1)
        {
            n = rand(1,3);
            switch (n)
            {
                case 1: { obj = instance_create(chest.x, chest.y, oEmeraldBig); break; }
                case 2: { obj = instance_create(chest.x, chest.y, oSapphireBig); break; }
                case 3: { obj = instance_create(chest.x, chest.y, oRubyBig); break; }
            }
            obj.xVel = rand(0,3) - rand(0,3);
            obj.yVel = -2;
        }}
        
        kAttackPressed = false;
    }
}

// open crate
if (kUp and kAttackPressed and collision_point(x, y, oCrate, 0, 0))
{
        if (isRealLevel()) global.totalCrates += 1;
        chest = instance_place(x, y, oCrate);
        if (isRoom("rTutorial")) obj = instance_create(chest.x, chest.y, oBombBag);
        else if (rand(1,500) == 1) obj = instance_create(chest.x, chest.y, oJetpack);
        else if (rand(1,200) == 1) obj = instance_create(chest.x, chest.y, oCapePickup);
        else if (rand(1,100) == 1) obj = instance_create(chest.x, chest.y, oShotgun);
        else if (rand(1,100) == 1) obj = instance_create(chest.x, chest.y, oMattock);
        else if (rand(1,100) == 1) obj = instance_create(chest.x, chest.y, oTeleporter);
        else if (rand(1,90) == 1) obj = instance_create(chest.x, chest.y, oGloves);
        else if (rand(1,90) == 1) obj = instance_create(chest.x, chest.y, oSpectacles);
        else if (rand(1,80) == 1) obj = instance_create(chest.x, chest.y, oWebCannon);
        else if (rand(1,80) == 1) obj = instance_create(chest.x, chest.y, oPistol);
        else if (rand(1,80) == 1) obj = instance_create(chest.x, chest.y, oMitt);
        else if (rand(1,60) == 1) obj = instance_create(chest.x, chest.y, oPaste);
        else if (rand(1,60) == 1) obj = instance_create(chest.x, chest.y, oSpringShoes);
        else if (rand(1,60) == 1) obj = instance_create(chest.x, chest.y, oSpikeShoes);
        else if (rand(1,60) == 1) obj = instance_create(chest.x, chest.y, oMachete);
        else if (rand(1,40) == 1) obj = instance_create(chest.x, chest.y, oBombBox);
        else if (rand(1,40) == 1) obj = instance_create(chest.x, chest.y, oBow);
        else if (rand(1,20) == 1) obj = instance_create(chest.x, chest.y, oCompass);
        else if (rand(1,10) == 1) obj = instance_create(chest.x, chest.y, oParaPickup);
        else if (rand(1,2) == 1) obj = instance_create(chest.x, chest.y, oRopePile);
        else obj = instance_create(chest.x, chest.y, oBombBag);
        obj.cost = 0;
        playSound(global.sndPickup);
        if (chest == holdItem)
        {
            holdItem = 0;
            pickupItemType = "";
        }
        with chest { instance_create(x, y, oPoof); instance_destroy(); }
        
        kAttackPressed = false;
}

// open flare crate

if (kUp and kAttackPressed and collision_point(x, y, oFlareCrate, 0, 0))
{
    chest = instance_place(x, y, oFlareCrate);
    for (i = 0; i < 3; i += 1)
    {
        obj = instance_create(chest.x, chest.y, oFlare);
        obj.xVel = rand(0,3)-rand(0,3);
        obj.yVel = rand(1,3)*-1;
    }
    playSound(global.sndPickup);
    if (chest == holdItem)
    {
        holdItem = 0;
        pickupItemType = "";
    }
    with chest { instance_create(x, y, oPoof); instance_destroy(); }
    
    kAttackPressed = false;
}

//
// start game
//
if (not dead and
    not stunned and
    not whipping and 
    collision_point(x, y, oXStart, 0, 0) and
    kUp and
	//platformCharacterIs(ON_GROUND) and
    platformCharacterIs(20) and
    sprite_index != sPExit and sprite_index != sDamselExit and sprite_index != sTunnelExit)
{
    // oXEnd is the child of oXStart, for some reason, that's why this is here:
    if (isRoom("rOlmec") and holdItem)
    {
        if (holdItem.heavy)
        {
            holdItem.held = false;
            holdItem = 0;
            pickupItemType = "";
        }
        else if (holdItem.type == "Bomb")
        {
            if (holdItem.armed)
            {
                holdItem.held = false;
            }
            else
            {
                global.bombs += 1;
                with holdItem { instance_destroy(); }
            }
            
            global.pickupItem = pickupItemType;
        }
        else if (holdItem.type == "Rope")
        {
            global.rope += 1;
            with holdItem { instance_destroy(); }
            
            global.pickupItem = pickupItemType;
        }
        else
        {
            global.pickupItem = holdItem.type;
            with holdItem
            {
                breakPieces = false;
                instance_destroy();
            }
        }
    }
    else if (isRoom("rOlmec")) global.pickupItem = "";
    else if (holdItem) holdItem.held = false;
    holdItem = 0;
    pickupItemType = "";

    door = instance_place(x, y, oXStart);
    if (door) x = door.x + 8;
    if (global.isDamsel) sprite_index = sDamselExit;
    else if (global.isTunnelMan) sprite_index = sTunnelExit;
    else sprite_index = sPExit;
    image_speed = 0.5;
    active = false;
    depth = 999;
    invincible = 999;
    
    pExit = xSTART;
    if (collision_point(x, y, oXScores, 0, 0)) pExit = xSCORES;
    else if (collision_point(x, y, oXTutorial, 0, 0)) pExit = xTUTORIAL;
    else if (collision_point(x, y, oXTitle, 0, 0)) pExit = xTITLE;
    else if (collision_point(x, y, oXEnd, 0, 0)) pExit = xEND;
    else if (collision_point(x, y, oXShortcut5, 0, 0)) pExit = xSHORTCUT5;
    else if (collision_point(x, y, oXShortcut9, 0, 0)) pExit = xSHORTCUT9;
    else if (collision_point(x, y, oXShortcut13, 0, 0)) pExit = xSHORTCUT13;
    else if (collision_point(x, y, oXSun, 0, 0)) pExit = xSUN;
    else if (collision_point(x, y, oXMoon, 0, 0)) pExit = xMOON;
    else if (collision_point(x, y, oXStars, 0, 0)) pExit = xSTARS;
    else if (collision_point(x, y, oXChange, 0, 0)) pExit = xCHANGE;
    else if (collision_point(x, y, oXChange2, 0, 0)) pExit = xCHANGE2;
    
    if (pExit != xCHANGE2) stopAllMusic();
    
    playSound(global.sndSteps);
}

//
// exit level
//
if (not dead and
    not stunned and
    not whipping and 
    collision_point(x, y, oExit, 0, 0) and
    kUp and
	//platformCharacterIs(ON_GROUND) and
    platformCharacterIs(20) and
    sprite_index != sPExit and sprite_index != sDamselExit and sprite_index != sTunnelExit)
{
    holdArrow = 0;
    global.pickupItem = "";
    if (holdItem)
    {
        if (holdItem.type == "Gold Idol")
        {
            if (isRealLevel()) global.idolsConverted += 1;
            global.money += holdItem.value*(global.levelType+1);
            if (holdItem.sprite_index == sCrystalSkull) global.skulls += 1;
            else global.idols += 1;
            playSound(global.sndCoin);
            instance_create(x, y-8, oBigCollect);
            with holdItem { instance_destroy(); }
            holdItem = 0;
        }
        else if (holdItem.type == "Damsel")
        {
            if (holdItem.hp > 0)
            {
                // global.plife += 1;
                if (isRealLevel()) global.damselsSavedTotal += 1;
                global.damsels += 1;
                global.xdamsels += 1;
                door = instance_place(x, y, oExit);
                holdItem.x = door.x+8;
                holdItem.y = door.y+8;
                with holdItem
                {
                    if (global.isDamsel) sprite_index = sPExit;
                    else sprite_index = sDamselExit;
                    status = 4;
                    held = false;
                    xVel = 0;
                    yVel = 0;
                    playSound(global.sndSteps);
                    depth = 1000;
                    active = false;
                }
                holdItem = 0;
            }
            else
            {
                holdItem.status = 2;
                holdItem.held = false;
                holdItem = 0;
                pickupItemType = "";
            }
        }
        else if (holdItem.heavy)
        {
            holdItem.held = false;
            holdItem = 0;
            pickupItemType = "";
        }
        else if (holdItem.type == "Bomb")
        {
            if (holdItem.armed)
            {
                holdItem.held = false;
            }
            else
            {
                global.bombs += 1;
                with holdItem { instance_destroy(); }
            }
            
            global.pickupItem = pickupItemType;
        }
        else if (holdItem.type == "Rope")
        {
            global.rope += 1;
            with holdItem { instance_destroy(); }
            
            global.pickupItem = pickupItemType;
        }
        else
        {
            global.pickupItem = holdItem.type;
            with holdItem
            {
                breakPieces = false;
                instance_destroy();
            }
        }
        holdItem = 0;
        pickupItemType = "";
    }

    door = instance_place(x, y, oExit);
    if (door)
    {
        x = door.x + 8;
        y = door.y + 8;
    }
    
    // money
    global.money += global.collect;
    global.xmoney += global.collect;
    global.collect = 0;
    
    if (global.isDamsel) sprite_index = sDamselExit;
    else if (global.isTunnelMan) sprite_index = sTunnelExit;
    else sprite_index = sPExit;
    image_speed = 0.5;
    active = false;
    invincible = 999;
    depth = 999;
    if (global.thiefLevel > 0) global.thiefLevel -= 1;
    if (global.currLevel == 1) global.currLevel += firstLevelSkip;
    else global.currLevel += levelSkip;
    stopAllMusic();
    playSound(global.sndSteps);
    if (collision_point(x, y, oXMarket, 0, 0)) global.genBlackMarket = true;
    if (collision_point(x, y, oXGold, 0, 0)) global.cityOfGold = true;
    obj = collision_point(x, y, oExit, 0, 0);
    if (obj)
    {
        if (obj.leadsTo != "")
        {
            global.nextCustomLevel = obj.leadsTo;
        }
    }
    
    with oMonkey
    {
        // knock off monkeys that grabbed you
        if (status == 7)
        {
            xVel = rand(0,1)-rand(0,1);
            yVel = -4;
            status = 1;
            vineCounter = 20;
            grabCounter = 60;
        }
    }
}

//
// Game Over
//
if ((checkAttackPressed() or checkStartPressed()) and dead)
{
    if (oGame.moneyCount < global.money or oGame.drawStatus < 3)
    {
        oGame.drawStatus = 3;
        oGame.moneyCount = global.money;
    }
    else
    {
        // Stats!
        if (isRealLevel()) global.levelDeaths[global.currLevel-1] += 1;
    
        if (gamepad.attackPressed) gamepad.attackPressed = false;
        if (gamepad.startPressed) gamepad.startPressed = false;
        global.prevCustomLevel = "";
        if (global.testLevel != "")
        {
            scrClearGlobals();
            room_goto(rLevelEditor);
        }
        else if (global.customLevel)
        {
            scrClearGlobals();
            global.customLevel = false;
            room_goto(rLoadLevel);
        }
        else
        {
            scrClearGlobals();
            if (isRoom("rSun")) global.scoresStart = 1;
            if (isRoom("rMoon")) global.scoresStart = 2;
            if (isRoom("rStars")) global.scoresStart = 3;
            room_goto(rHighscores);
        }
    }    
}

inGame = true;
if (not isLevel())
{
    inGame = false;
}

if (dead or stunned or not active)
{
    // do nothing
}
else if (inGame and kItemPressed and not whipping)
{   
    // switch items
    if (holdItem)
    {
        if (holdItem.sprite_index == sBombArmed)
        {
            // do nothing
        }
        else if (holdItem.sprite_index == sBomb)
        {
            with holdItem
            {
                global.bombs += 1;
                instance_destroy();
            }
            
            if (global.rope > 0)
            {
                holdItem = instance_create(x, y, oRopeThrow);
                holdItem.held = true;
                global.rope -= 1;
                whoaTimer = whoaTimerMax;
            }
            else
            {
                scrHoldItem(pickupItemType);
            }
        }
        else if (holdItem.sprite_index == sRopeEnd)
        {
            with holdItem
            {
                global.rope += 1;
                instance_destroy();
            }
            
            scrHoldItem(pickupItemType);
        }
        else if (not holdItem.heavy and holdItem.cost == 0)
        {
            if (global.bombs > 0 or global.rope > 0)
            {
                pickupItemType = holdItem.type;
                if (holdItem.type == "Bow" and bowArmed)
                {
                    scrFireBow();
                }
                with holdItem
                {
                    breakPieces = false;
                    instance_destroy();
                }
            }
            
            if (global.bombs > 0)
            {
                holdItem = instance_create(x, y, oBomb);
                if (global.hasStickyBombs) holdItem.sticky = true;
                holdItem.held = true;
                global.bombs -= 1;
                whoaTimer = whoaTimerMax;
            }
            else if (global.rope > 0)
            {
                holdItem = instance_create(x, y, oRopeThrow);
                holdItem.held = true;
                global.rope -= 1;
                whoaTimer = whoaTimerMax;
            }
        }
    }
    else
    {
        if (global.bombs > 0)
        {
            holdItem = instance_create(x, y, oBomb);
            if (global.hasStickyBombs) holdItem.sticky = true;
            holdItem.held = true;
            global.bombs -= 1;
            whoaTimer = whoaTimerMax;
        }
        else if (global.rope > 0)
        {
            holdItem = instance_create(x, y, oRopeThrow);
            holdItem.held = true;
            global.rope -= 1;
            whoaTimer = whoaTimerMax;
        }
    }
}
else if (inGame and kRopePressed and global.rope > 0 and not whipping)
{   
    if (not kDown and colTop)
    {
        // do nothing
    }
    else
    {
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
            if (oPlayer1.x < x)
            {
                if (not collision_point(oPlayer1.x+8, oPlayer1.y, oSolid, 0, 0))
                {
                    if (not collision_rectangle(x-8, y, x-7, y+16, oSolid, 0, 0))
                        x -= 8;
                    else if (not collision_rectangle(x+7, y, x+8, y+16, oSolid, 0, 0))
                        x += 8;
                    else t = false;
                }
                else t = false;
            }
            else if (not collision_point(oPlayer1.x-8, oPlayer1.y, oSolid, 0, 0))
            {
                if (not collision_rectangle(x+7, y, x+8, y+16, oSolid, 0, 0))
                    x += 8;
                else if (not collision_rectangle(x-8, y, x-7, y+16, oSolid, 0, 0))
                    x -= 8;
                else t = false;
            }
            else t = false;
                    
            if (not t)
            {
                /*
                if (oPlayer1.facing == 18)
                {
                    obj = instance_create(oPlayer1.x-4, oPlayer1.y+2, oRopeThrow);
                    obj.xVel = -3.2;                
                }
                else
                {
                    obj = instance_create(oPlayer1.x+4, oPlayer1.y+2, oRopeThrow);
                    obj.xVel = 3.2;
                }
                obj.yVel = 0.5;
                */
                instance_destroy();
            }
            else
            {
                instance_create(x, y, oRopeTop);
                armed = false;
                falling = true;
                xVel = 0;
                yVel = 0;
                global.rope -= 1;
                playSound(global.sndThrow);
            }
        }
    }
    else
    {
        obj = instance_create(x, y, oRopeThrow);
        obj.armed = true;
        obj.px = x;
        obj.py = y;
        obj.xVel = 0;
        obj.yVel = -12;
        global.rope -= 1;
        playSound(global.sndThrow);
    }
    }
}
else if (inGame and kBombPressed and global.bombs > 0 and not whipping and bowArmed)
{
    holdArrow = ARROW_BOMB;
    alarm[11] = 1;
}
else if (inGame and kBombPressed and global.bombs > 0 and not whipping)
{
    obj = instance_create(x, y, oBomb);
    if (global.hasStickyBombs) obj.sticky = true;
    obj.sprite_index = sBombArmed;
    obj.armed = true; 
    with obj
    {
        alarm[0] = 80;
        image_speed = 0.2;
    }       
    obj.safe = true;
    obj.alarm[2] = 10;
            
    if (facing == LEFT)
    {
        obj.xVel = -8 + xVel;
    }
    else if (facing == RIGHT)
    {
        obj.xVel = 8 + xVel;
    }
    obj.yVel = -3;
    
    if (kUp)
    {
        obj.yVel = -9;
    }
    
    if (kDown)
    {
		//if (platformCharacterIs(ON_GROUND)) obj.xVel *= 0.1;
        if (platformCharacterIs(20)) obj.xVel *= 0.1;
        obj.yVel = 3;
    }
    
    global.bombs -= 1;
    playSound(global.sndThrow);
}
else if (holdItem == 0)
{
    if (kAttackPressed and state != DUCKING and state != DUCKTOHANG and not whipping and
        sprite_index != sPExit and sprite_index != sDamselExit)
    {
        image_speed = 0.6;
        if (global.isTunnelMan)
        {
            //if (platformCharacterIs(ON_GROUND))
			if (platformCharacterIs(20))
            {
                sprite_index = sTunnelAttackL;
                image_index = 0;
                whipping = true;
            }
        }
        else if (global.isDamsel)
        {
            sprite_index = sDamselAttackL;
            image_index = 0;
            whipping = true;
        }
        else
        {
            sprite_index = sAttackLeft;
            image_index = 0;
            whipping = true;
        }
    }
    else if (kAttackPressed and kDown)
    {
        // pick up item
        if (collision_rectangle(x-8, y, x+8, y+8, oItem, 0, 0))
        {
            obj = instance_nearest(x, y, oItem);
            if (obj.canPickUp and not collision_point(obj.x, obj.y, oSolid, 0, 0))
            {
                holdItem = obj;
                holdItem.held = true;
                whoaTimer = whoaTimerMax;
                pickupItemType = holdItem.type;
                
                if (holdItem.type == "Bow" and holdItem.New)
                {
                    holdItem.New = false;
                    global.arrows += 6;
                }
                
                if (holdItem.type == "Gold Idol" and holdItem.trigger and not isRoom("rLoadLevel"))
                {
                    global.idolsGrabbed += 1;
                    if (global.levelType == 0)
                    {
                        trap = instance_nearest(x, y-64, oGiantTikiHead);
                        with trap { alarm[0] = 100; }
                        scrShake(100);
                        holdItem.trigger = false;
                    }
                    else if (global.levelType == 1)
                    {
                        if (global.cemetary and not global.ghostExists)
                        {  
                            if (oPlayer1.x > room_width / 2) instance_create(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+8, __view_get( e__VW.YView, 0 )+floor(__view_get( e__VW.HView, 0 ) / 2), oGhost);
                            else instance_create(__view_get( e__VW.XView, 0 )-32,  __view_get( e__VW.YView, 0 )+floor(__view_get( e__VW.HView, 0 ) / 2), oGhost);
                            global.ghostExists = true;
                        }
                        with oTrapBlock
                        {
                            dist = distance_to_object(oCharacter);
                            if (dist < 90)
                            {
                                dying = true;
                                //instance_destroy();
                            }
                        }
                    }
                    else if (global.levelType == 3)
                    {
                        if (instance_exists(oCeilingTrap))
                        {
                            with oCeilingTrap
                            {
                                status = 1;
                                yVel = 0.5;
                            }
                            scrShake(20);
                            trap = instance_nearest(x-64, y-64, oDoor);
                            trap.status = 1;
                            trap.yVel = 1;
                            trap = instance_nearest(x+64, y-64, oDoor);
                            trap.status = 1;
                            trap.yVel = 1;
                        }
                        else
                        {
                            with oTrapBlock
                            {
                                dist = distance_to_object(oCharacter);
                                if (dist < 90)
                                {
                                    instance_destroy();
                                }
                                playSound(global.sndThump);
                                scrShake(10);
                            }
                        }
                
                        holdItem.trigger = false;
                    }
                }
                else if (holdItem.type == "Damsel")
                {
                    if (holdItem.status == 4) // exiting
                    {
                        holdItem = 0;
                        holdItem.held = false;
                    }
                    else
                    {
                        if (global.isDamsel) holdItem.sprite_index = sDieLBounce;
                        else holdItem.sprite_index = sDamselHoldL;
                    }
                }
                else if (holdItem.cost == 0) scrStealItem();
            }
        }
        else if (collision_rectangle(x-8, y, x+8, y+8, oEnemy, 0, 0))
        {
            obj = instance_nearest(x, y, oEnemy);
            if (obj.status >= 98 and obj.canPickUp)
            {
                holdItem = obj;
                holdItem.held = true;
                whoaTimer = whoaTimerMax;
                pickupItemType = holdItem.type;
            }
        }
    }
}
else if (kAttackPressed)
{
    if (holdItem)
    {
        scrUseItem();
    }
}

if (isLevel() and active and kPayPressed and not dead and not stunned)
{
    if (isInShop(x, y) and instance_exists(oShopkeeper))
    {
        n = 0;
        if (holdItem)
        {
            if (holdItem.cost <= 0)
            {
                // do nothing
            }
            else if (holdItem.cost > global.money)
            {
                message1 = "YOU HAVEN'T GOT ENOUGH MONEY!";
                message2 = "";
                with holdItem { held = false; }
                holdItem = 0;
                pickupItemType = "";
                n = 1;
				trMessages(message1, message2, 0, 0, 80);
            }
            else
            {
                if (isRealLevel()) global.itemsBought += 1;
                global.money -= holdItem.cost;
                scrStealItem();
                message1 = "THANK YOU!";
                message2 = "";
                trMessages(message1, message2, 0, 0, 80);
                //holdItem = 0;
            }
        }
        
        if ((global.blackMarket and global.roomPath[scrGetRoomX(x), scrGetRoomY(y)] == 5) or
            (not global.blackMarket and oShopkeeper.style == "Craps"))
        {
            if (global.thiefLevel > 0 or global.murderer)
            {
                // do nothing
            }
            else if (bet == 0 and global.money >= (1000 + global.currLevel * 500))
            {
                if (isRealLevel()) global.diceGamesPlayed += 1;
                bet = 1000 + global.currLevel * 500;
                global.money -= 1000 + global.currLevel * 500;
                message1 = [" YOU BET $", string(1000 + global.currLevel * 500), "!"];
                message2 = "NOW ROLL THE DICE!";
                trMessages(message1, message2, 0, 0, 200);
            }
            else if (bet > 0)
            {
                message1 = "ONE BET AT A TIME!";
                message2 = "PLEASE ROLL THE DICE!";
				trMessages(message1, message2, 0, 0, 200);
            }
            else
            {
                message1 = ["YOU NEED $", string(1000 + global.currLevel * 500), (" TO BET!")];
                message2 = "";
                trMessages(message1, message2, 0, 0, 200);
            }
        }
        
        if (oShopkeeper.style == "Kissing" and distance_to_object(oDamsel) < 16)
        {
            obj = instance_nearest(x, y, oDamsel);
            if (global.thiefLevel > 0 or global.murderer or not obj.forSale)
            {
                // do nothing
            }
            else if (n == 0 and global.money >= getKissValue())
            {
                if (obj.forSale and not obj.held)
                {
                    if (isRealLevel()) global.kissesBought += 1;
                    obj.status = 6;
                    if (global.isDamsel)
                    {
                        obj.sprite_index = sPKissL;
                    }
                    else
                    {
                        obj.sprite_index = sDamselKissL;
                    }
                    global.money -= getKissValue();
                    global.plife += 1;
                    if (global.isDamsel) message1 = "NOW AIN'T HE SWEET!";
                    else message1 = "NOW AIN'T SHE SWEET!";
                    message2 = "";
					trMessages(message1, message2, 0, 0, 200);
                }
            }
            else
            {
                if (n == 0) message1 = ["YOU NEED $", string(getKissValue()), "!"];
                else message1 = ["YOU NEED $", string(obj.cost), "!"];
                message2 = "GET OUTTA HERE, DEADBEAT!";
                trMessages(message1, message2, 0, 0, 200);
            }
        }
    }
}


if (kAttack and bowArmed and bowStrength < 12)
{
    bowStrength += 0.2;
    if (not holdItem)
    {
        bowArmed = false;
        bowStrength = 0;
        if (audio_is_playing(global.sndBowPull))
        audio_stop_sound(global.sndBowPull);
    }
    holdArrow = ARROW_NORM;
}

if (kAttackReleased and bowArmed)
{
    scrFireBow();
}

/* */
///Main "Hurt" logic

if (global.plife < -10000) global.plife = -10000;

if (global.plife < -99 and visible)
{
    scrCreateBlood(x, y, 3);
    visible = false;
}

if (global.plife >= -99 and visible and sprite_index != sPExit and sprite_index != sDamselExit and sprite_index != sTunnelExit)
{
// crushed
if (collision_point(x, y, oSolid, 0, 0))
{
    if (global.plife > 0)
    {
        if (isRealLevel())
        {
            if (isRoom("rOlmec")) global.enemyDeaths[22] += 1;
            else global.miscDeaths[2] += 1;
        }
    }
    global.plife -= 99;
    active = false;
    yVel = -3;
    playSound(global.sndDie);
        
    scrCreateBlood(x, y, 3);
    
    visible = false;
}

if (collision_rectangle(x-8, y-8, x+8, y+8, oArrow, 0, 0))
{
    obj = instance_nearest(x, y, oArrow);
    if (obj and abs(obj.xVel) > 3 and not obj.safe)
    {
        if (global.plife > 0)
        {
            global.plife -= 2;
            if (global.plife <= 0 and isRealLevel()) global.miscDeaths[6] += 1;
        }
        xVel = obj.xVel;
        yVel = -4;
        
        scrCreateBlood(x, y, 3);
        
        with obj
        {
            instance_destroy();
        }
        playSound(global.sndHurt);
        stunned = true;
        stunTimer = 20;
    }
}

if (collision_rectangle(x-8, y-8, x+8, y+8, oRock, 0, 0))
{
    obj = instance_nearest(x, y, oRock);
    if (obj and abs(obj.xVel) > 4 and not obj.safe and not stunned and not dead)
    {
        if (global.hasMitt and !holdItem)
        {
            holdItem = oRock;
            holdItem.held = true;
            pickupItemType = holdItem.type;
        }
        else {
        if (global.plife > 0)
        {
            global.plife -= 2;
            if (global.plife <= 0 and isRealLevel()) global.miscDeaths[0] += 1;
        }
        xVel = obj.xVel;
        yVel = -4;
        
        scrCreateBlood(x, y, 3);
        
        playSound(global.sndHurt);
        stunned = true;
        stunTimer = 20;
        }
    }
}

if (collision_rectangle(x-8, y-8, x+8, y+8, oLaser, 0, 0))
{
    obj = instance_nearest(x, y, oLaser);
    if (obj)
    {
        if (global.plife > 0)
        {
            global.plife -= 3;
            if (global.plife <= 0 and isRealLevel()) global.enemyDeaths[16] += 1;
        }
        if (obj.x < x) xVel = 2;
        else xVel = -2;
        yVel = -4;
        
        scrCreateBlood(x, y, 3);
        
        with obj
        {
            instance_create(x, y, oLaserExplode);
            instance_destroy();
        }
        playSound(global.sndHurt);
        stunned = true;
        stunTimer = 20;
    }
}

if (collision_rectangle(x-8, y-8, x+8, y+8, oPsychicWave, 0, 0) and not stunned and not dead)
{
    obj = instance_nearest(x, y, oPsychicWave);
    if (obj)
    {
        if (global.plife > 0)
        {
            global.plife -= 1;
            if (global.plife <= 0 and isRealLevel()) global.enemyDeaths[17] += 1;
        }
        if (obj.x < x) xVel = 2;
        else xVel = -2;
        yVel = -4;
        
        playSound(global.sndHurt);
        stunned = true;
        stunTimer = 40;
    }
}

if (collision_rectangle(x-8, y-8, x+8, y+8, oExplosion, 0, 0))
{
    global.plife -= 10;
    if (global.plife > 0 and isRealLevel()) global.miscDeaths[1] += 1;
    explosion = instance_nearest(x, y, oExplosion)
    if (explosion.x < x) xVel = rand(4,6);
    else xVel = -rand(4,6);
    yVel = -6;
    burning = 50;
    stunned = true;
    stunTimer = 100;
        
    scrCreateBlood(x, y, 1);
}

obj = collision_rectangle(x-6, y-6, x+6, y+7, oSpearsLeft, 0, 0); instance_nearest(x, y, oSpearsLeft);
if (obj)
{
    if (obj.image_index >= 20 and obj.image_index < 24)
    {
        if (global.plife > 0 and isRealLevel())  global.miscDeaths[7] += 1;
    
        // stunned = true;
        // bounced  = false;
        global.plife -= 4;
        if (obj.sprite_index = sSpearsLeft) xVel = -rand(4,6);
        else xVel = rand(4,6);
        yVel = -6;
        y -= 1;
        // state = FALLING;
        
        scrCreateBlood(x, y, 1);
    }
}

if (collision_rectangle(x-6, y-6, x+6, y+7, oSmashTrap, 0, 0))
{
    if (global.plife > 0 and isRealLevel()) global.miscDeaths[8] += 1;

    obj = instance_nearest(x, y, oSmashTrap);
    global.plife -= 10;
    if (obj.x+8 < x) xVel = -rand(4,6);
    else xVel = rand(4,6);
    yVel = -6;
    if (obj)
    {
        if (obj.dir == 1) yVel = 4;
    }
    //RIGHT = 0;
    //DOWN = 1;
    //LEFT = 2;
    //UP = 3;
    scrCreateBlood(x, y, 1);
    if (holdItem) { holdItem.held = false; holdItem = 0; }
}

obj = collision_rectangle(x-2, y-9, x+2, y-7, oCeilingTrap, 0, 0); //instance_nearest(x, y-8, oCeilingTrap);
if (obj)
{
    if (obj.status > 0)
    {
        if (global.plife > 0 and isRealLevel()) global.miscDeaths[9] += 1;

        global.plife -= 10;
        scrCreateBlood(x, y, 1);
    }
}

colSpikes = false;
if (collision_rectangle(x-4, y-4, x+4, y+8, oSpikes, 0, 0)) colSpikes = true;

if (colSpikes and dead)
{
    //grav = 0;
    if (not collision_point(x, y+9, oSolid, 0, 0)) y += 0.05;
    else myGrav = 0.6;
}
else myGrav = 0.6;

if (colSpikes and yVel > 0 and (fallTimer > 4 or stunned))
{
    if (not dead)
    {
        if (isRealLevel()) global.miscDeaths[4] += 1;
        scrCreateBlood(x, y, 3);
        global.plife -= 99;
        xVel = 0;
        yVel = 0;
        myGrav = 0;
    }

    obj = instance_place(x, y, oSpikes);
    if (obj)
    {
        with obj { sprite_index = sSpikesBlood; }
    }
}
//else if (not dead) myGrav = 0.6;
}

if ((dead or stunned) and holdItem != 0)
{
    holdItem.held = false;
    
    holdItem.xVel = xVel;
    holdItem.yVel = -6;
    holdItem.armed = true;
    if (holdItem.type == "Damsel")
    {
        holdItem.status = 2;
    }
    else if (holdItem.type == "Bow")
    {
        scrFireBow();
    }
    
    if (holdItem.type == pickupItemType)
    {
        holdItem = 0;
        pickupItemType = "";
    }
    else scrHoldItem(pickupItemType);
}

if (dead or stunned)
{
    if (instance_exists(oParachute))
    {
        instance_create(x-8, y-16-8, oParaUsed);
        with oParachute { instance_destroy(); }
    }

    if (whipping)
    {
        whipping = false;
        with oWhip
        {
            instance_destroy();
        }
    }
    
    if (global.isDamsel)
    {
        if (xVel == 0)
        {
            if (dead) sprite_index = sDamselDieL;
            else if (stunned) sprite_index = sDamselStunL;
        }
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
    else if (global.isTunnelMan)
    {
        if (xVel == 0)
        {
            if (dead) sprite_index = sTunnelDieL;
            else if (stunned) sprite_index = sTunnelStunL;
        }
        else if (bounced)
        {
            if (yVel < 0) sprite_index = sTunnelLBounce;
            else sprite_index = sTunnelFallL;
        }
        else
        {
            if (xVel < 0) sprite_index = sTunnelDieLL;
            else sprite_index = sTunnelDieLR;
        }
    }
    else
    {
        if (xVel == 0)
        {
            if (dead) sprite_index = sDieL;
            else if (stunned) sprite_index = sStunL;
        }
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
    
    if (collision_point(x, y, oSpikes, 0, 0) and dead and yVel != 0)
    {
        if (rand(1,8) == 1) scrCreateBlood(other.x, other.y, 1);
    }
    
    if (isCollisionRight(1) or isCollisionLeft(1) or isCollisionBottom(1))
    {
        if (wallHurt > 0)
        {
            for (i = 0; i < 3; i += 1)
            {
                instance_create(other.x, other.y, oBlood);
            }
            global.plife -= 1;
            wallHurt -= 1;
            playSound(global.sndHurt);
        }
    }
    
    if (isCollisionBottom(1) and not bounced)
    {
        bounced = true;
        for (i = 0; i < 3; i += 1)
        {
            scrCreateBlood(other.x, other.y, 1);
        }
        
        if (wallHurt > 0)
        {
            global.plife -= 1;
            wallHurt -= 1;
        }
    }
}

/* */
///Post-death logic

if (dead and deadCounter > 0) deadCounter -= 1;

if (isLevel() or isRoom("rSun") or isRoom("rMoon") or isRoom("rStars"))
{
    if (not dead and global.plife < 1)
    {
        if (global.hasAnkh)
        {
            global.plife = 4;
            if (instance_exists(oMoai))
            {
                with oMoaiInside { instance_destroy(); }
                x = oMoai.x+16+8;
                y = oMoai.y+16+8;
            }
            else if (isRoom("rOlmec"))
            {
                x = 16+8;
                y = 544+8;
            }
            else
            {
                instance_activate_object(oEntrance);
                x = oEntrance.x+8;
                y = oEntrance.y+8;
            }
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
            xVel = 0;
            yVel = 0;
            blink = 60;
            invincible = 60;
            fallTimer = 0;
            visible = true;
            active = true;
            dead = false;
            global.hasAnkh = false;
            message1 = "THE ANKH SHATTERS!";
            message2 = "YOU HAVE BEEN REVIVED!";
            trMessages(message1, message2, 0, 0, 150);
            playSound(global.sndTeleport);
        }
        else
        {
            global.plife = 0;
            global.drawHUD = false;
        
            if (isRoom("rSun")) global.mini1 = oSunRoom.points;
            if (isRoom("rMoon"))
            {
                global.mini2 = oMoonRoom.baskets;
                oMoonRoom.timer = -1;
                oMoonRoom.alarm[10] = 30;
            }
            if (isRoom("rStars")) global.mini3 = oStarsRoom.kills;
            if (global.mini1 > 99) global.mini1 = 99;
            if (global.mini2 > 99) global.mini2 = 99;
            if (global.mini3 > 99) global.mini3 = 99;
            
            if (isRoom("rSun") or isRoom("rMoon") or isRoom("rStars")) scrUpdateHighscores(2);
            else scrUpdateHighscores(0);
    
            dead = true;
            //active = false;
            playSound(global.sndDie);
        }
    }

    if (dead)
    {
        stopAllMusic();
    }
}

/* */
///Death "blinking"

if (not dead and invincible > 0)
  invincible -= 1
  
if (blink > 0)
{
  blinkToggle *= -1
  blink -= 1
}
else blinkToggle = -1;

/*
if (sprite_index == sSlideRight)
{
    spark = instance_create(x, y, oGroundSpark);
    with spark { x += random(3)}
}
else if (sprite_index == sSlideLeft)
{
    spark = instance_create(x, y, oGroundSpark);
    with spark { sprite_index = sSparkLeft; x += random(3)}
}
*/

/* */
money = global.money;

if (global.collectCounter == 0)
{
    if (global.collect > 100)
    {
        global.money += 100;
        global.collect -= 100;
    }
    else 
    {
        global.money += global.collect;
        global.collect -= global.collect;
    }
}
else
{
    global.collectCounter -= 1;
}

if (holdItem)
{
    if (holdItem.type == "Bow")
    {
        if (collision_rectangle(x-8, y-8, x+8, y+8, oArrow, 0, 0) and not dead and not stunned)
        {
            obj = instance_nearest(x, y, oArrow);
            if (abs(obj.xVel) < 1 and abs(obj.yVel) < 1 and not obj.stuck)
            {
                global.arrows += 1;
                playSound(global.sndPickup);
                with obj { instance_destroy(); }
            }
        }
    }
}

if (collision_rectangle(x-8, y-8, x+8, y+8, oTreasure, 0, 0) and not dead and not stunned)
{
    gem = instance_nearest(x, y, oTreasure);
    if (gem.canCollect)
    {
        // global.money += gem.value;
        global.collect += gem.value + ceil(gem.value / 4)*global.levelType;
        global.collectCounter += 20;
        if (global.collectCounter > 100) global.collectCounter = 100;
        
        coin = false;
        //instance_create(x, y-8, oSmallCollect);
        if (gem.type == "Gold Chunk") { global.gold += 1; coin = true; }
        if (gem.type == "Gold Nugget") { global.nuggets += 1; coin = true; }
        if (gem.type == "Gold Bar") { global.goldbar += 1; coin = true; }
        if (gem.type == "Gold Bars") { global.goldbars += 1; coin = true; }
        if (gem.type == "Emerald") global.emeralds += 1;
        if (gem.type == "Big Emerald") global.bigemeralds += 1;
        if (gem.type == "Sapphire") global.sapphires += 1;
        if (gem.type == "Big Sapphire") global.bigsapphires += 1;
        if (gem.type == "Ruby") global.rubies += 1;
        if (gem.type == "Big Ruby") global.bigrubies += 1;
        if (gem.type == "Diamond") global.diamonds += 1;
        if (coin) playSound(global.sndCoin);
        else playSound(global.sndGem);

        with gem { instance_destroy(); }
    }
}

if (collision_rectangle(x-8, y-8, x+8, y+8, oBombBag, 0, 0) and not dead and not stunned)
{
    obj = collision_rectangle(x-8, y-8, x+8, y+8, oBombBag, 0, 0);
    if (not obj.held and obj.cost == 0 and not collision_point(obj.x, obj.y, oSolid, 0, 0))
    {
        global.bombs += 3;
        disp = instance_create(obj.x, obj.y-14, oItemsGet);
        disp.sprite_index = sBombsGet;
        with obj { instance_destroy(); }
        playSound(global.sndPickup);
        message1 = "YOU GOT 3 MORE BOMBS!";
        message2 = "";
        trMessages(message1, message2, 0, 0, 120);
    }
}

if (collision_rectangle(x-8, y-8, x+8, y+8, oBombBox, 0, 0) and not dead and not stunned)
{
    obj = collision_rectangle(x-8, y-8, x+8, y+8, oBombBox, 0, 0);
    if (not obj.held and obj.cost == 0 and not collision_point(obj.x, obj.y, oSolid, 0, 0))
    {
        global.bombs += 12;
        disp = instance_create(obj.x, obj.y-14, oItemsGet);
        disp.sprite_index = sBombsGet;
        with obj { instance_destroy(); }
        playSound(global.sndPickup);
        message1 = "YOU GOT 12 MORE BOMBS!";
        message2 = "";
        trMessages(message1, message2, 0, 0, 120);
    }
}

if (collision_rectangle(x-8, y-8, x+8, y+8, oRopePile, 0, 0) and not dead and not stunned)
{
    obj = collision_rectangle(x-8, y-8, x+8, y+8, oRopePile, 0, 0);
    if (not obj.held and obj.cost == 0 and not collision_point(obj.x, obj.y, oSolid, 0, 0))
    {
        global.rope += 3;
        disp = instance_create(obj.x, obj.y-15, oItemsGet);
        disp.sprite_index = sRopeGet;
        with obj { instance_destroy(); }
        playSound(global.sndPickup);
        message1 = "YOU GOT 3 MORE ROPES!";
        message2 = "";
        trMessages(message1, message2, 0, 0, 120);
    }
}

if (collision_point(x, y, oExit, 0, 0))
{
    if (holdItem != 0)
    {
        collect = false;
        if (holdItem.type == "Gold Idol")
        {
            if (isRealLevel()) global.idolsConverted += 1;
            global.collect += holdItem.value*(global.levelType+1);
            global.collectCounter += 20;
            if (global.collectCounter > 100) global.collectCounter = 100;
            if (holdItem.sprite_index == sCrystalSkull) global.skulls += 1;
            else global.idols += 1;
            playSound(global.sndCoin);
            instance_create(x, y-8, oBigCollect);
            with holdItem { instance_destroy(); }
            holdItem = 0;
        }
        else if (holdItem.type == "Damsel")
        {
            if (holdItem.active and holdItem.hp > 0)
            {
                if (isRealLevel()) global.damselsSavedTotal += 1;
                global.damsels += 1;
                global.xdamsels += 1;
                door = instance_place(x, y, oExit);
                holdItem.x = door.x+8;
                holdItem.y = door.y+8;
                with holdItem
                {
                    if (global.isDamsel) sprite_index = sPExit;
                    else sprite_index = sDamselExit2;
                    status = 4;
                    held = false;
                    xVel = 0;
                    yVel = 0;
                    playSound(global.sndSteps);
                    depth = 1000;
                    active = false;
                    canPickUp = false;
                }
                holdItem = 0;
            }
        }
    }
}

global.xmoney += global.money - money;

///Check keyboard input
if checkRunPressed() {
    if (global.toggleRunEnabled) {
        global.toggleRun = !global.toggleRun;
    }
}