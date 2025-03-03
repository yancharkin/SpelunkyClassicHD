/// @description quitGame
function quitGame() {

	if (!global.html5Build) {
	    game_end();
	} else {
	    if (global.electronBuild) {
	        electronQuit();
	    }
	}



}
