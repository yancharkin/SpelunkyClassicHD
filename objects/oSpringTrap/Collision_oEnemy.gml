if (status == IDLE and abs(other.x-x) < 6 and counter = 0 and not other.flying)
{
    sprite_index = sSpringTrapSprung;
    playSound(global.sndBoing);
    status = SPRUNG;
    with other
    {
        y -= 16;
        yVel = -8;
        if (facing == 0) xVel -= 1;
        else xVel += 1;
    }
    counter = 10;
}
