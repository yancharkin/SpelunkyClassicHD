if (other.type == "Arrow" or other.type == "Fish Bone" or
    other.type == "Jar" or other.type == "Skull")
{
    with other { instance_destroy(); }
}
else if (other.type == "Bomb")
{
    with other
    {
        sprite_index = sBombArmed;
        image_speed = 1;
        alarm[1] = rand(4,8);
        enemyID = 0;
    }

    if (other.y < y) other.yVel = -rand(2,4);
    if (other.x < x) other.xVel = -rand(2,4);
    else other.xVel = rand(2,4);
}
else if (other.type == "Rope")
{
    if (not other.falling)
    {
        if (other.y < y) other.yVel -= 6;
        else other.yVel += 6;
        if (x > other.x) other.xVel -= rand(4,6);
        else other.xVel += rand(4,6);
    }
}
else
{
    if (other.y < y) other.yVel -= 6;
    else other.yVel += 6;
    if (x > other.x) other.xVel -= rand(4,6);
    else other.xVel += rand(4,6);
}

if (other.held)
{
    with oPlayer1
    {
        holdItem = 0;
        pickupItemType = "";
    }
    other.held = false;
}
