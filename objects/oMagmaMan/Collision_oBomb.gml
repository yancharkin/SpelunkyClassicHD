if (other.sprite_index != sBombArmed)
{
    with other
    {
        sprite_index = sBombArmed;
        image_speed = 1;
        alarm[1] = rand(8,12);
    }
}

if (other.x < x) other.xVel = -rand(2,4);
else other.xVel = rand(2,4);
if (other.y < y) other.yVel = -rand(2,4);

if (other.held)
{
    if (oCharacter) oCharacter.holdItem = 0;
}
