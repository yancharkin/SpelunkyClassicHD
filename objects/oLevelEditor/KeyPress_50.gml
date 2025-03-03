// Monsters
if (status == 1)
{
    dropSelect = 1;
    if (global.tunnel1 == 0 and global.tunnel2 > 0) dropMax = 14;
    else if (global.tunnel1 > 0 and global.tunnel2 == 0) dropMax = 19;
    else if (global.tunnel1 == 0 and global.tunnel2 == 0) dropMax = 21;
    else dropMax = 6;
    dropVal = 0;
    oCursObj.sprite_index = sBatLeft;
}
