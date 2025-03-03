action_inherited();
if (colLeft or colRight) wallBounce = true;
else if (colBot) wallBounce = false;

if (collision_rectangle(x-1, y+4, x+1, y+5, oRimDeflect, 0, 0) and not goingIn and bounces < 40)
{
    yVel = -yVel * 0.8;
    obj = instance_nearest(x, y, oRimDeflect);
    if (x < (obj.x+8) and abs((obj.x+8)-x) > 7)
    {
        xVel = -2;
        yVel = -0.5;
    }
    else if (x > (obj.x+8) and abs((obj.x+8)-x) > 7)
    {
        xVel = 2;
        yVel = -0.5;
    }
    else if (abs((obj.x+8)-x) < 4)
    {
        if (x < (obj.x+8)) xVel = 1;
        else xVel = -0.2;
        yVel = -0.5;
    }
    bounces += 10;
}

if (bounces > 0) bounces -= 1;

if (collision_point(x, y, oRim, 0, 0))
{
    if (not goingIn and (yVel > 0 or (held and oPlayer1.state == 16)))
    {
        with oMoonRoom { alarm[0] = 20; }
        xVel = 0;
        yVel = 0;
        goingIn = true;
        obj = instance_nearest(x, y, oBasket);
        obj.sprite_index = sBasketSwoosh;
        obj.image_index = 0;
        if (held)
        {
            oMoonRoom.baskets += 1;
            oPlayer1.holdItem = false;
        }
        else if (wallBounce)
        {
            oMoonRoom.baskets += 3;
        }
        else
            oMoonRoom.baskets += 2;
        held = false;
    }
}
else goingIn = false;

if (held and collision_point(x, y+6, oSolid, 0, 0)) sprite_index = sDribble;
else sprite_index = sBasketball;
