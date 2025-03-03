n = (y - 112) / 8;
if (n+1 <= (oLoadLevel.numLevels - (oLoadLevel.page-1)*10))
{
    oLoadLevel.levelName = string_upper(oLoadLevel.levelList[(oLoadLevel.page-1)*10+n]);
    with oMenuSel { sprite_index = sMenuSelOff; }
    sprite_index = sMenuSelOn;
}
