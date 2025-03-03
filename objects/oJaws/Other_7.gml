if (sprite_index == sJawsTurnL)
{
    //dir = 180;
    sprite_index = sJawsLeft;
    status = PAUSE;
    counter = 40;
}
else if (sprite_index == sJawsTurnR)
{
    //dir = 0;
    sprite_index = sJawsRight;
    status = PAUSE;
    counter = 40;
    x = x + 48;
}
