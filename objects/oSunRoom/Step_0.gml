if (oGame.drawStatus == 0)
{
    if (instance_exists(oDamsel))
    {
        if (oDamsel.hp < 1)
        {
            global.plife = 0;
        }
    }
    else
    {
        global.plife = 0;
    }
}
