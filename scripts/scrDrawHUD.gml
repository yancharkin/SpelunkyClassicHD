//
// scrDrawHUD()
//
// Draw the HUD.  This is called in the Draw GUI Event of oGame.
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

if (global.drawHUD && instance_exists(oPlayer1) && view_current==7)
{
    vxv=0 //view_xview[0];
    vyv=0 //view_yview[0];
    
    lifeX = vxv+8;
    bombX = vxv+64;
    ropeX = vxv+120;
    moneyX = vxv+176;
    draw_set_font(global.myFont);
    draw_set_color(c_white);
    draw_sprite(sHeart, -1, lifeX, vyv+8);
    life = global.plife;
    if (life < 0) life = 0;
    draw_text(lifeX+16, vyv+8, life);
    if (global.hasStickyBombs) draw_sprite(sStickyBombIcon, -1, bombX, vyv+8);
    else draw_sprite(sBombIcon, -1, bombX, vyv+8);
    draw_text(bombX+16, vyv+8, global.bombs);
    draw_sprite(sRopeIcon, -1, ropeX, vyv+8);
    draw_text(ropeX+16, vyv+8, global.rope);
    draw_sprite(sDollarSign, -1, moneyX, vyv+8);
    draw_text(moneyX+16, vyv+8, global.money);

    if (isRoom("rOlmec")) { global.exitX = 640; global.exitY = 544; }
    
    if (global.hasCompass)
    {
        if (global.exitY > view_yview[0] + 240)
        {
            if (global.exitX < view_xview[0])
            {
                if (global.messageTimer > 0) draw_sprite(sCompassSmallLL, -1, vxv+0, vyv+224);
                else draw_sprite(sCompassLL, -1, vxv+0, vyv+224);
            }
            else if (global.exitX > view_xview[0]+320-16)
            {
                if (global.messageTimer > 0) draw_sprite(sCompassSmallLR, -1, vxv+304, vyv+224);
                else draw_sprite(sCompassLR, -1, vxv+304, vyv+224);
            }
            else
            {
                if (global.messageTimer > 0) draw_sprite(sCompassSmallDown, -1, vxv+global.exitX-view_xview[0], vyv+224);
                else draw_sprite(sCompassDown, -1, vxv+global.exitX-view_xview[0], vyv+224);
            }
        }
        else if (global.exitX < view_xview[0])
        {
            if (global.messageTimer > 0) draw_sprite(sCompassSmallLeft, -1, vxv+0, vyv+global.exitY-view_yview[0]);
            else draw_sprite(sCompassLeft, -1, vxv+0, vyv+global.exitY-view_yview[0]);
        }
        else if (global.exitX > view_xview[0]+320-16)
        {
            if (global.messageTimer > 0) draw_sprite(sCompassSmallRight, -1, vxv+304, vyv+global.exitY-view_yview[0]);
            else draw_sprite(sCompassRight, -1, vxv+304, vyv+global.exitY-view_yview[0]);
        }
    }
    
    draw_sprite(sHoldItemIcon, -1, vxv+8, vyv+24);
    if (oPlayer1.pickupItemType!= "")
    {
             if (oPlayer1.pickupItemType== "Rock") draw_sprite(sRock, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Jar") draw_sprite(sJar, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Skull") draw_sprite(sSkull, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Fish Bone") draw_sprite(sFishBone, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Arrow") draw_sprite(sArrowRight, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Machete") draw_sprite(sMacheteRight, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Mattock") draw_sprite(sMattockRight, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Mattock Head") draw_sprite(sMattockHead, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Pistol") draw_sprite(sPistolRight, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Web Cannon") draw_sprite(sWebCannonR, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Teleporter") draw_sprite(sTeleporter, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Shotgun") draw_sprite(sShotgunRight, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Bow") draw_sprite(sBowDisp, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Sceptre") draw_sprite(sSceptreRight, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Flare") draw_sprite(sFlare, -1, vxv+8+8, vyv+24+8);
        else if (oPlayer1.pickupItemType== "Key") draw_sprite(sKeyRight, -1, vxv+8+8, vyv+24+8);
    }
    
    n = 28;
    if (global.hasUdjatEye)
    {
        if (global.udjatBlink) draw_sprite(sUdjatEyeIcon2, -1, vxv+n, vyv+24);
        else draw_sprite(sUdjatEyeIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasAnkh)
    {
        draw_sprite(sAnkhIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasCrown)
    {
        draw_sprite(sCrownIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasKapala)
    {
        if (global.bloodLevel == 0) draw_sprite(sKapalaIcon, 0, vxv+n, vyv+24);
        else if (global.bloodLevel <= 2) draw_sprite(sKapalaIcon, 1, vxv+n, vyv+24);
        else if (global.bloodLevel <= 4) draw_sprite(sKapalaIcon, 2, vxv+n, vyv+24);
        else if (global.bloodLevel <= 6) draw_sprite(sKapalaIcon, 3, vxv+n, vyv+24);
        else if (global.bloodLevel <= 8) draw_sprite(sKapalaIcon, 4, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasSpectacles)
    {
        draw_sprite(sSpectaclesIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasGloves)
    {
        draw_sprite(sGlovesIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasMitt)
    {
        draw_sprite(sMittIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasSpringShoes)
    {
        draw_sprite(sSpringShoesIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasSpikeShoes)
    {
        draw_sprite(sSpikeShoesIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasCape)
    {
        draw_sprite(sCapeIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasJetpack)
    {
        draw_sprite(sJetpackIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasCompass)
    {
        draw_sprite(sCompassIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (global.hasParachute)
    {
        draw_sprite(sParachuteIcon, -1, vxv+n, vyv+24);
        n += 20;
    }
    if (oPlayer1.pickupItemType == "Bow")
    {
        m = global.arrows;
        while (m > 0)
        {
            draw_sprite(sArrowIcon, -1, vxv+n, vyv+24);
            n += 4;
            m -= 1;
        }
    }
     
    draw_set_font(global.myFontSmall);
    draw_set_color(c_yellow);
    if (global.collect > 0) draw_text(moneyX, vyv+8+16, "+" + string(global.collect));
}
