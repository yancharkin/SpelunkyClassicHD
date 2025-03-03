if (sprite_index != sGiantSpiderSquirt)
{
    status = BOUNCE;
    sprite_index = sGiantSpiderJump;
    if (isCollisionBottom(1))
    {
        sprite_index = sGiantSpider;
        yVel = -1 * rand(2,5);
        if (oCharacter.x < x+16)
        {
            xVel = -2.5;
        }
        else
        {
            xVel = 2.5;
        }
    }
}
