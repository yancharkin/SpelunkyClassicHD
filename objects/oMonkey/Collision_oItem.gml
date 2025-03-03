if (throwCounter == 0 and status != GRAB and other.active and not other.held)
{
    if (other.type == "Rope")
    {
        if (not other.falling)
        {
            if (facing == RIGHT) other.xVel = 5;
            else other.xVel = -5;
            other.yVel = -4;
            if (not collision_point(other.x, other.y, oSolid, 0, 0)) other.y = y-2
            throwCounter = 60;
            status = IDLE;
            counter = rand(20,60);
        }
    }
    else
    {
        if (facing == RIGHT) other.xVel = 5;
        else other.xVel = -5;
        other.yVel = -4;
        if (not collision_point(other.x, other.y-2, oSolid, 0, 0)) other.y -= 2;
        throwCounter = 60;
        status = IDLE;
        counter = rand(20,60);
    }
}
