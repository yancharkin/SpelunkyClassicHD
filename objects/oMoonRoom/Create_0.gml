global.plife = 8;
highscore = false;
baskets = 0;
timer = 60;
drawStatus = 0;
alarm[0] = 100;
alarm[1] = 30;
alarm[9] = 100;
global.arrows = 100;

// To prevent the Tunnel Man from tearing up the whole level.
with oBrick
{
    if (x <= 16 or x >= 288 or y <= 16 or y >= 208)
    {
        invincible = true;
    }
}
