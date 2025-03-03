if (other.invincible == 0)
{
    if (true)
    {
        if (isRealLevel()) global.enemyDeaths[23] += 1;
        repeat(3)
        {
            instance_create(other.x, other.y, oBone);
        }
        skull = instance_create(other.x, other.y-2, oSkull);
        skull.yVel = -rand(1,3);
        skull.xVel = rand(0,3)-rand(0,3);
        other.visible = false;
        other.invincible = 9999;
        other.bounced = true;
        global.plife = -99;
        playSound(global.sndDie);
        global.drawHUD = false;
        
        if (other.holdItem)
        {
            other.holdItem.held = false;
            if (facing == LEFT) other.holdItem.xVel = -2;
            else other.holdItem.xVel = 2;
            other.holdItem.yVel = -4;
            other.holdItem = 0;
        }
        
        status = IDLE;
        image_speed = 0.2;
        sprite_index = sGhostDisappear;
        playSound(global.sndGhost);
    }
}

