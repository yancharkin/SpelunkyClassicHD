if (status == 0)
{
    x -= 1;
    if (x <= 160)
    {
        audio_play_sound(global.musCredits, 10, false);
        status = 1;
    }
}
else if (status == 1)
{
    // do nothing

    // or original:
    x -= 0.01;
}
else if (status == 2)
{
    x -= 2;
}

if (isRoom("rCredits1") and x < -64) oCredits1.fadeOut = true;

