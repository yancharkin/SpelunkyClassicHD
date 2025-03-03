if (instance_exists(oTransition) and not instance_exists(oPDummy))
{
    instance_destroy();
}
else if (instance_exists(oPDummy))
{
    if (oPDummy.sprite_index == sPExit or oPDummy.sprite_index == sDamselExit or oPDummy.sprite_index == sTunnelExit)
    {
        x = oPDummy.x;
        y = oPDummy.y+4;
        sprite_index = sCapeBack;
        depth = 0;
    }
    else
    {
        x = oPDummy.x - 4;
        y = oPDummy.y - 2;
        if (oPDummy.sprite_index == sRunLeft or oPDummy.sprite_index == sDamselRunL or oPDummy.sprite_index == sTunnelRunL) sprite_index = sCapeRight;
        else sprite_index = sCapeDR;
        depth = 100;
    }
}
else if ((oPlayer1.state == 14 or (oPlayer1.sprite_index == sPExit or oPlayer1.sprite_index == sDamselExit or oPlayer1.sprite_index == sTunnelExit)) and not oPlayer1.whipping)
{
    x = oPlayer1.x;
    y = oPlayer1.y+4;
    sprite_index = sCapeBack;
    depth = 0;
}
else if (oPlayer1.facing == 19)
{
    x = oPlayer1.x - 4;
    y = oPlayer1.y - 2;
    if (oCape.open) sprite_index = sCapeUR;
    else if (abs(oPlayer1.xVel) > 0) sprite_index = sCapeRight;
    else sprite_index = sCapeDR;
    depth = 100;
}
else
{
    x = oPlayer1.x + 4;
    y = oPlayer1.y - 2;
    if (oCape.open) sprite_index = sCapeUL;
    else if (abs(oPlayer1.xVel) > 0) sprite_index = sCapeLeft;
    else sprite_index = sCapeDL;
    depth = 100;
}

if (instance_exists(oPlayer1))
    if (not oPlayer1.visible) instance_destroy();
