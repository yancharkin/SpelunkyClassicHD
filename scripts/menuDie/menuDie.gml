/// @description menuDie
function menuDie() {
	if (paused and global.plife > 0 and isLevel())
	{
	    instance_activate_all();
	    paused = false;
	    with oPlayer1
	    {
	        if (facing == 18) xVel = -3;
	        else xVel = 3;
	        yVel = -6;
	        global.plife = -99;
	    }

	    if (SS_IsSoundPlaying(global.musTitle)) SS_SetSoundVol(global.musTitle, 10000);
	    if (SS_IsSoundPlaying(global.musCave)) SS_SetSoundVol(global.musCave, 10000);
	    if (SS_IsSoundPlaying(global.musLush)) SS_SetSoundVol(global.musLush, 10000);
	    if (SS_IsSoundPlaying(global.musTemple)) SS_SetSoundVol(global.musTemple, 10000);
	    if (SS_IsSoundPlaying(global.musBoss)) SS_SetSoundVol(global.musBoss, 10000);
	    stopAllMusic();
	}



}
