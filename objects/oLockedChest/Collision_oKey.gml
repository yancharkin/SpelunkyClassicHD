if (other.held and sprite_index == sLockedChest)
{
    other.held = false;
    with oPlayer1
    {
        holdItem = 0;
        pickupItemType = "";
    }
    with other { instance_destroy(); }
    
    sprite_index = sLockedChestOpen;
    playSound(global.sndChestOpen);
    obj = instance_create(x, y, oUdjatEye);
    obj.xVel = rand(0,3) - rand(0,3);
    obj.yVel = -2;
    obj = instance_create(x, y, oPoof);
    with obj { xVel = -0.4; }
    obj = instance_create(x, y, oPoof);
    with obj { xVel = 0.4; }
    instance_destroy();
}
