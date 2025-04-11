function playMusic(argument0, argument1) {
	if (global.music and not audio_is_playing(argument0))
	{
	    if (argument1) {
			audio_play_sound(argument0, 100, true); //Loop Sound
	    } else {
			audio_play_sound(argument0, 100, false); //Play Once
	    }
	}
}