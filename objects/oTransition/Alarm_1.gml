drawLoot += 1;

if (drawLoot < 0)
{
    if (hurryup) alarm[1] = 1;
    else alarm[1] = 30;
}

