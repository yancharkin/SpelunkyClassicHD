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

	    if (audio_is_playing(global.musTitle)) setSoundVol(global.musTitle, 10000);
	    if (audio_is_playing(global.musCave)) setSoundVol(global.musCave, 10000);
	    if (audio_is_playing(global.musLush)) setSoundVol(global.musLush, 10000);
	    if (audio_is_playing(global.musTemple)) setSoundVol(global.musTemple, 10000);
	    if (audio_is_playing(global.musBoss)) setSoundVol(global.musBoss, 10000);
	    stopAllMusic();
	}



}
