if (shopWall)
{
    with oShopkeeper
    {
        scrShopkeeperAnger(1);
    }
}

if (collision_point(x+8, y-1, oSpikes, 0, 0))
{
    obj = instance_place(x+8, y-1, oSpikes);
    with obj { instance_destroy(); }
}
if (collision_point(x+8, y-1, oTikiTorch, 0, 0))
{
    obj = instance_place(x+8, y-1, oTikiTorch);
    with obj { instance_destroy(); }
}
if (collision_point(x+8, y-1, oGrave, 0, 0))
{
    obj = instance_place(x+8, y-1, oGrave);
    with obj { instance_destroy(); }
}
if (collision_point(x+8, y+18, oLampRed, 0, 0))
{
    obj = instance_place(x+8, y+16, oLampRed);
    with obj { instance_create(x+8, y+12, oLampRedItem); instance_destroy(); }
}
if (collision_point(x+8, y+18, oLamp, 0, 0))
{
    obj = instance_place(x+8, y+16, oLamp);
    with obj { instance_create(x+8, y+12, oLampItem); instance_destroy(); }
}

global.checkWater = true;
