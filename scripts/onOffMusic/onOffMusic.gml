/// @description onOffMusic
function onOffMusic() {
	if (!global.music) {
	    stopAllMusic();
	} else {
	    if (isLevel()) {
	        if (global.levelType == 1) playMusic(global.musLush, true);
	        else if (global.levelType == 2) playMusic(global.musIce, true);
	        else if (global.levelType == 3) playMusic(global.musTemple, true);
	        else if (isRoom("rOlmec")){
	            if (oPlayer1.active) playMusic(global.musBoss, true);
	        } else playMusic(global.musCave, true);
	    } else if (isRoom("rTitle")) playMusic(global.musTitle, true);
	}



}
