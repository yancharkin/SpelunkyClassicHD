/*if (musicFade and musicFadeTimer < 100)
{
    scrMusicFade();
    musicFadeTimer += 1;
}*/

if (view_enabled)
{
    // shake the screen
    if (global.shake > 0)
    {
        if (oPlayer1.y < 96 or oPlayer1.y > room_height-96) __view_set( e__VW.VBorder, 0, 0 );
        else __view_set( e__VW.VBorder, 0, 96 );
        if (global.shakeToggle or __view_get( e__VW.YView, 0 ) <= 0)
        {
            __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (3) );
            global.shakeToggle = false;
        }
        else if (not global.shakeToggle or __view_get( e__VW.YView, 0 ) >= room_height - __view_get( e__VW.HView, 0 ))
        {
            __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (3) );
            global.shakeToggle = true;
        }
        global.shake -= 1;
    }
    else
    {
        __view_set( e__VW.VBorder, 0, 96 );
    }
    /*
    if (global.shake > 0)
    {
        if (oPlayer1.y < 240-96 or oPlayer1.y > room_height-144) view_vborder[0] = 0;
        else view_vborder[0] = 96;
        //view_xview[0] = view_xview[0] + rand(0,3) - rand(0,3);
        if (global.shakeToggle)
        {
            // if (view_yview[0] >= room_height - view_hview[0]) view_yview[0] = 304;
            // global.yviewPrev = view_yview[0];
            global.yShakeDiff = rand(1,3);
            view_yview[0] = view_yview[0] + global.yShakeDiff;
        }
        else
        {
            view_yview[0] = view_yview[0] - global.yShakeDiff;
        }
        global.shake -= 1;
        global.shakeToggle = not global.shakeToggle;
    }
    else
    {
        global.shakeToggle = false;
        global.yShakeDiff = 0;
        view_vborder[0] = 96;
    }
    */
    /*
    if (global.levelType != 2)
    {
        if (view_yview[0] + view_hview[0] > 560) view_yview[0] = 560;
    }
    */

    offset = 96;
    // deactivate all instances outside the region
    
    // this is to prevent water from only getting drained partway
    with oWater
    {
        if (x+8 < __view_get( e__VW.XView, 0 )-96 or x+8 > __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+96 or y+8 < __view_get( e__VW.YView, 0 )-96 or y+8 > __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+96)
        {
            checked = false;
        }
    }
    //instance_deactivate_region(view_xview[0]-offset, view_yview[0]-offset, view_wview[0]+offset*2, view_hview[0]+offset*2, false, true);
    // activate all instances inside the region
    instance_activate_region(__view_get( e__VW.XView, 0 )-offset, __view_get( e__VW.YView, 0 )-offset, __view_get( e__VW.WView, 0 )+offset*2, __view_get( e__VW.HView, 0 )+offset*2, true);
    // activate all important instances
    // instance_activate_object(oSolid);
    // instance_activate_object(oWater);
    instance_activate_object(oCharacter);
    instance_activate_object(oRope);
    instance_activate_object(oRopeThrow);
    instance_activate_object(oRopeTop);
    // instance_activate_object(oOlmec);
    instance_activate_object(oGame);
    instance_activate_object(oGlobals);
    instance_activate_object(oScreen);
    instance_activate_object(oGamepad);
    instance_activate_object(oExplosion);
    instance_activate_object(oGhost);
    instance_activate_object(oFinalBoss);
    if (instance_exists(oPlayer1))
        instance_activate_region(oPlayer1.x-16, oPlayer1.y-16, oPlayer1.x+16, oPlayer1.y+16, true);
    instance_activate_object(oBoulder);
    if (instance_exists(oBoulder))
        instance_activate_region(oBoulder.x-32, oBoulder.y-32, 64, 64, true);
    instance_activate_object(oOlmec);
    if (instance_exists(oOlmec))
        instance_activate_region(oOlmec.x-16, oOlmec.y-16, 96, 96, true);
    /*
    with oCaveTop { if (not collision_point(x, y+16, oBrick, 0, 0)) instance_destroy(); }
    with oLushTop { if (not collision_point(x, y+16, oLush, 0, 0)) instance_destroy(); }
    with oDarkTop { if (not collision_point(x, y+16, oDark, 0, 0)) instance_destroy(); }
    with oTempleTop { if (not collision_point(x, y+16, oTemple, 0, 0)) instance_destroy(); }
    with oIceBottom { if (not collision_point(x, y-16, oIce, 0, 0)) instance_destroy(); }
    */
    
    //instance_activate_object(oNAL);
}

// darkness
if (global.darkLevel)
{
    // darkness = 0 : lightest
    // darkness = 1 : darkest
    dist = 160;
    if (global.hasCrown) dist = 0;
    else if (instance_exists(oFlare))
    {
        flare = instance_nearest(oPlayer1.x, oPlayer1.y, oFlare);
        dist = flare.distToPlayer;
    }
        
    if (oPlayer1.distToNearestLightSource < 200 and oPlayer1.distToNearestLightSource < dist)
    {
        dist = oPlayer1.distToNearestLightSource;
    }
    if (dist == 0) darkness = 0;
    else darkness = dist / 160;
       
    if (global.darknessLerp > 0)
    {
        darkness = global.darknessLerp;
        global.darknessLerp -= 0.1;
    }
    
    if (darkness > 0.9) darkness = 0.9;
}

/* */
/*  */
