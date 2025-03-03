if (not on)
{
    with oRadioBox
    {
        on = false;
        sprite_index = sBox;
    }

    on = true;
    sprite_index = sBoxMarked;
    
    if (y == 24) global.screenScale = 1;
    else if (y == 32) global.screenScale = 2;
    else if (y == 40) global.screenScale = 3;
    else if (y == 48) global.screenScale = 4;
}
