//return sound_isplaying(argument0)

return audio_is_playing(argument0)

//return false;
//Check if the specified sound is currently playing (or looping)

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: 1/0/-1 (true/false/error) as real
-1 if sound doesn't exist or there was another error

It returns 0 if the sound is paused or stopped. If you
want to check whether a sound is paused, use SS_IsSoundPaused()

If the sound is playing it returns 1.
*/

//if is_real(argument0) then return -1;
//return real(external_call(global.dll_SS_IsSoundPlaying,argument0));



