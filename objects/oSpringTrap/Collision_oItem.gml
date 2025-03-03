if (status == IDLE and abs(other.x-(x+8)) < 6 and not other.held and counter = 0 and
    other.active)
{
    sprite_index = sSpringTrapSprung;
    playSound(global.sndBoing);
    status = SPRUNG;
    with other
    {
        y -= 24;
        yVel = -8;
        if (type == "Damsel")
        {
            if (facing == 18) xVel -= 1;
            else xVel += 1;
        }
        
    }
    counter = 10;
}
