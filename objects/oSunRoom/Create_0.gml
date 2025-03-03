global.plife = 8;
highscore = false;
points = 0;
drawStatus = 0;
alarm[0] = 100+rand(100,200);
alarm[1] = 30;
alarm[10] = 100;
alarm[11] = 100;

// To prevent the Tunnel Man from tearing up the whole level.
with oBrick
{
    if (x <= 16 or x >= 288 or y <= 16 or y >= 208)
    {
        invincible = true;
    }
}
