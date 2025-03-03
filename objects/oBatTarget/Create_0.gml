bloodless = false;
UP = 0;
DOWN = 1;
dir = 1;
if (x == 208) difficulty = 2;
else if (x == 256) difficulty = 4;
else difficulty = 1;
xMid = x;
xDiff = 0;
if (oMoonRoom.timer <= 20)
{
    difficulty += 2;
    sprite_index = sUFO;
}
