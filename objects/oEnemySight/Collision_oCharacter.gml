with oCaveman
{
    if (distance_to_object(oPlayer1) < 100 and status < 98)
    {
        status = 2;
        playSound(global.sndAlert);
    }
}

with oHawkman
{
    if (distance_to_object(oPlayer1) < 100 and status < 98)
    {
        status = 2;
        playSound(global.sndAlert);
    }
}
