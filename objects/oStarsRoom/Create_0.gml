global.plife = 8;
highscore = false;
kills = 0;
drawStatus = 0;
alarm[0] = 100;
alarm[1] = 30;
alarm[10] = 100;
alarm[11] = 110;

// To prevent the Tunnel Man from tearing up the whole level.
with oBrick
{
    if (x <= 16 or x >= 288 or y <= 16 or y >= 208)
    {
        invincible = true;
    }
}
