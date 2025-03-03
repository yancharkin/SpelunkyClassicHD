// Traps
if (status == 1)
{
    dropSelect = 2;
    if (global.tunnel1 == 0 and global.tunnel2 > 0) dropMax = 4;
    else if (global.tunnel1 > 0 and global.tunnel2 == 0) dropMax = 5;
    else if (global.tunnel1 == 0 and global.tunnel2 == 0) dropMax = 6;
    else dropMax = 2;
    dropVal = 0;
    oCursObj.sprite_index = sSpikes;
}
