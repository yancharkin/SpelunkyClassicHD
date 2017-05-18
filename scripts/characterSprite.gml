//
// characterSprite()
//
// Sets the sprite of the character depending on his/her status
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

if (global.isTunnelMan and not stunned and not whipping)
{
    if (state == STANDING)
    {
        if (not collision_point(x-2, y+9, oSolid, 0, 0))
        {
            image_speed = 0.6;
            sprite_index = sTunnelWhoaL;
        }
        else sprite_index = sTunnelLeft;
    }
    if (state == RUNNING)
    { 
        if (kUp) sprite_index = sTunnelLookRunL;
        else sprite_index = sTunnelRunL;
    }
    if (state == DUCKING)
    {
        if (xVel == 0) sprite_index = sTunnelDuckL;
        else if (abs(xVel) < 3) sprite_index = sTunnelCrawlL;
        else sprite_index = sTunnelRunL;
    }
    if (state == LOOKING_UP)
    {
        if (abs(xVel)>0) sprite_index = sTunnelRunL;
        else sprite_index = sTunnelLookL;
    }
    if (state == JUMPING)
        sprite_index = sTunnelJumpL;
    if (state == FALLING and statePrev == FALLING and statePrevPrev == FALLING)
        sprite_index = sTunnelFallL;
    if (state == HANGING)
        sprite_index = sTunnelHangL;
    if (pushTimer > 20)
        sprite_index = sTunnelPushL;
    if (state == DUCKTOHANG)
        sprite_index = sTunnelDtHL;
    if (state == CLIMBING)
    {
        if (collision_point(x,y,oRope,0,0))
        {
            if (kDown) sprite_index = sTunnelClimb3;
            else sprite_index = sTunnelClimb2;
        }
        else sprite_index = sTunnelClimb;
    }
}
else if (global.isDamsel and not stunned and not whipping)
{
    if (state == STANDING)
    {
        if (not collision_point(x-2, y+9, oSolid, 0, 0))
        {
            image_speed = 0.6;
            sprite_index = sDamselWhoaL;
            /*
            if (holdItem and whoaTimer < 1)
            {
                holdItem.held = false;
                if (facing == LEFT) holdItem.xVel = -2;
                else holdItem.xVel = 2;
                if (holdItem.type == "Damsel") playSound(global.sndDamsel);
                if (holdItem.type == pickupItemType)
                {
                    holdItem = 0;
                    pickupItemType = "";
                }
                else scrHoldItem(pickupItemType);
            }
            */
        }
        else sprite_index = sDamselLeft;
    }
    if (state == RUNNING)
    { 
        if (kUp) sprite_index = sDamselRunL;
        else sprite_index = sDamselRunL;
    }
    if (state == DUCKING)
    {
        if (xVel == 0) sprite_index = sDamselDuckL;
        else if (abs(xVel) < 3) sprite_index = sDamselCrawlL;
        else sprite_index = sDamselRunL;
    }
    if (state == LOOKING_UP)
    {
        if (abs(xVel)>0) sprite_index = sDamselRunL;
        else sprite_index = sDamselLookL;
    }
    if (state == JUMPING)
        sprite_index = sDamselDieLR;
    if (state == FALLING and statePrev == FALLING and statePrevPrev == FALLING)
        sprite_index = sDamselFallL;
    if (state == HANGING)
        sprite_index = sDamselHangL;
    if (pushTimer > 20)
        sprite_index = sDamselPushL;
    if (state == DUCKTOHANG)
        sprite_index = sDamselDtHL;
    if (state == CLIMBING)
    {
        if (collision_point(x,y,oRope,0,0))
        {
            if (kDown) sprite_index = sDamselClimb3;
            else sprite_index = sDamselClimb2;
        }
        else sprite_index = sDamselClimb;
    }
}
else if (not stunned and not whipping)
{     
    if (state == STANDING)
    {
        if (not collision_point(x-2, y+9, oSolid, 0, 0))
        {
            image_speed = 0.6;
            sprite_index = sWhoaLeft;
            /*
            if (holdItem and whoaTimer < 1)
            {
                holdItem.held = false;
                if (facing == LEFT) holdItem.xVel = -2;
                else holdItem.xVel = 2;
                if (holdItem.type == "Damsel") playSound(global.sndDamsel);
                if (holdItem.type == pickupItemType)
                {
                    holdItem = 0;
                    pickupItemType = "";
                }
                else scrHoldItem(pickupItemType);
            }
            */
        }
        else sprite_index = sStandLeft;
    }
    if (state == RUNNING)
    { 
        if (kUp) sprite_index = sLookRunL;
        else sprite_index = sRunLeft
    }
    if (state == DUCKING)
    {
        if (xVel == 0) sprite_index = sDuckLeft;
        else if (abs(xVel) < 3) sprite_index = sCrawlLeft;
        else sprite_index = sRunLeft;
    }
    if (state == LOOKING_UP)
    {
        if (abs(xVel)>0) sprite_index = sLookRunL;
        else sprite_index = sLookLeft
    }
    if (state == JUMPING)
        sprite_index = sJumpLeft
    if (state == FALLING and statePrev == FALLING and statePrevPrev == FALLING)
        sprite_index = sFallLeft
    if (state == HANGING)
        sprite_index = sHangLeft;
    if (pushTimer > 20)
        sprite_index = sPushLeft;
    if (state == CLIMBING)
    {
        if (collision_point(x,y,oRope,0,0))
        {
            if (kDown) sprite_index = sClimbUp3;
            else sprite_index = sClimbUp2;
        }
        else sprite_index = sClimbUp;
    }
    if (state == DUCKTOHANG)
        sprite_index = sDuckToHangL;
}
