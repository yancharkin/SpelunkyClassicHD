if (status == IDLE and abs(other.x-(x+8)) < 6 and counter = 0)
{
    if (other.state <= 13 and other.sprite_index != sPExit and other.sprite_index != sDamselExit)
    {
        sprite_index = sSpringTrapSprung;
        playSound(global.sndBoing);
        status = SPRUNG;
        with other
        {
            y -= 16;
            yVel = -16;
        }
        counter = 10;
    }
}
