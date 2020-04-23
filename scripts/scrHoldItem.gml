//
// scrHoldItem(itemType)
//
// Set itemType to the currently held item.
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

itemType = argument0;
pickup = true;

if (itemType == "")
{
    holdItem = 0;
    pickupItemType = "";
}
else
{
    if (itemType == "Rock") holdItem = instance_create(x, y, oRock);
    else if (itemType == "Jar") holdItem = instance_create(x, y, oJar);
    else if (itemType == "Skull") holdItem = instance_create(x, y, oSkull);
    else if (itemType == "Fish Bone") holdItem = instance_create(x, y, oFishBone);
    else if (itemType == "Arrow") holdItem = instance_create(x, y, oArrow);
    else if (itemType == "Rock") holdItem = instance_create(x, y, oRock);
    else if (itemType == "Machete") holdItem = instance_create(x, y, oMachete);
    else if (itemType == "Mattock") holdItem = instance_create(x, y, oMattock);
    else if (itemType == "Mattock Head") holdItem = instance_create(x, y, oMattockHead);
    else if (itemType == "Pistol") holdItem = instance_create(x, y, oPistol);
    else if (itemType == "Web Cannon") holdItem = instance_create(x, y, oWebCannon);
    else if (itemType == "Teleporter") holdItem = instance_create(x, y, oTeleporter);
    else if (itemType == "Shotgun") holdItem = instance_create(x, y, oShotgun);
    else if (itemType == "Bow") holdItem = instance_create(x, y, oBow);
    else if (itemType == "Flare") holdItem = instance_create(x, y, oFlare);
    else if (itemType == "Sceptre") holdItem = instance_create(x, y, oSceptre);
    else if (itemType == "Key") holdItem = instance_create(x, y, oKey);
    else pickup = false;
    if (pickup)
    {
        holdItem.held = true;
        holdItem.cost = 0;
        holdItem.new = false;
        pickupItemType = itemType;
        whoaTimer = whoaTimerMax;
    }
    else
    {
        holdItem = 0;
        pickupItemType = "";
    }
}    
