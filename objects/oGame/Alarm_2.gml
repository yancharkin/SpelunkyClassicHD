global.udjatBlink = not global.udjatBlink;

if (global.hasUdjatEye)
{
    if (global.udjatBlink)
        playSound(global.sndBlink1);
    else
        playSound(global.sndBlink2);
}
