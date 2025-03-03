if (other.type == "Bomb")
{
    with other
    {
        sprite_index = sBombArmed;
        image_speed = 1;
        alarm[1] = rand(4,8);
    }
}

other.xVel = -rand(4,6);
other.yVel = -2;

if (other.held)
{
    if (oCharacter) oCharacter.holdItem = 0;
}
