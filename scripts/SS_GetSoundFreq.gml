return false;
//Get the current frequency of a sound

/*
argument0: Sound handle as returned by LoadSound
*/

/*
return: frequency as real or -1 if there was an error (ie. the sound
doesn't exist). See the script SS_SetSoundFreq for valid range
*/

/*if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_GetSoundFreq, argument0));
