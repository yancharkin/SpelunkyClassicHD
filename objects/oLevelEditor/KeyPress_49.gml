// Blocks
if (status == 1)
{
    dropSelect = 0;
    if (global.tunnel1 == 0 and global.tunnel2 > 0) dropMax = 18;
    else if (global.tunnel1 > 0 and global.tunnel2 == 0) dropMax = 21;
    else if (global.tunnel1 == 0 and global.tunnel2 == 0) dropMax = 23;
    else dropMax = 10;
    dropVal = 0;
    oCursObj.sprite_index = sEntrance;
}
