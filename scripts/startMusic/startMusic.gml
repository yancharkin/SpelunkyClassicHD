function startMusic() {
	if (global.music) {
	    if (instance_exists(oLoadLevel))
	    {
	        if (oLoadLevel.music == "LUSH")
	        {
	            playMusic(global.musLush, true);
	            setSoundVol(global.musLush, 2000 + 8000 * (global.musicVol/18));
	        }
	        else if (oLoadLevel.music == "ICE")
	        {
	            playMusic(global.musIce, true);
	            setSoundVol(global.musIce, 2000 + 8000 * (global.musicVol/18));
	        }
	        else if (oLoadLevel.music == "TEMPLE")
	        {
	            playMusic(global.musTemple, true);
	            setSoundVol(global.musTemple, 2000 + 8000 * (global.musicVol/18));
	        }
	        else if (oLoadLevel.music == "BOSS")
	        {
	            if (oPlayer1.active)
	            {
	                playMusic(global.musBoss, true);
	                setSoundVol(global.musBoss, 2000 + 8000 * (global.musicVol/18));
	            }
	        }
	        else
	        {
	            playMusic(global.musCave, true);
	            setSoundVol(global.musCave, 2000 + 8000 * (global.musicVol/18));
	        }
        
	    }
	    else if (isLevel())
	    {
	        if (isRoom("rOlmec"))
	        {
	            if (oPlayer1.active)
	            {
	                playMusic(global.musBoss, true);
	                setSoundVol(global.musBoss, 2000 + 8000 * (global.musicVol/18));
	            }
	        }
	        else if (global.levelType == 1)
	        {
	            playMusic(global.musLush, true);
	            setSoundVol(global.musLush, 2000 + 8000 * (global.musicVol/18));
	        }
	        else if (global.levelType == 2)
	        {
	            playMusic(global.musIce, true);
	            setSoundVol(global.musIce, 2000 + 8000 * (global.musicVol/18));
	        }
	        else if (global.levelType == 3)
	        {
	            playMusic(global.musTemple, true);
	            setSoundVol(global.musTemple, 2000 + 8000 * (global.musicVol/18));
	        }
	        else
	        {
	            playMusic(global.musCave, true);
	            setSoundVol(global.musCave, 2000 + 8000 * (global.musicVol/18));
	        }
	    }
	    else if (isRoom("rTitle")) audio_stop_sound(global.musTitle);
	    else if (isRoom("rSun") or isRoom("rMoon") or isRoom("rStars"))
	    {
	        playMusic(global.musBoss, true);
	        setSoundVol(global.musBoss, 2000 + 8000 * (global.musicVol/18));
	    }
	}



}
