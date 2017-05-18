//
// scrGetFavorMsg()
//
// Display appropriate message (and give gift) after player sacrifices to Kali.
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

if (global.favor <= -8) global.message2 = "SHE SEEMS VERY ANGRY WITH YOU!";
else if (global.favor < 0) global.message2 = "SHE SEEMS ANGRY WITH YOU.";
else if (global.favor == 0) global.message2 = "SHE HAS FORGIVEN YOU!";
else if (global.favor >= 32)
{
    if (global.kaliGift >= 3 and global.favor >= 32 + (global.kaliGift-2)*16)
    {
        global.message2 = "YOU FEEL INVIGORATED!";
        global.kaliGift += 1;
        global.plife += rand(4,8);
    }
    else if (global.kaliGift >= 3)
    {
        global.message2 = "SHE SEEMS ECSTATIC WITH YOU!";
    }
    else if (global.bombs < 80)
    {
        global.message2 = "YOUR SATCHEL FEELS VERY FULL NOW!";
        global.kaliGift = 3;
        global.bombs = 99;
    }
    else
    {
        global.message2 = "YOU FEEL INVIGORATED!";
        global.kaliGift += 1;
        global.plife += rand(4,8);
    }
}
else if (global.favor >= 16)
{
    if (global.kaliGift >= 2)
    {
        global.message2 = "SHE SEEMS VERY HAPPY WITH YOU!";
    }
    else
    {
        global.message2 = "SHE BESTOWS A GIFT UPON YOU!";
        global.kaliGift = 2;
        obj = instance_create(oSacAltarRight.x, y-8, oKapala);
        obj.cost = 0;
        obj.forSale = false;
    }
}
else if (global.favor >= 8)
{
    if (global.kaliGift >= 1)
    {
        global.message2 = "SHE SEEMS HAPPY WITH YOU.";
    }
    else
    {
        global.message2 = "SHE BESTOWS A GIFT UPON YOU!";
        global.kaliGift = 1;
        if (instance_exists(oSacAltarRight))
        {
            obj = instance_create(oSacAltarRight.x, y-8, oPoof);
            obj.xVel = -1;
            obj.yVel = 0;
            obj = instance_create(oSacAltarRight.x, y-8, oPoof);
            obj.xVel = 1;
            obj.yVel = 0;
            n = rand(1,8);
            m = n;
            while (true)
            {
                if (n == 1 and not global.hasCape and not global.hasJetpack) { obj = instance_create(oSacAltarRight.x, y-8, oCapePickup); break; }
                else if (n == 2 and not global.hasGloves) { obj = instance_create(oSacAltarRight.x, y-8, oGloves); break; }
                else if (n == 3 and not global.hasSpectacles) { obj = instance_create(oSacAltarRight.x, y-8, oSpectacles); break; }
                else if (n == 4 and not global.hasMitt) { obj = instance_create(oSacAltarRight.x, y-8, oMitt); break; }
                else if (n == 5 and not global.hasSpringShoes) { obj = instance_create(oSacAltarRight.x, y-8, oSpringShoes); break; }
                else if (n == 6 and not global.hasSpikeShoes) { obj = instance_create(oSacAltarRight.x, y-8, oSpikeShoes); break; }
                else if (n == 7 and not global.hasStickyBombs) { obj = instance_create(oSacAltarRight.x, y-8, oPaste); break; }
                else if (n == 8 and not global.hasCompass) { obj = instance_create(oSacAltarRight.x, y-8, oCompass); break; }
                n += 1;
                if (n > 8) n = 1;
                if (n == m)
                {
                    if (not global.hasJetpack) obj = instance_create(oSacAltarRight.x, y-8, oJetpack);
                    else obj = instance_create(oSacAltarRight.x, y-8, oBombBox);
                    break;
                }
            }
            obj.cost = 0;
            obj.forSale = false;
        }
    }
}
else if (global.favor > 0) global.message2 = "SHE SEEMS PLEASED WITH YOU.";
