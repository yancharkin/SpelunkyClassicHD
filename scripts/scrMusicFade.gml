/*if (isLevel())
{
    if (global.levelType == 1) SS_SetSoundFreq(global.musLush, SS_GetSoundFreq(global.musLush)-100);
    else if (global.levelType == 2) SS_SetSoundFreq(global.musIce, SS_GetSoundFreq(global.musIce)-100);
    else if (global.levelType == 3) SS_SetSoundFreq(global.musTemple, SS_GetSoundFreq(global.musTemple)-100);
    else if (isRoom("rOlmec"))
    {
        if (oPlayer1.active)
            SS_SetSoundFreq(global.musBoss, SS_GetSoundFreq(global.musBoss)-100);
    }
    else SS_SetSoundFreq(global.musCave, SS_GetSoundFreq(global.musCave)-100);
}
