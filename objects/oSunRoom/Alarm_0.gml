if (not oPlayer1.dead)
{
    i = oPlayer1.x;
    j = 32;
    if (i < 40) i = 40;
    if (i > 280) i = 280;
    if (not collision_point(i, j, oSolid, 0, 0))
    {
        if (points >= 80)
        {
            if (instance_exists(oGhost)) { /* do nothing */ }
            else if (oPlayer1.x > room_width/2) instance_create(-32, 120-16, oGhost);
            else instance_create(320, 120-16, oGhost);
        }
        else if (points >= 50)
        {
            obj = instance_create(152, 32, oVampire);
            obj.status = 7;
            with obj
            {
                obj = instance_create(x+8, y+8, oPoof);
                obj.xVel = -1;
                obj.yVel = 0;
                obj = instance_create(x+8, y+8, oPoof);
                obj.xVel = 1;
                obj.yVel = 0;
            }
        }
        else
        {
            obj = instance_create(i, j, oBomb);
            obj.sprite_index = sBombArmed;
            obj.armed = true;
            with obj
            {
                alarm[0] = 80;
                image_speed = 0.2;
                obj = instance_create(x, y, oPoof);
                obj.xVel = -1;
                obj.yVel = 0;
                obj = instance_create(x, y, oPoof);
                obj.xVel = 1;
                obj.yVel = 0;
            }       
            //obj.safe = true;
            obj.alarm[2] = 10;
        }
        alarm[0] = rand(100,200);
    }
    else
        alarm[0] = 1;
}
/* */
/*  */
